#include "tingle/actor_motion.h"
#include "tingle/game_phase_region_table.h"
#include "tingle/game_work.h"
#include "tingle/touch_region.h"

/*
 * Main update for the area-aware actor-motion helper. It selects map-area
 * bounds, follows the actor, handles area crossings, smooths the exported
 * position, and publishes centered coordinates into GameWork.
 */

extern void *gGamePhaseRuntime;

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitPlanarProjection(VecFx32Object *result,
                                               const void *source);
extern s32 ActorMotionAreaFollower_QueryCrossingDirection(ActorMotionAreaFollower *self, void *actor,
                         s32 area);
extern void ActorMotionAreaFollower_ClampToAreaBounds(ActorMotionAreaFollower *self, s32 area,
                          const s16 *bounds);
extern s32 Type7Actor_GetStateCode(void *actor);
extern void ActorMotionState_BuildOscillationOffset(VecFx32Object *result,
                          const ActorMotionState *state);
extern s32 func_020adcac(const VecFx32Value *left,
                         const VecFx32Value *right);
#ifdef __cplusplus
}
#endif

static s32 area_follower_multiply_fx32(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

/*
 * Locate the actor's current area from its transformed position. Unless
 * GameWork flag 0x404 is set or lookup fails, derive crossing direction,
 * update using area-specific bounds, and run area-transition bookkeeping.
 * On an actual area change, a qualifying companion actor is shifted 20 pixels
 * opposite/along the recovered direction code (1 left, 2 right, 3 up, 4 down).
 *
 * The resulting position is clamped to the caller bounds, then the retained
 * smoothed position approaches it using a capped weight which begins at
 * 0x29 and rises by 12 to 0x200. Smoothing ends below distance 0x1000. The
 * smoothed position becomes current position, and coordinates plus oscillation
 * are written to GameWork offsets 0x22e/0x230 with screen-center biases 128/96.
 * Returns zero. GameWork, actor/companion state, and this helper may change;
 * no direct hardware access occurs. Helper meanings beyond these observed
 * effects remain inferred from their call and field relationships.
 */
s32 ActorMotionAreaFollower_Update(ActorMotionAreaFollower *self, const s16 *bounds)
{
    ActorMotion *motion = &self->jitter.base;
    u8 *actor = (u8 *)motion->actor;
    VecFx32Object transformed;
    VecFx32Object candidate;
    VecFx32Object oscillation;
    s32 area;
    const RectS16 *viewport = (const RectS16 *)bounds;

    VecFx32Object_InitPlanarProjection(&transformed, actor + 0x18);
    area = GamePhaseRegionTable_FindContainingRegion(self->areaContext,
                         transformed.value.x >> 12,
                         (transformed.value.y >> 12) - 0x10);

    if (GameWork_TestFlag(gGameWork, 0x404) == 0 && area >= 0) {
        s32 direction = ActorMotionAreaFollower_QueryCrossingDirection(self, actor, area);
        const GamePhaseRegion *areaBounds =
            GamePhaseRegionTable_GetRegion(self->areaContext, area);

        ActorMotionJitter_Update(&self->jitter, (const s16 *)areaBounds);
        ActorMotionAreaFollower_ClampToAreaBounds(self, area, bounds);
        if (self->currentAreaIndex != -1 && self->currentAreaIndex != area) {
            u8 *runtime;
            u8 *companion = 0;

            self->smoothingWeight = 0x29;
            self->smoothingActive = 1;
            if (*(u8 *)(actor + 0x4d) == 1) {
                runtime = (u8 *)gGamePhaseRuntime;
                companion = *(u8 **)(runtime + 0x2ea8);
            }
            if (companion != 0 && Type7Actor_GetStateCode(companion) == 3) {
                VecFx32Object shifted;

                VecFx32Object_InitCopy(&shifted,
                              (const VecFx32Object *)(actor + 0x18));
                if (direction == 1)
                    shifted.value.x -= 0x14000;
                else if (direction == 2)
                    shifted.value.x += 0x14000;
                else if (direction == 3)
                    shifted.value.y -= 0x14000;
                else if (direction == 4)
                    shifted.value.y += 0x14000;
                VecFx32Object_Assign((VecFx32Object *)(companion + 0x18), &shifted);
                VecFx32Object_Destroy(&shifted);
            }
        }
        self->currentAreaIndex = area;
    } else {
        ActorMotionJitter_Update(&self->jitter, bounds);
    }

    VecFx32Object_InitCopy(&candidate, &motion->position);
    if ((candidate.value.x >> 12) < viewport->left)
        candidate.value.x = viewport->left << 12;
    else if ((candidate.value.x >> 12) + 0x100 > viewport->right)
        candidate.value.x = (viewport->right - 0x100) << 12;
    if ((candidate.value.y >> 12) < viewport->top)
        candidate.value.y = viewport->top << 12;
    else if ((candidate.value.y >> 12) + 0xc0 > viewport->bottom)
        candidate.value.y = (viewport->bottom - 0xc0) << 12;

    if (self->smoothingActive != 0) {
        s32 newWeight = self->smoothingWeight;
        s32 oldWeight = 0x1000 - newWeight;

        self->smoothedPosition.value.x =
            area_follower_multiply_fx32(self->smoothedPosition.value.x, oldWeight) +
            area_follower_multiply_fx32(candidate.value.x, newWeight);
        self->smoothedPosition.value.y =
            area_follower_multiply_fx32(self->smoothedPosition.value.y, oldWeight) +
            area_follower_multiply_fx32(candidate.value.y, newWeight);
        self->smoothedPosition.value.z =
            area_follower_multiply_fx32(self->smoothedPosition.value.z, oldWeight) +
            area_follower_multiply_fx32(candidate.value.z, newWeight);
        self->smoothingWeight += 12;
        if (self->smoothingWeight > 0x200)
            self->smoothingWeight = 0x200;
        if (func_020adcac(&self->smoothedPosition.value, &candidate.value) < 0x1000)
            self->smoothingActive = 0;
    } else {
        VecFx32Object_Assign(&self->smoothedPosition, &candidate);
    }
    VecFx32Object_Assign(&motion->position, &self->smoothedPosition);

    ActorMotionState_BuildOscillationOffset(&oscillation, &motion->state);
    *(s16 *)((u8 *)gGameWork + 0x22e) =
        (s16)(((motion->position.value.x + oscillation.value.x) >> 12) +
              0x80);
    VecFx32Object_Destroy(&oscillation);
    ActorMotionState_BuildOscillationOffset(&oscillation, &motion->state);
    *(s16 *)((u8 *)gGameWork + 0x230) =
        (s16)(((motion->position.value.y + oscillation.value.y) >> 12) +
              0x60);
    VecFx32Object_Destroy(&oscillation);
    VecFx32Object_Destroy(&candidate);
    VecFx32Object_Destroy(&transformed);
    return 0;
}

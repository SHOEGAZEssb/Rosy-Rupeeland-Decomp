#include "tingle/actor_motion.h"
#include "tingle/game_work.h"

/*
 * Main update for the area-aware actor-motion helper. It selects map-area
 * bounds, follows the actor, handles area crossings, smooths the exported
 * position, and publishes centered coordinates into GameWork.
 */

extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02056f00(VecFx32Object *result, const void *source);
extern s32 GamePhaseRegionTable_FindContainingRegion(void *context, s32 x, s32 y);
extern s32 ActorMotionAreaFollower_QueryCrossingDirection(ActorMotionAreaFollower *self, void *actor,
                         s32 area);
extern const s16 *GamePhaseRegionTable_GetRegion(void *context, s32 area);
extern void ActorMotionAreaFollower_ClampToAreaBounds(ActorMotionAreaFollower *self, s32 area,
                          const s16 *bounds);
extern s32 Type7Actor_GetStateCode(void *actor);
extern void func_02008740(VecFx32Object *result,
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
 * offset vector approaches it using a capped transition weight which begins at
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

    func_02056f00(&transformed, actor + 0x18);
    area = GamePhaseRegionTable_FindContainingRegion(self->areaContext,
                         transformed.value.x >> 12,
                         (transformed.value.y >> 12) - 0x10);

    if (GameWork_TestFlag(gGameWork, 0x404) == 0 && area >= 0) {
        s32 direction = ActorMotionAreaFollower_QueryCrossingDirection(self, actor, area);
        const s16 *areaBounds = GamePhaseRegionTable_GetRegion(self->areaContext, area);

        ActorMotionJitter_Update(&self->jitter, areaBounds);
        ActorMotionAreaFollower_ClampToAreaBounds(self, area, bounds);
        if (self->previousArea != -1 && self->previousArea != area) {
            u8 *runtime;
            u8 *companion = 0;

            self->transitionTimer = 0x29;
            self->transitionActive = 1;
            if (*(u8 *)(actor + 0x4d) == 1) {
                runtime = (u8 *)data_021052fc;
                companion = *(u8 **)(runtime + 0x2ea8);
            }
            if (companion != 0 && Type7Actor_GetStateCode(companion) == 3) {
                VecFx32Object shifted;

                func_02005030(&shifted,
                              (const VecFx32Object *)(actor + 0x18));
                if (direction == 1)
                    shifted.value.x -= 0x14000;
                else if (direction == 2)
                    shifted.value.x += 0x14000;
                else if (direction == 3)
                    shifted.value.y -= 0x14000;
                else if (direction == 4)
                    shifted.value.y += 0x14000;
                func_020050a4((VecFx32Object *)(companion + 0x18), &shifted);
                func_02005058(&shifted);
            }
        }
        self->previousArea = area;
    } else {
        ActorMotionJitter_Update(&self->jitter, bounds);
    }

    func_02005030(&candidate, &motion->position);
    if ((candidate.value.x >> 12) < bounds[0])
        candidate.value.x = bounds[0] << 12;
    else if ((candidate.value.x >> 12) + 0x100 > bounds[2])
        candidate.value.x = (bounds[2] - 0x100) << 12;
    if ((candidate.value.y >> 12) < bounds[1])
        candidate.value.y = bounds[1] << 12;
    else if ((candidate.value.y >> 12) + 0xc0 > bounds[3])
        candidate.value.y = (bounds[3] - 0xc0) << 12;

    if (self->transitionActive != 0) {
        s32 newWeight = self->transitionTimer;
        s32 oldWeight = 0x1000 - newWeight;

        self->offset.value.x =
            area_follower_multiply_fx32(self->offset.value.x, oldWeight) +
            area_follower_multiply_fx32(candidate.value.x, newWeight);
        self->offset.value.y =
            area_follower_multiply_fx32(self->offset.value.y, oldWeight) +
            area_follower_multiply_fx32(candidate.value.y, newWeight);
        self->offset.value.z =
            area_follower_multiply_fx32(self->offset.value.z, oldWeight) +
            area_follower_multiply_fx32(candidate.value.z, newWeight);
        self->transitionTimer += 12;
        if (self->transitionTimer > 0x200)
            self->transitionTimer = 0x200;
        if (func_020adcac(&self->offset.value, &candidate.value) < 0x1000)
            self->transitionActive = 0;
    } else {
        func_020050a4(&self->offset, &candidate);
    }
    func_020050a4(&motion->position, &self->offset);

    func_02008740(&oscillation, &motion->state);
    *(s16 *)((u8 *)gGameWork + 0x22e) =
        (s16)(((motion->position.value.x + oscillation.value.x) >> 12) +
              0x80);
    func_02005058(&oscillation);
    func_02008740(&oscillation, &motion->state);
    *(s16 *)((u8 *)gGameWork + 0x230) =
        (s16)(((motion->position.value.y + oscillation.value.y) >> 12) +
              0x60);
    func_02005058(&oscillation);
    func_02005058(&candidate);
    func_02005058(&transformed);
    return 0;
}

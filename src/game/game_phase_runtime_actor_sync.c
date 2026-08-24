#include "tingle/game_phase_runtime.h"
#include "tingle/touch_region.h"
#include "tingle/vec_fx32.h"

/*
 * Synchronize primary or secondary actor placement with the active area.
 * The retail instruction schedule is retained in the matching assembly file.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorMotionAreaFollower_Update(void *object, const void *value);
extern void GamePhaseRuntime_BuildPrimaryTransform(void *state, GamePhaseRuntime *self);
extern void GamePhaseRuntime_BuildSecondaryTransform(void *state, GamePhaseRuntime *self);
extern void GamePhaseState_ApplyPlacementState(void *object, const void *state);
extern s32 DisplayController_GetSubScreenVerticalOffset(void);
extern void VecFx32Object_InitSum(void *output, const void *state, const void *offset);
extern void GamePhaseAreaScene_ApplyPlacementState(void *actor, const void *state);
extern s32 GamePhaseAreaScene_GetSubRendererLowCoordinate(void *actor);
extern s32 GamePhaseAreaScene_GetSubRendererHighCoordinate(void *actor);
extern void ActorMotionGameWork_Update(void *object, const void *value);
#ifdef __cplusplus
}
#endif

/*
 * Synchronize actor zero (the primary actor) or actor one (the optional
 * secondary actor). Primary synchronization derives a compact four-halfword
 * placement from packed gameplay coordinates. Secondary synchronization uses
 * the area's orientation to choose an offset or current actor coordinates,
 * updates runtime placement state, and optionally pushes a full state to the
 * secondary actor. Returns zero for all paths; bit 2 at offset 0x30cc blocks
 * primary synchronization without side effects.
 */
s32 GamePhaseRuntime_SynchronizeActorPlacement(GamePhaseRuntime *self, s32 actorIndex)
{
    u8 *b = (u8 *)self;
    RectS16 compact;
    RectS16 primaryBounds;
    RectS16 secondaryBounds;
    VecFx32Object placement;
    VecFx32Object basePlacement;
    VecFx32Object shiftedPlacement;
    VecFx32Object offset;
    u8 *actor;
    u32 packed;
    s32 orientation;

    if (actorIndex == 0) {
        if (*(u8 *)(b + 0x30cc) & 4)
            return 0;
        packed = *(u32 *)(*(u8 **)(b + 0x2ed4) + 0x20);
        RectS16_InitComponents(&primaryBounds, 0, 0,
                      (s32)((packed & 0xffff) << 20) >> 16,
                      (s32)((packed >> 16) << 20) >> 16);
        RectS16_Assign(&compact, &primaryBounds);
        ActorMotionAreaFollower_Update(b + 0x2fbc, &compact);
        GamePhaseRuntime_BuildPrimaryTransform(&placement, self);
        GamePhaseState_ApplyPlacementState(b + 0x24, &placement);
        VecFx32Object_Destroy(&placement);
    } else if (actorIndex == 1) {
        orientation = (*(u32 *)(*(u8 **)(b + 0x30bc) + 0x40) << 12) >> 30;
        if (orientation == 3) {
            VecFx32Object_InitComponents(&offset, 0, -(DisplayController_GetSubScreenVerticalOffset() << 12), 0);
            GamePhaseRuntime_BuildPrimaryTransform(&basePlacement, self);
            VecFx32Object_InitSum(&shiftedPlacement, &basePlacement, &offset);
            GamePhaseAreaScene_ApplyPlacementState(*(void **)(b + 0x2fb8), &shiftedPlacement);
            VecFx32Object_Destroy(&shiftedPlacement);
            VecFx32Object_Destroy(&basePlacement);
            VecFx32Object_Destroy(&offset);
        } else {
            if (orientation == 0) {
                actor = *(u8 **)(b + 0x2fb8);
                RectS16_InitComponents(&secondaryBounds, 0, 0,
                              (s16)GamePhaseAreaScene_GetSubRendererLowCoordinate(actor),
                              (s16)GamePhaseAreaScene_GetSubRendererHighCoordinate(*(void **)(b + 0x2fb8)));
                RectS16_Assign(&compact, &secondaryBounds);
            } else {
                RectS16_InitComponents(&secondaryBounds, 0, 0, 0, 0);
                RectS16_Assign(&compact, &secondaryBounds);
            }
            ActorMotionGameWork_Update(b + 0x3044, &compact);
            if (*(void **)(b + 0x30fc) != 0 &&
                *(void **)(b + 0x2fb8) != 0) {
                GamePhaseRuntime_BuildSecondaryTransform(&placement, self);
                GamePhaseAreaScene_ApplyPlacementState(*(void **)(b + 0x2fb8), &placement);
                VecFx32Object_Destroy(&placement);
            }
        }
    }
    return 0;
}

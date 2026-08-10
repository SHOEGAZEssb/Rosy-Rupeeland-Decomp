#include "tingle/game_phase_runtime.h"

/*
 * Switch the optional actor placement mode and related camera/scene offsets.
 * The retail stack/value-object schedule is retained in matching assembly.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GamePhaseRuntime_GetActiveAreaPlacementVariant(GamePhaseRuntime *self);
extern void VecFx32Object_InitComponents(void *value, s32 x, s32 y, s32 z);
extern void ActorMotion_SetTarget(void *object, const void *value);
extern void VecFx32Object_Destroy(void *value);
extern void GamePhaseAreaScene_SetEnabled(void *actor, s32 enabled);
extern void ActorMotion_UpdateFromBoundActor(void *object);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

static void callSceneMode(GamePhaseRuntime *self, s32 enabled)
{
    void *object = *(void **)((u8 *)self + 0x30e8);
    typedef void (*Method)(void *, s32, s32);
    ((Method *)(*(void **)object))[3](object, enabled, 31);
}

/*
 * Apply placement mode 0..3 and return the previous mode from offset 0x30fc.
 * Modes configure scene virtual state, fixed camera offsets at 0x3044, and the
 * optional actor at 0x2fb8. Invalid modes halt. When synchronize is nonzero
 * and mode is not zero, primary/secondary transition state and virtual slot
 * four of object 0x30e8 are updated before the new mode is stored.
 */
s32 GamePhaseRuntime_SetPlacementMode(GamePhaseRuntime *self, s32 mode, s32 synchronize)
{
    u8 *b = (u8 *)self;
    u8 mode3Value[16];
    u8 mode2Value[16];
    u8 mode1Alternate[16];
    u8 mode1Value[16];
    s32 previous = *(s32 *)(b + 0x30fc);
    s32 variant;

    switch (mode) {
    case 0:
        callSceneMode(self, 0);
        GamePhaseAreaScene_SetEnabled(*(void **)(b + 0x2fb8), 0);
        break;
    case 1:
        variant = GamePhaseRuntime_GetActiveAreaPlacementVariant(self);
        if (variant == 0) {
            callSceneMode(self, 1);
            VecFx32Object_InitComponents(mode1Value, -0x58000, -0x44000, 0);
            ActorMotion_SetTarget(b + 0x3044, mode1Value);
            VecFx32Object_Destroy(mode1Value);
            GamePhaseAreaScene_SetEnabled(*(void **)(b + 0x2fb8), 1);
        } else if (variant == 1 || variant == 2) {
            callSceneMode(self, 0);
            VecFx32Object_InitComponents(mode1Alternate, -0x80000, -0x74000, 0);
            ActorMotion_SetTarget(b + 0x3044, mode1Alternate);
            VecFx32Object_Destroy(mode1Alternate);
            GamePhaseAreaScene_SetEnabled(*(void **)(b + 0x2fb8), 1);
        }
        break;
    case 2:
        callSceneMode(self, 0);
        VecFx32Object_InitComponents(mode2Value, -0x80000, -0x60000, 0);
        ActorMotion_SetTarget(b + 0x3044, mode2Value);
        VecFx32Object_Destroy(mode2Value);
        ActorMotion_UpdateFromBoundActor(b + 0x3044);
        GamePhaseAreaScene_SetEnabled(*(void **)(b + 0x2fb8), 1);
        break;
    case 3:
        VecFx32Object_InitComponents(mode3Value, -0x58000, -0x44000, 0);
        ActorMotion_SetTarget(b + 0x3044, mode3Value);
        VecFx32Object_Destroy(mode3Value);
        GamePhaseAreaScene_SetEnabled(*(void **)(b + 0x2fb8), 1);
        break;
    default:
        OS_Halt();
        break;
    }

    if (synchronize != 0 && mode != 0) {
        void *object;
        GamePhaseRuntime_PrepareActorCollections(self, self->field_04, 3);
        GamePhaseRuntime_SynchronizeActorPlacement(self, 1);
        object = *(void **)(b + 0x30e8);
        (*(void (***)(void *))object)[4](object);
    }
    *(s32 *)(b + 0x30fc) = mode;
    return previous;
}

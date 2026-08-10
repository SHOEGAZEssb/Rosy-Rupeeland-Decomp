#include "tingle/game_phase_transition_scene.h"
#include "tingle/game_work.h"
#include "tingle/heap.h"

/* Advance fades, shared contexts, and allocation during a game-phase transition. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 gGamePhaseResumeSceneAllocationTag[];
extern void *data_021052fc;
extern void *gLupyContext;
extern void DisplayBrightness_StartMainTransition(s32 screen, s32 frames);
extern void DisplayBrightness_StartSubTransition(s32 screen, s32 frames);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern s32 DisplayBrightness_IsSubTransitionComplete(void);
extern s32 DisplayBrightness_IsMainTransitionDecreasing(void);
extern s32 DisplayBrightness_IsSubTransitionDecreasing(void);
extern void GamePhaseRuntime_ApplyStagedAreaRequest(void *context);
extern void GamePhaseCurrencyHud_SetVisible(void *context, s32 value);
extern void *GamePhaseResumeScene_Init(void *allocation, s32 mode);
#ifdef __cplusplus
}
#endif

typedef void (*GamePhaseTransitionMethod)(void *object, s32 value,
                                          s32 parameter);

/*
 * Advance the Scene value08 state machine. State 0 either consumes GameWork
 * flag 0x3f8 and skips ahead, or starts missing screen-2 fades. State 1 waits
 * for both fades, resets Lupy state, and invokes context object 0x30e8's vtable
 * method 0x0c with (0,0x1f). State 2 optionally consumes flag 0x3e8/resetting
 * GameWork, refreshes the root context, and allocates/initializes a 0x28-byte
 * mode-1 object. State 3 destroys this scene, consumes flag 0x386 or starts
 * screen-1 fades, and returns 1. Other/incomplete states return 0.
 */
s32 GamePhaseTransitionScene_Update(GamePhaseTransitionScene *self)
{
    if (self->base.value08 == 0) {
        if (GameWork_TestFlag(gGameWork, 0x3f8)) {
            GameWork_ClearFlag(gGameWork, 0x3f8);
            self->base.value08 = 2;
            return 0;
        }
        if (!DisplayBrightness_IsMainTransitionDecreasing())
            DisplayBrightness_StartMainTransition(2, 0x10);
        if (!DisplayBrightness_IsSubTransitionDecreasing())
            DisplayBrightness_StartSubTransition(2, 0x10);
        self->base.value08++;
    }

    if (self->base.value08 == 1) {
        void *object;
        void **vtable;

        if (!DisplayBrightness_IsMainTransitionComplete() || !DisplayBrightness_IsSubTransitionComplete())
            return 0;
        GamePhaseCurrencyHud_SetVisible(gLupyContext, 0);
        object = *(void **)((u8 *)data_021052fc + 0x30e8);
        vtable = *(void ***)object;
        ((GamePhaseTransitionMethod)vtable[3])(object, 0, 0x1f);
        self->base.value08++;
    } else if (self->base.value08 == 2) {
        void *allocation;

        if (GameWork_TestFlag(gGameWork, 0x3e8)) {
            GameWork_ClearFlag(gGameWork, 0x3e8);
            GameWork_Reset();
        }
        GamePhaseRuntime_ApplyStagedAreaRequest(data_021052fc);
        allocation = Heap_Alloc(0x28, (const char *)gGamePhaseResumeSceneAllocationTag, -4,
                                &gHeapContext);
        if (allocation != 0)
            GamePhaseResumeScene_Init(allocation, 1);
        self->base.value08++;
    } else if (self->base.value08 == 3) {
        if (self != 0)
            self->base.vtable->destroyAndFree(&self->base);
        if (GameWork_TestFlag(gGameWork, 0x386))
            GameWork_ClearFlag(gGameWork, 0x386);
        else {
            DisplayBrightness_StartMainTransition(1, 0x10);
            DisplayBrightness_StartSubTransition(1, 0x10);
        }
        return 1;
    }
    return 0;
}

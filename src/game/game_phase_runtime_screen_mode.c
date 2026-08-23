#include "tingle/game_phase_runtime.h"
#include "tingle/game_phase_state.h"
#include "tingle/game_work.h"

/* Switch runtime screen mode and synchronize the affected actors/hardware. */

#ifdef __cplusplus
extern "C" {
#endif
extern void GamePhaseAreaScene_RestoreSubDisplay(void *actor);
extern void GamePhaseRuntime_RefreshAreaAuxiliaryObject(GamePhaseRuntime *self, void *area, s32 enabled);
extern void RuntimePresentationManager_NotifyScreenModeChanged(
    void *manager, s32 screenMode);
#ifdef __cplusplus
}
#endif

/*
 * Apply screen mode 0..2. Modes 0/2 force main display mode bits and update
 * state 0x24; modes 1/2 do the corresponding sub-display/secondary-actor
 * work, invoke virtual slot two of object 0x30e8, clear the first sub BG
 * palette entry, and set flag 0x39c. All modes update object 0x2f7c and set
 * flag 0x3f4. Returns no value; volatile display and palette writes are
 * observable hardware effects.
 */
void GamePhaseRuntime_ApplyScreenMode(GamePhaseRuntime *self, s32 mode, s32 use3dMode)
{
    u8 *b = (u8 *)self;
    volatile u32 *mainDisplay = (volatile u32 *)0x04000000;
    volatile u32 *subDisplay = (volatile u32 *)0x04001000;

    if (mode == 2 || mode == 0) {
        *mainDisplay = (*mainDisplay & ~0x1f00) | 0x1000;
        GamePhaseState_ConfigureMainDisplay((GamePhaseState *)(b + 0x24), use3dMode);
        GameWork_SetFlag(gGameWork, 0x395);
    }
    if ((u32)(mode - 1) <= 1) {
        void *object;
        volatile u16 *palette = (volatile u16 *)0x05000400;
        GameWork *volatile *workAddress = &gGameWork;
        *subDisplay = (*subDisplay & ~0x1f00) | 0x1000;
        GamePhaseAreaScene_RestoreSubDisplay(*(void **)(b + 0x2fb8));
        GamePhaseRuntime_RefreshAreaAuxiliaryObject(self, *(void **)(b + 0x30bc), 1);
        object = *(void **)(b + 0x30e8);
        (*(void (***)(void *))object)[2](object);
        GamePhaseRuntime_SetPlacementMode(self, 1, 0);
        *palette = 0;
        GameWork_SetFlag(*workAddress, 0x39c);
    }
    RuntimePresentationManager_NotifyScreenModeChanged(b + 0x2f7c, mode);
    GameWork_SetFlag(gGameWork, 0x3f4);
}

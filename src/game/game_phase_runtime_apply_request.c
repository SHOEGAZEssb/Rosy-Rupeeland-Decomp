#include "tingle/game_phase_runtime.h"

/* Apply a staged area request and rebuild the active phase configuration. */

#ifdef __cplusplus
extern "C" {
#endif
extern void DebugHudState_GetGlobal(void);
extern void DebugHudState_Close(void);
extern void GamePhaseState_ResetRuntime(void *state);
extern void GamePhaseRuntime_DestroySecondaryActorSubsystem(GamePhaseRuntime *self);
extern void GamePhaseRuntime_TeardownActiveAreaState(GamePhaseRuntime *self);
#ifdef __cplusplus
}
#endif

/*
 * Promote the staged area at 0x30d0 to 0x30bc, force both DS display-control
 * registers' mode bits 8..12 to 0x1000, tear down the prior phase state, and
 * rebuild it using staged values 0x30d4..0x30dc. Returns no value. Hardware
 * writes and teardown order are observable and must remain ordered.
 */
void GamePhaseRuntime_ApplyStagedAreaRequest(GamePhaseRuntime *self)
{
    u8 *b = (u8 *)self;
    volatile u32 *mainDisplay = (volatile u32 *)0x04000000;
    volatile u32 *subDisplay = (volatile u32 *)0x04001000;

    *(void **)(b + 0x30bc) = *(void **)(b + 0x30d0);
    *mainDisplay = (*mainDisplay & ~0x1f00) | 0x1000;
    *subDisplay = (*subDisplay & ~0x1f00) | 0x1000;
    DebugHudState_GetGlobal();
    DebugHudState_Close();
    GamePhaseState_ResetRuntime(b + 0x24);
    GamePhaseRuntime_DestroySecondaryActorSubsystem(self);
    GamePhaseRuntime_TeardownActiveAreaState(self);
    GamePhaseRuntime_Configure(self, *(void **)(b + 0x30d0),
                   *(s32 *)(b + 0x30d4), *(s32 *)(b + 0x30d8),
                   *(s32 *)(b + 0x30dc));
}

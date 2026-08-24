#include "tingle/game_phase_runtime.h"

/* Per-frame maintenance calls for GamePhaseRuntime and its field loader. */

#ifdef __cplusplus
extern "C" {
#endif
extern void DebugHudState_GetGlobal(void);
extern void DebugHudState_Close(void);
extern void GamePhaseState_ResetActivePhase(void *state);
extern void GamePhaseRuntime_DestroySecondaryActorSubsystem(GamePhaseRuntime *self);
extern void ActorRuntimeAnimationResourceLists_ClearCategory1(void *loader);
#ifdef __cplusplus
}
#endif

/*
 * Run two global frame hooks, update the embedded state at offset 0x24,
 * update runtime-owned phase state, and advance the loader at offset 0x30b4.
 * The loader is assumed non-null. Returns no value.
 */
void GamePhaseRuntime_RunFrameMaintenance(GamePhaseRuntime *self)
{
    u8 *b = (u8 *)self;
    DebugHudState_GetGlobal();
    DebugHudState_Close();
    GamePhaseState_ResetActivePhase(b + 0x24);
    GamePhaseRuntime_DestroySecondaryActorSubsystem(self);
    ActorRuntimeAnimationResourceLists_ClearCategory1(*(void **)(b + 0x30b4));
}

#include "tingle/game_phase_runtime.h"

/* Per-frame maintenance calls for GamePhaseRuntime and its field loader. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200f824(void);
extern void func_0200f52c(void);
extern void GamePhaseState_ResetActivePhase(void *state);
extern void GamePhaseRuntime_DestroySecondaryActorSubsystem(GamePhaseRuntime *self);
extern void ActorRuntimeObjectLists_ClearSecond(void *loader);
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
    func_0200f824();
    func_0200f52c();
    GamePhaseState_ResetActivePhase(b + 0x24);
    GamePhaseRuntime_DestroySecondaryActorSubsystem(self);
    ActorRuntimeObjectLists_ClearSecond(*(void **)(b + 0x30b4));
}

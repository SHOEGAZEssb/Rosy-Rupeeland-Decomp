#include "tingle/game_phase_script_vm.h"

/* Reconstruct the script opcode that submits a four-operand phase request. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void GamePhaseRuntime_StageAreaRequest(void *runtime, u32 first, u32 second, u32 third,
                         u32 fourth, u32 zero);
#ifdef __cplusplus
}
#endif

/*
 * Pop fourth through first operands, submit them plus a trailing zero to
 * GamePhaseRuntime_StageAreaRequest on the global phase runtime, and return one. Returning one
 * stops the current VM dispatch loop after the request is queued.
 */
s32 func_0201416c(GamePhaseActorScriptVm *self)
{
    u32 fourth = GamePhaseScriptVm_Pop(&self->base);
    u32 third = GamePhaseScriptVm_Pop(&self->base);
    u32 second = GamePhaseScriptVm_Pop(&self->base);
    u32 first = GamePhaseScriptVm_Pop(&self->base);
    GamePhaseRuntime_StageAreaRequest(data_021052fc, first, second, third, fourth, 0);
    return 1;
}

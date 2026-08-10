#include "tingle/game_phase_script_vm.h"

/* Implement a conditional script opcode that sets a global actor-runtime flag. */

#ifdef __cplusplus
extern "C" {
#endif
extern u8 gActorRuntimeFlags[];
extern void ActorRuntimeFlags_Set(void *object, u32 value);
#ifdef __cplusplus
}
#endif

/*
 * Pop and discard two operands, then pop a condition. When it is zero, set
 * mask 0x100 in gActorRuntimeFlags. Return zero. The discarded operands may
 * be retained for bytecode-format compatibility.
 */
s32 GamePhaseActorScriptVm_SetActorRuntimeFlag100WhenZero(GamePhaseActorScriptVm *self)
{
    (void)GamePhaseScriptVm_Pop(&self->base);
    (void)GamePhaseScriptVm_Pop(&self->base);
    if (GamePhaseScriptVm_Pop(&self->base) == 0)
        ActorRuntimeFlags_Set(gActorRuntimeFlags, 0x100);
    return 0;
}

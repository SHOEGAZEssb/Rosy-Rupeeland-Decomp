#include "tingle/game_phase_script_vm.h"

/* Dispatch actor-script opcodes and expose the VM's recovered completion flag. */

typedef s32 (*ActorScriptOpcode)(GamePhaseActorScriptVm *self);

#ifdef __cplusplus
extern "C" {
#endif
extern ActorScriptOpcode data_020d56e4[];
#ifdef __cplusplus
}
#endif

/* Invoke the opcode-table entry at index with self and return its result; no bounds check occurs. */
s32 func_0201b210(GamePhaseActorScriptVm *self, s32 index)
{
    return data_020d56e4[index](self);
}

/* Set derived flag bit zero and return. */
void func_0201b228(GamePhaseActorScriptVm *self)
{
    self->flags_8c |= 1;
}

/* Return flag bit zero expanded to retail's Boolean representation, zero or -1. */
s32 func_0201b23c(const GamePhaseActorScriptVm *self)
{
    return (s32)(self->flags_8c << 31) >> 31;
}

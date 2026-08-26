#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes that update the u16-keyed table referenced by data_021e9ac0. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021e9ac0;
extern s32 func_0206370c(void *table, u16 key, s32 value);
extern void func_02063724(void *table, u16 key, u16 value);
extern void func_020638b0(void *table, u16 first, u16 second, u16 third);
#ifdef __cplusplus
}
#endif

/* Pop a value and key, narrow both to u16, pass them to func_0206370c, and return zero. */
s32 GamePhaseActorScriptVm_DispatchInventoryTableKeyValueVariantA(GamePhaseActorScriptVm *self)
{
    u16 value = (u16)GamePhaseScriptVm_Pop(&self->base);
    u16 key = (u16)GamePhaseScriptVm_Pop(&self->base);
    func_0206370c(data_021e9ac0, key, value);
    return 0;
}

/* Pop a value and key, narrow both to u16, pass them to func_02063724, and return zero. */
s32 GamePhaseActorScriptVm_DispatchInventoryTableKeyValueVariantB(GamePhaseActorScriptVm *self)
{
    u16 value = (u16)GamePhaseScriptVm_Pop(&self->base);
    u16 key = (u16)GamePhaseScriptVm_Pop(&self->base);
    func_02063724(data_021e9ac0, key, value);
    return 0;
}

/* Pop third, second, and first u16 values, pass them to func_020638b0, and return zero. */
s32 GamePhaseActorScriptVm_DispatchInventoryTableTriple(GamePhaseActorScriptVm *self)
{
    u16 operandC = (u16)GamePhaseScriptVm_Pop(&self->base);
    u16 operandB = (u16)GamePhaseScriptVm_Pop(&self->base);
    u16 operandA = (u16)GamePhaseScriptVm_Pop(&self->base);
    func_020638b0(data_021e9ac0, operandA, operandB, operandC);
    return 0;
}

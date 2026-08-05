#include "tingle/game_phase_script_vm.h"

/* Implement a conditional script command against the recovered global object at 0x021f5ebc. */

#ifdef __cplusplus
extern "C" {
#endif
extern u8 data_021f5ebc[];
extern void func_020828ac(void *object, u32 value);
#ifdef __cplusplus
}
#endif

/*
 * Pop and discard two operands, then pop a condition. When it is zero, call
 * func_020828ac for data_021f5ebc with value 0x100. Return zero. The discarded
 * operands may be retained for bytecode-format compatibility.
 */
s32 func_020178fc(GamePhaseActorScriptVm *self)
{
    (void)func_02012704(&self->base);
    (void)func_02012704(&self->base);
    if (func_02012704(&self->base) == 0)
        func_020828ac(data_021f5ebc, 0x100);
    return 0;
}

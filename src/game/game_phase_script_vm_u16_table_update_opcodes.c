#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes that update the u16-keyed table referenced by data_021e9ac0. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021e9ac0;
extern void func_0206370c(void *table, u16 key, u16 value);
extern void func_02063724(void *table, u16 key, u16 value);
extern void func_020638b0(void *table, u16 first, u16 second, u16 third);
#ifdef __cplusplus
}
#endif

/* Pop a value and key, narrow both to u16, pass them to func_0206370c, and return zero. */
s32 func_02016070(GamePhaseActorScriptVm *self)
{
    u16 value = (u16)func_02012704(&self->base);
    u16 key = (u16)func_02012704(&self->base);
    func_0206370c(data_021e9ac0, key, value);
    return 0;
}

/* Pop a value and key, narrow both to u16, pass them to func_02063724, and return zero. */
s32 func_020160b0(GamePhaseActorScriptVm *self)
{
    u16 value = (u16)func_02012704(&self->base);
    u16 key = (u16)func_02012704(&self->base);
    func_02063724(data_021e9ac0, key, value);
    return 0;
}

/* Pop third, second, and first u16 values, pass them to func_020638b0, and return zero. */
s32 func_020160f0(GamePhaseActorScriptVm *self)
{
    u16 third = (u16)func_02012704(&self->base);
    u16 second = (u16)func_02012704(&self->base);
    u16 first = (u16)func_02012704(&self->base);
    func_020638b0(data_021e9ac0, first, second, third);
    return 0;
}

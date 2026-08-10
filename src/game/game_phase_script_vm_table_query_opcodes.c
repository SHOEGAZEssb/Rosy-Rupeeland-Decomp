#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes that finalize or query the runtime tables at data_021e9ac0 and data_021e9e00. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021e9ac0;
extern u8 data_021e9e00[];
extern void func_02063820(void *table, u16 value);
extern void *func_020636f0(void *table);
extern void *func_020636ac(void *table, u32 value);
extern void *func_0206f9d4(void *table, u32 value);
#ifdef __cplusplus
}
#endif

/* Pop a u16 value, pass it to func_02063820 for data_021e9ac0, and return zero. */
s32 func_02016144(GamePhaseActorScriptVm *self)
{
    u16 value = (u16)GamePhaseScriptVm_Pop(&self->base);
    func_02063820(data_021e9ac0, value);
    return 0;
}

/* Push whether func_020636f0 returns a non-null entry for data_021e9ac0, then return zero. */
s32 func_0201616c(GamePhaseActorScriptVm *self)
{
    GamePhaseScriptVm_SetResult(&self->base, func_020636f0(data_021e9ac0) != 0);
    return 0;
}

/* Pop a value, push whether func_020636ac finds it in data_021e9ac0, and return zero. */
s32 func_020161ac(GamePhaseActorScriptVm *self)
{
    u32 value = GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_SetResult(&self->base, func_020636ac(data_021e9ac0, value) != 0);
    return 0;
}

/* Pop a value, push whether func_0206f9d4 finds it in data_021e9e00, and return zero. */
s32 func_020161f4(GamePhaseActorScriptVm *self)
{
    u32 value = GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_SetResult(&self->base, func_0206f9d4(data_021e9e00, value) != 0);
    return 0;
}

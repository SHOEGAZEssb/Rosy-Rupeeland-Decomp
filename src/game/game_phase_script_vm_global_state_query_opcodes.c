#include "tingle/game_phase_script_vm.h"

/* Push recovered values from a global context and a one-based runtime record table. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021e9ac0;
extern s32 func_0206522c(void *state);
extern void *func_02028388(s32 index);
#ifdef __cplusplus
}
#endif

/* Query the subobject at global-context offset 0x34, push its result, and return zero. */
s32 func_0201b040(GamePhaseActorScriptVm *self)
{
    GamePhaseScriptVm_SetResult(&self->base,
                  (u32)func_0206522c((u8 *)data_021e9ac0 + 0x34));
    return 0;
}

/* Pop a one-based record index, push its signed byte at offset 0x4c, and return zero. */
s32 func_0201b070(GamePhaseActorScriptVm *self)
{
    s32 index = (s32)GamePhaseScriptVm_Pop(&self->base) - 1;
    s8 value = *(s8 *)((u8 *)func_02028388(index) + 0x4c);
    GamePhaseScriptVm_SetResult(&self->base, (u32)value);
    return 0;
}

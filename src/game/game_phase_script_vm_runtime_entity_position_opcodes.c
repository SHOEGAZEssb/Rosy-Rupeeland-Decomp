#include "tingle/game_phase_script_vm.h"

/* Push integer position components from the runtime's optional active entity. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
#ifdef __cplusplus
}
#endif

/* Push active-entity X in integer units, or zero when no entity exists; return zero. */
s32 func_0201ae64(GamePhaseActorScriptVm *self)
{
    u8 *runtime = (u8 *)data_021052fc;
    u8 *entity = *(u8 **)(runtime + 0x2ea8);
    GamePhaseScriptVm_SetResult(&self->base, entity ? (u32)(*(s32 *)(entity + 0x1c) >> 12) : 0);
    return 0;
}

/* Push active-entity Y in integer units, or zero when no entity exists; return zero. */
s32 func_0201ae98(GamePhaseActorScriptVm *self)
{
    u8 *runtime = (u8 *)data_021052fc;
    u8 *entity = *(u8 **)(runtime + 0x2ea8);
    GamePhaseScriptVm_SetResult(&self->base, entity ? (u32)(*(s32 *)(entity + 0x20) >> 12) : 0);
    return 0;
}

/* Push active-entity Z in integer units, or zero when no entity exists; return zero. */
s32 func_0201aecc(GamePhaseActorScriptVm *self)
{
    u8 *runtime = (u8 *)data_021052fc;
    u8 *entity = *(u8 **)(runtime + 0x2ea8);
    GamePhaseScriptVm_SetResult(&self->base, entity ? (u32)(*(s32 *)(entity + 0x24) >> 12) : 0);
    return 0;
}

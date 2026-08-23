#include "tingle/game_phase_script_vm.h"

/* Store integer position components from the runtime's optional active entity as VM results. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
#ifdef __cplusplus
}
#endif

/* Store active-entity X in integer units, or zero when no entity exists, as the VM result; return zero. */
s32 GamePhaseActorScriptVm_GetActiveEntityPositionX(GamePhaseActorScriptVm *self)
{
    u8 *runtime = (u8 *)data_021052fc;
    u8 *entity = *(u8 **)(runtime + 0x2ea8);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, entity ? (u32)(*(s32 *)(entity + 0x1c) >> 12) : 0);
    return 0;
}

/* Store active-entity Y in integer units, or zero when no entity exists, as the VM result; return zero. */
s32 GamePhaseActorScriptVm_GetActiveEntityPositionY(GamePhaseActorScriptVm *self)
{
    u8 *runtime = (u8 *)data_021052fc;
    u8 *entity = *(u8 **)(runtime + 0x2ea8);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, entity ? (u32)(*(s32 *)(entity + 0x20) >> 12) : 0);
    return 0;
}

/* Store active-entity Z in integer units, or zero when no entity exists, as the VM result; return zero. */
s32 GamePhaseActorScriptVm_GetActiveEntityPositionZ(GamePhaseActorScriptVm *self)
{
    u8 *runtime = (u8 *)data_021052fc;
    u8 *entity = *(u8 **)(runtime + 0x2ea8);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, entity ? (u32)(*(s32 *)(entity + 0x24) >> 12) : 0);
    return 0;
}

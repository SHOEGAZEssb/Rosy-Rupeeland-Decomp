#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes that query and update the table at data_021f3d68. */

#ifdef __cplusplus
extern "C" {
#endif
extern u8 data_021f3d68[];
extern u8 *RuntimeRecordTable_FindByKey(void *table, u32 index);
extern void *RuntimeRecordTable_IsKeyActive(void *table, u32 value);
extern void RuntimeRecordTable_ActivateByKey(void *table, u32 value);
#ifdef __cplusplus
}
#endif

/*
 * Pop a byte offset and table index, resolve the indexed record through
 * RuntimeRecordTable_FindByKey, store the byte at resolved+offset+0xc as the VM result, and return zero.
 */
s32 GamePhaseActorScriptVm_GetDataTableRecordByte(GamePhaseActorScriptVm *self)
{
    u32 recordByteOffset = GamePhaseScriptVm_Pop(&self->base);
    u32 key = GamePhaseScriptVm_Pop(&self->base);
    u8 *record = RuntimeRecordTable_FindByKey(data_021f3d68, key);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(
        &self->base, record[recordByteOffset + 0xc]);
    return 0;
}

/* Store whether RuntimeRecordTable_IsKeyActive finds the popped value in data_021f3d68 as the VM result. */
s32 GamePhaseActorScriptVm_HasDataTableValue(GamePhaseActorScriptVm *self)
{
    u32 key = GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(
        &self->base, RuntimeRecordTable_IsKeyActive(data_021f3d68, key) != 0);
    return 0;
}

/* Pop a value, pass it to RuntimeRecordTable_ActivateByKey for data_021f3d68, and return zero. */
s32 GamePhaseActorScriptVm_UpdateDataTableValue(GamePhaseActorScriptVm *self)
{
    u32 key = GamePhaseScriptVm_Pop(&self->base);
    RuntimeRecordTable_ActivateByKey(data_021f3d68, key);
    return 0;
}

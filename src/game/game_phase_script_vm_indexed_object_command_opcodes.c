#include "tingle/game_phase_script_vm.h"

/* Implement two script opcodes that command objects from a recovered global pointer table. */

#ifdef __cplusplus
extern "C" {
#endif
extern void **data_021f5128;
extern void RetailRecordCategory_InsertById(void *object, s32 value);
extern void RecordCategory_RemoveById(void *object, s32 value);
extern u32 RetailRecord_GetCategoryBank(u16 id);
extern void *RecordCategory_FindSlotById(void *category, u32 bank, u16 id);
extern void RecordDescriptor_SetValue(void *object, s32 value);
#ifdef __cplusplus
}
#endif

/* Pop a command value and table index, call RetailRecordCategory_InsertById on that object, and return zero. */
s32 GamePhaseActorScriptVm_InsertRetailRecordIdAtCategoryIndex(GamePhaseActorScriptVm *self)
{
    s32 recordId = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 categoryIndex = (s32)GamePhaseScriptVm_Pop(&self->base);
    RetailRecordCategory_InsertById(data_021f5128[categoryIndex], recordId);
    return 0;
}

/* Pop a command value and table index, call RecordCategory_RemoveById on that object, and return zero. */
s32 GamePhaseActorScriptVm_RemoveRetailRecordIdAtCategoryIndex(GamePhaseActorScriptVm *self)
{
    s32 recordId = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 categoryIndex = (s32)GamePhaseScriptVm_Pop(&self->base);
    RecordCategory_RemoveById(data_021f5128[categoryIndex], recordId);
    return 0;
}

/*
 * Pop a value, record ID, and category index. Find the category slot in the
 * record-selected bank and apply the value when that slot is present.
 */
s32 GamePhaseActorScriptVm_SetRetailRecordValue(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 id = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 categoryIndex = (s32)GamePhaseScriptVm_Pop(&self->base);
    void *category = data_021f5128[categoryIndex];
    void *slot = RecordCategory_FindSlotById(
        category, RetailRecord_GetCategoryBank((u16)id), (u16)id);
    if (slot)
        RecordDescriptor_SetValue(slot, value);
    return 0;
}

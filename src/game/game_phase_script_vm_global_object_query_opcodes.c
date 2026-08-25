#include "tingle/game_phase_script_vm.h"

/* Implement boolean script queries against a recovered process-global object subsystem. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021f5128;
extern void *RetailRecordManager_IsSelectorDiscovered(void *context, s32 selector);
extern void *RetailRecordManager_IsSelectorAvailable(void *context, s32 selector);
extern void *RetailRecordManager_CategoryHasAvailableEntry(void *context, s32 selector);
extern s32 RetailRecordManager_CategoryContainsRecordId(void *manager,
                                                         s32 category_index,
                                                         s32 id);
extern s32 RetailRecordManager_GetType1Tier(void *manager, s32 category_index,
                                            s32 id);
#ifdef __cplusplus
}
#endif

/* Pop a selector, test RetailRecordManager_CategoryHasAvailableEntry for a non-null result, store that Boolean as the VM result, and return zero. */
s32 GamePhaseActorScriptVm_HasAvailableRetailRecordForSelector(GamePhaseActorScriptVm *self)
{
    s32 selector = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, RetailRecordManager_CategoryHasAvailableEntry(data_021f5128, selector) != 0);
    return 0;
}

/* Pop a record ID and category index, store whether that category contains the
 * record, update the VM condition, and return zero. */
s32 GamePhaseActorScriptVm_QueryRetailRecordPresent(GamePhaseActorScriptVm *self)
{
    s32 id = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 categoryIndex = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base,
        RetailRecordManager_CategoryContainsRecordId(data_021f5128,
                                                      categoryIndex, id) != 0);
    return 0;
}

/* Pop a selector, test RetailRecordManager_IsSelectorDiscovered for a non-null result, store that Boolean as the VM result, and return zero. */
s32 GamePhaseActorScriptVm_IsRetailRecordSelectorDiscovered(GamePhaseActorScriptVm *self)
{
    s32 selector = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, RetailRecordManager_IsSelectorDiscovered(data_021f5128, selector) != 0);
    return 0;
}

/* Pop a selector, test RetailRecordManager_IsSelectorAvailable for a non-null result, store that Boolean as the VM result, and return zero. */
s32 GamePhaseActorScriptVm_IsRetailRecordSelectorAvailable(GamePhaseActorScriptVm *self)
{
    s32 selector = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, RetailRecordManager_IsSelectorAvailable(data_021f5128, selector) != 0);
    return 0;
}

/* Pop a record ID and category index, store its current type-one tier as the VM
 * result, update the VM condition, and return zero. */
s32 GamePhaseActorScriptVm_QueryRetailRecordTier(GamePhaseActorScriptVm *self)
{
    s32 id = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 categoryIndex = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(
        &self->base,
        RetailRecordManager_GetType1Tier(data_021f5128, categoryIndex, id));
    return 0;
}

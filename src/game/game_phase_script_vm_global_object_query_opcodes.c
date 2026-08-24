#include "tingle/game_phase_script_vm.h"

/* Implement boolean script queries against a recovered process-global object subsystem. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021f5128;
extern void *RetailRecordManager_IsSelectorDiscovered(void *context, s32 selector);
extern void *RetailRecordManager_IsSelectorAvailable(void *context, s32 selector);
extern void *RetailRecordManager_CategoryHasAvailableEntry(void *context, s32 selector);
extern void *func_0207a99c(void *context, s32 first, s32 second);
extern u32 func_0207a4a8(void *context, s32 first, s32 second);
#ifdef __cplusplus
}
#endif

/* Pop a selector, test RetailRecordManager_CategoryHasAvailableEntry for a non-null result, store that Boolean as the VM result, and return zero. */
s32 func_02017788(GamePhaseActorScriptVm *self)
{
    s32 selector = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, RetailRecordManager_CategoryHasAvailableEntry(data_021f5128, selector) != 0);
    return 0;
}

/* Pop second and first selectors, test func_0207a99c, store its non-null status as the VM result, and return zero. */
s32 func_020177c8(GamePhaseActorScriptVm *self)
{
    s32 second = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 first = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base,
                  func_0207a99c(data_021f5128, first, second) != 0);
    return 0;
}

/* Pop a selector, test RetailRecordManager_IsSelectorDiscovered for a non-null result, store that Boolean as the VM result, and return zero. */
s32 func_0201787c(GamePhaseActorScriptVm *self)
{
    s32 selector = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, RetailRecordManager_IsSelectorDiscovered(data_021f5128, selector) != 0);
    return 0;
}

/* Pop a selector, test RetailRecordManager_IsSelectorAvailable for a non-null result, store that Boolean as the VM result, and return zero. */
s32 func_020178bc(GamePhaseActorScriptVm *self)
{
    s32 selector = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, RetailRecordManager_IsSelectorAvailable(data_021f5128, selector) != 0);
    return 0;
}

/* Pop second and first selectors, store the value returned by func_0207a4a8 as the VM result, and return zero. */
s32 func_02017938(GamePhaseActorScriptVm *self)
{
    s32 second = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 first = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, func_0207a4a8(data_021f5128, first, second));
    return 0;
}

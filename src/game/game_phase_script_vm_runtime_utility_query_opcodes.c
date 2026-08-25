#include "tingle/game_phase_script_vm.h"
#include "tingle/game_work.h"

/*
 * Implement adjacent runtime utility and query opcodes: global subsystem
 * calls, a normalized-distance test, and accessors for two GameWork counters.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021e9e00;
extern void *data_021e9ac0;
extern void *gGamePhaseTouchPromptTaskNode;
extern void *gRuntimeContext;
extern void RetailPhaseDatabase_UnlockById(void *state, u16 value);
extern void ActorDescriptorState_ActivateFirstEligible(void *state);
extern void GamePhaseTouchPrompt_SetEnabled(void *state, s32 value);
extern s32 RetailSaveContext_BeginRecordOperation(void *context, s32 zero0, s32 zero1, s32 enabled);
extern s32 func_020befec(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

/* Pop a u16 value, pass it to the recovered global subsystem, and return zero. */
s32 GamePhaseActorScriptVm_UnlockRetailPhaseById(GamePhaseActorScriptVm *self)
{
    u16 phaseId = (u16)GamePhaseScriptVm_Pop(&self->base);
    RetailPhaseDatabase_UnlockById(&data_021e9e00, phaseId);
    return 0;
}

/*
 * Pop a u16 count and invoke the recovered operation on global state offset
 * 0x34 exactly count times.  A zero count has no effect.  Return zero.
 */
s32 GamePhaseActorScriptVm_ActivateEligibleActorDescriptors(GamePhaseActorScriptVm *self)
{
    u16 count = (u16)GamePhaseScriptVm_Pop(&self->base);
    u16 index;
    for (index = 0; index < count; index++)
        ActorDescriptorState_ActivateFirstEligible((u8 *)data_021e9ac0 + 0x34);
    return 0;
}

/* Pop an enable value, apply it to the touch-prompt task, and return zero. */
s32 GamePhaseActorScriptVm_SetTouchPromptEnabled(GamePhaseActorScriptVm *self)
{
    s32 enabled = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseTouchPrompt_SetEnabled(
        *(void **)((u8 *)gGamePhaseTouchPromptTaskNode + 8), enabled);
    return 0;
}

/* Query the runtime context with fixed arguments (0, 0, 1), store the VM result, and return zero. */
s32 GamePhaseActorScriptVm_BeginRetailRecordOperation(GamePhaseActorScriptVm *self)
{
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)RetailSaveContext_BeginRecordOperation(gRuntimeContext, 0, 0, 1));
    return 0;
}

/* Convert an fx32 value squared back to fx32 using retail rounding. */
static s32 squareFx32(s32 value)
{
    return (s32)(((s64)value * value + 0x800) >> 12);
}

/*
 * Pop vertical radius, horizontal radius, first Y/X, and second Y/X.  Store one as the VM result
 * when the points coincide or when the sum of the two normalized squared-axis
 * distances is below 1.0 fx32; otherwise store zero.  The recovered division
 * routine supplies each normalized term.  Return zero.
 */
s32 GamePhaseActorScriptVm_IsPointWithinEllipse(GamePhaseActorScriptVm *self)
{
    s32 verticalRadius = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 horizontalRadius = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 firstY = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 firstX = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 secondY = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 secondX = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 deltaXFx = (secondX - firstX) << 12;
    s32 deltaYFx = (secondY - firstY) << 12;
    s32 withinEllipse = 0;
    if (deltaXFx == 0 && deltaYFx == 0) {
        withinEllipse = 1;
    } else if (func_020befec(squareFx32(deltaXFx),
                             horizontalRadius * horizontalRadius)
             + func_020befec(squareFx32(deltaYFx),
                             verticalRadius * verticalRadius)
             < 0x1000) {
        withinEllipse = 1;
    }
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base,
                                                     (u32)withinEllipse);
    return 0;
}

/* Store the currency-increase accumulator as the VM result and return zero. */
s32 GamePhaseActorScriptVm_GetCurrencyIncreaseAccumulator(GamePhaseActorScriptVm *self)
{
    GamePhaseScriptVm_StoreResultAndUpdateCondition(
        &self->base, (u32)gGameWork->currencyIncreaseAccumulator);
    return 0;
}

/* Store the negated currency-decrease accumulator and return zero. */
s32 GamePhaseActorScriptVm_GetNegatedCurrencyDecreaseAccumulator(GamePhaseActorScriptVm *self)
{
    GamePhaseScriptVm_StoreResultAndUpdateCondition(
        &self->base, (u32)-gGameWork->currencyDecreaseAccumulator);
    return 0;
}

/* Clear both pending currency-change accumulators and return zero. */
s32 GamePhaseActorScriptVm_ClearCurrencyChangeAccumulators(GamePhaseActorScriptVm *self)
{
    (void)self;
    gGameWork->currencyIncreaseAccumulator = 0;
    gGameWork->currencyDecreaseAccumulator = 0;
    return 0;
}

/* Return zero without consuming operands or changing state. */
s32 GamePhaseActorScriptVm_RuntimeUtilityNoOp(GamePhaseActorScriptVm *self)
{
    (void)self;
    return 0;
}

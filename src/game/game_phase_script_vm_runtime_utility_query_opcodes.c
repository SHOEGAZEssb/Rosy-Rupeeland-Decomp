#include "tingle/game_phase_script_vm.h"

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
extern void *gGameWork;
extern void RetailPhaseDatabase_UnlockById(void *state, u16 value);
extern void ActorDescriptorState_ActivateFirstEligible(void *state);
extern void GamePhaseTouchPrompt_SetEnabled(void *state, s32 value);
extern s32 RetailSaveContext_BeginRecordOperation(void *context, s32 zero0, s32 zero1, s32 enabled);
extern s32 func_020befec(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

/* Pop a u16 value, pass it to the recovered global subsystem, and return zero. */
s32 func_02019104(GamePhaseActorScriptVm *self)
{
    u16 value = (u16)GamePhaseScriptVm_Pop(&self->base);
    RetailPhaseDatabase_UnlockById(&data_021e9e00, value);
    return 0;
}

/*
 * Pop a u16 count and invoke the recovered operation on global state offset
 * 0x34 exactly count times.  A zero count has no effect.  Return zero.
 */
s32 GamePhaseActorScriptVm_RepeatGlobalState34Operation(GamePhaseActorScriptVm *self)
{
    u16 count = (u16)GamePhaseScriptVm_Pop(&self->base);
    u16 index;
    for (index = 0; index < count; index++)
        ActorDescriptorState_ActivateFirstEligible((u8 *)data_021e9ac0 + 0x34);
    return 0;
}

/* Pop a value, apply it to recovered global state offset 0x08, and return zero. */
s32 GamePhaseActorScriptVm_SetTouchPromptEnabled(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseTouchPrompt_SetEnabled(*(void **)((u8 *)gGamePhaseTouchPromptTaskNode + 8), value);
    return 0;
}

/* Query the runtime context with fixed arguments (0, 0, 1), store the VM result, and return zero. */
s32 GamePhaseActorScriptVm_QueryRuntimeContextFixedMode(GamePhaseActorScriptVm *self)
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
    s32 dx = (secondX - firstX) << 12;
    s32 dy = (secondY - firstY) << 12;
    s32 inside = 0;
    if (dx == 0 && dy == 0) {
        inside = 1;
    } else if (func_020befec(squareFx32(dx), horizontalRadius * horizontalRadius)
             + func_020befec(squareFx32(dy), verticalRadius * verticalRadius)
             < 0x1000) {
        inside = 1;
    }
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)inside);
    return 0;
}

/* Store the confirmed GameWork word at offset 0x44 as the VM result and return zero. */
s32 GamePhaseActorScriptVm_GetGameWorkField44(GamePhaseActorScriptVm *self)
{
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, *(u32 *)((u8 *)gGameWork + 0x44));
    return 0;
}

/* Store the negated GameWork word at offset 0x48 as the VM result and return zero. */
s32 GamePhaseActorScriptVm_GetNegatedGameWorkField48(GamePhaseActorScriptVm *self)
{
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)-*(s32 *)((u8 *)gGameWork + 0x48));
    return 0;
}

/* Clear the GameWork words at offsets 0x44 and 0x48 and return zero. */
s32 GamePhaseActorScriptVm_ClearGameWorkFields44And48(GamePhaseActorScriptVm *self)
{
    (void)self;
    *(u32 *)((u8 *)gGameWork + 0x44) = 0;
    *(u32 *)((u8 *)gGameWork + 0x48) = 0;
    return 0;
}

/* Return zero without consuming operands or changing state. */
s32 GamePhaseActorScriptVm_RuntimeUtilityNoOp(GamePhaseActorScriptVm *self)
{
    (void)self;
    return 0;
}

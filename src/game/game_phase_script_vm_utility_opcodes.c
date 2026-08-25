#include "tingle/game_phase_script_vm.h"
#include "tingle/heap.h"

/* Implement miscellaneous script opcodes for notifications, distance, scene creation, and value queries. */

#ifdef __cplusplus
extern "C" {
#endif
extern const char data_020d5b2c[];
extern void *data_021e9ac0;
extern void ActorInteraction_SetDirectionAndMagnitude(u16 directionIndex,
                                                       u16 magnitude);
extern s32 func_020adc40(s32 value);
extern void *GamePhaseMetadata_GetByIndex(s32 phaseIndex);
typedef struct GamePhaseApplyScene GamePhaseApplyScene;
extern GamePhaseApplyScene *GamePhaseApplyScene_Init(
    GamePhaseApplyScene *self, void *pendingArea, u32 requestValue0,
    u32 requestValue1, u32 unusedRequestValue3);
extern s32 SignedAbsoluteValueVariant(s32 value);
extern u32 func_02063670(void *table, u16 value);
#ifdef __cplusplus
}
#endif

/*
 * Pop a magnitude and direction-table index, discard one additional value,
 * publish the interaction input pair, and return zero.
 */
s32 GamePhaseActorScriptVm_SetInteractionDirectionAndMagnitude(GamePhaseActorScriptVm *self)
{
    u16 magnitude = (u16)GamePhaseScriptVm_Pop(&self->base);
    u16 directionIndex = (u16)GamePhaseScriptVm_Pop(&self->base);
    (void)GamePhaseScriptVm_Pop(&self->base);
    ActorInteraction_SetDirectionAndMagnitude(directionIndex, magnitude);
    return 0;
}

/*
 * Pop two integer XYZ triples, calculate their Euclidean distance through
 * func_020adc40, arithmetically divide the result by 64, store it as the VM result, and return zero.
 */
s32 GamePhaseActorScriptVm_CalculateScaledDistance(GamePhaseActorScriptVm *self)
{
    s32 firstPointZ = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 firstPointX = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 firstPointY = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 secondPointZ = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 secondPointX = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 secondPointY = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 deltaX = firstPointX - secondPointX;
    s32 deltaZ = firstPointZ - secondPointZ;
    s32 deltaY = firstPointY - secondPointY;
    s32 distance = func_020adc40(
        deltaX * deltaX + deltaZ * deltaZ + deltaY * deltaY);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)(distance >> 6));
    return 0;
}

/*
 * Pop field2c, field28, and one-based phase ID; allocate a 0x30-byte apply
 * scene with the confirmed heap tag, initialize it when allocation succeeds,
 * pass a zero matching-only fifth argument ignored by the recovered constructor,
 * and return zero.
 */
s32 GamePhaseActorScriptVm_CreateApplyScene(GamePhaseActorScriptVm *self)
{
    u32 secondaryRequestValue = GamePhaseScriptVm_Pop(&self->base);
    u32 primaryRequestValue = GamePhaseScriptVm_Pop(&self->base);
    s32 phaseNumber = (s32)GamePhaseScriptVm_Pop(&self->base);
    void *applySceneStorage = Heap_Alloc(
        0x30, data_020d5b2c, 4, &gHeapContext);
    if (applySceneStorage != 0)
        GamePhaseApplyScene_Init(
            (GamePhaseApplyScene *)applySceneStorage,
            GamePhaseMetadata_GetByIndex(phaseNumber - 1),
            primaryRequestValue, secondaryRequestValue, 0);
    return 0;
}

/* Pop a signed value, store its absolute magnitude as the VM result, and return zero. */
s32 GamePhaseActorScriptVm_GetAbsoluteValue(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)SignedAbsoluteValueVariant(value));
    return 0;
}

/* Pop a u16 key, query the inventory table, store the value, and return zero. */
s32 GamePhaseActorScriptVm_QueryInventoryTableByKey(GamePhaseActorScriptVm *self)
{
    u16 key = (u16)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(
        &self->base, func_02063670(data_021e9ac0, key));
    return 0;
}

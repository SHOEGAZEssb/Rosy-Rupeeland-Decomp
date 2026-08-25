#ifndef TINGLE_GAME_PHASE_SCRIPT_VM_H
#define TINGLE_GAME_PHASE_SCRIPT_VM_H

#include "tingle/types.h"

typedef struct GamePhaseScriptVm GamePhaseScriptVm;

typedef struct GamePhaseScriptVmVTable {
    GamePhaseScriptVm *(*destroy)(GamePhaseScriptVm *self);
    GamePhaseScriptVm *(*destroyAndFree)(GamePhaseScriptVm *self);
    s32 (*noOpHook)(GamePhaseScriptVm *self);
} GamePhaseScriptVmVTable;

enum {
    GAME_PHASE_SCRIPT_VM_HALTED = 1,
    GAME_PHASE_SCRIPT_VM_CONDITION_TRUE = 2
};

enum {
    GAME_PHASE_ACTOR_SCRIPT_VM_ACTIVE = 1,
    GAME_PHASE_ACTOR_SCRIPT_VM_EFFECT_STATE_PENDING = 2
};

/* Compact bytecode interpreter state with registers and a shared value/call stack. */
struct GamePhaseScriptVm {
    const GamePhaseScriptVmVTable *vtable;
    const s8 *cursor;
    const s8 *scriptStart;
    u32 externalStorage[8];
    u32 registers[8];
    u32 stack[12];
    s8 stackDepth;
    u8 stateFlags;
    s8 preservedByte7e;
    s8 resetByte7f;
    void *contextWords;
};

/* Script VM specialization used by actor-bound phase scripts. */
typedef struct GamePhaseActorScriptVm {
    GamePhaseScriptVm base;
    void *actor;
    s32 waitCounter;
    u32 actorStateFlags;
    u8 effectStateValue;
    u8 padding_91[3];
} GamePhaseActorScriptVm;

typedef char GamePhaseScriptVmVTableSizeCheck[
    sizeof(GamePhaseScriptVmVTable) == 0x0c ? 1 : -1];
typedef char GamePhaseScriptVmSizeCheck[
    sizeof(GamePhaseScriptVm) == 0x84 ? 1 : -1];
typedef char GamePhaseActorScriptVmSizeCheck[
    sizeof(GamePhaseActorScriptVm) == 0x94 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif
extern const GamePhaseScriptVmVTable gGamePhaseScriptVmVTable;
extern const GamePhaseScriptVmVTable gGamePhaseActorScriptVmVTable;
GamePhaseScriptVm *GamePhaseScriptVm_Init(GamePhaseScriptVm *self);
void GamePhaseScriptVm_Reset(GamePhaseScriptVm *self);
GamePhaseScriptVm *GamePhaseScriptVm_Destroy(GamePhaseScriptVm *self);
GamePhaseScriptVm *GamePhaseScriptVm_DestroyAndFree(GamePhaseScriptVm *self);
GamePhaseScriptVm *GamePhaseScriptVm_DestroyBase(GamePhaseScriptVm *self);
GamePhaseScriptVm *GamePhaseScriptVm_InitWithScript(GamePhaseScriptVm *self,
                                                    const s8 *script,
                                                    void *contextWords);
void GamePhaseScriptVm_ResetWithScript(GamePhaseScriptVm *self,
                                       const s8 *script, void *contextWords);
GamePhaseScriptVm *GamePhaseScriptVm_Assign(GamePhaseScriptVm *self,
                                            const GamePhaseScriptVm *source);
void GamePhaseScriptVm_CopyState(GamePhaseScriptVm *self,
                                 const GamePhaseScriptVm *source);
u32 GamePhaseScriptVm_Pop(GamePhaseScriptVm *self);
void GamePhaseScriptVm_Push(GamePhaseScriptVm *self, u32 value);
s32 GamePhaseScriptVm_Execute(GamePhaseScriptVm *self, s32 singleStep);
s32 GamePhaseScriptVm_NoOpHook(GamePhaseScriptVm *self);
void GamePhaseScriptVm_StoreResultAndUpdateCondition(GamePhaseScriptVm *self, u32 result);
s32 GamePhaseScriptVm_DispatchRuntimeMotionCommand(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_StoreRandomBelowLimit(GamePhaseScriptVm *self);
s32 GamePhaseActorScriptVm_SetPositionFromCoordinates3D(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchIndexedActorValueCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetAttachmentAnimation(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ConfigureAttachmentFlagsForEnabledState(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetWaitCountdown(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_WaitForCountdown(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetAttachmentEnabledIfPresent(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetActorFlag20(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_LookupAngleFirstComponent(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_LookupAngleSecondComponent(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ComputeAngle(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetVectorX(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetVectorY(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetVectorZ(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchActorModeCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_IsActorFlag1Set(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchCollectionModeCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetAttachmentByte38(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_WaitForAttachmentFlag1Set(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetAttachmentHalfword36(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetActorFlag2Inverse(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetActorFlag4Inverse(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_StartMovement(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_WaitForMovementCompletion(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_IsMovementActive(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetField5cLowHalfword(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_QueryRuntimeLayerPair(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetField3c(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetField40(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_LookupDirectionTowardCoordinates(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetCollection1ActorVectorX(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetCollection1ActorVectorY(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetCollection1ActorVectorZ(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetActorFlag10AndAttachmentFlag40(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetAttachmentFlag80(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetAttachmentFlag20(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ComputeFixedPointRoot(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_CancelMovement(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_FaceIndexedActorAndGetAttachmentByte38(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetFieldE6(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ClearFlag01000000AndCleanup(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_NoOp(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_QueryActorProperty(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetActorProperty(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_QueryIndexedActorProperty(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetIndexedActorProperty(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetSelectedActorFlag169Bit0(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetIndexedRuntimeActorFlag169Bit0(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetGameWorkFlag(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ClearGameWorkFlag(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_TestGameWorkFlag(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ConfigureAttachmentByte3aAndFlag80(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetActorField4e(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_MaskValueByBit(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetActorFlag8(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetActorFlag200000Inverse(GamePhaseActorScriptVm *self);
void Actor_SetFlag200000Inverse(void *actor, s32 enabled);
s32 GamePhaseActorScriptVm_SetTileMapCell(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_QueryTerrainHeight(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DiscardValue(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SavePrimaryAttachmentState(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_RestorePrimaryAttachmentState(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_QueueEffectStateValue(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ClearPendingEffectState(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ConfigureOrSpawnOverlay62Effect(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetPositionFromCoordinates(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_TranslateSecondaryBounds(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_TranslateCollisionBounds(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_StageAreaRequest(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_StartBrightnessTransition(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_IsBrightnessTransitionPending(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetCollectionPendingValue(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_PresentationNoOp(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetAttachmentAngle(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetAttachmentAngleFromByte(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetAttachmentScale(GamePhaseActorScriptVm *self);
s32 func_020142f4(GamePhaseActorScriptVm *self);
s32 func_02014314(GamePhaseActorScriptVm *self);
s32 func_0201433c(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchEffectCommand(GamePhaseActorScriptVm *self);
u32 *RectS32_Set(u32 *rectangle, s32 left, s32 top, s32 right, s32 bottom);
s32 GamePhaseActorScriptVm_SetMotionProbeScale(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetAttachmentFrameIndex(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_CalculateDistanceToCoordinates(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_OpenDebugHudFromCollectionMode(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_CreateOverlay60PresentationPreset136f(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_CreateOverlay60PresentationPreset1372(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_CreateOverlay61DebugObject(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_OpenDebugHudFromLookupTables(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_WaitForDebugHudInput(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetDataTableRecordByte(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_HasDataTableValue(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_UpdateDataTableValue(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetActorRectangle(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ExpandActorRectangleLeft(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ExpandActorRectangleTop(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ExpandActorRectangleRight(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ExpandActorRectangleBottom(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchOppositeCollectionActorCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetInteractionDirectionAndMagnitude(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_CalculateScaledDistance(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_CreateApplyScene(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetAbsoluteValue(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_QueryInventoryTableByKey(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetIndexedActorActive(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ActivateAllActors(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_RebuildPrimaryAttachmentPreservingDisplayState(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetSystemStateHalfword5c(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_StepActorOrientation(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchInventoryTableKeyValueVariantA(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchInventoryTableKeyValueVariantB(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchInventoryTableTriple(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchInventoryTableValue(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_HasInventoryTableEntry(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_InventoryTableContainsId(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SecondaryTableContainsValue(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchRuntimeCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetGameWorkFlag1004AndCollection1ActorFlag4(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_RuntimeMiscNoOp0(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_RuntimeMiscNoOp1(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_BeginRuntimeActorAuxiliaryShutdown(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_IsRuntimeActorAboveTerrainOrFlagD0Bit4Set(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchSubBackgroundCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchMainBackgroundCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_QueryPackedTileField(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetPackedTileField(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_PlaceActorOnGridAndSetBounds(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_IsCollection1ActorInRectangle(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ConfigureMotionProbe(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ResetMotionProbe(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetGameWorkMotionOscillation(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ClearGameWorkMotionOscillation(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetAreaFollowerMotionOscillation(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ClearAreaFollowerMotionOscillation(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetActorFlag40AndClearField44(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_AddCurrency(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetCurrency(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetCurrencyHudVisibleAndPosition(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetCurrency(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SpawnTieredEffect(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_StartMainBrightnessToZero(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_StartMainBrightnessToMinus8(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_StartSubBrightnessToZero(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_StartSubBrightnessToMinus8(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DebugHudNoOp(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetDebugHudNumberRow(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetDebugHudTextRowFromCollectionMode(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetDebugHudRectangle(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SpawnDualVariantEffect(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetRuntimeCollection2Enabled(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetAreaSceneEnabled(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchRuntimeObjectSlot9(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SelectRuntimeScreenMode1(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SelectRuntimeScreenMode0(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_RuntimeControlNoOp(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_InsertRetailRecordIdAtCategoryIndex(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_RemoveRetailRecordIdAtCategoryIndex(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_HasAvailableRetailRecordForSelector(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_QueryRetailRecordPresent(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetRetailRecordValue(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_IsRetailRecordSelectorDiscovered(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_IsRetailRecordSelectorAvailable(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetActorRuntimeFlag100WhenZero(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_QueryRetailRecordTier(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetRisingSpriteSwarmEnabled(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchActorScaledVectorCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchActorPresentationMode(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchObjectFactory(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchIndexedSubtypeActorCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetInteractionIconOffset(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ReturnOne(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchActorSigned16Command(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetActorFlag10(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_StartSelectedDisplayBrightnessTransitions(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetInteractionIconEnabled(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchActorBoundsCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchInteractionBoundsCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetInteractionIconDirection(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchActiveType7ActorCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchType7ActorQuery(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_UnlockRetailPhaseById(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ActivateEligibleActorDescriptors(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetTouchPromptEnabled(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_BeginRetailRecordOperation(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_IsPointWithinEllipse(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetCurrencyIncreaseAccumulator(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetNegatedCurrencyDecreaseAccumulator(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ClearCurrencyChangeAccumulators(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_RuntimeUtilityNoOp(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchScenarioAction(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchActorEffectCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ConfigureAndStartPackedTimer(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_MarkPackedTimerComplete(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetPackedTimerRepeatCount(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_IsPackedTimerActive(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ResetType1ActorWhenFieldE4Zero(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_CreateSecondaryRenderAttachmentAndSetFlag1(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ReleaseSecondaryRenderAttachmentAndClearFlag1(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchType1ManagerCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchType1ManagerQuery(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchGamePhaseProgressCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_InsertSelectionHistoryId(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetSelectionHistoryTrailingValue(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchRuntimeObjectValue(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetInteractionIconEnabledFlag(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetAuxiliaryOverlayCameraTarget(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_PrepareRuntimeScene(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchVisualEffectControl(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchOptionalSingletonControl(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchOptionalSingletonQuery(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GenerateModeBasedValue(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_LookupSignedByteByHighNibble(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SelectWeightedGameWorkValue(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchSoundContextUtilityCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchSoundCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchTwoOperandSoundCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchThreeOperandSoundCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchEffectParameterCommand(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_PlayStream(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_ConfigureSoundGroupSlots(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetPackedBitGridMask(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetPackedBitGridBit(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_IsPointInRectangle(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetActiveEntityPositionX(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetActiveEntityPositionY(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetActiveEntityPositionZ(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SetPlacementModeAndSynchronize(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_QueryGlobalContextByIndex(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_CalculateScaledRuntimeValue(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetInactiveKind1Subtype1DescriptorCount(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetOneBasedPhaseRecordByte4c(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_SendCommand2aToCollection2Actor0(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_GetDepartingOrFinishedGridEffectActorCount(GamePhaseActorScriptVm *self);
GamePhaseActorScriptVm *GamePhaseActorScriptVm_Init(GamePhaseActorScriptVm *self);
GamePhaseActorScriptVm *GamePhaseActorScriptVm_InitWithScript(
    GamePhaseActorScriptVm *self, void *actor, const s8 *script,
    void *context);
void GamePhaseActorScriptVm_ResetState(GamePhaseActorScriptVm *self);
GamePhaseActorScriptVm *GamePhaseActorScriptVm_Assign(
    GamePhaseActorScriptVm *self, const GamePhaseActorScriptVm *source);
void GamePhaseActorScriptVm_CopyState(GamePhaseActorScriptVm *self,
                                      const GamePhaseActorScriptVm *source);
GamePhaseActorScriptVm *GamePhaseActorScriptVm_Destroy(
    GamePhaseActorScriptVm *self);
GamePhaseActorScriptVm *GamePhaseActorScriptVm_DestroyAndFree(
    GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_DispatchOpcode(GamePhaseActorScriptVm *self, s32 index);
void GamePhaseActorScriptVm_Activate(GamePhaseActorScriptVm *self);
s32 GamePhaseActorScriptVm_IsActive(const GamePhaseActorScriptVm *self);
s32 GamePhaseScriptVm_ReadS16Le(const s8 *bytes);
u32 GamePhaseScriptVm_ReadU32Le(const s8 *bytes);
void GamePhaseScriptVm_UpdateConditionForZeroRegisterValue(GamePhaseScriptVm *self, s32 registerIndex);
s32 GamePhaseScriptVm_Halt(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_JumpAndYield(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_Jump(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_CopyRegister(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_LoadRegisterFromContext(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_StoreRegisterToContext(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_PushRegister(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_PushImmediateS16(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_LoadImmediateU32(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_AddRegisters(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_AddImmediate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_SubtractRegisters(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_SubtractImmediate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_MultiplyRegisters(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_MultiplyImmediate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_DivideRegisters(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_DivideImmediate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_ModuloRegisters(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_ModuloImmediate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_AndRegisters(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_AndImmediate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_OrRegisters(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_OrImmediate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_XorRegisters(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_XorImmediate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_NotRegister(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_JumpIfConditionSet(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_JumpIfConditionClear(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_InvokeByteMethod(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_LoadImmediateU32Alternate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_CompareGreaterRegisters(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_CompareGreaterEqualRegisters(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_CompareEqualRegisters(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_CompareLessEqualRegisters(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_CompareLessRegisters(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_CompareNotEqualRegisters(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_CompareGreaterImmediate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_CompareGreaterEqualImmediate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_CompareEqualImmediate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_CompareLessEqualImmediate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_CompareLessImmediate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_CompareNotEqualImmediate(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_Call(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_Return(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_StoreRegisterToGameWorkHalfword(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_StoreRegisterToContextSlot(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_StoreRegisterToExternalStorage(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_LoadRegisterFromGameWorkHalfword(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_LoadRegisterFromContextSlot(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_LoadRegisterFromExternalStorage(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_PushImmediateU32(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_PushGameWorkHalfword(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_PushContextSlot(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_PushExternalStorage(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_StoreRegisterToGameWorkWord(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_LoadRegisterFromGameWorkWord(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_PushGameWorkWord(GamePhaseScriptVm *self);
s32 GamePhaseScriptVm_PushZero(GamePhaseScriptVm *self);
#ifdef __cplusplus
}
#endif

#endif

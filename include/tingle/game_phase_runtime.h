#ifndef TINGLE_GAME_PHASE_RUNTIME_H
#define TINGLE_GAME_PHASE_RUNTIME_H

#include "tingle/types.h"

typedef struct RectS16 RectS16;

typedef struct GamePhaseRuntime {
    const void *vtable;
    s32 field_04;
    u8 unknown_008[0x30f8];
} GamePhaseRuntime;

typedef char GamePhaseRuntimeSizeCheck[
    sizeof(GamePhaseRuntime) == 0x3100 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

GamePhaseRuntime *GamePhaseRuntime_Init(GamePhaseRuntime *self);
void GamePhaseRuntime_Configure(GamePhaseRuntime *self, const void *config,
                   s32 x, s32 y, s32 z);
void GamePhaseRuntime_SetDisplayRouting(s32 value);
void GamePhaseRuntime_CreateFieldLoader(GamePhaseRuntime *self);
void GamePhaseRuntime_DestroyFieldLoader(GamePhaseRuntime *self);
GamePhaseRuntime *GamePhaseRuntime_Destroy(GamePhaseRuntime *self);
GamePhaseRuntime *GamePhaseRuntime_DestroyAndFree(GamePhaseRuntime *self);
s32 GamePhaseRuntime_UpdateRenderHelpers(GamePhaseRuntime *self);
s32 GamePhaseRuntime_ForwardCurrentVCount(GamePhaseRuntime *self);
s32 GamePhaseRuntime_QueueSelectionQuery(GamePhaseRuntime *self,
                                         const void *query);
void ActorQuery_CopyCoordinates(void *destination, const void *source);
s32 GamePhaseRuntime_QueueQueryUntilHandled(GamePhaseRuntime *self,
                                            const void *query);
s32 GamePhaseRuntime_QueueBroadcastQuery(GamePhaseRuntime *self,
                                         const void *query);
s32 GamePhaseRuntime_HandleEvent100(GamePhaseRuntime *self, s32 event);
s32 func_02007420(GamePhaseRuntime *self);
s32 func_02007428(GamePhaseRuntime *self);
s32 GamePhaseRuntime_Update(GamePhaseRuntime *self);
s32 func_02007868(void *context);
void GamePhaseRuntime_PrepareActorCollections(GamePhaseRuntime *self, s32 value, s32 mode);
void GamePhaseRuntime_FinalizeActorCollections(GamePhaseRuntime *self, s32 value, s32 mode);
void GamePhaseRuntime_RunFrameMaintenance(GamePhaseRuntime *self);
s32 GamePhaseRuntime_ChangeToNeighborArea(GamePhaseRuntime *self, s32 direction);
void func_02007f08(void);
void *GamePhaseRuntime_GetActorCollection(GamePhaseRuntime *self, s32 index);
void GamePhaseRuntime_StageAreaRequest(GamePhaseRuntime *self, s32 areaNumber,
                   s32 value0, s32 value1, s32 value2, s32 mode);
void GamePhaseRuntime_ApplyStagedAreaRequest(GamePhaseRuntime *self);
void GamePhaseRuntime_CreateSecondaryActorSubsystem(GamePhaseRuntime *self, void *area, s32 enabled);
void GamePhaseRuntime_DestroySecondaryActorSubsystem(GamePhaseRuntime *self);
void GamePhaseRuntime_TeardownActiveAreaState(GamePhaseRuntime *self);
s32 GamePhaseRuntime_SynchronizeActorPlacement(GamePhaseRuntime *self, s32 actorIndex);
void RectS16_Assign(RectS16 *destination, const RectS16 *source);
void VecFx32Object_InitSum(void *destination, const void *left, const void *right);
void RectS16_InitComponents(RectS16 *destination, s32 left, s32 top,
                            s32 right, s16 bottom);
s32 GamePhaseRuntime_DispatchActorQueryRequest(GamePhaseRuntime *self);
s32 GamePhaseRuntime_RequestPrimaryWarp(GamePhaseRuntime *self, s32 x, s32 y);
s32 func_02008514(GamePhaseRuntime *self, s32 x, s32 y);
void GamePhaseRuntime_ApplyScreenMode(GamePhaseRuntime *self, s32 mode, s32 use3dMode);
void func_0200866c(GamePhaseRuntime *self);
void GamePhaseRuntime_BuildPrimaryTransform(void *destination, GamePhaseRuntime *self);
void ActorMotionState_BuildOscillationOffset(void *destination, const void *runtimeFields);
void GamePhaseRuntime_BuildSecondaryTransform(void *destination, GamePhaseRuntime *self);
s32 GamePhaseRuntime_SetPlacementMode(GamePhaseRuntime *self, s32 mode, s32 synchronize);
s32 GamePhaseRuntime_GetActiveAreaPlacementVariant(GamePhaseRuntime *self);
void GamePhaseRuntime_UpdateDualScreenUiPresentation(GamePhaseRuntime *self);
void GamePhaseRuntime_InitScaledAreaCoordinates(void *destination, GamePhaseRuntime *self, const void *area);
void GamePhaseRuntime_RefreshAreaAuxiliaryObject(GamePhaseRuntime *self, void *area, s32 enabled);
void GamePhaseRuntime_RecreateDualScreenUiPresentation(GamePhaseRuntime *self, s32 mode, void *area);
void GamePhaseRuntime_UpdateActorPresentationState(GamePhaseRuntime *self, s32 mode);
void GamePhaseRuntime_ProcessPendingPresentationRefreshes(GamePhaseRuntime *self);
s32 func_02008f2c(void);
s32 FrameCounter_Tick31(void *counter);
void GamePhaseRuntime_SetGlobalValue30F8(void *value);
void *GamePhaseRuntime_GetAuxiliaryOverlayObject(GamePhaseRuntime *self);
void *Heap_FreeAndReturnPointer(void *allocation);

#ifdef __cplusplus
}
#endif

#endif

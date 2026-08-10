#ifndef TINGLE_GAME_PHASE_RUNTIME_H
#define TINGLE_GAME_PHASE_RUNTIME_H

#include "tingle/types.h"

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
s32 func_02007b18(GamePhaseRuntime *self, s32 direction);
void func_02007f08(void);
void *func_02007f0c(GamePhaseRuntime *self, s32 index);
void GamePhaseRuntime_StageAreaRequest(GamePhaseRuntime *self, s32 areaNumber,
                   s32 value0, s32 value1, s32 value2, s32 mode);
void func_02007ff4(GamePhaseRuntime *self);
void func_0200807c(GamePhaseRuntime *self, void *area, s32 enabled);
void func_020080d0(GamePhaseRuntime *self);
void func_02008110(GamePhaseRuntime *self);
s32 func_02008148(GamePhaseRuntime *self, s32 actorIndex);
void func_02008354(void *destination, const void *source);
void func_02008378(void *destination, const void *left, const void *right);
void func_020083b0(void *destination, s32 a, s32 b, s32 c, s16 d);
s32 GamePhaseRuntime_DispatchActorQueryRequest(GamePhaseRuntime *self);
s32 func_020084b8(GamePhaseRuntime *self, s32 x, s32 y);
s32 func_02008514(GamePhaseRuntime *self, s32 x, s32 y);
void func_02008570(GamePhaseRuntime *self, s32 mode, void *state);
void func_0200866c(GamePhaseRuntime *self);
void func_020086f8(void *destination, GamePhaseRuntime *self);
void func_02008740(void *destination, const void *runtimeFields);
void func_0200875c(void *destination, GamePhaseRuntime *self);
s32 func_020088b8(GamePhaseRuntime *self, s32 mode, s32 synchronize);
s32 func_02008af8(GamePhaseRuntime *self);
void func_02008b50(GamePhaseRuntime *self);
void func_02008b6c(void *destination, GamePhaseRuntime *self, const void *area);
void func_02008bb8(GamePhaseRuntime *self, void *area, s32 enabled);
void func_02008cf8(GamePhaseRuntime *self, s32 mode, void *area);
void func_02008e10(GamePhaseRuntime *self, s32 mode);
void GamePhaseRuntime_ProcessPendingPresentationRefreshes(GamePhaseRuntime *self);
s32 func_02008f2c(void);
s32 func_02008f34(void *counter);
void func_02008f58(void *value);
void *GamePhaseRuntime_GetAuxiliaryOverlayObject(GamePhaseRuntime *self);
void *Heap_FreeAndReturnPointer(void *allocation);

#ifdef __cplusplus
}
#endif

#endif

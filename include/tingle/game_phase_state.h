#ifndef TINGLE_GAME_PHASE_STATE_H
#define TINGLE_GAME_PHASE_STATE_H

#include "tingle/types.h"

/* Large runtime state embedded at GamePhaseRuntime offset 0x24. */
typedef struct GamePhaseState {
    void *configuration;
    u8 actorCollectionStorage[0x2ea0];
    u8 overlaySlotStorage[0x0c];
    void *phaseObject;
    u8 helper_2eb4[0xa4];
    u8 renderHelperStorage[0x28];
    u32 renderFlags;
    u8 helper_2f80[0x10];
    u16 field_2f90;
    s16 field_2f92;
} GamePhaseState;

#ifdef __cplusplus
extern "C" {
#endif

GamePhaseState *GamePhaseState_Init(GamePhaseState *self);
GamePhaseState *GamePhaseState_Destroy(GamePhaseState *self);
void GamePhaseState_UnloadPhase(GamePhaseState *self);
void GamePhaseState_ResetRuntime(GamePhaseState *self);
void GamePhaseState_ConfigureForPhase(GamePhaseState *self,
                                      const void *configuration);
void GamePhaseState_ApplyAreaChange(GamePhaseState *self,
                                    const void *configuration);
void GamePhaseState_ApplyConfiguration(GamePhaseState *self,
                                       const void *configuration);
void GamePhaseState_UpdateRenderHelpers(GamePhaseState *self);
void GamePhaseState_ForwardVCount(GamePhaseState *self, u16 vcount);
void GamePhaseState_ResetActivePhase(GamePhaseState *self);
void *GamePhaseState_GetConfiguration(GamePhaseState *self);
s32 GamePhaseState_QueryTerrainHeight(GamePhaseState *self, s32 x, s32 y);
void GamePhaseState_ConfigureMainDisplay(GamePhaseState *self, s32 use3dMode);
void GamePhaseState_SetEnabled(GamePhaseState *self, s32 enabled);
void GamePhaseState_ApplyPlacementState(GamePhaseState *self,
                                        const void *placementState);
s32 GamePhaseState_TryStartBoundaryTransition(GamePhaseState *self);
s32 GamePhaseState_GetBoundaryDirection(GamePhaseState *self);
void GamePhaseState_CreatePhaseObject(GamePhaseState *self,
                                      const void *configuration);

#ifdef __cplusplus
}
#endif

#endif

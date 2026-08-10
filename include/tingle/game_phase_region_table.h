#ifndef TINGLE_GAME_PHASE_REGION_TABLE_H
#define TINGLE_GAME_PHASE_REGION_TABLE_H

#include "tingle/types.h"

typedef struct GamePhaseRegion {
    s16 left;
    s16 top;
    s16 right;
    s16 bottom;
} GamePhaseRegion;

/* Owned rectangle table with per-table flags and an optional GameWork flag base. */
typedef struct GamePhaseRegionTable {
    GamePhaseRegion *regions;
    s32 count;
    u32 flags;
    s32 gameWorkFlagBase;
} GamePhaseRegionTable;

/* Only the recovered region-file slice of the larger caller record is known. */
typedef struct GamePhaseRegionFileInfo {
    u8 unknown_00[0x30];
    u32 fileOffset_30;
    u32 compressedSize_34;
} GamePhaseRegionFileInfo;

#ifdef __cplusplus
extern "C" {
#endif
GamePhaseRegionTable *GamePhaseRegionTable_Init(GamePhaseRegionTable *self);
GamePhaseRegionTable *GamePhaseRegionTable_InitWithCount(
    GamePhaseRegionTable *self, s32 count);
void GamePhaseRegion_Init(GamePhaseRegion *region);
void GamePhaseRegion_Destroy(GamePhaseRegion *region);
void GamePhaseRegionTable_Clear(GamePhaseRegionTable *self);
GamePhaseRegionTable *GamePhaseRegionTable_Destroy(GamePhaseRegionTable *self);
void GamePhaseRegionTable_SetRegionsFromSentinel(GamePhaseRegionTable *self,
                                                 const GamePhaseRegion *source);
void GamePhaseRegionTable_Resize(GamePhaseRegionTable *self, s32 count);
s32 GamePhaseRegionTable_FindContainingRegion(
    const GamePhaseRegionTable *self, s32 x, s32 y);
s32 GamePhaseRegion_ContainsPoint(const GamePhaseRegion *region, s32 x, s32 y);
GamePhaseRegion *GamePhaseRegionTable_GetRegion(GamePhaseRegionTable *self,
                                                s32 index);
s32 GamePhaseRegionTable_ClassifyContainedSide(
    const GamePhaseRegionTable *self, s32 index,
    const GamePhaseRegion *candidate);
s32 GamePhaseRegionTable_Load(GamePhaseRegionTable *self,
                              const GamePhaseRegionFileInfo *info);
s32 GamePhaseRegionTable_IsRegionEnabled(const GamePhaseRegionTable *self,
                                         s32 index);
void GamePhaseRegionTable_SetRegionEnabled(GamePhaseRegionTable *self,
                                           s32 index, s32 enabled);
s32 GamePhaseRegionTable_GetCount(const GamePhaseRegionTable *self);
void GamePhaseRegionTable_SetGameWorkFlagBase(GamePhaseRegionTable *self,
                                              s32 flagBase);
void GamePhaseRegionTable_PublishActive(GamePhaseRegionTable *self);
#ifdef __cplusplus
}
#endif

#endif

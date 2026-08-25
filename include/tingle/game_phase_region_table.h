#ifndef TINGLE_GAME_PHASE_REGION_TABLE_H
#define TINGLE_GAME_PHASE_REGION_TABLE_H

#include "tingle/types.h"

typedef struct GamePhaseRegion {
    s16 left;
    s16 top;
    s16 right;
    s16 bottom;
} GamePhaseRegion;

/* Owned rectangle table with per-table flags and optional GameWork reveal flags. */
typedef struct GamePhaseRegionTable {
    GamePhaseRegion *regions;
    s32 count;
    u32 flags;
    s32 revealFlagBase;
} GamePhaseRegionTable;

/* Only the recovered region-file slice of the larger caller record is known. */
typedef struct GamePhaseRegionFileInfo {
    u8 unknown_00[0x30];
    u32 fileOffset_30;
    u32 compressedSize_34;
} GamePhaseRegionFileInfo;

typedef char GamePhaseRegionSizeCheck[
    sizeof(GamePhaseRegion) == 0x8 ? 1 : -1];
typedef char GamePhaseRegionTableSizeCheck[
    sizeof(GamePhaseRegionTable) == 0x10 ? 1 : -1];
typedef char GamePhaseRegionFileInfoSizeCheck[
    sizeof(GamePhaseRegionFileInfo) == 0x38 ? 1 : -1];

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
s32 GamePhaseRegionTable_IsRegionRevealed(const GamePhaseRegionTable *self,
                                         s32 index);
void GamePhaseRegionTable_SetRegionRevealed(GamePhaseRegionTable *self,
                                            s32 index, s32 revealed);
s32 GamePhaseRegionTable_GetRegionCount(const GamePhaseRegionTable *self);
void GamePhaseRegionTable_SetRevealFlagBase(GamePhaseRegionTable *self,
                                            s32 revealFlagBase);
void GamePhaseRegionTable_PublishActive(GamePhaseRegionTable *self);
#ifdef __cplusplus
}
#endif

#endif

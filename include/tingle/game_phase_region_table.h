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
GamePhaseRegionTable *func_02011470(GamePhaseRegionTable *self);
GamePhaseRegionTable *func_02011498(GamePhaseRegionTable *self, s32 count);
void func_02011518(GamePhaseRegion *region);
void func_0201151c(GamePhaseRegion *region);
void func_02011520(GamePhaseRegionTable *self);
GamePhaseRegionTable *func_0201155c(GamePhaseRegionTable *self);
void func_02011584(GamePhaseRegionTable *self,
                   const GamePhaseRegion *sentinelTerminated);
void func_0201166c(GamePhaseRegionTable *self, s32 count);
s32 func_020116e8(const GamePhaseRegionTable *self, s32 x, s32 y);
s32 func_02011738(const GamePhaseRegion *region, s32 x, s32 y);
GamePhaseRegion *func_02011788(GamePhaseRegionTable *self, s32 index);
s32 func_02011794(const GamePhaseRegionTable *self, s32 index,
                   const GamePhaseRegion *candidate);
s32 func_0201185c(GamePhaseRegionTable *self,
                   const GamePhaseRegionFileInfo *info);
s32 func_020119c8(const GamePhaseRegionTable *self, s32 index);
void func_020119f4(GamePhaseRegionTable *self, s32 index, s32 enabled);
s32 func_02011a3c(const GamePhaseRegionTable *self);
void func_02011a44(GamePhaseRegionTable *self, s32 flagBase);
void func_02011a4c(GamePhaseRegionTable *self);
#ifdef __cplusplus
}
#endif

#endif

#include "tingle/types.h"

/* Validate a terrain cell while permitting a one-unit downward height step. */
extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_QueryTerrainHeight(void *actor, s32 gridX, s32 gridY);
extern u32 Actor_QueryTerrainCell(void *actor, s32 gridX, s32 gridY);
#ifdef __cplusplus
}
#endif

/*
 * Apply the same inclusive unsigned-dimension bounds and packed exclusions as
 * Actor_IsTerrainCellEligibleAtHeight, but accept queriedHeight equal to
 * referenceHeight or exactly referenceHeight-1. Class bits 5..9 equal to 7 or
 * 14 and subtype bits 10..13 equal to one are rejected. Return a strict
 * boolean. Query order is dimensions, height, then packed cell. Actor state is
 * read-only; terrain helpers may observe global map/SDK-managed state and no
 * direct hardware is accessed.
 */
s32 Actor_IsTerrainCellEligibleAtHeightOrOneBelow(void *actor, s32 gridX,
                                                   s32 gridY,
                                                   s32 referenceHeight)
{
    void *terrainMap = *(void **)((u8 *)data_021052fc + 0x2ed4);
    u32 packedDimensions = *(u32 *)((u8 *)terrainMap + 0x20);
    s32 queriedHeight;
    u32 packedCell;
    u32 terrainClass;

    if (gridX < 1 || gridY < 1 ||
        gridX > (s32)(u16)packedDimensions - 1 ||
        gridY > (s32)(u16)(packedDimensions >> 16) - 1) {
        return 0;
    }
    queriedHeight = Actor_QueryTerrainHeight(actor, gridX, gridY);
    if (queriedHeight != referenceHeight &&
        queriedHeight != referenceHeight - 1)
        return 0;

    packedCell = Actor_QueryTerrainCell(actor, gridX, gridY);
    terrainClass = (packedCell >> 5) & 0x1f;
    if (terrainClass == 7 || ((packedCell >> 10) & 0x0f) == 1 ||
        terrainClass == 14) {
        return 0;
    }
    return 1;
}

#include "tingle/types.h"

/* Validate a terrain cell against bounds, height, and packed terrain classes. */
extern void *gGamePhaseRuntime;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_QueryTerrainHeight(void *actor, s32 gridX, s32 gridY);
extern u32 Actor_QueryTerrainCell(void *actor, s32 gridX, s32 gridY);
#ifdef __cplusplus
}
#endif

/*
 * Return one when gridX/gridY are each at least one and no greater than their
 * respective unsigned packed terrain dimension minus one, the actor-aware
 * height query equals referenceHeight, class bits 5..9 are neither 7 nor 14,
 * and subtype bits 10..13 are not one. Return zero otherwise. Query order is
 * dimensions, height, then packed cell; a height mismatch avoids the cell
 * callback. Actor state is read-only. Terrain helpers may observe global
 * map/SDK-managed state; no direct hardware access.
 */
s32 Actor_IsTerrainCellEligibleAtHeight(void *actor, s32 gridX, s32 gridY,
                                        s32 referenceHeight)
{
    void *terrainMap = *(void **)((u8 *)gGamePhaseRuntime + 0x2ed4);
    u32 packedDimensions = *(u32 *)((u8 *)terrainMap + 0x20);
    u32 packedCell;
    u32 terrainClass;

    if (gridX < 1 || gridY < 1 ||
        gridX > (s32)(u16)packedDimensions - 1 ||
        gridY > (s32)(u16)(packedDimensions >> 16) - 1) {
        return 0;
    }
    if (Actor_QueryTerrainHeight(actor, gridX, gridY) != referenceHeight)
        return 0;

    packedCell = Actor_QueryTerrainCell(actor, gridX, gridY);
    terrainClass = (packedCell >> 5) & 0x1f;
    if (terrainClass == 7 || ((packedCell >> 10) & 0x0f) == 1 ||
        terrainClass == 14) {
        return 0;
    }
    return 1;
}

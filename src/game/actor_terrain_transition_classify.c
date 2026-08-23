#include "tingle/types.h"

/* Classify a terrain transition as normal, alternate, or rejected. */
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
 * Return two when either coordinate is outside one through its respective
 * unsigned packed terrain dimension minus one, class bits 5..9 equal seven,
 * or queriedHeight is above referenceHeight. Return one for any lower height,
 * or, at equal height, for subtype bits 10..13 equal one or class 14. Return
 * zero only for an equal-height ordinary cell. Query order is dimensions,
 * packed cell, the class-seven early exit, then height. Actor state is
 * read-only; terrain
 * helpers may observe global map/SDK-managed state and no direct hardware is
 * accessed.
 */
s32 Actor_ClassifyTerrainCellTransition(void *actor, s32 gridX, s32 gridY,
                                         s32 referenceHeight)
{
    void *terrainMap = *(void **)((u8 *)data_021052fc + 0x2ed4);
    u32 packedDimensions = *(u32 *)((u8 *)terrainMap + 0x20);
    u32 packedCell;
    u32 terrainClass;
    s32 queriedHeight;

    if (gridX < 1 || gridY < 1 ||
        gridX > (s32)(u16)packedDimensions - 1 ||
        gridY > (s32)(u16)(packedDimensions >> 16) - 1) {
        return 2;
    }
    packedCell = Actor_QueryTerrainCell(actor, gridX, gridY);
    terrainClass = (packedCell >> 5) & 0x1f;
    if (terrainClass == 7) return 2;

    queriedHeight = Actor_QueryTerrainHeight(actor, gridX, gridY);
    if (referenceHeight < queriedHeight) return 2;
    if (queriedHeight <= referenceHeight - 1) return 1;
    if (((packedCell >> 10) & 0x0f) == 1 || terrainClass == 14) return 1;
    return 0;
}

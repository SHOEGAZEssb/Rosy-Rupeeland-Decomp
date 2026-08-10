#include "tingle/types.h"

/* Classify a terrain transition as normal, alternate, or rejected. */
extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_QueryTerrainHeight(void *actor, s32 x, s32 y);
extern u32 Actor_QueryTerrainCell(void *actor, s32 x, s32 y);
#ifdef __cplusplus
}
#endif

/*
 * Return 2 for coordinates outside the terrain's one-cell border, packed class
 * bits 5..9 equal to 7, or a queried height above expectedHeight. Return 1 for
 * a height below expectedHeight, packed bits 10..13 equal to 1, or class 14.
 * Return 0 only for an in-bounds, equal-height ordinary cell. Terrain width and
 * height are recovered from the low/high halves of global object+0x20. Query
 * helpers read global map/SDK-managed state without changing actor fields.
 */
s32 func_02034718(void *self, s32 x, s32 y, s32 expectedHeight)
{
    void *terrain = *(void **)((u8 *)data_021052fc + 0x2ed4);
    u32 dimensions = *(u32 *)((u8 *)terrain + 0x20);
    u32 packed;
    u32 terrainClass;
    s32 height;

    if (x < 1 || y < 1 || x > (s32)(u16)dimensions - 1 ||
        y > (s32)(s16)(dimensions >> 16) - 1) {
        return 2;
    }
    packed = Actor_QueryTerrainCell(self, x, y);
    terrainClass = (packed >> 5) & 0x1f;
    if (terrainClass == 7) return 2;

    height = Actor_QueryTerrainHeight(self, x, y);
    if (expectedHeight < height) return 2;
    if (height <= expectedHeight - 1) return 1;
    if (((packed >> 10) & 0x0f) == 1 || terrainClass == 14) return 1;
    return 0;
}

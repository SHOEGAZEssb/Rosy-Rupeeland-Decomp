#include "tingle/types.h"

/* Validate a terrain cell while permitting a one-unit downward height step. */
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
 * Apply the same one-cell terrain border and packed-class exclusions as
 * func_02034568, but accept the queried height when it equals expectedHeight
 * or expectedHeight-1. Bits 5..9 equal to 7 or 14 and bits 10..13 equal to 1
 * are rejected. Return one only for an accepted cell; terrain helpers read
 * global map/SDK-managed state without changing actor fields.
 */
s32 func_0203463c(void *self, s32 x, s32 y, s32 expectedHeight)
{
    void *terrain = *(void **)((u8 *)data_021052fc + 0x2ed4);
    u32 dimensions = *(u32 *)((u8 *)terrain + 0x20);
    s32 height;
    u32 packed;
    u32 terrainClass;

    if (x < 1 || y < 1 || x > (s32)(u16)dimensions - 1 ||
        y > (s32)(s16)(dimensions >> 16) - 1) {
        return 0;
    }
    height = Actor_QueryTerrainHeight(self, x, y);
    if (height != expectedHeight && height != expectedHeight - 1) return 0;

    packed = Actor_QueryTerrainCell(self, x, y);
    terrainClass = (packed >> 5) & 0x1f;
    if (terrainClass == 7 || ((packed >> 10) & 0x0f) == 1 ||
        terrainClass == 14) {
        return 0;
    }
    return 1;
}

#include "tingle/types.h"

/* Validate a terrain cell against bounds, height, and packed terrain classes. */
extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020343e4(void *actor, s32 x, s32 y);
extern u32 func_02034464(void *actor, s32 x, s32 y);
#ifdef __cplusplus
}
#endif

/*
 * Return one when x/y are inside the terrain object's one-cell border, the
 * actor-aware height query equals expectedHeight, packed terrain bits 5..9 are
 * neither 7 nor 14, and bits 10..13 are not 1. Return zero otherwise. Terrain
 * width/height are the low/high 16-bit halves of global object+0x20. The query
 * helpers read global map/SDK-managed state but actor fields are unchanged.
 */
s32 func_02034568(void *self, s32 x, s32 y, s32 expectedHeight)
{
    void *terrain = *(void **)((u8 *)data_021052fc + 0x2ed4);
    u32 dimensions = *(u32 *)((u8 *)terrain + 0x20);
    u32 packed;
    u32 terrainClass;

    if (x < 1 || y < 1 || x > (s32)(u16)dimensions - 1 ||
        y > (s32)(s16)(dimensions >> 16) - 1) {
        return 0;
    }
    if (func_020343e4(self, x, y) != expectedHeight) return 0;

    packed = func_02034464(self, x, y);
    terrainClass = (packed >> 5) & 0x1f;
    if (terrainClass == 7 || ((packed >> 10) & 0x0f) == 1 ||
        terrainClass == 14) {
        return 0;
    }
    return 1;
}

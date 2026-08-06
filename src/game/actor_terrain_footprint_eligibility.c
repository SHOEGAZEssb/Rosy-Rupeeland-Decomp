#include "tingle/types.h"

/* Validate an actor-centered terrain footprint using its primary byte bounds. */
#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02034568(void *actor, s32 x, s32 y, s32 expectedHeight);
extern s32 func_0203463c(void *actor, s32 x, s32 y, s32 expectedHeight);
extern s32 func_0200ab18(const s8 *bounds);
extern s32 func_0200ab30(const s8 *bounds);
extern s32 func_020adae4(s32 dividend, s32 divisor);
#ifdef __cplusplus
}
#endif

/*
 * Convert supplied X/Y/height from 16.16 to integers and require the center
 * cell to pass func_02034568. Derive X/Y footprint strides as half the signed-
 * byte width/height of actor bounds +4, plus two, in 20.12 units. Probe the
 * eight surrounding positions at offsets -1..1 with func_0203463c, permitting
 * its one-level step rule. Return one only when every probe is nonzero; terrain
 * helpers read global map state and actor fields are unchanged.
 */
s32 func_02034d34(void *self, s32 x, s32 y, s32 expectedHeight)
{
    u8 *actor = (u8 *)self;
    s32 integerHeight = expectedHeight >> 16;
    s32 strideX;
    s32 strideY;
    s32 dx;
    s32 dy;

    if (func_02034568(actor, x >> 16, y >> 16, integerHeight) == 0)
        return 0;
    strideX = (func_020adae4(func_0200ab18((s8 *)actor + 4), 2) + 2) << 12;
    strideY = (func_020adae4(func_0200ab30((s8 *)actor + 4), 2) + 2) << 12;

    for (dx = -1; dx <= 1; ++dx) {
        for (dy = -1; dy <= 1; ++dy) {
            if ((dx != 0 || dy != 0) &&
                func_0203463c(actor, (x + dx * strideX) >> 16,
                              (y + dy * strideY) >> 16,
                              integerHeight) == 0) {
                return 0;
            }
        }
    }
    return 1;
}

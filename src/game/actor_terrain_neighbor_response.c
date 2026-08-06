#include "tingle/types.h"

/* Accumulate a fixed response away from rejected neighboring terrain cells. */
#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02034568(void *actor, s32 x, s32 y, s32 expectedHeight);
#ifdef __cplusplus
}
#endif

/*
 * Snapshot vector X/Y/Z at +4/+8/+0xc shifted by 16, then test the 3x3 terrain
 * neighborhood centered on X/Y with func_02034568. For every rejected cell
 * (helper return zero), add -4 times that cell's relative X/Y offset in 20.12
 * units to the original vector fields. All nine tests use the snapshotted
 * coordinates even as responses accumulate. Returns no value; terrain queries
 * read global map state and the supplied vector is modified in place.
 */
void func_02034800(void *self, void *value)
{
    u8 *vector = (u8 *)value;
    s32 originalX = *(s32 *)(vector + 4);
    s32 originalY = *(s32 *)(vector + 8);
    s32 expectedHeight = *(s32 *)(vector + 0x0c) >> 16;
    s32 dx;
    s32 dy;

    for (dx = -1; dx <= 1; ++dx) {
        for (dy = -1; dy <= 1; ++dy) {
            if (func_02034568(self, dx + (originalX >> 16),
                              dy + (originalY >> 16), expectedHeight) == 0) {
                *(s32 *)(vector + 4) += -4 * dx * 0x1000;
                *(s32 *)(vector + 8) += -4 * dy * 0x1000;
            }
        }
    }
}

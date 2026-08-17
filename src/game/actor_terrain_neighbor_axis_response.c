#include "tingle/types.h"

/* Bias a vector away from the more obstructed side of its terrain neighborhood. */
#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02034568(void *actor, s32 x, s32 y, s32 expectedHeight);
extern void Memory_ClearBytes(void *destination, u32 size);
#ifdef __cplusplus
}
#endif

/*
 * Probe the snapshotted 3x3 terrain neighborhood around vector X/Y +4/+8 at
 * expected height +0x0c. Count rejected cells independently for each relative
 * X and Y band. If left/right rejection counts differ, move vector X by 0x2000
 * away from the larger count; similarly move Y by 0x4000 according to top/bottom
 * counts. Equal or both-zero edge counts produce no movement on that axis.
 * Returns no value; the clear helper initializes two local count arrays and
 * terrain queries read global map state.
 */
void ActorTerrain_ApplyNeighborAxisBias(void *self, void *value)
{
    u8 *vector = (u8 *)value;
    s32 xCounts[3];
    s32 yCounts[3];
    s32 originalX = *(s32 *)(vector + 4);
    s32 originalY = *(s32 *)(vector + 8);
    s32 expectedHeight = *(s32 *)(vector + 0x0c) >> 16;
    s32 dx;
    s32 dy;

    Memory_ClearBytes(xCounts, sizeof(xCounts));
    Memory_ClearBytes(yCounts, sizeof(yCounts));
    for (dx = -1; dx <= 1; ++dx) {
        for (dy = -1; dy <= 1; ++dy) {
            if (func_02034568(self, dx + (originalX >> 16),
                              dy + (originalY >> 16), expectedHeight) == 0) {
                ++xCounts[dx + 1];
                ++yCounts[dy + 1];
            }
        }
    }

    if (xCounts[0] > xCounts[2]) {
        *(s32 *)(vector + 4) += 0x2000;
    } else if (xCounts[2] > xCounts[0]) {
        *(s32 *)(vector + 4) -= 0x2000;
    }
    if (yCounts[0] > yCounts[2]) {
        *(s32 *)(vector + 8) += 0x4000;
    } else if (yCounts[2] > yCounts[0]) {
        *(s32 *)(vector + 8) -= 0x4000;
    }
}

#include "tingle/types.h"

/* Bias a vector away from the more obstructed side of its terrain neighborhood. */
#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_IsTerrainCellEligibleAtHeight(
    void *actor, s32 gridX, s32 gridY, s32 referenceHeight);
extern void Memory_ClearBytes(void *destination, u32 size);
#ifdef __cplusplus
}
#endif

/*
 * Probe the snapshotted 3x3 terrain neighborhood around vector X/Y +4/+8 at
 * reference height +0x0c. Count rejected cells independently for each relative
 * X and Y band. If left/right rejection counts differ, move vector X by 0x2000
 * away from the larger count; similarly move Y by 0x4000 according to top/bottom
 * counts. Equal or both-zero edge counts produce no movement on that axis.
 * Returns no value; the clear helper initializes two local count arrays and
 * terrain queries read global map state.
 */
void ActorTerrain_ApplyNeighborAxisBias(void *actorPointer,
                                        void *vectorPointer)
{
    u8 *vector = (u8 *)vectorPointer;
    s32 rejectedXBandCounts[3];
    s32 rejectedYBandCounts[3];
    s32 originalX = *(s32 *)(vector + 4);
    s32 originalY = *(s32 *)(vector + 8);
    s32 referenceHeight = *(s32 *)(vector + 0x0c) >> 16;
    s32 xOffset;
    s32 yOffset;

    Memory_ClearBytes(rejectedXBandCounts, sizeof(rejectedXBandCounts));
    Memory_ClearBytes(rejectedYBandCounts, sizeof(rejectedYBandCounts));
    for (xOffset = -1; xOffset <= 1; ++xOffset) {
        for (yOffset = -1; yOffset <= 1; ++yOffset) {
            if (Actor_IsTerrainCellEligibleAtHeight(
                    actorPointer, xOffset + (originalX >> 16),
                    yOffset + (originalY >> 16), referenceHeight) == 0) {
                ++rejectedXBandCounts[xOffset + 1];
                ++rejectedYBandCounts[yOffset + 1];
            }
        }
    }

    if (rejectedXBandCounts[0] > rejectedXBandCounts[2]) {
        *(s32 *)(vector + 4) += 0x2000;
    } else if (rejectedXBandCounts[2] > rejectedXBandCounts[0]) {
        *(s32 *)(vector + 4) -= 0x2000;
    }
    if (rejectedYBandCounts[0] > rejectedYBandCounts[2]) {
        *(s32 *)(vector + 8) += 0x4000;
    } else if (rejectedYBandCounts[2] > rejectedYBandCounts[0]) {
        *(s32 *)(vector + 8) -= 0x4000;
    }
}

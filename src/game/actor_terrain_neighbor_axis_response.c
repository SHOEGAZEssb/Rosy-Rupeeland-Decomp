#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Bias a position away from the more rejected terrain-neighborhood side. */
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
 * Snapshot the supplied VecFx32Object's FX32 world position, derive its
 * terrain-grid X/Y and reference-height indices with arithmetic >>16, and
 * probe the centered 3x3 terrain neighborhood. Count rejected samples in each
 * relative X and Y band. Comparing only the negative and positive outer bands,
 * move X by one fixed two-world-unit step or Y by one fixed four-world-unit
 * step away from the greater count. Equal outer counts produce no movement on
 * that axis, regardless of the count difference's magnitude; center-band
 * counts are collected but not used. The actor is borrowed and read-only; the
 * borrowed position's X/Y fields are modified in place, Z is unchanged, and
 * there is no allocation, ownership transfer, error return, or direct hardware
 * access. Memory_ClearBytes initializes the two local count arrays.
 */
void Actor_ApplyTerrainNeighborAxisBias(void *actorPointer,
                                        void *positionPointer)
{
    VecFx32Object *position = (VecFx32Object *)positionPointer;
    s32 rejectedXBandCounts[3];
    s32 rejectedYBandCounts[3];
    s32 sampleCenterXFx32 = position->value.x;
    s32 sampleCenterYFx32 = position->value.y;
    s32 referenceHeight = position->value.z >> 16;
    s32 xOffset;
    s32 yOffset;

    Memory_ClearBytes(rejectedXBandCounts, sizeof(rejectedXBandCounts));
    Memory_ClearBytes(rejectedYBandCounts, sizeof(rejectedYBandCounts));
    for (xOffset = -1; xOffset <= 1; ++xOffset) {
        for (yOffset = -1; yOffset <= 1; ++yOffset) {
            if (Actor_IsTerrainCellEligibleAtHeight(
                    actorPointer, xOffset + (sampleCenterXFx32 >> 16),
                    yOffset + (sampleCenterYFx32 >> 16), referenceHeight) == 0) {
                ++rejectedXBandCounts[xOffset + 1];
                ++rejectedYBandCounts[yOffset + 1];
            }
        }
    }

    if (rejectedXBandCounts[0] > rejectedXBandCounts[2]) {
        position->value.x += 0x2000;
    } else if (rejectedXBandCounts[2] > rejectedXBandCounts[0]) {
        position->value.x -= 0x2000;
    }
    if (rejectedYBandCounts[0] > rejectedYBandCounts[2]) {
        position->value.y += 0x4000;
    } else if (rejectedYBandCounts[2] > rejectedYBandCounts[0]) {
        position->value.y -= 0x4000;
    }
}

#include "tingle/types.h"

/* Accumulate a fixed response away from rejected neighboring terrain cells. */
#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_IsTerrainCellEligibleAtHeight(
    void *actor, s32 gridX, s32 gridY, s32 referenceHeight);
#ifdef __cplusplus
}
#endif

/*
 * Snapshot the FX32 vector X/Y fields +4/+8, derive grid X/Y and reference
 * height indices with >>16, then test the centered 3x3 terrain neighborhood
 * with Actor_IsTerrainCellEligibleAtHeight. For every rejected cell
 * (helper return zero), add -4 times that cell's relative X/Y offset in 20.12
 * units to the original vector fields. All nine tests use the snapshotted
 * coordinates even as responses accumulate. Returns no value; terrain queries
 * read global map state and the supplied vector is modified in place.
 */
void func_02034800(void *actorPointer, void *vectorPointer)
{
    u8 *vector = (u8 *)vectorPointer;
    s32 originalX = *(s32 *)(vector + 4);
    s32 originalY = *(s32 *)(vector + 8);
    s32 referenceHeight = *(s32 *)(vector + 0x0c) >> 16;
    s32 xOffset;
    s32 yOffset;

    for (xOffset = -1; xOffset <= 1; ++xOffset) {
        for (yOffset = -1; yOffset <= 1; ++yOffset) {
            if (Actor_IsTerrainCellEligibleAtHeight(
                    actorPointer, xOffset + (originalX >> 16),
                    yOffset + (originalY >> 16), referenceHeight) == 0) {
                *(s32 *)(vector + 4) += -4 * xOffset * 0x1000;
                *(s32 *)(vector + 8) += -4 * yOffset * 0x1000;
            }
        }
    }
}

#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Accumulate repulsion away from rejected neighboring terrain samples. */
#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_IsTerrainCellEligibleAtHeight(
    void *actor, s32 gridX, s32 gridY, s32 referenceHeight);
#ifdef __cplusplus
}
#endif

/*
 * Snapshot the supplied VecFx32Object's world position, derive terrain-grid
 * X/Y and height-level indices with arithmetic >>16, then test the centered
 * 3x3 terrain neighborhood with Actor_IsTerrainCellEligibleAtHeight. For every
 * rejected sample (helper return zero), add -4 times that sample's relative
 * X/Y offset in FX32 world units to the live position. All nine tests use the
 * snapshotted coordinates even as repulsion accumulates. The actor is borrowed
 * and read-only; the borrowed position's X/Y fields are modified in place, Z
 * is unchanged, and there is no allocation, ownership transfer, error return,
 * or direct hardware access.
 */
void Actor_ApplyTerrainNeighborRepulsion(
    void *actorPointer, void *positionPointer)
{
    VecFx32Object *position = (VecFx32Object *)positionPointer;
    s32 sampleCenterXFx32 = position->value.x;
    s32 sampleCenterYFx32 = position->value.y;
    s32 referenceHeight = position->value.z >> 16;
    s32 xOffset;
    s32 yOffset;

    for (xOffset = -1; xOffset <= 1; ++xOffset) {
        for (yOffset = -1; yOffset <= 1; ++yOffset) {
            if (Actor_IsTerrainCellEligibleAtHeight(
                    actorPointer, xOffset + (sampleCenterXFx32 >> 16),
                    yOffset + (sampleCenterYFx32 >> 16), referenceHeight) == 0) {
                position->value.x += -4 * xOffset * 0x1000;
                position->value.y += -4 * yOffset * 0x1000;
            }
        }
    }
}

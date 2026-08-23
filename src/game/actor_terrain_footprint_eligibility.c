#include "tingle/types.h"

/* Validate a terrain footprint centered at a supplied FX32 world position. */
#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_IsTerrainCellEligibleAtHeight(
    void *actor, s32 gridX, s32 gridY, s32 referenceHeight);
extern s32 Actor_IsTerrainCellEligibleAtHeightOrOneBelow(
    void *actor, s32 gridX, s32 gridY, s32 referenceHeight);
extern s32 ActorBounds_GetWidth(const s8 *bounds);
extern s32 ActorBounds_GetHeight(const s8 *bounds);
extern s32 func_020adae4(s32 dividend, s32 divisor);
#ifdef __cplusplus
}
#endif

/*
 * Arithmetic >>16 converts the supplied FX32 world X/Y/reference height to
 * terrain-cell X/Y and height-level indices, each representing 16 world units.
 * First require the center sample to be eligible at the exact reference
 * height. Then derive FX32 X/Y probe offsets by signed-dividing the actor +4
 * bounds width/height by two, adding two world units, and shifting by 12.
 * Require every noncentral -1..1 multiplier combination to be eligible at the
 * reference height or exactly one level below, short-circuiting on the first
 * rejection. Quantization may make multiple probes address the same cell.
 * Return strict one only when every probe succeeds. The actor and terrain map
 * are read-only; there is no allocation, ownership transfer, explicit error
 * path, or direct hardware access.
 */
s32 Actor_IsTerrainFootprintEligibleAtHeight(
    void *actorPointer, s32 worldXFx32, s32 worldYFx32,
    s32 referenceHeightFx32)
{
    u8 *actor = (u8 *)actorPointer;
    s32 referenceHeight = referenceHeightFx32 >> 16;
    s32 footprintProbeOffsetXFx32;
    s32 footprintProbeOffsetYFx32;
    s32 xOffset;
    s32 yOffset;

    if (Actor_IsTerrainCellEligibleAtHeight(
            actor, worldXFx32 >> 16, worldYFx32 >> 16,
            referenceHeight) == 0)
        return 0;
    footprintProbeOffsetXFx32 =
        (func_020adae4(ActorBounds_GetWidth((s8 *)actor + 4), 2) + 2) << 12;
    footprintProbeOffsetYFx32 =
        (func_020adae4(ActorBounds_GetHeight((s8 *)actor + 4), 2) + 2) << 12;

    for (xOffset = -1; xOffset <= 1; ++xOffset) {
        for (yOffset = -1; yOffset <= 1; ++yOffset) {
            if ((xOffset != 0 || yOffset != 0) &&
                Actor_IsTerrainCellEligibleAtHeightOrOneBelow(
                    actor,
                    (worldXFx32 + xOffset * footprintProbeOffsetXFx32) >> 16,
                    (worldYFx32 + yOffset * footprintProbeOffsetYFx32) >> 16,
                    referenceHeight) == 0) {
                return 0;
            }
        }
    }
    return 1;
}

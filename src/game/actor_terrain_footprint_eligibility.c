#include "tingle/types.h"

/* Validate an actor-centered terrain footprint using its primary byte bounds. */
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
 * Convert supplied FX32 world X/Y/reference height to 16-world-unit terrain
 * indices with >>16 and require the center cell to be eligible at the exact
 * height. Derive FX32 X/Y footprint strides as half the signed-byte
 * width/height of the bounds structure at actor +4, plus two world units.
 * Require the eight surrounding positions at offsets -1..1 to be eligible at
 * that height or exactly one level below. Return one only when every probe is
 * nonzero; terrain helpers read global map state and actor fields are
 * unchanged.
 */
s32 func_02034d34(void *actorPointer, s32 worldXFx32, s32 worldYFx32,
                  s32 referenceHeightFx32)
{
    u8 *actor = (u8 *)actorPointer;
    s32 referenceHeight = referenceHeightFx32 >> 16;
    s32 strideXFx32;
    s32 strideYFx32;
    s32 xOffset;
    s32 yOffset;

    if (Actor_IsTerrainCellEligibleAtHeight(
            actor, worldXFx32 >> 16, worldYFx32 >> 16,
            referenceHeight) == 0)
        return 0;
    strideXFx32 =
        (func_020adae4(ActorBounds_GetWidth((s8 *)actor + 4), 2) + 2) << 12;
    strideYFx32 =
        (func_020adae4(ActorBounds_GetHeight((s8 *)actor + 4), 2) + 2) << 12;

    for (xOffset = -1; xOffset <= 1; ++xOffset) {
        for (yOffset = -1; yOffset <= 1; ++yOffset) {
            if ((xOffset != 0 || yOffset != 0) &&
                Actor_IsTerrainCellEligibleAtHeightOrOneBelow(
                    actor, (worldXFx32 + xOffset * strideXFx32) >> 16,
                    (worldYFx32 + yOffset * strideYFx32) >> 16,
                    referenceHeight) == 0) {
                return 0;
            }
        }
    }
    return 1;
}

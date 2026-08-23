#include "tingle/types.h"

/*
 * Recovered collision-aware destination adjustment for the type-seven actor.
 * It limits a distant temporary target, steers its first correction toward
 * eligible cells, then repels it from classified terrain transitions.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern s32 Actor_IsTerrainCellEligibleAtHeightOrOneBelow(
    void *actor, s32 gridX, s32 gridY, s32 referenceHeight);
extern s32 Actor_ClassifyTerrainCellTransition(
    void *actor, s32 gridX, s32 gridY, s32 referenceHeight);
extern s32 Fx32Vector2_Magnitude(s32 x, s32 y);
extern s32 func_020adae4(s32 value, s32 divisor);
extern s32 func_020adc90(s32 value, s32 length);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Query the temporary target +0x7c/+0x80 at the
 * actor's recovered height. Use a minimum correction distance of 0x20000 when
 * that cell is eligible at the reference height or one level below, and
 * 0x200000 otherwise. If the current-to-target distance is below that
 * threshold, return unchanged.
 *
 * Otherwise normalize the target delta. For distances above 0x32000, first
 * clamp the temporary target to 50 world units along the normalized FX32
 * direction from current position. Sample a 5x5 neighborhood at 30 world
 * units along that direction plus offsets -2..2 through the one-below
 * eligibility predicate. Eligible nonzero axes contribute reciprocal signed
 * weights toward those samples; an eligible center triples both divisors and
 * therefore damps the correction. Convert the accumulated X and Y weights to
 * FX32 corrections and add them to +0x7c/+0x80.
 *
 * Then sample the eight noncentral offsets -1..1 around current position with
 * X spacing 0x11000 and Y spacing 0x7000 through the transition classifier,
 * skipping samples that truncate to the current integer cell. Classification
 * two repels each axis by 0x10000; classification one uses 0x8000. Actor
 * temporary destination state may change; collision queries are read-only
 * from this routine and there are no direct SDK or hardware effects. No value
 * is returned.
 */
void Type7Actor_AdjustDestinationForCollisions(void *actorPointer)
{
    u8 *actor = (u8 *)actorPointer;
    s32 referenceHeight = Actor_GetCachedTerrainHeight(actor) >> 16;
    s32 targetXFx32 = *(s32 *)(actor + 0x7c);
    s32 targetYFx32 = *(s32 *)(actor + 0x80);
    s32 currentXFx32 = *(s32 *)(actor + 0x1c);
    s32 currentYFx32 = *(s32 *)(actor + 0x20);
    s32 targetCellEligible = Actor_IsTerrainCellEligibleAtHeightOrOneBelow(
        actor, targetXFx32 >> 16, targetYFx32 >> 16, referenceHeight);
    s32 minimumAdjustmentDistanceFx32 =
        targetCellEligible != 0 ? 0x20000 : 0x200000;
    s32 deltaXFx32 = targetXFx32 - currentXFx32;
    s32 deltaYFx32 = targetYFx32 - currentYFx32;
    s32 targetDistanceFx32 = Fx32Vector2_Magnitude(deltaXFx32, deltaYFx32);

    if (targetDistanceFx32 >= minimumAdjustmentDistanceFx32) {
        s32 directionXFx32 = func_020adc90(deltaXFx32, targetDistanceFx32);
        s32 directionYFx32 = func_020adc90(deltaYFx32, targetDistanceFx32);
        s32 eligibleXWeight = 0;
        s32 eligibleYWeight = 0;
        s32 eligibleXCount = 0;
        s32 eligibleYCount = 0;
        s32 centerCellEligible = 0;
        s32 xOffset;
        s32 yOffset;
        s32 correctionXFx32 = 0;
        s32 correctionYFx32 = 0;

        if (targetDistanceFx32 > 0x32000) {
            *(s32 *)(actor + 0x7c) = currentXFx32 + directionXFx32 * 50;
            *(s32 *)(actor + 0x80) = currentYFx32 + directionYFx32 * 50;
        }

        for (xOffset = -2; xOffset < 3; ++xOffset) {
            for (yOffset = -2; yOffset < 3; ++yOffset) {
                s32 cellEligible = Actor_IsTerrainCellEligibleAtHeightOrOneBelow(
                    actor,
                    ((currentXFx32 + directionXFx32 * 30) >> 16) + xOffset,
                    ((currentYFx32 + directionYFx32 * 30) >> 16) + yOffset,
                    referenceHeight);
                if (cellEligible != 0) {
                    if (xOffset != 0) {
                        eligibleXWeight += func_020adae4(2, xOffset);
                        ++eligibleXCount;
                    }
                    if (yOffset != 0) {
                        eligibleYWeight += func_020adae4(2, yOffset);
                        ++eligibleYCount;
                    }
                    if (xOffset == 0 && yOffset == 0)
                        centerCellEligible = 1;
                }
            }
        }
        if (centerCellEligible) {
            eligibleXCount *= 3;
            eligibleYCount *= 3;
        }
        if (eligibleXCount != 0)
            *(s32 *)(actor + 0x7c) +=
                func_020adae4(eligibleXWeight << 17, eligibleXCount);
        if (eligibleYCount != 0)
            *(s32 *)(actor + 0x80) +=
                func_020adae4(eligibleYWeight * 0x30000, eligibleYCount);

        for (xOffset = -1; xOffset < 2; ++xOffset) {
            for (yOffset = -1; yOffset < 2; ++yOffset) {
                s32 sampleGridX;
                s32 sampleGridY;
                s32 transitionClass;
                if (xOffset == 0 && yOffset == 0)
                    continue;
                sampleGridX = (currentXFx32 + xOffset * 0x11000) >> 16;
                sampleGridY = (currentYFx32 + yOffset * 0x7000) >> 16;
                if (sampleGridX == (currentXFx32 >> 16)
                    && sampleGridY == (currentYFx32 >> 16))
                    continue;
                transitionClass = Actor_ClassifyTerrainCellTransition(
                    actor, sampleGridX, sampleGridY, referenceHeight);
                if (transitionClass > 0) {
                    s32 repulsionStrengthFx32 =
                        transitionClass == 2 ? 0x10000 : 0x8000;
                    correctionXFx32 -= xOffset * repulsionStrengthFx32;
                    correctionYFx32 -= yOffset * repulsionStrengthFx32;
                }
            }
        }
        *(s32 *)(actor + 0x7c) += correctionXFx32;
        *(s32 *)(actor + 0x80) += correctionYFx32;
    }
}

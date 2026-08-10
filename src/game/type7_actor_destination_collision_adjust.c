#include "tingle/types.h"

/*
 * Recovered collision-aware destination adjustment for the type-seven actor.
 * It limits a distant temporary target, samples two offset neighborhoods, and
 * accumulates fixed-point corrections away from occupied cells.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern s32 func_0203463c(void *actor, s32 x, s32 y, s32 height);
extern s32 func_02034718(void *actor, s32 x, s32 y, s32 height);
extern s32 func_0204cfa4(s32 x, s32 y);
extern s32 func_020adae4(s32 value, s32 divisor);
extern s32 func_020adc90(s32 value, s32 length);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Query the temporary target +0x7c/+0x80 at the
 * actor's recovered height. Use a minimum correction distance of 0x20000 when
 * that cell is occupied or 0x200000 otherwise. If the current-to-target
 * distance is below that threshold, return unchanged.
 *
 * Otherwise normalize the target delta. For distances above 0x32000, first
 * clamp the temporary target to 50 normalized units from current position.
 * Sample a 5x5 neighborhood at 30 normalized units plus offsets -2..2 through
 * func_0203463c. Occupied nonzero axes contribute reciprocal signed weights;
 * a center hit triples both contribution counts. Convert the accumulated X
 * and Y weights to fx32 corrections and add them to +0x7c/+0x80.
 *
 * Then sample the eight noncentral offsets -1..1 around current position with
 * X spacing 0x11000 and Y spacing 0x7000 through func_02034718, skipping cells
 * that truncate to the current integer cell. Positive results push the target
 * away by 0x10000 per axis for result two or 0x8000 otherwise. Actor temporary
 * destination state may change; collision queries are read-only from this
 * routine and there are no direct SDK or hardware effects. No value is
 * returned.
 */
void Type7Actor_AdjustDestinationForCollisions(void *self)
{
    u8 *actor = (u8 *)self;
    s32 height = Actor_GetCachedTerrainHeight(actor) >> 16;
    s32 targetX = *(s32 *)(actor + 0x7c);
    s32 targetY = *(s32 *)(actor + 0x80);
    s32 currentX = *(s32 *)(actor + 0x1c);
    s32 currentY = *(s32 *)(actor + 0x20);
    s32 occupied = func_0203463c(actor, targetX >> 16,
                                 targetY >> 16, height);
    s32 threshold = occupied != 0 ? 0x20000 : 0x200000;
    s32 deltaX = targetX - currentX;
    s32 deltaY = targetY - currentY;
    s32 distance = func_0204cfa4(deltaX, deltaY);

    if (distance >= threshold) {
        s32 normalizedX = func_020adc90(deltaX, distance);
        s32 normalizedY = func_020adc90(deltaY, distance);
        s32 xWeight = 0;
        s32 yWeight = 0;
        s32 xCount = 0;
        s32 yCount = 0;
        s32 centerOccupied = 0;
        s32 xOffset;
        s32 yOffset;
        s32 correctionX = 0;
        s32 correctionY = 0;

        if (distance > 0x32000) {
            *(s32 *)(actor + 0x7c) = currentX + normalizedX * 50;
            *(s32 *)(actor + 0x80) = currentY + normalizedY * 50;
        }

        for (xOffset = -2; xOffset < 3; ++xOffset) {
            for (yOffset = -2; yOffset < 3; ++yOffset) {
                s32 hit = func_0203463c(
                    actor,
                    ((currentX + normalizedX * 30) >> 16) + xOffset,
                    ((currentY + normalizedY * 30) >> 16) + yOffset,
                    height);
                if (hit != 0) {
                    if (xOffset != 0) {
                        xWeight += func_020adae4(2, xOffset);
                        ++xCount;
                    }
                    if (yOffset != 0) {
                        yWeight += func_020adae4(2, yOffset);
                        ++yCount;
                    }
                    if (xOffset == 0 && yOffset == 0)
                        centerOccupied = 1;
                }
            }
        }
        if (centerOccupied) {
            xCount *= 3;
            yCount *= 3;
        }
        if (xCount != 0)
            *(s32 *)(actor + 0x7c) +=
                func_020adae4(xWeight << 17, xCount);
        if (yCount != 0)
            *(s32 *)(actor + 0x80) +=
                func_020adae4(yWeight * 0x30000, yCount);

        for (xOffset = -1; xOffset < 2; ++xOffset) {
            for (yOffset = -1; yOffset < 2; ++yOffset) {
                s32 sampleX;
                s32 sampleY;
                s32 result;
                if (xOffset == 0 && yOffset == 0)
                    continue;
                sampleX = (currentX + xOffset * 0x11000) >> 16;
                sampleY = (currentY + yOffset * 0x7000) >> 16;
                if (sampleX == (currentX >> 16)
                    && sampleY == (currentY >> 16))
                    continue;
                result = func_02034718(actor, sampleX, sampleY, height);
                if (result > 0) {
                    s32 strength = result == 2 ? 0x10000 : 0x8000;
                    correctionX -= xOffset * strength;
                    correctionY -= yOffset * strength;
                }
            }
        }
        *(s32 *)(actor + 0x7c) += correctionX;
        *(s32 *)(actor + 0x80) += correctionY;
    }
}

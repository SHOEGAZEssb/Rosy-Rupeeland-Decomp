#include "tingle/types.h"

/* Overlay 18 point-path self-intersection detection and crossing capture. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay018Point {
    s16 x;
    s16 y;
} Overlay018Point;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Test the newest segment (count-2,count-1) against older segments, scanning
 * backward from (count-9,count-8). The six intervening segments are excluded,
 * apparently to avoid nearby path turns being treated as a self-crossing. On
 * the first inclusive intersection, store the older/newer start indices at
 * +0x14/+0x18, calculate its signed-halfword coordinates into +8/+A, set the
 * +0x24 latch, and return one. Return zero without changes when already latched,
 * when count is at most eight, or when no crossing exists. The point array is
 * otherwise read only; fixed-point division uses SDK helper 0x020BEFEC and no
 * hardware is accessed directly. Products intentionally retain recovered
 * signed 32-bit arithmetic, including its original overflow behavior.
 */
extern "C" s32 func_ov018_021ff770(void *state)
{
    Overlay018Point *points;
    s32 count;
    s32 newestStart;
    s32 newestEnd;
    s32 newestDx;
    s32 newestDy;

    if (FIELD(s32, state, 0x24) != 0)
        return 0;
    count = FIELD(s32, state, 0x10);
    if (count <= 8)
        return 0;

    points = FIELD(Overlay018Point *, state, 4);
    newestStart = count - 2;
    newestEnd = count - 1;
    newestDx = points[newestEnd].x - points[newestStart].x;
    newestDy = points[newestEnd].y - points[newestStart].y;

    for (s32 i = count - 8; i > 0; i--) {
        s32 newestStartX = points[newestStart].x;
        s32 newestStartY = points[newestStart].y;
        s32 newestEndX = points[newestEnd].x;
        s32 newestEndY = points[newestEnd].y;
        s32 olderStartX = points[i - 1].x;
        s32 olderStartY = points[i - 1].y;
        s32 olderEndX = points[i].x;
        s32 olderEndY = points[i].y;
        s32 newestMinX = newestStartX < newestEndX ? newestStartX : newestEndX;
        s32 newestMaxX = newestStartX > newestEndX ? newestStartX : newestEndX;
        s32 newestMinY = newestStartY < newestEndY ? newestStartY : newestEndY;
        s32 newestMaxY = newestStartY > newestEndY ? newestStartY : newestEndY;
        s32 olderMinX = olderStartX < olderEndX ? olderStartX : olderEndX;
        s32 olderMaxX = olderStartX > olderEndX ? olderStartX : olderEndX;
        s32 olderMinY = olderStartY < olderEndY ? olderStartY : olderEndY;
        s32 olderMaxY = olderStartY > olderEndY ? olderStartY : olderEndY;
        s32 sideOlderEnd;
        s32 sideOlderStart;
        s32 sideNewestEnd;
        s32 sideNewestStart;

        if (newestMaxX < olderMinX || newestMinX > olderMaxX ||
            newestMaxY < olderMinY || newestMinY > olderMaxY)
            continue;

        sideOlderEnd = newestDx * (olderEndY - newestEndY) -
                       newestDy * (olderEndX - newestEndX);
        sideOlderStart = newestDx * (olderStartY - newestEndY) -
                         newestDy * (olderStartX - newestEndX);
        if (sideOlderEnd * sideOlderStart > 0)
            continue;

        s32 olderDx = olderEndX - olderStartX;
        s32 olderDy = olderEndY - olderStartY;
        sideNewestEnd = olderDx * (newestEndY - olderEndY) -
                        olderDy * (newestEndX - olderEndX);
        sideNewestStart = olderDx * (newestStartY - olderEndY) -
                          olderDy * (newestStartX - olderEndX);
        if (sideNewestEnd * sideNewestStart > 0)
            continue;

        /* Parameterize the crossing from newestEnd back toward newestStart. */
        s32 denominator = sideNewestEnd - sideNewestStart;
        FIELD(s32, state, 0x14) = i - 1;
        FIELD(s32, state, 0x18) = newestEnd;
        FIELD(s16, state, 8) =
            newestEndX + func_020befec(
                             sideNewestEnd * (newestStartX - newestEndX),
                             denominator);
        FIELD(s16, state, 0xa) =
            newestEndY + func_020befec(
                             sideNewestEnd * (newestStartY - newestEndY),
                             denominator);
        FIELD(s32, state, 0x24) = 1;
        return 1;
    }
    return 0;
}

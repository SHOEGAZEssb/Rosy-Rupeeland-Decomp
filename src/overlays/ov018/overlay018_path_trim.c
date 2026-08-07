#include "tingle/types.h"

/* Overlay 18 point-path distance trimming, compaction, and bounds maintenance. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay018Point {
    s16 x;
    s16 y;
} Overlay018Point;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32, s32);
extern u32 func_ov018_021ff738(void);
extern void func_ov018_021ff75c(void *, const void *);
#ifdef __cplusplus
}
#endif

/*
 * Starting at caller indices start/end, walk both directions from the signed
 * anchor at +8/+A until each accumulated polyline distance reaches distance.
 * Interpolate and overwrite each reached boundary point, retain the inclusive
 * range between those boundaries, compact it to point-array index zero, rebase
 * indices +0x14/+0x18, and extend the stored signed bounds at +0x1C..+0x22 for
 * points inside those rebased indices. Returns void. Point-buffer state and
 * storage change, and each segment length is obtained synchronously through
 * the Nintendo DS square-root unit at 0x040002B0..0x040002BC. The 128-entry
 * local array is the recovered fixed scratch capacity; callers must keep the
 * selected inclusive range within it.
 */
extern "C" void func_ov018_021ff474(void *state, s32 start, s32 end,
                                     s32 distance)
{
    Overlay018Point scratch[128];
    Overlay018Point *points = FIELD(Overlay018Point *, state, 4);
    s32 anchorX = FIELD(s16, state, 8);
    s32 anchorY = FIELD(s16, state, 0xa);
    s32 accumulated = 0;

    while (start >= 0) {
        s32 pointX = points[start].x;
        s32 pointY = points[start].y;
        s32 deltaX = pointX - anchorX;
        s32 deltaY = pointY - anchorY;
        s32 squaredLength = deltaX * deltaX + deltaY * deltaY;
        volatile u8 *sqrt = (volatile u8 *)0x040002b0;
        s32 segmentLength;

        *(volatile u16 *)(sqrt + 0) = 1; /* 64-bit square-root operand mode. */
        *(volatile u32 *)(sqrt + 8) = squaredLength;
        *(volatile s32 *)(sqrt + 0xc) = squaredLength >> 31;
        segmentLength = func_ov018_021ff738();
        if (accumulated + segmentLength >= distance) {
            s32 remainder = distance - accumulated;
            points[start].x =
                anchorX + func_020befec(deltaX * remainder, segmentLength);
            points[start].y =
                anchorY + func_020befec(deltaY * remainder, segmentLength);
            break;
        }
        anchorX = pointX;
        anchorY = pointY;
        accumulated += segmentLength;
        start--;
    }

    anchorX = FIELD(s16, state, 8);
    anchorY = FIELD(s16, state, 0xa);
    accumulated = 0;
    while (end < FIELD(s32, state, 0x10)) {
        s32 pointX = points[end].x;
        s32 pointY = points[end].y;
        s32 deltaX = pointX - anchorX;
        s32 deltaY = pointY - anchorY;
        s32 squaredLength = deltaX * deltaX + deltaY * deltaY;
        volatile u8 *sqrt = (volatile u8 *)0x040002b0;
        s32 segmentLength;

        *(volatile u16 *)(sqrt + 0) = 1; /* 64-bit square-root operand mode. */
        *(volatile u32 *)(sqrt + 8) = squaredLength;
        *(volatile s32 *)(sqrt + 0xc) = squaredLength >> 31;
        segmentLength = func_ov018_021ff738();
        if (accumulated + segmentLength >= distance) {
            s32 remainder = distance - accumulated;
            points[end].x =
                anchorX + func_020befec(deltaX * remainder, segmentLength);
            points[end].y =
                anchorY + func_020befec(deltaY * remainder, segmentLength);
            break;
        }
        anchorX = pointX;
        anchorY = pointY;
        accumulated += segmentLength;
        end++;
    }

    if (start < 0)
        start = 0;
    if (end >= FIELD(s32, state, 0x10))
        end = FIELD(s32, state, 0x10) - 1;

    FIELD(s32, state, 0x14) -= start;
    FIELD(s32, state, 0x18) -= start;

    s32 retained = 0;
    while (start <= end) {
        func_ov018_021ff75c(&scratch[retained], &points[start]);
        retained++;
        start++;
    }
    FIELD(s32, state, 0x10) = retained;

    for (s32 i = 0; i < retained; i++) {
        func_ov018_021ff75c(&points[i], &scratch[i]);
        if (i >= FIELD(s32, state, 0x14) &&
            i <= FIELD(s32, state, 0x18)) {
            if (points[i].x < FIELD(s16, state, 0x1c))
                FIELD(s16, state, 0x1c) = points[i].x;
            if (points[i].x > FIELD(s16, state, 0x20))
                FIELD(s16, state, 0x20) = points[i].x;
            if (points[i].y < FIELD(s16, state, 0x1e))
                FIELD(s16, state, 0x1e) = points[i].y;
            if (points[i].y > FIELD(s16, state, 0x22))
                FIELD(s16, state, 0x22) = points[i].y;
        }
    }
}

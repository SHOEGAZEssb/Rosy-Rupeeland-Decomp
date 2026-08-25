#include "tingle/types.h"

/* Overlay 18 hardware square-root access and point-buffer geometry predicates. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define POINT_X(points, index) FIELD(s16, points, (index) * 4)
#define POINT_Y(points, index) FIELD(s16, points, (index) * 4 + 2)

#ifdef __cplusplus
extern "C" {
#endif
extern void Overlay018_TrimPathRange(void *, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Busy-wait until DS square-root status bit 15 at 0x040002B0 clears, then
 * return the low result word at 0x040002B4. No caller memory or SDK state
 * changes; this directly reads Nintendo DS math-coprocessor MMIO.
 */
extern "C" u32 Overlay018_WaitForSquareRoot(void)
{
    while (*(volatile u16 *)0x040002b0 & 0x8000) {
    }
    return *(volatile u32 *)0x040002b4;
}

/*
 * Copy the source's two signed halfwords to destination offsets +0/+2. Returns
 * void; only destination memory changes and no SDK or hardware effects occur.
 */
extern "C" void func_ov018_021ff75c(void *destination, const void *source)
{
    FIELD(s16, destination, 0) = FIELD(s16, source, 0);
    FIELD(s16, destination, 2) = FIELD(s16, source, 2);
}

/*
 * If point-buffer index +0x14 is nonnegative, invoke 0x021FF474 using indices
 * +0x14/+0x18 and fixed fourth argument 8; otherwise do nothing. Returns void.
 * The callee may update point-buffer traversal state; no direct MMIO occurs.
 */
extern "C" void Overlay018_TrimSelectedPathRange(void *state)
{
    if (FIELD(s32, state, 0x14) >= 0)
        Overlay018_TrimPathRange(state, FIELD(s32, state, 0x14),
                            FIELD(s32, state, 0x18), 8);
}

/*
 * For buffers with at least four points, accumulate twice the signed area of
 * the fan/chain spanning indices +0x14 through +0x18, divide by two with
 * truncation toward zero, and return its absolute value. Smaller buffers return
 * zero. State is read only; no SDK or hardware effects occur.
 */
extern "C" s32 func_ov018_021ff984(void *state)
{
    s32 count = FIELD(s32, state, 0x10);
    s32 start;
    s32 end;
    s32 i;
    s32 area = 0;
    void *points;
    s32 baseX;
    s32 baseY;

    if (count < 4)
        return 0;
    start = FIELD(s32, state, 0x14);
    end = FIELD(s32, state, 0x18);
    points = FIELD(void *, state, 4);
    baseX = POINT_X(points, start);
    baseY = POINT_Y(points, start);
    for (i = start + 1; i < end; i++) {
        s32 x = POINT_X(points, i);
        s32 y = POINT_Y(points, i);
        area += (x - baseX) * (POINT_Y(points, i + 1) - y) -
                (y - baseY) * (POINT_X(points, i + 1) - x);
    }
    area /= 2;
    return area < 0 ? -area : area;
}

/*
 * Test caller point (X,Y) against the polygon fan rooted at point zero. For
 * each nondegenerate triangle (0,i,i+1), require all three edge cross products
 * to have the triangle's sign. Classify accepted triangles by whether their
 * signed area agrees with the fan's total signed area. Return one only when at
 * least one agreeing triangle accepts the point and agreeing triangles outnumber
 * opposing ones; return zero for fewer than four points or otherwise. The
 * fixed local array supports the recovered maximum of 128 fan entries. Caller
 * state is read only and no SDK/hardware effects occur.
 */
extern "C" s32 func_ov018_021ffa14(void *state, s32 queryX, s32 queryY)
{
    s32 triangleCross[128];
    s32 count = FIELD(s32, state, 0x10);
    void *points;
    s32 baseX;
    s32 baseY;
    s32 total = 0;
    s32 agreeing = 0;
    s32 opposing = 0;
    s32 i;

    if (count < 4)
        return 0;
    points = FIELD(void *, state, 4);
    baseX = POINT_X(points, 0);
    baseY = POINT_Y(points, 0);
    for (i = 1; i < count - 1; i++) {
        s32 x = POINT_X(points, i);
        s32 y = POINT_Y(points, i);
        s32 cross = (x - baseX) * (POINT_Y(points, i + 1) - y) -
                    (y - baseY) * (POINT_X(points, i + 1) - x);
        triangleCross[i] = cross;
        total += cross;
    }

    for (i = 1; i < count - 1; i++) {
        s32 cross = triangleCross[i];
        s32 x;
        s32 y;
        s32 nextX;
        s32 nextY;
        s32 edge;
        if (cross == 0)
            continue;
        x = POINT_X(points, i);
        y = POINT_Y(points, i);
        nextX = POINT_X(points, i + 1);
        nextY = POINT_Y(points, i + 1);
        edge = (x - baseX) * (queryY - y) -
               (y - baseY) * (queryX - x);
        if (edge * cross < 0)
            continue;
        edge = (nextX - x) * (queryY - nextY) -
               (nextY - y) * (queryX - nextX);
        if (edge * cross < 0)
            continue;
        edge = (baseX - nextX) * (queryY - baseY) -
               (baseY - nextY) * (queryX - baseX);
        if (edge * cross < 0)
            continue;
        if (total * cross < 0)
            opposing++;
        else
            agreeing++;
    }
    return agreeing != 0 && agreeing > opposing;
}

/* Store caller word at state +0x24 and return void; only caller memory changes. */
extern "C" void func_ov018_021ffbb0(void *state, s32 value)
{
    FIELD(s32, state, 0x24) = value;
}

#include "tingle/types.h"

/* Overlay 17 wave-grid integration and per-vertex normal reconstruction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define GRID_POINT(base, row, column) \
    ((s32 *)((u8 *)(base) + 0x144 + (row) * 0x6c + (column) * 0xc))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020b5880(void *, void *, u32);
extern s32 func_020befec(s32, s32);
extern s32 Overlay017_WaitForSquareRoot(void);
#ifndef MATCHING
extern u32 TingleNativeMath_Sqrt64(u64 value);
#endif
#ifdef __cplusplus
}
#endif

/* Multiply a signed value by a 20.12 fixed-point factor with DS rounding. */
static s32 fxMul(s32 value, s32 factor)
{
    return (s32)(((s64)value * factor + 0x800) >> 12);
}

/* Submit a signed squared magnitude to the DS square-root unit and return its result. */
static s32 hardwareSqrt(s32 squared)
{
#ifndef MATCHING
    return (s32)TingleNativeMath_Sqrt64((u64)(s64)squared);
#else
    volatile u8 *regs = (volatile u8 *)0x040002b0;
    *(volatile u16 *)regs = 1;
    *(volatile s32 *)(regs + 8) = squared;
    *(volatile s32 *)(regs + 0xc) = squared >> 31;
    return Overlay017_WaitForSquareRoot();
#endif
}

/* Add the 20.12 cross product of vectors A and B to the supplied accumulator. */
#define ACCUMULATE_CROSS(nx, ny, nz, ax, ay, az, bx, by, bz) do { \
    (nx) += ((ay) * (bz) - (az) * (by)) >> 12;                    \
    (ny) += ((az) * (bx) - (ax) * (bz)) >> 12;                    \
    (nz) += ((ax) * (by) - (ay) * (bx)) >> 12;                    \
} while (0)

/*
 * Snapshot the 9x9 position grid from +0x144 to +0x510, then advance the
 * interior 7x7 wave field. Each velocity at the parallel table +0 receives
 * one quarter of the four-neighbor Y Laplacian, moves the live Y coordinate
 * by one sixteenth of that velocity, and is damped by 0xFD7/0x1000.
 *
 * Reconstruct a normalized 20.12 normal for every interior point into the
 * grid at +0x8DC. Four guarded triangle cross products are accumulated in the
 * exact recovered order; notably, the third contribution reuses the second
 * contribution's right-edge vector (or the first one's down-edge vector at
 * the guarded top-right point). This is confirmed control/data flow and is
 * retained even though it resembles a source-level indexing mistake. Clamp
 * normal Y to [-0x1000, 0x0FFF]. Returns void; caller grid state and the DS
 * square-root MMIO unit change, and the fixed-point division helper runs.
 */
extern "C" void Overlay017_UpdateGridDeformation(void *state)
{
    s32 row;

    func_020b5880((u8 *)state + 0x144, (u8 *)state + 0x510, 0x3cc);

    for (row = 1; row < 8; row++) {
        s32 column;
        for (column = 1; column < 8; column++) {
            s32 *snapshot = (s32 *)((u8 *)state + 0x510 +
                                      row * 0x6c + column * 0xc);
            s32 *live = GRID_POINT(state, row, column);
            s32 *velocity = (s32 *)((u8 *)state + row * 0x24 +
                                      column * 4);
            s32 laplacian = snapshot[4] + snapshot[-2] +
                            snapshot[28] + snapshot[-26] -
                            snapshot[1] * 4;

            *velocity += laplacian / 4;
            live[1] += *velocity / 16;
            *velocity = fxMul(*velocity, 0xfd7);
        }
    }

    for (row = 1; row < 8; row++) {
        s32 column;
        for (column = 1; column < 8; column++) {
            s32 *center = GRID_POINT(state, row, column);
            s32 *left = GRID_POINT(state, row, column - 1);
            s32 *right = GRID_POINT(state, row, column + 1);
            s32 *up = GRID_POINT(state, row - 1, column);
            s32 *down = GRID_POINT(state, row + 1, column);
            s32 nx = 0;
            s32 ny = 0;
            s32 nz = 0;
            s32 ax = 0;
            s32 ay = 0;
            s32 az = 0;
            s32 bx = 0;
            s32 by = 0;
            s32 bz = 0;
            s32 length;
            s32 *normal;

            if (column != 7 || row != 7) {
                ax = center[0] - right[0];
                ay = center[1] - right[1];
                az = center[2] - right[2];
                bx = down[0] - center[0];
                by = down[1] - center[1];
                bz = down[2] - center[2];
                ACCUMULATE_CROSS(nx, ny, nz, ax, ay, az, bx, by, bz);
            }
            if (column != 7 || row != 1) {
                ax = center[0] - up[0];
                ay = center[1] - up[1];
                az = center[2] - up[2];
                bx = right[0] - center[0];
                by = right[1] - center[1];
                bz = right[2] - center[2];
                ACCUMULATE_CROSS(nx, ny, nz, ax, ay, az, bx, by, bz);
            }
            if (column != 1 || row != 1) {
                ax = up[0] - center[0];
                ay = up[1] - center[1];
                az = up[2] - center[2];
                ACCUMULATE_CROSS(nx, ny, nz, ax, ay, az, bx, by, bz);
            }
            if (column != 1 || row != 7) {
                ax = center[0] - down[0];
                ay = center[1] - down[1];
                az = center[2] - down[2];
                bx = left[0] - center[0];
                by = left[1] - center[1];
                bz = left[2] - center[2];
                ACCUMULATE_CROSS(nx, ny, nz, ax, ay, az, bx, by, bz);
            }

            length = hardwareSqrt(nx * nx + ny * ny + nz * nz);
            normal = (s32 *)((u8 *)state + 0x8dc +
                             row * 0x6c + column * 0xc);
            normal[0] = func_020befec((s32)((u32)nx << 12), length);
            normal[1] = func_020befec((s32)((u32)ny << 12), length);
            normal[2] = func_020befec((s32)((u32)nz << 12), length);
            if (normal[1] >= 0x1000) {
                normal[1] = 0xfff;
            } else if (normal[1] < -0x1000) {
                normal[1] = -0x1000;
            }
        }
    }
}

#include "tingle/types.h"

/*
 * Overlay 48 geometry/capture packet emission. These recovered helpers reset
 * 3D state, configure clear/capture registers, and send one of two vertex
 * orderings for an axis-aligned quadrilateral. Exact assembly preserves FIFO
 * write order, signed 16-bit truncation, and stack-argument ABI behavior.
 */

/*
 * Reset the geometry matrix, set identity scale, configure clear color and
 * disable capture, then emit four vertices using `(x0,y0)`, `(x1,y0)`,
 * `(x1,y1)`, `(x0,y1)` with caller-supplied depth, color, and polygon values.
 * Geometry FIFO, clear-color, capture, and flush registers change; nothing is
 * returned. All coordinates are intentionally truncated to signed 16 bits.
 */
extern "C" void func_ov048_0220bbfc(u32 color, u32 alpha, u32 polygonId,
                                     u32 depthFlag, u32 depth, u32 fog);
extern "C" void func_ov048_0220bc28(void);

static u32 pack_s16_pair(s32 low, s32 high)
{
    return (u16)low | ((u32)(u16)high << 16);
}

static void begin_quad(u16 color, s32 first, s32 second, s32 depth)
{
    *(volatile u32 *)0x04000444 = 0;
    *(volatile u32 *)0x0400046c = 0x10000;
    *(volatile u32 *)0x0400046c = 0x10000;
    *(volatile u32 *)0x0400046c = 0x10000;
    func_ov048_0220bbfc(0, 0, 3, 0x3f, 0x1f, 0);
    func_ov048_0220bc28();
    *(volatile u32 *)0x04000500 = 1;
    *(volatile u32 *)0x04000480 = color;
    *(volatile u32 *)0x0400048c = pack_s16_pair(second, first);
    *(volatile u32 *)0x0400048c = (u16)depth;
}

static void end_quad(void)
{
    *(volatile u32 *)0x04000504 = 0;
    *(volatile u32 *)0x04000448 = 1;
}

extern "C" void func_ov048_0220baec(s32 y0, s32 x0, s32 x1, s32 y1,
                                     s32 depth, u16 color, u16 polygon)
{
    volatile u32 *vertex = (volatile u32 *)0x04000494;
    begin_quad(color, y0, x0, depth);
    *vertex = pack_s16_pair(x1, y0);
    *(volatile u32 *)0x04000480 = polygon;
    *vertex = pack_s16_pair(x1, y1);
    *vertex = pack_s16_pair(x0, y1);
    end_quad();
}

/*
 * Pack clear-color fields and two stack arguments into the 3D clear-color
 * register at 0x040004A4. Hardware clear state changes, nothing is returned,
 * and the shifts correspond directly to the Nintendo DS register layout.
 */
extern "C" void func_ov048_0220bbfc(u32 color, u32 alpha, u32 polygonId,
                                     u32 depthFlag, u32 depth, u32 fog)
{
    *(volatile u32 *)0x040004a4 =
        color | (alpha << 4) | (polygonId << 6) | (depthFlag << 24) |
        (depth << 16) | fog;
}

/*
 * Write zero to DISPCAPCNT at 0x040004A8, disabling display capture. No memory
 * or SDK-owned state changes and no value is returned.
 */
extern "C" void func_ov048_0220bc28(void)
{
    *(volatile u32 *)0x040004a8 = 0;
}

/*
 * Perform the same geometry setup as func_ov048_0220baec but emit the alternate
 * vertex ordering `(x0,y0)`, `(x0,y1)`, `(x1,y1)`, `(x1,y0)`. Geometry FIFO,
 * clear-color, capture, and flush registers change; coordinates are signed
 * 16-bit packets and the function returns nothing.
 */
extern "C" void func_ov048_0220bc3c(s32 y0, s32 x0, s32 x1, s32 y1,
                                     s32 depth, u16 color, u16 polygon)
{
    volatile u32 *vertex = (volatile u32 *)0x04000494;
    begin_quad(color, y0, x0, depth);
    *vertex = pack_s16_pair(x0, y1);
    *(volatile u32 *)0x04000480 = polygon;
    *vertex = pack_s16_pair(x1, y1);
    *vertex = pack_s16_pair(x1, y0);
    end_quad();
}

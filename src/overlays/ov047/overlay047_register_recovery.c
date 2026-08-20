#include "tingle/types.h"

/*
 * Overlay 47 Nintendo DS register packing. These recovered helpers encode
 * display-capture control and geometry FIFO payloads. Exact assembly preserves
 * volatile write width/order and the original ABI treatment of stack arguments.
 */

/*
 * Pack eight confirmed bit fields into DISPCAPCNT at
 * 0x040004A8. Inputs occupy their hardware-defined shifts (including the
 * destination offset divided by eight); the capture register changes, nothing
 * is returned, and no validation or masking beyond the original shifts occurs.
 */
extern "C" void func_ov047_0220c2c8(u32 a, u32 b, u32 c, u32 d, u32 e,
                                     u32 f, u32 g, u32 h)
{
    u32 value = (a << 26) | (h >> 3) | (b << 30) | (c << 20) |
                (d << 23) | (e << 16) | (f << 18) | (g << 29);
    *(volatile u32 *)0x040004a8 = value;
}

/*
 * Write two packed 16-bit coordinate pairs to the geometry FIFO register at
 * 0x0400048C: `(first, second)` followed by zero-extended `third`. Geometry
 * engine command state changes, nothing is returned, and argument truncation
 * to 16 bits is intentional hardware packet formatting.
 */
extern "C" void func_ov047_0220c308(s32 first, s32 second, s32 third)
{
    volatile u32 *fifo = (volatile u32 *)0x0400048c;
    *fifo = ((u32)(u16)second << 16) | (u16)first;
    *fifo = (u16)third;
}

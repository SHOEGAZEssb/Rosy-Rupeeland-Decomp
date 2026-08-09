#include "tingle/types.h"

/*
 * Overlay 48 geometry/capture packet emission. These recovered helpers reset
 * 3D state, configure clear/capture registers, and send one of two vertex
 * orderings for an axis-aligned quadrilateral. Exact assembly preserves FIFO
 * write order, signed 16-bit truncation, and stack-argument ABI behavior.
 */

/*
 * Reset the geometry matrix, set identity scale, configure clear color and
 * disable capture, then emit four vertices using `(x0,y0)`, `(x0,y1)`,
 * `(x1,y1)`, `(x1,y0)` with caller-supplied depth, color, and polygon values.
 * Geometry FIFO, clear-color, capture, and flush registers change; nothing is
 * returned. All coordinates are intentionally truncated to signed 16 bits.
 */
extern "C" void func_ov048_0220baec(s32 x0, s32 y0, s32 x1, s32 y1,
                                     s32 depth, u16 color, u16 polygon);

/*
 * Pack clear-color fields and two stack arguments into the 3D clear-color
 * register at 0x040004A4. Hardware clear state changes, nothing is returned,
 * and the shifts correspond directly to the Nintendo DS register layout.
 */
extern "C" void func_ov048_0220bbfc(u32 color, u32 alpha, u32 polygonId,
                                     u32 depthFlag, u32 depth, u32 fog);

/*
 * Write zero to DISPCAPCNT at 0x040004A8, disabling display capture. No memory
 * or SDK-owned state changes and no value is returned.
 */
extern "C" void func_ov048_0220bc28(void);

/*
 * Perform the same geometry setup as func_ov048_0220baec but emit the alternate
 * vertex ordering `(x0,y0)`, `(x1,y0)`, `(x1,y1)`, `(x0,y1)`. Geometry FIFO,
 * clear-color, capture, and flush registers change; coordinates are signed
 * 16-bit packets and the function returns nothing.
 */
extern "C" void func_ov048_0220bc3c(s32 x0, s32 y0, s32 x1, s32 y1,
                                     s32 depth, u16 color, u16 polygon);

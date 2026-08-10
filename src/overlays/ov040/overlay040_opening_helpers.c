#include "tingle/types.h"

/*
 * Overlay 40 opening helpers. This recovered group initializes the overlay's
 * shared transform-like base and writes packed Nintendo DS background-control
 * fields used by the larger scene constructor that follows.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_020f3058[];

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_Init(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Install the address-derived base vtable, initialize embedded objects at
 * +0x1C and +0x2C, clear words +4/+8/+0x0C/+0x44, and return object.
 * The two embedded initializers may change their subsystem state.
 */
extern "C" void *func_ov040_021fce00(void *object)
{
    FIELD(const void *, object, 0) = data_020f3058;
    VecFx32Object_Init((u8 *)object + 0x1c);
    VecFx32Object_Init((u8 *)object + 0x2c);
    FIELD(u32, object, 4) = 0;
    FIELD(u32, object, 8) = 0;
    FIELD(u32, object, 0x0c) = 0;
    FIELD(u32, object, 0x44) = 0;
    return object;
}

/*
 * Rewrite main-engine BG1CNT at 0x0400000A. Preserve priority bits 0-1 and
 * mosaic bit 6, then pack screen size, color mode, screen-base block,
 * character-base block, and extended-palette selector in that order. Returns
 * no value; only the display hardware register changes.
 */
extern "C" void func_ov040_021fce40(s32 screenSize, s32 colorMode,
                                      s32 screenBase, s32 characterBase,
                                      s32 extendedPalette)
{
    volatile u16 *bg1cnt = (volatile u16 *)0x0400000a;
    *bg1cnt = (*bg1cnt & 0x43) | (u16)(screenSize << 14) |
              (u16)(colorMode << 7) | (u16)(screenBase << 8) |
              (u16)(characterBase << 2) | (u16)(extendedPalette << 13);
}

/*
 * Rewrite main-engine BG3CNT at 0x0400000E. Preserve priority bits 0-1 and
 * mosaic bit 6, then pack screen size, color mode, screen-base block, and
 * character-base block. Returns no value; only the display register changes.
 */
extern "C" void func_ov040_021fce74(s32 screenSize, s32 colorMode,
                                      s32 screenBase, s32 characterBase)
{
    volatile u16 *bg3cnt = (volatile u16 *)0x0400000e;
    *bg3cnt = (*bg3cnt & 0x43) | (u16)(screenSize << 14) |
              (u16)(colorMode << 7) | (u16)(screenBase << 8) |
              (u16)(characterBase << 2);
}

/*
 * Store three caller-supplied transform words at +0x30/+0x34/+0x38. The
 * surrounding constructors use these as fixed-point coordinates. Returns no
 * value and changes only object.
 */
extern "C" void func_ov040_021fcea0(void *object, s32 x, s32 y, s32 z)
{
    FIELD(s32, object, 0x30) = x;
    FIELD(s32, object, 0x34) = y;
    FIELD(s32, object, 0x38) = z;
}

/*
 * Store two caller-supplied 16-bit transform values at +0x3C/+0x3E. Their
 * exact role beyond the transform relationship is not yet confirmed. Returns
 * no value and changes only object.
 */
extern "C" void func_ov040_021fceb0(void *object, u16 first, u16 second)
{
    FIELD(u16, object, 0x3c) = first;
    FIELD(u16, object, 0x3e) = second;
}

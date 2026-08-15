#include "tingle/types.h"

/* Overlay 34 GX strip emission for the segmented cylindrical/scrolling mesh. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

extern const s32 data_ov034_021fe788[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Presentation_InterpolateLinear(s32 start, s32 end, s32 scale, s32 phase);
extern void func_ov034_021fd2b8(s32 x, s32 y);
extern void func_ov034_021fd2ec(s32 x, s32 y, s32 z);
#ifdef __cplusplus
}
#endif

/* Wraps a recovered sixteen-entry sector index. */
static s32 wrap_sector(s32 sector)
{
    if (sector >= 16)
        sector -= 16;
    if (sector < 0)
        sector += 16;
    return sector;
}

/* Returns the table-derived fixed-point X coordinate for one bank/sector. */
static s32 sector_x(s32 bank, s32 sector)
{
    return data_ov034_021fe788[bank * 16 + wrap_sector(sector)] << 18;
}

/*
 * Emits three adjacent textured quads to the Nintendo DS GX FIFO. `state` holds
 * a table bank at +0, transform words at +4/+8/+0xC, and a 16-bit cyclic phase
 * at +0x1C. The phase chooses the leading sector and feeds Presentation_InterpolateLinear to
 * split texture V across two rows; X coordinates come from sixteen-entry banks
 * at 0x021FE788. The third sector is emitted only when its table value is below
 * two, matching the recovered boundary guard. The routine writes GXSTAT,
 * MTX_LOAD_4x3, BEGIN_VTXS, NORMAL/COLOR-like command port 0x04000480,
 * TEXCOORD 0x04000488 through the helper, VTX_16 0x0400048C through the helper,
 * command port 0x04000494, END_VTXS 0x04000504, and flush/enable 0x04000448.
 * Returns no value; its observable effect is direct GX/MMIO command emission.
 */
extern "C" void func_ov034_021fd030(void *state)
{
    s32 bank = FIELD(s32, state, 0);
    s32 phase = FIELD(s32, state, 0x1c);
    s32 sector = wrap_sector(((u16)phase >> 12) + 1);
    s32 split = (u16)(0x1e0 - Presentation_InterpolateLinear(0, 0x1e0, 0x1000,
                                            (u16)phase));

    REG32(0x04000444) = 0;
    REG32(0x04000470) = FIELD(u32, state, 4);
    REG32(0x04000470) = FIELD(u32, state, 8);
    REG32(0x04000470) = FIELD(u32, state, 0xc);
    REG32(0x04000500) = 1;
    REG32(0x04000480) = 0x7fff;

    s32 x = sector_x(bank, sector);
    func_ov034_021fd2b8(x, 0);
    func_ov034_021fd2ec(-0x200, 0x1e0, 0);
    func_ov034_021fd2b8(x + 0x40000, 0);
    REG32(0x04000494) = 0x01e00200;
    func_ov034_021fd2b8(x + 0x40000, 0x20000);
    REG32(0x04000494) = ((u32)(u16)split << 16) | 0x0200;
    func_ov034_021fd2b8(x, 0x20000);
    REG32(0x04000494) = ((u32)(u16)split << 16) | 0xfe00;

    sector = wrap_sector(sector - 1);
    x = sector_x(bank, sector);
    s32 nextSplit = (s16)(split - 0x1e0);
    func_ov034_021fd2b8(x, 0);
    func_ov034_021fd2ec(-0x200, split, 0);
    func_ov034_021fd2b8(x + 0x40000, 0);
    REG32(0x04000494) = ((u32)(u16)split << 16) | 0x0200;
    func_ov034_021fd2b8(x + 0x40000, 0x20000);
    REG32(0x04000494) = ((u32)(u16)nextSplit << 16) | 0x0200;
    func_ov034_021fd2b8(x, 0x20000);
    REG32(0x04000494) = ((u32)(u16)nextSplit << 16) | 0xfe00;

    sector = wrap_sector(sector - 1);
    s32 entry = data_ov034_021fe788[bank * 16 + sector];
    s32 lastX = entry < 2 ? entry << 18 : 0;
    s32 lastRight = entry < 2 ? lastX + 0x40000 : 0;
    func_ov034_021fd2b8(lastX, 0);
    func_ov034_021fd2ec(-0x200, nextSplit, 0);
    func_ov034_021fd2b8(lastRight, 0);
    REG32(0x04000494) = ((u32)(u16)nextSplit << 16) | 0x0200;
    func_ov034_021fd2b8(lastRight, 0x20000);
    REG32(0x04000494) = 0xfe200200;
    func_ov034_021fd2b8(lastX, 0x20000);
    REG32(0x04000494) = 0xfe20fe00;
    REG32(0x04000504) = 0;
    REG32(0x04000448) = 1;
}

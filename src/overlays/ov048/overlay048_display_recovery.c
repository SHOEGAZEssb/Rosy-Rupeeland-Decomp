#include "tingle/types.h"

/*
 * Overlay 48 display/capture setup. These recovered routines route VRAM,
 * configure main/sub BG modes, and prepare a software OAM buffer for a capture
 * effect. Exact assembly preserves volatile Nintendo DS MMIO write ordering.
 */

/*
 * Initialize display hardware and OAM state for `object`. It masks 3D control
 * bits at 0x04000060, initializes the transfer table at +0x404, selects main
 * and sub graphics modes, configures BG2 affine parameters and sub BG control,
 * fills twelve initial OAM entries in the 128-entry buffer, uploads the 0x400-
 * byte OAM block, applies plane priorities, and initializes capture registers.
 * Object OAM records, SDK graphics state, and main/sub MMIO all change; nothing
 * is returned. Packed values are confirmed hardware encodings.
 */
extern "C" const s16 gFx32CosSinTable[];
extern "C" void TitleDisplay_ResetMainBgScroll(void);
extern "C" void TitleDisplay_SetMainBgPriorities(s32, s32, s32, s32);
extern "C" void TitleDisplay_SetSubBgPriorities(s32, s32, s32, s32);
extern "C" void func_020afd28(volatile void *, const void *, s32, s32, s32,
                               s32);
extern "C" void func_020b0348(void *);
extern "C" void func_020b1e5c(const void *, u32, u32);
extern "C" void func_020b44e8(void);
extern "C" void func_020b4554(void *, s32);
extern "C" void GX_SetGraphicsMode(u32, u32, u32);
extern "C" void GXS_SetGraphicsMode(u32);

extern "C" void func_ov048_0220b9a0(s32 enabled);

extern "C" void func_ov048_0220b7b8(void *object)
{
    u8 *bytes = (u8 *)object;
    volatile u16 *reg3d = (volatile u16 *)0x04000060;
    volatile u16 *subBg2Control = (volatile u16 *)0x0400100c;
    s32 transform[4];

    *reg3d &= 0xffffcffd;
    *reg3d &= 0xcfdf;
    *reg3d = (*reg3d & ~0x3000) | 0x10;
    *reg3d = (*reg3d & ~0x3000) | 8;
    *reg3d &= 0xcffb;
    func_020b0348(bytes + 0x404);
    func_ov048_0220b9a0(0);
    GX_SetGraphicsMode(1, 0, 1);
    TitleDisplay_ResetMainBgScroll();
    TitleDisplay_SetMainBgPriorities(1, 0, 2, 3);
    *(volatile u16 *)0x04000050 = 0;
    GXS_SetGraphicsMode(5);

    *subBg2Control = (*subBg2Control & 0x43) | 0x4084;
    transform[0] = gFx32CosSinTable[1];
    transform[1] = gFx32CosSinTable[0];
    transform[2] = -gFx32CosSinTable[0];
    transform[3] = gFx32CosSinTable[1];
    func_020afd28((volatile void *)0x04001020, transform, 0, 0, 0, 0);
    *(volatile u32 *)0x04001000 =
        (*(volatile u32 *)0x04001000 & ~0x60u) | 0x20;

    for (s32 row = 0; row < 3; ++row) {
        for (s32 column = 0; column < 4; ++column) {
            u8 *entry = bytes + 4 + (row * 4 + column) * 8;
            *(u32 *)entry = 0xc0000c00u | ((u32)(row << 6) & 0xff) |
                            ((u32)column << 22);
            *(u16 *)(entry + 4) =
                (u16)(0xf000 | (row << 8) | (column << 3));
        }
    }
    func_020b4554(bytes + 4, 0x400);
    func_020b44e8();
    func_020b1e5c(bytes + 4, 0, 0x400);
    TitleDisplay_SetSubBgPriorities(0, 1, 2, 3);
    *(volatile u32 *)0x04000540 = 2;
    *(volatile u32 *)0x04000580 = 0xbfff0000;
}

/*
 * Set or clear bit 15 of POWCNT1 at 0x04000304 from `enabled`. No masking of
 * the input beyond its left shift occurs. Hardware power/display state changes;
 * memory is unchanged and nothing is returned.
 */
extern "C" void func_ov048_0220b9a0(s32 enabled)
{
    volatile u16 *power = (volatile u16 *)0x04000304;
    *power = (u16)((*power & ~0x8000u) | ((u32)enabled << 15));
}

/*
 * Route VRAM banks and configure DISPCAPCNT according to selector field +0,
 * then return that selector. Zero routes bank C for LCDC after clearing the
 * alternate mapping; nonzero routes bank C to sub BG and bank D to LCDC. VRAM
 * bank ownership and capture MMIO change through SDK calls.
 */
extern "C" void GX_SetBankForLCDC(u32);
extern "C" void GX_SetBankForSubBG(u32);
extern "C" void func_020ae6c8(void);
extern "C" void func_020ae6dc(void);
extern "C" void func_020aeb08(u32);

extern "C" void func_ov048_0220ba54(u32 sourceA, u32 sourceB, u32 size,
                                     u32 mode, u32 destination, u32 eva,
                                     u32 evb);

extern "C" s32 func_ov048_0220b9bc(void *object)
{
    s32 selector = *(s32 *)object;
    if (selector == 0) {
        func_020aeb08(8);
        func_020ae6dc();
        GX_SetBankForLCDC(4);
        func_ov048_0220ba54(3, 0, 0, 0, 2, 0x10, 0);
    } else {
        GX_SetBankForSubBG(4);
        func_020ae6c8();
        GX_SetBankForLCDC(8);
        func_ov048_0220ba54(3, 0, 0, 0, 3, 0x10, 0);
    }
    return selector;
}

/*
 * Pack capture source, size, destination-bank, mode, offset, and EVA/EVB stack
 * arguments into DISPCAPCNT at 0x04000064 and set its enable bit. Hardware
 * capture state changes, nothing is returned, and values are shifted exactly
 * as provided without semantic validation.
 */
extern "C" void func_ov048_0220ba54(u32 sourceA, u32 sourceB, u32 size,
                                     u32 mode, u32 destination, u32 eva,
                                     u32 evb)
{
    *(volatile u32 *)0x04000064 =
        0x80000000u | (sourceB << 29) | (mode << 25) | (size << 24) |
        (sourceA << 20) | (destination << 16) | (evb << 8) | eva;
}

/*
 * Apply selector field +0 to POWCNT1 and sub-engine display mode bits: zero
 * enables the power bit and chooses display mode 4, nonzero clears it and
 * chooses mode 1. Main/sub display MMIO changes; the object is unchanged and
 * no value is returned.
 */
extern "C" void func_ov048_0220ba90(void *object)
{
    s32 selector = *(s32 *)object;
    volatile u32 *subDisplay = (volatile u32 *)0x04001000;
    func_ov048_0220b9a0(selector);
    *subDisplay = (*subDisplay & ~0x1f00u) |
                  (selector == 0 ? 0x1000u : 0x400u);
}

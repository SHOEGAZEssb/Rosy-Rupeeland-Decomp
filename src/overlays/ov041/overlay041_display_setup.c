#include "tingle/types.h"

/*
 * Overlay 41 display-engine setup. These recovered routines configure capture,
 * display banks and BG control/scroll registers for the two scene layouts, and
 * build the capture buffer's initial tile map.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void func_020ae8f8(void);
void func_020ae90c(void);
void func_020aeb08(s32);
void GX_SetBankForSubBG(s32);
void GX_SetBankForLCDC(s32);
void GX_SetGraphicsMode(s32, s32, s32);
void GXS_SetGraphicsMode(s32);
void func_020b4554(void *, s32);
void func_020b44e8(void);
void func_020b1e5c(void *, s32, s32);
extern u8 data_ov041_022059e4[];
}

/*
 * Enable or disable the LCD power bit selected by enabled. This performs one
 * halfword write to POWCNT1 and returns no value.
 */
extern "C" void func_ov041_021fe2c4(s32 enabled)
{
    volatile u16 *powcnt1 = (volatile u16 *)0x04000304;
    *powcnt1 = (u16)((*powcnt1 & ~0x8000) | (enabled << 15));
}

/*
 * Pack the eight capture-control arguments into DISPCAPCNT. The final three
 * arguments are supplied on the stack under the ARM ABI; no value is returned.
 */
extern "C" void func_ov041_021fe2e0(s32 size, s32 sourceA, s32 sourceB,
                                      s32 destination, s32 writeBlock,
                                      s32 eva, s32 evb)
{
    *(volatile u32 *)0x04000064 =
        0x80000000u | (sourceA << 29) | (destination << 25) |
        (sourceB << 24) | (size << 20) | (writeBlock << 16) |
        (evb << 8) | eva;
}

static void set_scroll_and_bg(void *owner, s32 lowerOffset)
{
    volatile u32 *scroll = (volatile u32 *)0x04000014;
    s32 mode = FIELD(s32, owner, 0x1f4);
    s32 x = FIELD(s32, owner, 0x190);
    s32 y = FIELD(s32, owner, 0x194);
    if (mode == 0 || mode == 2) {
        scroll[0] = (x >> 15) & 0x1ff;
        scroll[1] = ((x >> 13) & 0x1ff) | (((y >> 14) - lowerOffset) << 16 & 0x1ff0000);
    } else {
        scroll[0] = 0;
        scroll[1] = ((y >> 14) - lowerOffset) << 16 & 0x1ff0000;
    }

    volatile u16 *bg = (volatile u16 *)0x0400000a;
    bg[0] = (bg[0] & ~3) | 2;
    bg[1] = (bg[1] & ~3) | 1;
    bg[2] &= ~3;
    *(volatile u32 *)0x0400001c =
        (((x >> 12) + 0x80) & 0x1ff) | (((y >> 12) - lowerOffset) << 16 & 0x1ff0000);
}

/*
 * Configure the display for the vertically shifted capture layout. This
 * updates scroll/BG registers, VRAM banks, capture control and both engines'
 * graphics modes; it returns no value.
 */
extern "C" void func_ov041_021fe110(void *owner)
{
    func_ov041_021fe2c4(1);
    set_scroll_and_bg(owner, 0xc0);
    func_020ae8f8();
    GX_SetBankForSubBG(4);
    GX_SetBankForLCDC(8);
    func_ov041_021fe2e0(3, 0, 0, 0, 3, 0x10, 0);
    GX_SetGraphicsMode(1, 0, 1);
    volatile u32 *mainDisp = (volatile u32 *)0x04000000;
    *mainDisp = (*mainDisp & ~0x1f00) | (FIELD(s32, owner, 0x44) << 8);
    *(volatile u16 *)0x04000008 &= ~3;
    GXS_SetGraphicsMode(5);
    volatile u32 *subDisp = (volatile u32 *)0x04001000;
    *subDisp = (*subDisp & ~0x1f00) | 0x400;
    volatile u16 *subBg2 = (volatile u16 *)0x0400100c;
    *subBg2 = (*subBg2 & 0x43) | 0x4084;
    *subBg2 &= ~3;
    *subBg2 &= ~0x40;
}

/*
 * Configure the alternate, unshifted capture layout. It performs the same
 * class of display-register and VRAM-bank changes as func_ov041_021fe110 but
 * selects the other LCDC bank and sub-engine display plane.
 */
extern "C" void func_ov041_021fe31c(void *owner)
{
    func_ov041_021fe2c4(0);
    set_scroll_and_bg(owner, 0);
    func_020ae90c();
    func_020aeb08(8);
    GX_SetBankForLCDC(4);
    func_ov041_021fe2e0(3, 0, 0, 0, 2, 0x10, 0);
    GX_SetGraphicsMode(1, 0, 1);
    volatile u32 *mainDisp = (volatile u32 *)0x04000000;
    *mainDisp = (*mainDisp & ~0x1f00) | (FIELD(s32, owner, 0x44) << 8);
    *(volatile u16 *)0x04000008 &= ~3;
    GXS_SetGraphicsMode(5);
    volatile u32 *subDisp = (volatile u32 *)0x04001000;
    *subDisp = (*subDisp & ~0x1f00) | 0x1000;
}

/*
 * Clear the 0x400-byte capture staging table and generate 24 tile descriptors
 * for three rows of eight columns. It then flushes and transfers that table
 * through the graphics SDK. No value is returned.
 */
extern "C" void func_ov041_021fe498(void *)
{
    volatile u32 *subDisp = (volatile u32 *)0x04001000;
    *subDisp = (*subDisp & ~0x60) | 0x20;
    u32 *table = (u32 *)data_ov041_022059e4;
    for (s32 i = 0; i < 0x100; ++i)
        table[i] = 0;

    s32 output = 0;
    for (s32 y = 0; y < 0xc0; y += 0x40) {
        for (s32 x = 0; x < 0x100; x += 0x40) {
            table[output * 2] = 0xc0000c00u | (y & 0xff) | ((u32)x << 16);
            ((u16 *)table)[output * 4 + 2] =
                (u16)(0xf000 | ((x / 8) + (y / 8) * 32));
            ++output;
        }
    }
    func_020b4554(table, 0x400);
    func_020b44e8();
    func_020b1e5c(table, 0, 0x400);
}

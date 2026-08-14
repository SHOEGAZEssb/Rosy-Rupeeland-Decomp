/*
 * Shared dual-engine 2D display setup helpers used by title-era scenes. They
 * configure VRAM ownership and write the NDS background control/scroll MMIO.
 */
#include "tingle/types.h"

#ifdef __cplusplus
extern "C" {
#endif

extern void GX_SetGraphicsMode(s32 displayMode, s32 backgroundMode,
                               s32 bg0Mode);
extern void GXS_SetGraphicsMode(s32 backgroundMode);
extern void GX_SetBankForBG(u32 banks);
extern void GX_SetBankForSubBG(u32 banks);
extern void func_020af1f8(u32 banks);
extern void func_020aea7c(u32 banks);

#ifdef __cplusplus
}
#endif

/* Configure the main engine for 2D mode, assign bank B to BG and banks F/G to
 * BG extended palettes, then clear the main BG block selector. */
void func_020925a4(s32 backgroundMode)
{
    GX_SetGraphicsMode(1, backgroundMode, 0);
    GX_SetBankForBG(2);
    func_020af1f8(0x40);
    *(volatile u32 *)0x04000000 &= ~0x38000000u;
}

/* Configure the sub engine, assign bank C to BG and bank H to its extended
 * palettes. The caller supplies the SDK sub-engine background mode. */
void func_020925dc(s32 backgroundMode)
{
    GXS_SetGraphicsMode(backgroundMode);
    GX_SetBankForSubBG(4);
    func_020aea7c(0x80);
}

/* Zero all four main-engine BG horizontal/vertical scroll register pairs. */
void func_020925f8(void)
{
    volatile u32 *scroll = (volatile u32 *)0x04000010;

    scroll[0] = 0;
    scroll[1] = 0;
    scroll[2] = 0;
    scroll[3] = 0;
}

/* Zero all four sub-engine BG horizontal/vertical scroll register pairs. */
void func_02092618(void)
{
    volatile u32 *scroll = (volatile u32 *)0x04001010;

    scroll[0] = 0;
    scroll[1] = 0;
    scroll[2] = 0;
    scroll[3] = 0;
}

/* Replace only the two priority bits in the four main-engine BG controls. */
void func_02092638(s32 bg0, s32 bg1, s32 bg2, s32 bg3)
{
    volatile u16 *control = (volatile u16 *)0x04000008;

    control[0] = (u16)((control[0] & ~3u) | bg0);
    control[1] = (u16)((control[1] & ~3u) | bg1);
    control[2] = (u16)((control[2] & ~3u) | bg2);
    control[3] = (u16)((control[3] & ~3u) | bg3);
}

/* Replace only the two priority bits in the four sub-engine BG controls. */
void func_02092688(s32 bg0, s32 bg1, s32 bg2, s32 bg3)
{
    volatile u16 *control = (volatile u16 *)0x04001008;

    control[0] = (u16)((control[0] & ~3u) | bg0);
    control[1] = (u16)((control[1] & ~3u) | bg1);
    control[2] = (u16)((control[2] & ~3u) | bg2);
    control[3] = (u16)((control[3] & ~3u) | bg3);
}

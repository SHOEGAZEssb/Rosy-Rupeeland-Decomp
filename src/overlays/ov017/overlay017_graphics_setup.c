#include "tingle/types.h"

/* Overlay 17 Nintendo DS 2D/3D graphics mode, VRAM, and resource initialization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];

#ifdef __cplusplus
extern "C" {
#endif
extern void G3X_Init(void);
extern void GX_SetBankForBG(s32);
extern void GX_SetGraphicsMode(s32, s32, s32);
extern void GraphicsResourceSet_Apply(void *, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void GraphicsResourceSet_ApplyToMainBg(void *, s32, s32);
extern void TitleDisplay_ConfigureSub2dEngine(s32, s32);
extern void TitleDisplay_ResetMainBgScroll(void);
extern void TitleDisplay_ResetSubBgScroll(void);
extern void TitleDisplay_SetMainBgPriorities(s32, s32, s32, s32);
extern void TitleDisplay_SetSubBgPriorities(s32, s32, s32, s32);
extern void TitlePalette_SetSubBackdrop(s32);
extern void func_020af1f8(s32);
extern void func_020b0300(s32, s32, s32, s32, s32);
extern void func_020b44e8(void);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the 3D engine, configure display/geometry registers, select main
 * graphics mode and BG VRAM bank, configure main/sub backgrounds and blending,
 * then load two resource-ID groups (0x8000/1/2 and 0x8012/13/19) through a
 * temporary resource set. Store state flags +0x48 = 0x19 and +0x4C = 0x10,
 * apply the second set, reset helper 0x0209285C, and destroy the temporary set.
 * State, graphics SDK, VRAM/resource ownership, and Nintendo DS MMIO change;
 * returns void. Masked halfword accesses preserve unrelated hardware bits.
 */
extern "C" void Overlay017_SetupGraphics(void *state)
{
    u8 resourceSet[12];
    volatile u16 *reg60 = (volatile u16 *)0x04000060;
    volatile u32 *reg4c4 = (volatile u32 *)0x040004c4;
    volatile u16 *mainBg2Cnt = (volatile u16 *)0x0400000c;
    volatile u16 *blendCnt = (volatile u16 *)0x04000050;
    volatile u16 *subBg3Cnt = (volatile u16 *)0x0400100e;

    G3X_Init();
    *reg60 &= 0xcffd;
    *reg60 = (*reg60 & ~0x3000) | 0x10;
    *reg60 = (*reg60 & ~0x3000) | 8;
    *reg60 &= 0xcfdf;
    *(volatile u32 *)0x04000540 = 2;
    func_020b0300(0, 0x1f, 0x7fff, 0x3f, 0);
    *reg4c4 = 0;
    *(volatile u32 *)0x04000580 = 0xbfff0000;
    GX_SetGraphicsMode(1, 0, 1);
    FIELD(s32, state, 0x48) = 0x19;
    GX_SetBankForBG(0x10);
    func_020af1f8(0x40);
    *mainBg2Cnt = (*mainBg2Cnt & 0x43) | 0x1c00;
    TitleDisplay_ResetMainBgScroll();
    TitleDisplay_SetMainBgPriorities(2, 1, 0, 3);
    *blendCnt = 0;
    FIELD(s32, state, 0x4c) = 0x10;
    TitleDisplay_ConfigureSub2dEngine(0, 0x10);
    *subBg3Cnt = (*subBg3Cnt & 0x43) | 0x1e00;
    TitleDisplay_ResetSubBgScroll();
    TitleDisplay_SetSubBgPriorities(0, 1, 2, 3);

    GraphicsResourceSet_Init(resourceSet);
    GraphicsResourceSet_Load(resourceSet, data_020f4e18[0], 0x8000, 0x8001,
                             0x8002);
    func_020b44e8();
    GraphicsResourceSet_ApplyToMainBg(resourceSet, 2, 0);
    GraphicsResourceSet_Load(resourceSet, data_020f4e18[0], 0x8012, 0x8013,
                             0x8019);
    func_020b44e8();
    GraphicsResourceSet_Apply(resourceSet, 3, 0);
    TitlePalette_SetSubBackdrop(0);
    GraphicsResourceSet_Destroy(resourceSet);
}

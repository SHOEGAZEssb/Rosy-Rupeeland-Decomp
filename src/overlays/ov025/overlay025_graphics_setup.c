#include "tingle/types.h"

/* Overlay 25 dual-engine display setup and shared graphics-resource uploads. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void GraphicsResourceSet_Apply(void *, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void func_020706c4(void *, s32, s32);
extern void *GraphicsBgResourceData_GetDecoded(void *);
extern void GraphicsBgMapResource_UploadToSubBg(void *, s32, s32);
extern void GraphicsBgMapResource_AddPaletteBankOffset(void *, s32);
extern void func_02072048(void *, s32, s32);
extern void *GraphicsSpriteRenderer_GetObjectPaletteAddress(void *);
extern void TitleDisplay_ConfigureMain2dEngine(s32);
extern void TitleDisplay_ConfigureSub2dEngine(s32);
extern void TitleDisplay_ResetMainBgScroll(void);
extern void TitleDisplay_ResetSubBgScroll(void);
extern void TitleDisplay_SetMainBgPriorities(s32, s32, s32, s32);
extern void TitleDisplay_SetSubBgPriorities(s32, s32, s32, s32);
extern void func_020b1ff0(void *, s32, s32);
extern void func_020b44e8(void);
#ifdef __cplusplus
}
#endif

/*
 * Configures both display engines with BG0/BG1/BG2 modes and layer ordering,
 * stores sub display mode 18 at scene +0x4C, and uploads resource triplets
 * 0x8030..32, 0xA138..3A, and 0xC006..08. Their retail bgLibKatsu archive
 * names are bg_saveSelDlog, bg_ttl_up, and bg_effeDark respectively;
 * func_ov025_02200014 installs the paired bg_ttl_down resource. It configures
 * palette bank 8, clears a 32-byte palette region, and rewrites shared
 * font-renderer BG fields +6/+8/+A/+C. Engine MMIO, font, resource, VRAM, and
 * palette state change.
 */
extern "C" void func_ov025_021ffdfc(void *scene)
{
    *(volatile u16 *)0x04000304 &= ~0x8000;
    TitleDisplay_ConfigureMain2dEngine(0);
    volatile u16 *main_bg = (volatile u16 *)0x0400000a;
    main_bg[0] = (main_bg[0] & 0x43) | 0x3a00;
    main_bg[1] = (main_bg[1] & 0x43) | 0x1e10;
    main_bg[2] = (main_bg[2] & 0x43) | 0x1e10;
    TitleDisplay_ResetMainBgScroll();
    TitleDisplay_SetMainBgPriorities(0, 0, 2, 3);
    FIELD(s32, scene, 0x4c) = 18;
    TitleDisplay_ConfigureSub2dEngine(0);
    volatile u16 *sub_bg = (volatile u16 *)0x0400100a;
    sub_bg[0] = (sub_bg[0] & 0x43) | 0x3a00;
    sub_bg[1] = (sub_bg[1] & 0x43) | 0x1e10;
    sub_bg[2] = (sub_bg[2] & 0x43) | 0x1e10;
    TitleDisplay_ResetSubBgScroll();
    TitleDisplay_SetSubBgPriorities(0, 3, 2, 3);

    void *set[3];
    GraphicsResourceSet_Init(set);
    GraphicsResourceSet_Load(set, data_020f4e18, 0x8030, 0x8031, 0x8032);
    func_020b44e8();
    func_02072048(set, 1, 0);
    GraphicsResourceSet_Load(set, data_020f4e18, 0xa138, 0xa139, 0xa13a);
    GraphicsBgMapResource_AddPaletteBankOffset(set[2], 8);
    func_020b44e8();
    GraphicsResourceSet_Apply(set, 1, 0x100);
    GraphicsResourceSet_Load(set, data_020f4e18, 0xc006, 0xc007, 0xc008);
    func_020b44e8();
    func_020706c4(set[0], 2, 0);
    GraphicsBgMapResource_UploadToSubBg(set[2], 2, 0);
    func_020b1ff0((u8 *)GraphicsBgResourceData_GetDecoded(set[1]) + 0xa0, 0, 0x20);
    u8 *font = (u8 *)GraphicsSpriteRenderer_GetObjectPaletteAddress(data_020f4e14);
    FIELD(u16, font, 6) = FIELD(u16, font, 0x1c);
    FIELD(u16, font, 8) = 0x31f;
    FIELD(u16, font, 0xa) = FIELD(u16, font, 0x1c);
    FIELD(u16, font, 0xc) = 0x215;
    GraphicsResourceSet_Destroy(set);
}

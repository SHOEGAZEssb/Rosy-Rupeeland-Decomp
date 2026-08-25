#include "tingle/types.h"

/* Overlay 21 dual-engine background setup, resource loading, and frame callbacks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18[];
extern const u8 data_021f5ee8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsResourceSet_Destroy(void *);
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void GraphicsBgCharacterResource_UploadToMainBg(void *, s32, s32);
extern void GraphicsBgCharacterResource_UploadToSubBg(void *, s32, s32);
extern void *GraphicsBgResourceData_GetDecoded(void *);
extern void GraphicsBgMapResource_UploadToMainBg(void *, s32, s32);
extern void GraphicsBgMapResource_UploadToSubBg(void *, s32, s32);
extern void GraphicsBgMapResource_SetPaletteBank(void *, s32);
extern void GraphicsResourceSet_ApplyToMainBg(void *, s32, s32);
extern void *GraphicsSpriteRenderer_GetObjectPaletteAddress(void *);
extern void TitleDisplay_ConfigureMain2dEngine(s32);
extern void TitleDisplay_ConfigureSub2dEngine(s32);
extern void TitleDisplay_ResetMainBgScroll(void);
extern void TitleDisplay_ResetSubBgScroll(void);
extern void TitleDisplay_SetMainBgPriorities(s32, s32, s32, s32);
extern void TitleDisplay_SetSubBgPriorities(s32, s32, s32, s32);
extern void TitleScreenResourceCollection_Init(void *);
extern void TitleScreenResourceCollection_Destroy(void *);
extern void TitleScreenResourceCollection_Append(void *, s32);
extern void *TitleScreenResourceCollection_Get(void *, s32);
extern void TitlePalette_SetMainBackdrop(s32);
extern void TitleScrollValue_Advance(void *);
extern void GraphicsAffineScanlineWave_Apply(void *, s32);
extern void Presentation_BlendPalette16(void *, void *, s32);
extern void func_020afd0c(void *, s32, s32, s32, s32);
extern void func_020b1ff0(void *, s32, s32);
extern void func_020b2058(const void *, s32, s32);
extern void func_020b44e8(void);
extern void Overlay021_ConfigureMainBg1(s32, s32, s32, s32, s32);
extern void Overlay021_RefreshPrimarySelectionDisplay(void *);
extern void Overlay021_RefreshSecondarySelectionDisplay(void *);
#ifdef __cplusplus
}
#endif

/*
 * If scene flag bit 10 is set, install main/sub display mode fields from
 * +0x48/+0x4C into DISPCNT bits 8..12, write +0x3FC into main BG2VOFS bits
 * 16..24 using the original masked 32-bit store, and update object +0x404.
 * Always return zero. Nintendo DS display MMIO and graphics SDK state may change.
 */
extern "C" s32 Overlay021_UpdateDisplay(void *state)
{
    if ((FIELD(u32, state, 0x20) & 0x400) != 0) {
        volatile u32 *mainDisplay = (volatile u32 *)0x04000000;
        volatile u32 *subDisplay = (volatile u32 *)0x04001000;
        *mainDisplay = (*mainDisplay & ~0x1f00U) |
                       (FIELD(u32, state, 0x48) << 8);
        *subDisplay = (*subDisplay & ~0x1f00U) |
                      (FIELD(u32, state, 0x4c) << 8);
        *(volatile u32 *)0x04000014 =
            (FIELD(u32, state, 0x3fc) << 16) & 0x01ff0000;
        TitleScrollValue_Advance((u8 *)state + 0x404);
    }
    return 0;
}

/*
 * If scene flag bit 10 is set, submit object +0x404 with argument zero.
 * Always return zero. Graphics SDK state may change; no direct MMIO occurs.
 */
extern "C" s32 Overlay021_ApplyScanlineWave(void *state)
{
    if ((FIELD(u32, state, 0x20) & 0x400) != 0)
        GraphicsAffineScanlineWave_Apply((u8 *)state + 0x404, 0);
    return 0;
}

/*
 * Clear POWCNT1 LCD-swap bit 15, set main/sub display selectors +0x48/+0x4C to
 * 0x1C, configure main and sub BG2/BG3 control words while preserving bits
 * 0,1,6, and order sub layers 0/1/2/3. Copy four font-derived halfwords into a
 * sub-engine blend/window record and configure register 0x04001050. Returns
 * void. Nintendo DS display/power MMIO and graphics SDK state change.
 */
extern "C" void Overlay021_SetupDisplay(void *state)
{
    *(volatile u16 *)0x04000304 &= (u16)~0x8000;
    FIELD(s32, state, 0x48) = 0x1c;
    TitleDisplay_ConfigureMain2dEngine(0);
    volatile u16 *mainBg = (volatile u16 *)0x0400000c;
    mainBg[0] = (mainBg[0] & 0x43) | 0x1e10;
    mainBg[1] = (mainBg[1] & 0x43) | 0x1e10;
    TitleDisplay_ResetMainBgScroll();

    FIELD(s32, state, 0x4c) = 0x1c;
    TitleDisplay_ConfigureSub2dEngine(0);
    volatile u16 *subBg = (volatile u16 *)0x0400100c;
    subBg[0] = (subBg[0] & 0x43) | 0x1e00;
    subBg[1] = (subBg[1] & 0x43) | 0x1e00;
    TitleDisplay_ResetSubBgScroll();
    TitleDisplay_SetSubBgPriorities(0, 1, 2, 3);

    u8 *fontState = (u8 *)GraphicsSpriteRenderer_GetObjectPaletteAddress(data_020f4e14);
    FIELD(u16, fontState, 6) = 0x17f;
    FIELD(u16, fontState, 8) = FIELD(u16, fontState, 0x1c);
    FIELD(u16, fontState, 0xa) = 0x4210;
    FIELD(u16, fontState, 0xc) = FIELD(u16, fontState, 0x1e);
    func_020afd0c((void *)0x04001050, 4, 0x18, 8, 8);
}

/*
 * Derive a tile-buffer address from resource +0x400, cache the same +0x20
 * address at +0x3F0/+0x3F4 and size 0x10 at +0x3F8, initialize it, load
 * resources 0xC006..0xC008, bind their first/third handles to mode 2, clear
 * 0x20 bytes at +0x3F0, and destroy the temporary resource set. Graphics and
 * resource memory change; returns void and performs no direct MMIO.
 */
extern "C" void Overlay021_LoadSubBackground(void *state)
{
    void *buffer = (u8 *)GraphicsBgResourceData_GetDecoded(FIELD(void *, state, 0x400)) + 0x20;
    FIELD(void *, state, 0x3f0) = buffer;
    FIELD(void *, state, 0x3f4) = buffer;
    FIELD(s32, state, 0x3f8) = 0x10;
    Presentation_BlendPalette16(buffer, buffer, 0);

    u8 resources[12];
    GraphicsResourceSet_Init(resources);
    GraphicsResourceSet_Load(resources, data_020f4e18[0],
                             0xc006, 0xc007, 0xc008);
    func_020b44e8();
    GraphicsBgCharacterResource_UploadToSubBg(FIELD(void *, resources, 0), 2, 0);
    GraphicsBgMapResource_UploadToSubBg(FIELD(void *, resources, 8), 2, 0);
    func_020b1ff0(FIELD(void *, state, 0x3f0), 0, 0x20);
    GraphicsResourceSet_Destroy(resources);
}

/*
 * Order main layers 0/1/2/3; configure BG1 through 0x021FE268; load/apply
 * resources 0x8038..0x803A to layer 1; clear +0x3FC, select display mode 0x1C,
 * and configure main register 0x04000050. Then load 0xC006..0xC008, set the
 * third handle to mode 8, bind first/third handles to mode 2, copy 0x20 bytes
 * from data_021F5EE8 at scale 0x100, and destroy the temporary set. Graphics
 * MMIO/resource state changes; returns void.
 */
extern "C" void Overlay021_SetupMainBackground(void *state)
{
    TitleDisplay_SetMainBgPriorities(0, 1, 2, 3);
    Overlay021_ConfigureMainBg1(0, 0, 0, 0x1c, 1);
    u8 resources[12];
    GraphicsResourceSet_Init(resources);
    GraphicsResourceSet_Load(resources, data_020f4e18[0],
                             0x8038, 0x8039, 0x803a);
    func_020b44e8();
    GraphicsResourceSet_ApplyToMainBg(resources, 1, 0);
    FIELD(s32, state, 0x3fc) = 0;
    FIELD(s32, state, 0x48) = 0x1c;
    func_020afd0c((void *)0x04000050, 4, 8, 8, 8);

    GraphicsResourceSet_Load(resources, data_020f4e18[0],
                             0xc006, 0xc007, 0xc008);
    GraphicsBgMapResource_SetPaletteBank(FIELD(void *, resources, 8), 8);
    func_020b44e8();
    GraphicsBgCharacterResource_UploadToMainBg(FIELD(void *, resources, 0), 2, 0);
    GraphicsBgMapResource_UploadToMainBg(FIELD(void *, resources, 8), 2, 0);
    func_020b2058(data_021f5ee8, 0x100, 0x20);
    GraphicsResourceSet_Destroy(resources);
}

/*
 * Configure the main engine for the A06D..A070 background set: order layers
 * 0/1/2/3, set BG0CNT screen base 0x3C and BG1 through 0x021FE268, load/apply
 * resources 0xA06D..0xA06F to layer zero, bind manager item 0xA070, set
 * +0x3FC=0 and display selector +0x48=0x13, then finalize and destroy both
 * temporary resource objects. Graphics resource and Nintendo DS BG MMIO state
 * change; returns void.
 */
extern "C" void Overlay021_SetupAlternateMainBackground(void *state)
{
    TitleDisplay_SetMainBgPriorities(0, 1, 2, 3);
    volatile u16 *bg0cnt = (volatile u16 *)0x04000008;
    *bg0cnt = (*bg0cnt & 0x43) | 0x3c00;
    Overlay021_ConfigureMainBg1(0, 0, 0, 0x1e, 1);

    u8 resources[12];
    u8 manager[0x44];
    GraphicsResourceSet_Init(resources);
    TitleScreenResourceCollection_Init(manager);
    GraphicsResourceSet_Load(resources, data_020f4e18[0],
                             0xa06d, 0xa06e, 0xa06f);
    TitleScreenResourceCollection_Append(manager, 0xa070);
    func_020b44e8();
    GraphicsResourceSet_ApplyToMainBg(resources, 0, 0);
    GraphicsBgMapResource_UploadToMainBg(TitleScreenResourceCollection_Get(manager, 0), 1, 0);
    FIELD(s32, state, 0x3fc) = 0;
    FIELD(s32, state, 0x48) = 0x13;
    TitlePalette_SetMainBackdrop(0);
    TitleScreenResourceCollection_Destroy(manager);
    GraphicsResourceSet_Destroy(resources);
}

/*
 * Configure the main selection-panel background: order layers 0/3/3/3,
 * program BG1 through 0x021FE268, load/apply 0x8008..0x800A to layer one, set
 * +0x3FC=0x20 and display selector +0x48=0x12, configure blend register
 * 0x04000050 with 0/2/4/12, refresh the overlay-0 selection display, and
 * destroy the temporary resources. Graphics MMIO/resource state changes.
 */
extern "C" void Overlay021_SetupPrimarySelectionBackground(void *state)
{
    TitleDisplay_SetMainBgPriorities(0, 3, 3, 3);
    Overlay021_ConfigureMainBg1(0, 0, 0x1c, 0, 1);
    u8 resources[12];
    GraphicsResourceSet_Init(resources);
    GraphicsResourceSet_Load(resources, data_020f4e18[0],
                             0x8008, 0x8009, 0x800a);
    func_020b44e8();
    GraphicsResourceSet_ApplyToMainBg(resources, 1, 0);
    FIELD(s32, state, 0x3fc) = 0x20;
    FIELD(s32, state, 0x48) = 0x12;
    func_020afd0c((void *)0x04000050, 0, 2, 4, 0xc);
    Overlay021_RefreshPrimarySelectionDisplay(state);
    GraphicsResourceSet_Destroy(resources);
}

/*
 * Configure the same selection-panel background as 0x021FE390, but refresh
 * the overlay-1 selection display through 0x021FF644. Graphics MMIO/resource
 * state changes; returns void.
 */
extern "C" void Overlay021_RefreshSelectionBackground(void *state)
{
    TitleDisplay_SetMainBgPriorities(0, 3, 3, 3);
    Overlay021_ConfigureMainBg1(0, 0, 0x1c, 0, 1);
    u8 resources[12];
    GraphicsResourceSet_Init(resources);
    GraphicsResourceSet_Load(resources, data_020f4e18[0],
                             0x8008, 0x8009, 0x800a);
    func_020b44e8();
    GraphicsResourceSet_ApplyToMainBg(resources, 1, 0);
    FIELD(s32, state, 0x3fc) = 0x20;
    FIELD(s32, state, 0x48) = 0x12;
    func_020afd0c((void *)0x04000050, 0, 2, 4, 0xc);
    Overlay021_RefreshSecondarySelectionDisplay(state);
    GraphicsResourceSet_Destroy(resources);
}

/*
 * Pack five caller fields into main BG1CNT at 0x0400000A: bits 14+, 7+, 8+,
 * 2+, and 13+, preserving existing bits 0,1,6. Returns void. This directly
 * changes Nintendo DS background-control MMIO.
 */
extern "C" void Overlay021_ConfigureMainBg1(s32 a, s32 b, s32 c, s32 d, s32 e)
{
    volatile u16 *bg1cnt = (volatile u16 *)0x0400000a;
    *bg1cnt = (u16)((*bg1cnt & 0x43) | (a << 14) | (b << 7) | (c << 8) |
                    (d << 2) | (e << 13));
}

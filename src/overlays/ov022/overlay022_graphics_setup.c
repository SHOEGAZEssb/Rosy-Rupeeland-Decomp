#include "tingle/types.h"

/* Overlay 22 per-frame display callbacks and initial main/sub-engine graphics setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern u8 data_021f5ee8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsResourceSet_Destroy(void *);
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void func_02070638(void *, s32, s32);
extern void func_020706c4(void *, s32, s32);
extern s32 func_02070874(void *);
extern void func_02070e0c(void *, s32, s32);
extern void func_02070eac(void *, s32, s32);
extern void func_02070f34(void *, s32);
extern void func_02072048(void *, s32, s32);
extern void *GraphicsSpriteRenderer_GetObjectPaletteAddress(void *);
extern void func_020925a4(s32, s32);
extern void func_020925dc(s32, s32);
extern void func_020925f8(void);
extern void func_02092618(void);
extern void func_02092638(s32, s32, s32, s32);
extern void func_02092688(s32, s32, s32, s32);
extern void func_020929f4(void *);
extern void func_02092a34(void *, s32);
extern void Presentation_BlendPalette16(s32, s32, s32);
extern void func_020afd0c(void *, s32, s32, s32, ...);
extern void func_020b1ff0(void *, s32, s32);
extern void func_020b2058(void *, s32, s32);
extern void func_020b44e8(void);
extern void func_ov046_0220c1d8(void *);
#ifdef __cplusplus
}
#endif

/*
 * Per-frame display callback. When scene flag 0x400 is enabled, it lets the
 * optional overlay-46 object at +0x35C program the main display or writes main
 * DISPCNT priority bits from +0x48 itself, always writes sub DISPCNT bits from
 * +0x4C, and commits render-control +0x378. Returns zero. This directly touches
 * Nintendo DS display MMIO and calls the SDK render commit.
 */
extern "C" s32 func_ov022_021fe310(void *scene)
{
    if ((FIELD(u32, scene, 0x20) & 0x400) != 0) {
        if (FIELD(void *, scene, 0x35c) != 0) {
            func_ov046_0220c1d8(FIELD(void *, scene, 0x35c));
        } else {
            volatile u32 *main_dispcnt = (volatile u32 *)0x04000000;
            *main_dispcnt = (*main_dispcnt & ~0x1f00U) |
                            (FIELD(u32, scene, 0x48) << 8);
        }
        volatile u32 *sub_dispcnt = (volatile u32 *)0x04001000;
        *sub_dispcnt = (*sub_dispcnt & ~0x1f00U) |
                       (FIELD(u32, scene, 0x4c) << 8);
        func_020929f4((u8 *)scene + 0x378);
    }
    return 0;
}

/*
 * Companion display/VBlank callback. With scene flag 0x400 set, it updates
 * render-control +0x378 with mode one while overlay-46 object +0x35C exists,
 * otherwise mode zero. Returns zero; SDK render state may change, with no
 * direct MMIO in this function.
 */
extern "C" s32 func_ov022_021fe380(void *scene)
{
    if ((FIELD(u32, scene, 0x20) & 0x400) != 0)
        func_02092a34((u8 *)scene + 0x378,
                      FIELD(void *, scene, 0x35c) != 0 ? 1 : 0);
    return 0;
}

/*
 * Establishes the base display configuration. It clears display-capture bit
 * 15, initializes main/sub background priorities at +0x48/+0x4C to 0x1C,
 * configures sub-engine BG control registers, applies BG ordering, mirrors
 * selected font/display descriptor halfwords, and programs sub blend control.
 * The scene and display SDK/MMIO state change; no value is returned.
 */
extern "C" void func_ov022_021fe3c0(void *scene)
{
    *(volatile u16 *)0x04000304 &= (u16)~0x8000;
    FIELD(s32, scene, 0x48) = 0x1c;
    func_020925a4(0, 0x1c);
    FIELD(s32, scene, 0x4c) = 0x1c;
    func_020925dc(0, 0x1c);
    volatile u16 *sub_bg = (volatile u16 *)0x0400100c;
    sub_bg[0] = (sub_bg[0] & 0x43) | 0x1e00;
    sub_bg[1] = (sub_bg[1] & 0x43) | 0x1e00;
    func_02092618();
    func_02092688(0, 1, 2, 3);
    void *descriptor = GraphicsSpriteRenderer_GetObjectPaletteAddress(data_020f4e14);
    FIELD(u16, descriptor, 6) = FIELD(u16, descriptor, 0x16);
    FIELD(u16, descriptor, 8) = FIELD(u16, descriptor, 0x1e);
    FIELD(u16, descriptor, 0xa) = 0x4210;
    FIELD(u16, descriptor, 0xc) = FIELD(u16, descriptor, 0x1e);
    func_020afd0c((void *)0x04001050, 4, 0x18, 8, 8);
}

/*
 * Initializes palette-transfer bookkeeping from graphics handle +0x374 and
 * loads resource triple 0xC006..0xC008. It transfers resource slots two to the
 * graphics engine, clears a 0x20-byte palette block at +0x368, then destroys
 * the temporary resource set. Scene palette fields +0x368..+0x370 and SDK
 * graphics state change; no direct MMIO or return value.
 */
extern "C" void func_ov022_021fe498(void *scene)
{
    s32 palette = func_02070874(FIELD(void *, scene, 0x374)) + 0x20;
    FIELD(s32, scene, 0x36c) = palette;
    FIELD(s32, scene, 0x368) = palette;
    FIELD(s32, scene, 0x370) = 0x10;
    Presentation_BlendPalette16(FIELD(s32, scene, 0x368),
                  FIELD(s32, scene, 0x36c), 0);
    u32 resources[3];
    GraphicsResourceSet_Init(resources);
    GraphicsResourceSet_Load(resources, data_020f4e18,
                             0xc006, 0xc007, 0xc008);
    func_020b44e8();
    func_020706c4((void *)resources[0], 2, 0);
    func_02070eac((void *)resources[2], 2, 0);
    func_020b1ff0((void *)FIELD(s32, scene, 0x368), 0, 0x20);
    GraphicsResourceSet_Destroy(resources);
}

/*
 * Loads the scene's main and sub background graphics. It programs BG ordering
 * and three main BG control halfwords, loads/transfers resource triples
 * 0x8038..0x803A and 0xC006..0xC008, sets main priority +0x48 to 0x1C,
 * programs main blend control, and copies 0x20 bytes into data_021F5EE8+0x100.
 * Graphics SDK state and display MMIO change; no value is returned.
 */
extern "C" void func_ov022_021fe544(void *scene)
{
    func_02092638(0, 1, 2, 3);
    volatile u16 *main_bg = (volatile u16 *)0x0400000a;
    main_bg[0] = (main_bg[0] & 0x43) | 0x3c00;
    main_bg[1] = (main_bg[1] & 0x43) | 0x1e10;
    main_bg[2] = (main_bg[2] & 0x43) | 0x1e10;
    func_020925f8();
    u32 resources[3];
    GraphicsResourceSet_Init(resources);
    GraphicsResourceSet_Load(resources, data_020f4e18,
                             0x8038, 0x8039, 0x803a);
    func_020b44e8();
    func_02072048(resources, 1, 0);
    FIELD(s32, scene, 0x48) = 0x1c;
    func_020afd0c((void *)0x04000050, 4, 8, 8, 8);
    GraphicsResourceSet_Load(resources, data_020f4e18,
                             0xc006, 0xc007, 0xc008);
    func_02070f34((void *)resources[2], 8);
    func_020b44e8();
    func_02070638((void *)resources[0], 2, 0);
    func_02070e0c((void *)resources[2], 2, 0);
    func_020b2058(data_021f5ee8, 0x100, 0x20);
    GraphicsResourceSet_Destroy(resources);
}

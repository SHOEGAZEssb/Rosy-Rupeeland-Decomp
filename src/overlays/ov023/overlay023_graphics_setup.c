#include "tingle/types.h"

/* Overlay 23 VBlank render callbacks and initial engine/resource configuration. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void func_02070638(void *, s32, s32);
extern void func_020706c4(void *, s32, s32);
extern void *GraphicsBgResourceData_GetDecoded(void *);
extern void func_02070e0c(void *, s32, s32);
extern void func_02070eac(void *, s32, s32);
extern void func_02070f34(void *, s32);
extern void func_02072048(void *, s32, s32);
extern void *GraphicsSpriteRenderer_GetObjectPaletteAddress(void *);
extern void func_020925a4(s32);
extern void func_020925dc(s32);
extern void func_020925f8(void);
extern void func_02092618(void);
extern void func_02092638(s32, s32, s32, s32);
extern void func_02092688(s32, s32, s32, s32);
extern void func_020929f4(void *);
extern void func_02092a34(void *, s32);
extern void func_020b1ff0(void *, s32, s32);
extern void func_020b2058(void *, s32, s32);
extern void func_020b44e8(void);
#ifdef __cplusplus
}
#endif

/*
 * VBlank render callback. When scene flag 0x400 is set, it copies +0x48/+0x4C
 * into main/sub DISPCNT display-mode bits 8..12 and commits transition object
 * +0x4C4. It always returns zero. Engine MMIO and graphics state may change.
 */
extern "C" s32 func_ov023_021fe0e0(void *scene)
{
    if (FIELD(u32, scene, 0x20) & 0x400) {
        volatile u32 *main_dispcnt = (volatile u32 *)0x04000000;
        volatile u32 *sub_dispcnt = (volatile u32 *)0x04001000;
        *main_dispcnt = (*main_dispcnt & ~0x1f00u) |
                        (FIELD(u32, scene, 0x48) << 8);
        *sub_dispcnt = (*sub_dispcnt & ~0x1f00u) |
                       (FIELD(u32, scene, 0x4c) << 8);
        func_020929f4((u8 *)scene + 0x4c4);
    }
    return 0;
}

/*
 * Companion render callback. With scene flag 0x400 set it updates transition
 * object +0x4C4 with argument zero; otherwise it is inert. Returns zero and
 * may change graphics transition state.
 */
extern "C" s32 func_ov023_021fe138(void *scene)
{
    if (FIELD(u32, scene, 0x20) & 0x400)
        func_02092a34((u8 *)scene + 0x4c4, 0);
    return 0;
}

/*
 * Configures both DS display engines: clears the power-control high bit,
 * selects main/sub BG modes and layer ordering, stores display modes 30/28 at
 * scene +0x48/+0x4C, and rewrites the shared font renderer's BG-control
 * halfwords. Engine MMIO and font/graphics state change; no value is returned.
 */
extern "C" void func_ov023_021fe164(void *scene)
{
    *(volatile u16 *)0x04000304 &= (u16)~0x8000;
    FIELD(s32, scene, 0x48) = 30;
    func_020925a4(0);
    volatile u16 *main_bg = (volatile u16 *)0x0400000a;
    main_bg[0] = (main_bg[0] & 0x43) | 0x3c00;
    main_bg[1] = (main_bg[1] & 0x43) | 0x1e10;
    main_bg[2] = (main_bg[2] & 0x43) | 0x1e10;
    func_020925f8();
    func_02092638(0, 1, 2, 3);
    FIELD(s32, scene, 0x4c) = 28;
    func_020925dc(0);
    volatile u16 *sub_bg = (volatile u16 *)0x0400100c;
    sub_bg[0] = (sub_bg[0] & 0x43) | 0x1e00;
    sub_bg[1] = (sub_bg[1] & 0x43) | 0x1e00;
    func_02092618();
    func_02092688(0, 1, 2, 3);
    u8 *font = (u8 *)GraphicsSpriteRenderer_GetObjectPaletteAddress(data_020f4e14);
    FIELD(u16, font, 6) = FIELD(u16, font, 0xe);
    FIELD(u16, font, 8) = FIELD(u16, font, 0x1e);
    FIELD(u16, font, 0xa) = 0x4210;
    FIELD(u16, font, 0xc) = FIELD(u16, font, 0x1e);
}

/*
 * Loads graphics resource IDs 0x8038/0x8039 with selector 0x803C from the
 * shared graphics archive, synchronizes, installs slot 1, and destroys the
 * temporary resource set. Graphics/VRAM state changes; returns void.
 */
extern "C" void func_ov023_021fe270(void *scene)
{
    (void)scene;
    void *set[3];
    GraphicsResourceSet_Init(set);
    GraphicsResourceSet_Load(set, data_020f4e18, 0x8038, 0x8039, 0x803c);
    func_020b44e8();
    func_02072048(set, 1, 0);
    GraphicsResourceSet_Destroy(set);
}

/*
 * Loads resource IDs 0xC006/0xC007/0xC008, uploads their main/sub components
 * to slot 2, sets an eight-unit parameter, clears and uploads the palette area
 * at resource handle +0x4C0, then destroys the temporary set. Graphics/VRAM
 * and palette state change; no value is returned.
 */
extern "C" void func_ov023_021fe2cc(void *scene)
{
    void *set[3];
    GraphicsResourceSet_Init(set);
    GraphicsResourceSet_Load(set, data_020f4e18, 0xc006, 0xc007, 0xc008);
    func_020b44e8();
    func_020706c4(set[0], 2, 0);
    func_02070eac(set[2], 2, 0);
    func_02070f34(set[2], 8);
    func_020b44e8();
    func_02070638(set[0], 2, 0);
    func_02070e0c(set[2], 2, 0);
    u8 *palette = (u8 *)GraphicsBgResourceData_GetDecoded(FIELD(void *, scene, 0x4c0)) + 0x40;
    func_020b1ff0(palette, 0, 0x20);
    func_020b2058(palette, 0x100, 0x20);
    GraphicsResourceSet_Destroy(set);
}

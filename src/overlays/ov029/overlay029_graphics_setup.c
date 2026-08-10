#include "tingle/types.h"

/* Overlay 29 dual-engine display setup and temporary graphics-resource upload. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14[];
extern void *data_020f4e18[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void func_02070638(void *, s32, s32);
extern void func_020706c4(void *, s32, s32);
extern void *func_02070874(void *);
extern void func_02070e0c(void *, s32, s32);
extern void func_02070eac(void *, s32, s32);
extern void *GraphicsSpriteRenderer_GetObjectPaletteAddress(void *);
extern void func_020925a4(s32, s32);
extern void func_020925dc(s32);
extern void func_020925f8(void);
extern void func_02092618(void);
extern void func_02092638(s32, s32, s32, s32);
extern void func_02092688(s32, s32, s32, s32);
extern void func_020b1ff0(void *, s32, s32);
extern void func_020b2058(void *, s32, s32);
extern void func_020b44e8(void);
#ifdef __cplusplus
}
#endif

/*
 * Configures both display engines. It disables bit 15 at 0x04000304, sets
 * scene main/sub display fields +0x48/+0x4C to 28, programs main BG0..BG3
 * controls at 0x04000008..0x0E and sub BG2/BG3 controls at 0x0400100C/0E,
 * installs layer orders 0..3, and updates primary font state by copying its
 * recovered halfwords and writing constant 0x4210. Returns void; graphics SDK
 * state and Nintendo DS display MMIO change.
 */
extern "C" void func_ov029_021fd464(void *state)
{
    *(volatile u16 *)0x04000304 &= (u16)~0x8000;
    FIELD(s32, state, 0x48) = 0x1c;
    func_020925a4(0, 0x1c);
    volatile u16 *mainBg = (volatile u16 *)0x04000008;
    mainBg[0] = (mainBg[0] & 0x43) | 0x3c00;
    mainBg[1] = (mainBg[1] & 0x43) | 0x3e00;
    mainBg[2] = (mainBg[2] & 0x43) | 0x1e00;
    mainBg[3] = (mainBg[3] & 0x43) | 0x1e00;
    func_020925f8();
    func_02092638(0, 1, 2, 3);
    FIELD(s32, state, 0x4c) = 0x1c;
    func_020925dc(0);
    volatile u16 *subBg = (volatile u16 *)0x0400100c;
    subBg[0] = (subBg[0] & 0x43) | 0x1e00;
    subBg[1] = (subBg[1] & 0x43) | 0x1e00;
    func_02092618();
    func_02092688(0, 1, 2, 3);
    u16 *font = (u16 *)GraphicsSpriteRenderer_GetObjectPaletteAddress(data_020f4e14[0]);
    font[3] = font[11];
    font[4] = font[15];
    font[5] = 0x4210;
    font[6] = font[15];
}

/*
 * Initializes a temporary resource set, loads IDs 0xC006..0xC008, and publishes
 * it. Palette data from scene resource +0xE8 (offset +0x20) becomes +0xD4/+0xD8
 * with count +0xDC=16 and is copied to both main and sub destinations. The
 * loaded graphics resources are installed with mode 2 before destruction.
 * Returns void; graphics/palette SDK state changes without direct MMIO.
 */
extern "C" void func_ov029_021fd578(void *state)
{
    u32 resources[3];
    GraphicsResourceSet_Init(resources);
    GraphicsResourceSet_Load(resources, data_020f4e18[0],
                             0xc006, 0xc007, 0xc008);
    func_020b44e8();
    void *palette = (u8 *)func_02070874(FIELD(void *, state, 0xe8)) + 0x20;
    FIELD(void *, state, 0xd4) = palette;
    FIELD(void *, state, 0xd8) = palette;
    FIELD(s32, state, 0xdc) = 0x10;
    func_02070638((void *)resources[0], 2, 0);
    func_02070e0c((void *)resources[2], 2, 0);
    func_020b2058(palette, 0, 0x20);
    func_020706c4((void *)resources[0], 2, 0);
    func_02070eac((void *)resources[2], 2, 0);
    func_020b1ff0(palette, 0, 0x20);
    GraphicsResourceSet_Destroy(resources);
}

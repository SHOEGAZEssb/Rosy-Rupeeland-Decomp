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
extern void func_02070638(void *, s32, s32);
extern void func_020706c4(void *, s32, s32);
extern void *func_02070874(void *);
extern void func_02070e0c(void *, s32, s32);
extern void func_02070eac(void *, s32, s32);
extern void func_02070f34(void *, s32);
extern void func_02070f80(void *, s32);
extern void func_02072048(void *, s32, s32);
extern void *func_020755e0(void *);
extern void func_020925a4(s32);
extern void func_020925dc(s32);
extern void func_020925f8(void);
extern void func_02092618(void);
extern void func_02092638(s32, s32, s32, s32);
extern void func_02092688(s32, s32, s32, s32);
extern void func_020afd0c(void *, s32, s32, s32, s32);
extern void func_020b1ff0(void *, s32, s32);
extern void func_020b2058(void *, s32, s32);
extern void func_020b44e8(void);
#ifdef __cplusplus
}
#endif

/*
 * Configures both display engines with BG0/BG1/BG2 modes and layer ordering,
 * stores sub display mode 18 at scene +0x4C, and uploads resource triplets
 * 0x8030..32, 0xA138..3A, and 0xC006..08. It configures palette bank 8,
 * clears a 32-byte palette region, and rewrites shared font-renderer BG fields
 * +6/+8/+A/+C. Engine MMIO, font, resource, VRAM, and palette state change.
 */
extern "C" void func_ov025_021ffdfc(void *scene)
{
    *(volatile u16 *)0x04000304 &= (u16)~0x8000;
    func_020925a4(0);
    volatile u16 *main_bg = (volatile u16 *)0x0400000a;
    main_bg[0] = (main_bg[0] & 0x43) | 0x3a00;
    main_bg[1] = (main_bg[1] & 0x43) | 0x1e10;
    main_bg[2] = (main_bg[2] & 0x43) | 0x1e10;
    func_020925f8();
    func_02092638(0, 0, 2, 3);
    FIELD(s32, scene, 0x4c) = 18;
    func_020925dc(0);
    volatile u16 *sub_bg = (volatile u16 *)0x0400100a;
    sub_bg[0] = (sub_bg[0] & 0x43) | 0x3a00;
    sub_bg[1] = (sub_bg[1] & 0x43) | 0x1e10;
    sub_bg[2] = (sub_bg[2] & 0x43) | 0x1e10;
    func_02092618();
    func_02092688(0, 3, 2, 3);

    void *set[3];
    GraphicsResourceSet_Init(set);
    GraphicsResourceSet_Load(set, data_020f4e18, 0x8030, 0x8031, 0x8032);
    func_020b44e8();
    func_02072048(set, 1, 0);
    GraphicsResourceSet_Load(set, data_020f4e18, 0xa138, 0xa139, 0xa13a);
    func_02070f80(set[2], 8);
    func_020b44e8();
    GraphicsResourceSet_Apply(set, 1, 0x100);
    GraphicsResourceSet_Load(set, data_020f4e18, 0xc006, 0xc007, 0xc008);
    func_020b44e8();
    func_020706c4(set[0], 2, 0);
    func_02070eac(set[2], 2, 0);
    func_020b1ff0((u8 *)func_02070874(set[1]) + 0xa0, 0, 0x20);
    u8 *font = (u8 *)func_020755e0(data_020f4e14);
    FIELD(u16, font, 6) = FIELD(u16, font, 0x1c);
    FIELD(u16, font, 8) = 0x31f;
    FIELD(u16, font, 0xa) = FIELD(u16, font, 0x1c);
    FIELD(u16, font, 0xc) = 0x215;
    GraphicsResourceSet_Destroy(set);
}

/*
 * Sets scene display modes +0x48/+0x4C to 24/18, loads triplet
 * 0xA13B..0xA13D, selects palette bank 8, installs it in slot 3 with offset
 * 0x100, and clears both blend registers. Graphics/VRAM/MMIO state changes.
 */
extern "C" void func_ov025_02200014(void *scene)
{
    FIELD(s32, scene, 0x48) = 24;
    FIELD(s32, scene, 0x4c) = 18;
    void *set[3];
    GraphicsResourceSet_Init(set);
    GraphicsResourceSet_Load(set, data_020f4e18, 0xa13b, 0xa13c, 0xa13d);
    func_02070f80(set[2], 8);
    func_020b44e8();
    func_02072048(set, 3, 0x100);
    *(volatile u16 *)0x04000050 = 0;
    *(volatile u16 *)0x04001050 = 0;
    GraphicsResourceSet_Destroy(set);
}

/*
 * Sets both display modes to 28, loads 0xC006..0xC008, selects palette bank 8,
 * uploads character/map data to slot 2, copies a 32-byte palette block at
 * offset 0xA0 to destination 0x100, and configures identical 4/24/8 blend
 * parameters on both engines. Graphics, palette, and MMIO state change.
 */
extern "C" void func_ov025_022000a4(void *scene)
{
    FIELD(s32, scene, 0x48) = 28;
    FIELD(s32, scene, 0x4c) = 28;
    void *set[3];
    GraphicsResourceSet_Init(set);
    GraphicsResourceSet_Load(set, data_020f4e18, 0xc006, 0xc007, 0xc008);
    func_02070f34(set[2], 8);
    func_020b44e8();
    func_02070638(set[0], 2, 0);
    func_02070e0c(set[2], 2, 0);
    func_020b2058((u8 *)func_02070874(set[1]) + 0xa0, 0x100, 0x20);
    func_020afd0c((void *)0x04000050, 4, 24, 8, 8);
    func_020afd0c((void *)0x04001050, 4, 24, 8, 8);
    GraphicsResourceSet_Destroy(set);
}

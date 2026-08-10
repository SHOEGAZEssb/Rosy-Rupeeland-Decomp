#include "tingle/types.h"

/*
 * Overlay 41 graphics and controller lifecycle. These recovered routines
 * configure both 2D engines, load mode-specific graphics resources, initialize
 * scroll/controller state, write BG control words, and release owned objects.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020ae9a4(void);
extern void func_020ae90c(void);
extern void func_020ae284(s32, s32, s32);
extern void func_020af478(s32);
extern void func_020ae6dc(void);
extern void func_02075238(void *);
extern void GraphicsSpriteRenderer_HideAllSprites(void *);
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Destroy(void *);
extern void func_02071f80(void *);
extern void func_02071f94(void *);
extern void func_02071fa8(void *, void *, s32, s32, s32);
extern void func_02072000(void *);
extern void func_020b44e8(void);
extern void *func_0207043c(void);
extern void *func_02070874(void *);
extern void *func_02070888(void *);
extern void func_020b1924(void *, s32, void *);
extern void func_020b2058(void *, s32, void *);
extern void func_02070f80(void *, s32);
extern void func_020050a4(void *, const void *);
extern void func_02005058(void *);
extern void func_02099fb0(void *);
extern void func_02003e2c(void *);
extern void GraphicsSpriteGroupOwner_DestroyGroup(void *, void *);
extern void func_02075020(void *);
void func_ov041_021fdd04(s32, s32, s32, s32, s32);
void func_ov041_021fdd38(s32, s32, s32, s32);
extern void func_ov041_021fe088(void *, s32, s32);
extern void func_ov041_021fe498(void *);
extern void func_ov041_021fdeb4(void *);
extern void func_ov041_021ff530(void *);
extern void func_ov041_022012f4(void *);
extern void func_ov070_02210238(void *);
extern void func_ov070_022102e0(void *, s32, s32);
extern void func_ov041_02200970(void *, s32);
extern void GX_DispOn(void);
extern void *data_020f4e18;
extern void *data_020f4e14;
extern void *data_020f4dc8;
extern const s32 data_ov041_02204d00[];
#ifdef __cplusplus
}
#endif

/* Write main BG1 control from five unpacked fields. */
extern "C" void func_ov041_021fdd04(s32 priority, s32 mosaic, s32 screenBase,
                                      s32 colorMode, s32 wrap)
{
    volatile u16 *reg = (volatile u16 *)0x0400000a;
    *reg = (*reg & 0x43) | (u16)(priority << 14) | (u16)(mosaic << 7) |
           (u16)(screenBase << 8) | (u16)(colorMode << 2) | (u16)(wrap << 13);
}

/* Write main BG3 control from four unpacked fields. */
extern "C" void func_ov041_021fdd38(s32 priority, s32 mosaic, s32 screenBase,
                                      s32 colorMode)
{
    volatile u16 *reg = (volatile u16 *)0x0400000e;
    *reg = (*reg & 0x43) | (u16)(priority << 14) | (u16)(mosaic << 7) |
           (u16)(screenBase << 8) | (u16)(colorMode << 2);
}

static void load_set(void *destination, s32 last)
{
    func_02071fa8(destination, data_020f4e18, last - 2, last - 1, last);
}

/*
 * Initialize graphics for controller `owner`. Mode at +0x1F4 selects resource
 * families ending at A080/A088/A08B/A08E/A091/A0A0..A0A6, A0AE..A0B6, or
 * A0BE..A0CC. Confirmed effects include BG registers and palette memory,
 * resource arrays +0x48..+0x14C, scroll bounds +0x168..+0x1B4, child setup,
 * display enable, and graphics-manager calls. Returns no value. The exact
 * fallback preserves the exhaustive mode-specific load order.
 */
extern "C" void func_ov041_021fd01c(void *owner)
{
    s32 temporary[3];
    s32 mode = FIELD(s32, owner, 0x1f4);
    func_020ae9a4();
    func_020ae90c();
    func_020ae284(1, 0, 1);
    func_020af478(0x10);
    func_ov041_021fdd04(0, 0, 0x1c, 0, 0);
    *(volatile u16 *)0x0400000a = (*(volatile u16 *)0x0400000a & (u16)~3) | 2;
    *(volatile u32 *)0x04000014 = 0;
    *(volatile u16 *)0x0400000c = (*(volatile u16 *)0x0400000c & 0x43) | 0x1d00 | 1;
    *(volatile u32 *)0x0400001c = 0;
    func_ov041_021fdd38(1, 0, 0x1e, 0);
    *(volatile u16 *)0x0400000e &= (u16)~3;
    *(volatile u32 *)0x0400001c = 0;
    *(volatile u16 *)0x05000000 = 0;
    *(volatile u16 *)0x05000400 = 0;
    func_02075238(data_020f4e14);
    GraphicsSpriteRenderer_HideAllSprites(data_020f4e14);
    func_020ae6dc();
    func_02071f80(temporary);
    FIELD(s32, owner, 0x44) = 0x1f;

    s32 baseLast = mode == 0 ? 0xa080 : mode == 1 ? 0xa0ae : 0xa0be;
    s32 secondaryLast = mode == 0 ? 0xa088 : mode == 1 ? 0xa0b3 : 0xa0c6;
    load_set((u8 *)owner + 0x48, baseLast);
    func_020b44e8();
    func_020b1924((u8 *)FIELD(void *, owner, 0x48) + 0x24, 0, func_0207043c());
    func_020b44e8();
    func_020b2058(func_02070874(FIELD(void *, owner, 0x4c)), 0,
                  func_02070888(FIELD(void *, owner, 0x4c)));
    func_020b44e8();
    load_set((u8 *)owner + 0x54, secondaryLast);
    func_020b44e8();
    func_020b1924((u8 *)FIELD(void *, owner, 0x54) + 0x24, 0x8000, func_0207043c());
    func_020b44e8();
    func_020b2058(func_02070874(FIELD(void *, owner, 0x58)), 0x100,
                  func_02070888(FIELD(void *, owner, 0x58)));
    func_020b44e8();
    func_02070f80(FIELD(void *, owner, 0x5c), 8);

    if (mode == 0 || mode == 2) {
        FIELD(s32, owner, 0x168) = FIELD(s32, FIELD(void *, owner, 0x48), 0x24) - 0x24;
        func_ov041_021fe088(owner, 1, mode == 0 ? 0x3c : 0x1e);
        func_ov041_021fe088(owner, 2, mode == 0 ? 0x78 : 0x5a);
        load_set(temporary, baseLast);
        func_020b44e8();
        func_020b2058(func_02070874((void *)temporary[1]), 0,
                      func_02070888((void *)temporary[1]));
        func_020b44e8();
        func_02072000(temporary);
    }

    /* The retail sequence fills fourteen consecutive resource sets here. */
    const s32 *ids = data_ov041_02204d00 + (mode == 0 ? 0 : mode == 1 ? 32 : 64);
    for (s32 index = 0; index < 14; index++)
        load_set((u8 *)owner + 0x9c + index * 0x0c, ids[index]);
    func_020b44e8();

    FIELD(s32, owner, 0x174) = mode == 2 ? 0x1e : 0x5a;
    s32 extent = mode == 1 ? 0x5dc : FIELD(s32, owner, 0x174) * 0x60 - 0x15e;
    if (mode == 0 || mode == 2) {
        func_ov070_022102e0(FIELD(void *, owner, 8), extent, extent);
        func_ov041_02200970(FIELD(void *, owner, 0x14), extent);
    } else func_ov070_022102e0(FIELD(void *, owner, 8), 0xf0, 0x5dc);
    FIELD(s32, owner, 0x178) = extent >> 4;
    FIELD(s32, owner, 0x190) = FIELD(void *, owner, 0x0c) ? -0x4e000 : 0;
    FIELD(s32, owner, 0x194) = extent << 12;
    func_020050a4((u8 *)owner + 0x19c, (u8 *)owner + 0x18c);
    FIELD(s32, owner, 0x1ac) = 0x19a;
    FIELD(s32, owner, 0x1b0) = FIELD(s32, owner, 0x194);
    FIELD(s32, owner, 0x1b4) = 0;
    FIELD(s32, owner, 0x180) = FIELD(s32, owner, 0x184) = FIELD(s32, owner, 0x188) = 0;
    func_ov041_021fe498(owner);
    GX_DispOn();
    *(volatile u32 *)0x04001000 |= 0x10000;
    func_02071f94(temporary);
}

/*
 * Tear down controller and all four optional owned children, release shared
 * contexts, destroy the embedded resource arrays in reverse ownership order,
 * and destroy vectors +0x19C/+0x18C/+0x2C/+0x1C. Returns `owner`; heap,
 * resource, renderer, and graphics-manager state change.
 */
extern "C" void *func_ov041_021fdd64(void *owner, s32, s32, s32)
{
    func_ov041_021fdeb4(owner);
    if (FIELD(void *, owner, 0x14)) { func_02099fb0(FIELD(void *, owner, 0x14)); func_02003e2c(FIELD(void *, owner, 0x14)); FIELD(void *, owner, 0x14)=0; }
    if (FIELD(void *, owner, 0x10)) { func_ov041_021ff530(FIELD(void *, owner, 0x10)); func_02003e2c(FIELD(void *, owner, 0x10)); FIELD(void *, owner, 0x10)=0; }
    if (FIELD(void *, owner, 0x0c)) { func_ov041_022012f4(FIELD(void *, owner, 0x0c)); func_02003e2c(FIELD(void *, owner, 0x0c)); FIELD(void *, owner, 0x0c)=0; }
    if (FIELD(void *, owner, 8)) { func_ov070_02210238(FIELD(void *, owner, 8)); func_02003e2c(FIELD(void *, owner, 8)); FIELD(void *, owner, 8)=0; }
    GraphicsSpriteGroupOwner_DestroyGroup(data_020f4e14, FIELD(void *, owner, 0));
    func_02075020(data_020f4dc8);
    func_02005058((u8 *)owner + 0x19c);
    func_02005058((u8 *)owner + 0x18c);
    for (s32 index=9; index>=0; index--) GraphicsResourceSet_Destroy((u8 *)owner+0xf0+index*0x0c);
    for (s32 index=7; index>=0; index--) GraphicsResourceSet_Destroy((u8 *)owner+0x90+index*0x0c);
    for (s32 index=5; index>=0; index--) GraphicsResourceSet_Destroy((u8 *)owner+0x48+index*0x0c);
    func_02005058((u8 *)owner + 0x2c);
    func_02005058((u8 *)owner + 0x1c);
    return owner;
}

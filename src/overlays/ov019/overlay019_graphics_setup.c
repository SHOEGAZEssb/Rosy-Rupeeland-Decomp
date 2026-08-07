#include "tingle/types.h"

/* Overlay 19 mode-dependent main/sub graphics resource and background setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsResourceSet_Apply(void *, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void func_02070e0c(void *, s32, s32);
extern void func_02070eac(void *, s32, s32);
extern void func_02072048(void *, s32, s32);
extern void func_020925a4(s32);
extern void func_020925dc(s32);
extern void func_020925f8(void);
extern void func_02092618(void);
extern void func_02092638(s32, s32, s32, s32);
extern void func_02092688(s32, s32, s32, s32);
extern void func_020926d8(void *);
extern void func_020926f8(void *);
extern void func_02092754(void *, s32);
extern void *func_02092790(void *, s32);
extern void func_02092850(s32);
extern void func_0209285c(s32);
extern void func_020aea7c(s32);
extern void func_020b44e8(void);
extern void func_ov019_021fd154(s32);
#ifdef __cplusplus
}
#endif

/*
 * Load temporary graphics set 0xA06D..0xA06F and manager resource 0xA070.
 * When mode +0x58 is null, route LCDs with selector zero, store layer value
 * 0x13 at +0x48, configure main BG control 0/1 to 0x3800/0x3A00 while preserving
 * bits 0,1,6, and apply/upload through the main-engine helpers. For nonnull mode,
 * route with selector one, store 0x13 at +0x4C, configure the corresponding sub
 * BG registers, set auxiliary value 0x80, and use sub-engine helpers. Destroy
 * both temporary resource objects and return void. Graphics/SDK state changes;
 * POWCNT1 and main/sub BG control MMIO are directly modified.
 */
extern "C" void func_ov019_021fcfbc(void *state)
{
    u8 resources[12];
    u8 manager[0x44];

    GraphicsResourceSet_Init(resources);
    func_020926d8(manager);
    GraphicsResourceSet_Load(resources, data_020f4e18[0],
                             0xa06d, 0xa06e, 0xa06f);
    func_02092754(manager, 0xa070);
    func_020b44e8();

    if (FIELD(void *, state, 0x58) == 0) {
        volatile u16 *background = (volatile u16 *)0x04000008;
        func_ov019_021fd154(0);
        FIELD(s32, state, 0x48) = 0x13;
        func_020925a4(0);
        background[0] = (background[0] & 0x43) | 0x3800;
        background[1] = (background[1] & 0x43) | 0x3a00;
        func_020925f8();
        func_02092638(0, 1, 2, 3);
        func_02072048(resources, 0, 0);
        func_02070e0c(func_02092790(manager, 0), 1, 0);
        func_02092850(0);
    } else {
        volatile u16 *background = (volatile u16 *)0x04001008;
        func_ov019_021fd154(1);
        FIELD(s32, state, 0x4c) = 0x13;
        func_020925dc(0);
        func_020aea7c(0x80);
        background[0] = (background[0] & 0x43) | 0x3800;
        background[1] = (background[1] & 0x43) | 0x3a00;
        func_02092618();
        func_02092688(0, 1, 2, 3);
        GraphicsResourceSet_Apply(resources, 0, 0);
        func_02070eac(func_02092790(manager, 0), 1, 0);
        func_0209285c(0);
    }
    func_020926f8(manager);
    GraphicsResourceSet_Destroy(resources);
}

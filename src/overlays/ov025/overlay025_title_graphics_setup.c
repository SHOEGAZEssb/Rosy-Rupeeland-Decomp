#include "tingle/types.h"

/* Overlay 25 title and alternate dual-screen background resource setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void func_02070638(void *, s32, s32);
extern void *GraphicsBgResourceData_GetDecoded(void *);
extern void func_02070e0c(void *, s32, s32);
extern void func_02070f34(void *, s32);
extern void func_02070f80(void *, s32);
extern void func_02072048(void *, s32, s32);
extern void func_020afd0c(void *, s32, s32, s32, s32);
extern void func_020b2058(void *, s32, s32);
extern void func_020b44e8(void);
#ifdef __cplusplus
}
#endif

/*
 * Sets scene display modes +0x48/+0x4C to 24/18, loads the bgLibKatsu
 * bg_ttl_down triplet 0xA13B..0xA13D, selects palette bank 8, installs it in
 * slot 3 with offset 0x100, and clears both blend registers. Graphics, VRAM,
 * and MMIO state change.
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
 * Sets both display modes to 28, loads the bgLibKatsu bg_effeDark triplet
 * 0xC006..0xC008, selects palette bank 8, uploads character/map data to slot
 * 2, copies a 32-byte palette block at offset 0xA0 to destination 0x100, and
 * configures identical 4/24/8 blend parameters on both engines. Graphics,
 * palette, and MMIO state change.
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
    func_020b2058((u8 *)GraphicsBgResourceData_GetDecoded(set[1]) + 0xa0, 0x100, 0x20);
    func_020afd0c((void *)0x04000050, 4, 24, 8, 8);
    func_020afd0c((void *)0x04001050, 4, 24, 8, 8);
    GraphicsResourceSet_Destroy(set);
}

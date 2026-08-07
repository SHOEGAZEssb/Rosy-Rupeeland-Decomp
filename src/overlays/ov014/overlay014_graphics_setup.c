#include "tingle/types.h"

/* Overlay 14 dual-screen background and graphics-resource initialization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay014ResourceSet { u32 words[3]; } Overlay014ResourceSet;

extern void *data_020f4e14;
extern void *gDebugFont;
extern void *data_020f4e18;
#ifdef __cplusplus
extern "C" {
#endif
extern void func_020755bc(void *);
extern void *func_020755e0(void *);
extern void func_020925a4(s32);
extern void func_020925f8(void);
extern void func_02092638(s32, s32, s32, s32);
extern void func_020925dc(s32);
extern void func_02092618(void);
extern void func_02092688(s32, s32, s32, s32);
extern void GraphicsResourceSet_Init(Overlay014ResourceSet *);
extern void GraphicsResourceSet_Load(Overlay014ResourceSet *, void *, s32, s32, s32);
extern void GraphicsResourceSet_Apply(Overlay014ResourceSet *, s32, s32);
extern void GraphicsResourceSet_Destroy(Overlay014ResourceSet *);
extern void func_02070f80(void *, s32);
extern void func_020b44e8(void);
extern void func_02072048(Overlay014ResourceSet *, s32, s32);
extern void func_020706c4(void *, s32, s32);
extern void func_02070bc4(void *, s32);
extern void func_02070eac(void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Clear the normal/debug graphics managers, disable power-control bit 15,
 * configure main display mask +0x48 to 0x14 and sub display mask +0x4C to 0x19,
 * program main/sub BG control and scroll registers, and assign layer priorities.
 * Load resource triples B003/B004/B006 and three 0x8000-series triples through
 * temporary resource sets, apply them to BG layers, synchronize manager fields
 * +0x0A/+0x0C, then destroy the temporary sets. Return void. All fixed IDs,
 * manager calls, and MMIO changes are confirmed Nintendo DS graphics effects;
 * exact resource contents remain unknown.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov014_021fd07c(void *state)
{
    Overlay014ResourceSet first, second, third;
    volatile u16 *power = (volatile u16 *)0x04000304;
    volatile u16 *mainBg = (volatile u16 *)0x0400000a;
    volatile u32 *mainScroll = (volatile u32 *)0x04000018;
    volatile u16 *subBg = (volatile u16 *)0x04001008;
    void *mainManager;
    void *debugManager;

    func_020755bc(data_020f4e14);
    func_020755bc(gDebugFont);
    *power &= (u16)~0x8000;
    FIELD(s32, state, 0x48) = 0x14;
    func_020925a4(0);
    mainBg[0] = (mainBg[0] & 0x43) | 0x3a00;
    mainBg[1] = (mainBg[1] & 0x43) | 0x1c00;
    func_020925f8();
    *mainScroll = 0x200000;
    func_02092638(0, 1, 2, 3);

    FIELD(s32, state, 0x4c) = 0x19;
    func_020925dc(0);
    subBg[0] = (subBg[0] & 0x43) | 0x3800;
    subBg[1] = (subBg[1] & 0x43) | 0x3a00;
    subBg[3] = (subBg[3] & 0x43) | 0x1e10;
    func_02092618();
    func_02092688(0, 1, 2, 3);

    GraphicsResourceSet_Init(&first);
    GraphicsResourceSet_Init(&second);
    GraphicsResourceSet_Init(&third);
    GraphicsResourceSet_Load(&first, data_020f4e18, 0xb003, 0xb004, 0xb006);
    func_02070f80((void *)first.words[2], 8);
    func_020b44e8();
    GraphicsResourceSet_Apply(&first, 3, 0x100);
    GraphicsResourceSet_Load(&first, data_020f4e18, 0x8008, 0x8009, 0x800a);
    GraphicsResourceSet_Load(&second, data_020f4e18, 0x8008, 0x8009, 0x800f);
    GraphicsResourceSet_Load(&third, data_020f4e18, 0x8008, 0x8009, 0x800c);
    func_020b44e8();
    func_02072048(&first, 2, 0);
    func_020706c4((void *)first.words[0], 0, 0);
    func_02070bc4((void *)first.words[1], 0);
    func_02070eac((void *)second.words[2], 0, 0);
    func_02070eac((void *)third.words[2], 1, 0);

    mainManager = func_020755e0(data_020f4e14);
    debugManager = func_020755e0(gDebugFont);
    FIELD(u16, debugManager, 0x0a) = 0x4210;
    FIELD(u16, mainManager, 0x0a) = FIELD(u16, debugManager, 0x0a);
    FIELD(u16, debugManager, 0x0c) = FIELD(u16, mainManager, 0x1e);
    FIELD(u16, mainManager, 0x0c) = FIELD(u16, mainManager, 0x1e);
    GraphicsResourceSet_Destroy(&third);
    GraphicsResourceSet_Destroy(&second);
    GraphicsResourceSet_Destroy(&first);
}

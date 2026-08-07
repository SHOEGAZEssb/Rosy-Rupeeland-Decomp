#include "tingle/types.h"

/* Overlay 16 dual-screen graphics, resource-set, font, and blending initialization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
typedef struct Overlay016ResourceSet { u32 words[3]; } Overlay016ResourceSet;
typedef struct Overlay016GraphicsManager { u32 words[17]; } Overlay016GraphicsManager;

extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsResourceSet_Apply(Overlay016ResourceSet *, s32, s32);
extern void GraphicsResourceSet_Destroy(Overlay016ResourceSet *);
extern void GraphicsResourceSet_Init(Overlay016ResourceSet *);
extern void GraphicsResourceSet_Load(Overlay016ResourceSet *, void *, s32, s32, s32);
extern void func_02070eac(void *, s32, s32);
extern void func_02070f80(void *, s32);
extern void *func_020755e0(void *);
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
extern void func_020afd0c(void *, s32, s32, s32, s32);
extern void func_020b44e8(void);
extern void func_ov016_021ff04c(s32);
extern void func_ov016_021ff068(s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Configure both display engines for overlay 16. Disable power-control bit 15,
 * set layer masks +0x48/+0x4C to 0x10/0x1D, program main BG0-2 and BG3 plus sub
 * BG0-3 control registers, and set priorities 0-3. Load/apply resource triples
 * 0x8004-0x8006 and 0x8012/0x8013/0x8018. A temporary graphics manager registers
 * 0x801E for mode +0x54==2 or 0x8014 otherwise, plus 0x8015, and binds its two
 * handles. Copy confirmed font metric halfwords between the main/debug managers,
 * set shared field +0x0A to 0x4210, and configure sub blending at 0x04001050.
 * Destroy temporary resources and return void. This performs direct Nintendo DS
 * BG/power/blend MMIO and extensive SDK graphics-resource changes.
 */
extern "C" void func_ov016_021fedc4(void *state)
{
    Overlay016ResourceSet resources;
    Overlay016GraphicsManager manager;
    volatile u16 *mainBg = (volatile u16 *)0x04000008;
    volatile u16 *subBg = (volatile u16 *)0x04001008;
    void *mainFont;
    void *debugFont;
    void *handle;

    func_ov016_021ff04c(0);
    FIELD(s32, state, 0x48) = 0x10;
    func_020925a4(0);
    mainBg[0] = (mainBg[0] & 0x43) | 0x3800;
    mainBg[1] = (mainBg[1] & 0x43) | 0x3a00;
    mainBg[2] = (mainBg[2] & 0x43) | 0x1c00;
    func_ov016_021ff068(0, 0, 0x1e, 4);
    func_020925f8();
    func_02092638(0, 1, 2, 3);

    FIELD(s32, state, 0x4c) = 0x1d;
    func_020925dc(0);
    subBg[0] = (subBg[0] & 0x43) | 0x3800;
    subBg[1] = (subBg[1] & 0x43) | 0x3a00;
    subBg[2] = (subBg[2] & 0x43) | 0x1c00;
    subBg[3] = (subBg[3] & 0x43) | 0x1e10;
    func_02092618();
    func_02092688(0, 1, 2, 3);

    GraphicsResourceSet_Init(&resources);
    func_020926d8(&manager);
    GraphicsResourceSet_Load(&resources, data_020f4e18, 0x8004, 0x8005, 0x8006);
    func_02070f80((void *)resources.words[2], 8);
    func_020b44e8();
    GraphicsResourceSet_Apply(&resources, 3, 0x100);
    GraphicsResourceSet_Load(&resources, data_020f4e18, 0x8012, 0x8013, 0x8018);
    func_02092754(&manager, FIELD(s32, state, 0x54) == 2 ? 0x801e : 0x8014);
    func_02092754(&manager, 0x8015);
    func_020b44e8();
    GraphicsResourceSet_Apply(&resources, 2, 0);
    handle = func_02092790(&manager, 0);
    func_02070eac(handle, 0, 0);
    handle = func_02092790(&manager, 1);
    func_02070eac(handle, 1, 0);

    mainFont = func_020755e0(FIELD(void *, data_020f4e14, 0));
    debugFont = func_020755e0(FIELD(void *, gDebugFont, 0));
    FIELD(u16, debugFont, 6) = FIELD(u16, mainFont, 0xe);
    FIELD(u16, mainFont, 6) = FIELD(u16, mainFont, 0xe);
    FIELD(u16, debugFont, 8) = FIELD(u16, mainFont, 0x1e);
    FIELD(u16, mainFont, 8) = FIELD(u16, mainFont, 0x1e);
    FIELD(u16, debugFont, 0xa) = 0x4210;
    FIELD(u16, mainFont, 0xa) = FIELD(u16, debugFont, 0xa);
    FIELD(u16, debugFont, 0xc) = FIELD(u16, mainFont, 0x1e);
    FIELD(u16, mainFont, 0xc) = FIELD(u16, mainFont, 0x1e);
    func_020afd0c((void *)0x04001050, 0, 0xc, 8, 8);

    func_020926f8(&manager);
    GraphicsResourceSet_Destroy(&resources);
}

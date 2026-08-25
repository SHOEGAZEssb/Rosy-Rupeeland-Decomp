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
extern void GraphicsBgMapResource_UploadToSubBg(void *, s32, s32);
extern void GraphicsBgMapResource_AddPaletteBankOffset(void *, s32);
extern void *GraphicsSpriteRenderer_GetObjectPaletteAddress(void *);
extern void TitleDisplay_ConfigureMain2dEngine(s32);
extern void TitleDisplay_ConfigureSub2dEngine(s32);
extern void TitleDisplay_ResetMainBgScroll(void);
extern void TitleDisplay_ResetSubBgScroll(void);
extern void TitleDisplay_SetMainBgPriorities(s32, s32, s32, s32);
extern void TitleDisplay_SetSubBgPriorities(s32, s32, s32, s32);
extern void TitleScreenResourceCollection_Init(void *);
extern void func_020926f8(void *);
extern void func_02092754(void *, s32);
extern void *TitleScreenResourceCollection_Get(void *, s32);
extern void func_020afd0c(void *, s32, s32, s32, s32);
extern void func_020b44e8(void);
extern void func_ov016_021ff04c(s32);
extern void Overlay016_ConfigureMainBg3(s32, s32, s32, s32);
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
    TitleDisplay_ConfigureMain2dEngine(0);
    mainBg[0] = (mainBg[0] & 0x43) | 0x3800;
    mainBg[1] = (mainBg[1] & 0x43) | 0x3a00;
    mainBg[2] = (mainBg[2] & 0x43) | 0x1c00;
    Overlay016_ConfigureMainBg3(0, 0, 0x1e, 4);
    TitleDisplay_ResetMainBgScroll();
    TitleDisplay_SetMainBgPriorities(0, 1, 2, 3);

    FIELD(s32, state, 0x4c) = 0x1d;
    TitleDisplay_ConfigureSub2dEngine(0);
    subBg[0] = (subBg[0] & 0x43) | 0x3800;
    subBg[1] = (subBg[1] & 0x43) | 0x3a00;
    subBg[2] = (subBg[2] & 0x43) | 0x1c00;
    subBg[3] = (subBg[3] & 0x43) | 0x1e10;
    TitleDisplay_ResetSubBgScroll();
    TitleDisplay_SetSubBgPriorities(0, 1, 2, 3);

    GraphicsResourceSet_Init(&resources);
    TitleScreenResourceCollection_Init(&manager);
    GraphicsResourceSet_Load(&resources, data_020f4e18, 0x8004, 0x8005, 0x8006);
    GraphicsBgMapResource_AddPaletteBankOffset((void *)resources.words[2], 8);
    func_020b44e8();
    GraphicsResourceSet_Apply(&resources, 3, 0x100);
    GraphicsResourceSet_Load(&resources, data_020f4e18, 0x8012, 0x8013, 0x8018);
    func_02092754(&manager, FIELD(s32, state, 0x54) == 2 ? 0x801e : 0x8014);
    func_02092754(&manager, 0x8015);
    func_020b44e8();
    GraphicsResourceSet_Apply(&resources, 2, 0);
    handle = TitleScreenResourceCollection_Get(&manager, 0);
    GraphicsBgMapResource_UploadToSubBg(handle, 0, 0);
    handle = TitleScreenResourceCollection_Get(&manager, 1);
    GraphicsBgMapResource_UploadToSubBg(handle, 1, 0);

    mainFont = GraphicsSpriteRenderer_GetObjectPaletteAddress(data_020f4e14);
    debugFont = GraphicsSpriteRenderer_GetObjectPaletteAddress(gDebugFont);
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

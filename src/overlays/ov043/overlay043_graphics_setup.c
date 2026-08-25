#include "tingle/types.h"

/*
 * Overlay 43 graphics setup. This recovered routine configures both Nintendo
 * DS display engines and loads the presentation's background/font resources.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *data_020f4e18;
extern "C" void *data_020f4e14;
extern "C" void *gDebugFont;
extern "C" void TitleDisplay_ConfigureMain2dEngine(s32 engine);
extern "C" void TitleDisplay_ResetMainBgScroll(void);
extern "C" void TitleDisplay_SetMainBgPriorities(s32 first, s32 second, s32 third, s32 fourth);
extern "C" void TitleDisplay_ConfigureSub2dEngine(s32 engine);
extern "C" void TitleDisplay_ResetSubBgScroll(void);
extern "C" void TitleDisplay_SetSubBgPriorities(s32 first, s32 second, s32 third, s32 fourth);
extern "C" void GraphicsResourceSet_Init(void *resources);
extern "C" void TitleScreenResourceCollection_Init(void *transfer);
extern "C" void GraphicsResourceSet_Load(void *resources, void *archive,
                                          s32 first, s32 second, s32 third,
                                          s32 fourth);
extern "C" void GraphicsResourceSet_Apply(void *resources, s32 engine, s32 value);
extern "C" void GraphicsBgMapResource_AddPaletteBankOffset(void *resource, s32 value);
extern "C" void func_020b44e8(void);
extern "C" void GraphicsResourceSet_ApplyToMainBg(void *resources, s32 engine, s32 value);
extern "C" void func_02092754(void *transfer, s32 resourceId);
extern "C" void *TitleScreenResourceCollection_Get(void *transfer, s32 engine);
extern "C" void GraphicsBgMapResource_UploadToSubBg(void *resource, s32 engine, s32 value);
extern "C" void *GraphicsSpriteRenderer_GetObjectPaletteAddress(void *font);
extern "C" void func_020926f8(void *transfer);
extern "C" void GraphicsResourceSet_Destroy(void *resources);

/*
 * Configure overlay-43 graphics for object. It enables the display-capture
 * bit at 0x04000304, writes BG control registers for both engines, sets stored
 * brightness values +0x48/+0x4C to 24/29, loads resource triples
 * 0x8004..0x8006 and 0x8012..0x8014 plus transfer resource 0x8016, applies
 * them, and synchronizes palette metadata between data_020f4e14 and
 * gDebugFont. Temporary resource/transfer objects are destroyed before return.
 * VRAM/display registers, resource managers, and font state are changed.
 */
extern "C" void func_ov043_0220ba28(void *object)
{
    volatile u16 *powerControl = (volatile u16 *)0x04000304;
    volatile u16 *mainBg0 = (volatile u16 *)0x0400000e;
    volatile u16 *subBg = (volatile u16 *)0x04001008;

    *powerControl &= ~0x8000;
    FIELD(s32, object, 0x48) = 24;
    TitleDisplay_ConfigureMain2dEngine(0);
    *mainBg0 = (*mainBg0 & 0x43) | 0x1e10;
    TitleDisplay_ResetMainBgScroll();
    TitleDisplay_SetMainBgPriorities(0, 1, 2, 3);

    FIELD(s32, object, 0x4c) = 29;
    TitleDisplay_ConfigureSub2dEngine(0);
    subBg[0] = (subBg[0] & 0x43) | 0x3800;
    subBg[2] = (subBg[2] & 0x43) | 0x1c00;
    subBg[3] = (subBg[3] & 0x43) | 0x1e10;
    TitleDisplay_ResetSubBgScroll();
    TitleDisplay_SetSubBgPriorities(0, 1, 2, 3);

    u8 resources[12];
    u8 transfer[68];
    GraphicsResourceSet_Init(resources);
    TitleScreenResourceCollection_Init(transfer);

    GraphicsResourceSet_Load(resources, data_020f4e18,
                              0x8004, 0x8005, 0x8006, 0x8006);
    GraphicsBgMapResource_AddPaletteBankOffset(FIELD(void *, resources, 8), 8);
    func_020b44e8();
    GraphicsResourceSet_ApplyToMainBg(resources, 3, 0x100);
    GraphicsResourceSet_Apply(resources, 3, 0x100);

    GraphicsResourceSet_Load(resources, data_020f4e18,
                              0x8012, 0x8013, 0x8014, 0x8014);
    func_02092754(transfer, 0x8016);
    func_020b44e8();
    GraphicsResourceSet_Apply(resources, 0, 0);
    void *resource = TitleScreenResourceCollection_Get(transfer, 0);
    GraphicsBgMapResource_UploadToSubBg(resource, 2, 0);

    void *font = GraphicsSpriteRenderer_GetObjectPaletteAddress(data_020f4e14);
    void *debugFont = GraphicsSpriteRenderer_GetObjectPaletteAddress(gDebugFont);
    FIELD(u16, debugFont, 6) = FIELD(u16, font, 0xe);
    FIELD(u16, font, 6) = FIELD(u16, font, 0xe);
    FIELD(u16, debugFont, 8) = FIELD(u16, font, 0x1e);
    FIELD(u16, font, 8) = FIELD(u16, font, 0x1e);
    FIELD(u16, debugFont, 0xa) = 0x4210;
    FIELD(u16, font, 0xa) = FIELD(u16, debugFont, 0xa);
    FIELD(u16, debugFont, 0xc) = FIELD(u16, font, 0x1e);
    FIELD(u16, font, 0xc) = FIELD(u16, font, 0x1e);

    func_020926f8(transfer);
    GraphicsResourceSet_Destroy(resources);
}

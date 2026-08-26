#include "tingle/types.h"

/* Overlay 29 detail-screen resource setup, frame update, and entry selection. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern void *gDebugFont;
extern void *gGamePhaseCurrencyHud;
extern u16 data_021f5ee8[];
extern const u8 data_021f5ed0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void GamePhaseCurrencyHud_Update(void *);
extern void GraphicsBgMapResource_UploadToMainBg(void *, s32, s32);
extern void GraphicsResourceSet_ApplyToMainBg(void *, s32, s32);
extern void *RecordDescriptor_GetMessage(void *, s32);
extern void TitleScreenResourceCollection_Init(void *);
extern void TitleScreenResourceCollection_Destroy(void *);
extern void TitleScreenResourceCollection_Append(void *, s32);
extern void *TitleScreenResourceCollection_Get(void *, s32);
extern void TitlePalette_SetMainBackdrop(s32);
extern void Presentation_BlendPalette16(void *, void *, s32);
extern void TitleDialog_SetText(void *, void *, s32);
extern s32 TitleDialog_UpdateTextPage(void *, const void *);
extern void TitleDialog_ClearTextRect(void *);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void func_020b1ff0(void *, s32, s32);
extern void func_020b2058(void *, s32, s32);
extern void func_020b44e8(void);
extern void func_ov002_021fba00(void *);
extern void func_ov029_021fce00(void *, void *);
extern void func_ov045_0220b908(void *);
extern void func_ov045_0220c028(void *);
extern void func_ov045_0220c128(void *, s32);
extern void func_ov045_0220c18c(void *);
extern void Overlay045_DrawSelectorPreview(s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Builds temporary graphics resource 0xA06D..0xA06F and auxiliary resource
 * 0xA070, publishes them to layer zero, installs the latter with mode 1, selects
 * manager state zero, clears main blend control 0x04000050, and changes scene
 * display field +0x48 to 19 before destroying the temporaries. Returns void;
 * graphics SDK and Nintendo DS blend-register state change.
 */
extern "C" void func_ov029_021fd644(void *state)
{
    u32 graphics[3];
    u8 auxiliary[0x44];
    GraphicsResourceSet_Init(graphics);
    TitleScreenResourceCollection_Init(auxiliary);
    GraphicsResourceSet_Load(graphics, data_020f4e18[0],
                             0xa06d, 0xa06e, 0xa06f);
    TitleScreenResourceCollection_Append(auxiliary, 0xa070);
    func_020b44e8();
    GraphicsResourceSet_ApplyToMainBg(graphics, 0, 0);
    void *resource = TitleScreenResourceCollection_Get(auxiliary, 0);
    GraphicsBgMapResource_UploadToMainBg(resource, 1, 0);
    TitlePalette_SetMainBackdrop(0);
    *(volatile u16 *)0x04000050 = 0;
    FIELD(s32, state, 0x48) = 0x13;
    TitleScreenResourceCollection_Destroy(auxiliary);
    GraphicsResourceSet_Destroy(graphics);
}

/*
 * Advances global context, optional external object +0xA4, optional virtual
 * object +0xA0, optional overlay-2 child +0xA8, and required child +0xD0. While
 * palette progress +0xDC is below 16 it increments progress, interpolates from
 * +0xD4 toward +0xD8, uploads 0x021F5EE8 to the sub destination, and also to
 * the main destination when +0xA8 is absent. Returns void; context, external
 * overlays, object, and palette SDK state may change.
 */
extern "C" void func_ov029_021fd6fc(void *state)
{
    GamePhaseCurrencyHud_Update(gGamePhaseCurrencyHud);
    if (FIELD(void *, state, 0xa4) != 0)
        func_ov045_0220c18c(FIELD(void *, state, 0xa4));
    void *object = FIELD(void *, state, 0xa0);
    if (object != 0) {
        typedef void (*Update)(void *);
        FIELD(Update *, object, 0)[2](object);
    }
    if (FIELD(void *, state, 0xa8) != 0)
        func_ov002_021fba00(FIELD(void *, state, 0xa8));
    func_ov045_0220b908(FIELD(void *, state, 0xd0));
    s32 progress = FIELD(s32, state, 0xdc);
    if (progress < 0x10) {
        FIELD(s32, state, 0xdc) = progress + 1;
        Presentation_BlendPalette16(FIELD(void *, state, 0xd4),
                      FIELD(void *, state, 0xd8), progress + 1);
        func_020b1ff0(data_021f5ee8, 0, 0x20);
        if (FIELD(void *, state, 0xa8) == 0)
            func_020b2058(data_021f5ee8, 0, 0x20);
    }
}

/*
 * Reconstructs a temporary source wrapper around scene argument +0x68, clears
 * controller +0x9C, resolves entry `index`, installs it with mode 4, and applies
 * descriptor 0x021F5ED0. If the resulting controller flags contain bit 9, the
 * external object +0xA4 receives controller field +0xE8; otherwise it is reset.
 * It binds the debug font to manager value +0x78 and updates the external
 * display from source fields +0x54/+0x58. Returns void; UI and external overlay
 * state change.
 */
extern "C" void func_ov029_021fd7a8(void *state, s32 index)
{
    u8 temporary[16];
    func_ov029_021fce00(temporary, FIELD(void *, state, 0x68));
    TitleDialog_ClearTextRect(FIELD(void *, state, 0x9c));
    void *entry = RecordDescriptor_GetMessage(temporary, index);
    TitleDialog_SetText(FIELD(void *, state, 0x9c), entry, 4);
    s32 flags = TitleDialog_UpdateTextPage(FIELD(void *, state, 0x9c), data_021f5ed0);
    if (flags & 0x200)
        func_ov045_0220c128(FIELD(void *, state, 0xa4),
                            FIELD(s32, FIELD(void *, state, 0x9c), 0xe8));
    else
        func_ov045_0220c028(FIELD(void *, state, 0xa4));
    GraphicsSpriteRenderer_SetFontResource(gDebugFont, FIELD(void *, state, 0x78));
    Overlay045_DrawSelectorPreview(FIELD(s32, state, 0x54), FIELD(s32, state, 0x58));
}

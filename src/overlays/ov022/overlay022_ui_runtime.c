#include "tingle/types.h"

/* Overlay 22 embedded UI controllers, cursor anchoring, message presentation, and teardown. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const u8 data_021f3ecc[];
extern void *data_021f5128;
extern const u16 data_021f5ed0[];
extern u8 data_021f5ee8[];
extern void *gDebugFont;
extern void *gGameWork;
extern void *gLupyContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void func_02073e48(void *, s32, s32, s32, ...);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteText_FormatDecimal(void *, s32, u32, s32);
extern const void *func_020791e0(const void *, u16);
extern const void *RetailTextTable_FindRecordById(const void *, u16);
extern const void *RecordMode_GetMessage(void *, s32);
extern void GamePhaseCurrencyHud_Update(void *);
extern void Presentation_BlendPalette16(void *, void *);
extern void TitleDialog_SetText(void *, const void *, s32);
extern s32 TitleDialog_UpdateTextPage(void *, const void *);
extern void TitleDialog_ClearTextRect(void *);
extern void InventoryScroll_UpdatePresentation(void *);
extern void PresentationList_UpdateAndDeleteCompleted(void *);
extern void func_020957f0(void *, void *, s32, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_020958d8(void *);
extern void func_02095940(void *);
extern void func_02095988(void *, s32);
extern void func_020b1ff0(void *, s32, s32);
extern void func_020b2058(void *, s32, s32);
extern s32 GameWork_TestFlag(void *, u16);
extern void func_ov046_0220c1a4(void *);
extern void *func_ov022_021fdca0(void *);
extern void func_ov022_021fd2f4(void);
extern void func_ov022_021fd4d4(void *);
extern void func_ov022_021fd5d4(void *, void *);
extern void func_ov022_021fef48(void *);
extern void func_ov022_021ff2c4(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the scene's two embedded 0xAC UI controllers at +0x154/+0x200
 * from resource slot 1, positions them off the left edge, and selects their
 * initial animations. It then refreshes visibility, creates sprite +0xA4 at
 * (20,134), and constructs the +0xA8 controller at (228,170). Sprite/resource
 * and UI-controller state change; no value is returned.
 */
extern "C" void func_ov022_021fee3c(void *scene)
{
    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0x9c),
                                 (u8 *)scene + 0x84, 1);
    func_020957f0((u8 *)scene + 0x154, sprite, 0, 1, 0);
    func_02095820((u8 *)scene + 0x154, -64, 64);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0x9c),
                           (u8 *)scene + 0x84, 1);
    func_020957f0((u8 *)scene + 0x200, sprite, 2, 1, 0);
    func_02095820((u8 *)scene + 0x200, -64, 112);
    func_ov022_021fef48(scene);

    FIELD(void *, scene, 0xa4) = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, scene, 0x9c), (u8 *)scene + 0x78, 1);
    func_02073e48(FIELD(void *, scene, 0xa4), 0x14, 0x86, 0x1c, 1, 0, 6);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0x9c),
                           (u8 *)scene + 0x78, 1);
    func_020957f0((u8 *)scene + 0xa8, sprite, 2, 1, 0);
    func_02095820((u8 *)scene + 0xa8, 0xe4, 0xaa);
}

/*
 * Selects animations/visibility for the two embedded controllers. +0x154 uses
 * animation 0 when collection +0x2B4 exists and 1 otherwise. +0x200 is hidden
 * until game-work flag 0x3CB is set; afterward it is hidden when +0x2B0 is
 * nonzero, else uses animation 2 when menu +0x2B8 exists and 3 when absent.
 * UI animation state changes and no value is returned.
 */
extern "C" void func_ov022_021fef48(void *scene)
{
    func_02095988((u8 *)scene + 0x154,
                  FIELD(void *, scene, 0x2b4) != 0 ? 0 : 1);
    if (GameWork_TestFlag(gGameWork, 0x3cb)) {
        if (FIELD(s32, scene, 0x2b0) != 0)
            func_02095940((u8 *)scene + 0x200);
        else
            func_02095988((u8 *)scene + 0x200,
                          FIELD(void *, scene, 0x2b8) != 0 ? 2 : 3);
    } else {
        func_02095940((u8 *)scene + 0x200);
    }
}

/*
 * Enables scene flag bit 1, unhides sprite +0xA4, and places it beside the
 * currently selected visible menu row using x=134 and y=28+24*(selection-
 * scroll). The selected menu entry's descriptor pointer is saved at +0x2BC.
 * Scene flags and sprite position/visibility change; no value is returned.
 */
extern "C" void func_ov022_021fefe0(void *scene)
{
    FIELD(u32, scene, 0x48) |= 2;
    void *sprite = FIELD(void *, scene, 0xa4);
    FIELD(u16, sprite, 0x24) &= (u16)~4;
    FIELD(u16, sprite, 0x2c) = 0x86;
    void *menu = FIELD(void *, scene, 0x2b8);
    void *ui = FIELD(void *, menu, 0x30);
    FIELD(u16, sprite, 0x2e) = (u16)(0x1c + 0x18 *
        (FIELD(s32, ui, 0x14) - FIELD(s32, ui, 0xc)));
    FIELD(void *, scene, 0x2bc) = FIELD(void *, func_ov022_021fdca0(menu), 0);
}

/*
 * Copies the selected descriptor +0x2BC's text into scene +0x2D0, configures
 * display field +0x310 from descriptor word +0x24, resets dialog +0x2CC, and
 * presents message state 0x206. Scene/dialog rendering state changes; no
 * value is returned.
 */
extern "C" void func_ov022_021ff048(void *scene)
{
    const u8 *descriptor = FIELD(const u8 *, scene, 0x2bc);
    const u8 *message = (const u8 *)RetailTextTable_FindRecordById(
        data_021f3ecc, FIELD(u16, descriptor, 0));
    const u16 *text = (const u16 *)(message + 2);
    for (s32 i = 0; i < 0x20; ++i) {
        FIELD(u16, scene, 0x2d0 + i * 2) = text[i];
        if (text[i] == 0)
            break;
    }
    GraphicsSpriteText_FormatDecimal((u8 *)scene + 0x310,
                  FIELD(s32, descriptor, 0x24), 0xff676980, 0);
    TitleDialog_ClearTextRect(FIELD(void *, scene, 0x2cc));
    func_ov022_021ff2c4(scene, 0x206);
}

/*
 * Performs the scene's incremental teardown. It shuts down global Lupy state,
 * both embedded controllers, optional status/menu/overlay-46 objects, the
 * +0x354 object, and sprite-resource owners +0x9C/+0xA0. For up to 16 calls it
 * also advances +0x370, updates +0x368/+0x36C, and clears/uploads two 0x20-byte
 * ranges in data_021F5EE8. Heap, graphics, palette, and scene state change.
 */
extern "C" void func_ov022_021ff0d0(void *scene)
{
    GamePhaseCurrencyHud_Update(gLupyContext);
    func_020958d8((u8 *)scene + 0xa8);
    for (s32 i = 0; i < 2; ++i)
        func_020958d8((u8 *)scene + 0x154 + i * 0xac);

    void *status = FIELD(void *, scene, 0x350);
    if (status != 0) {
        typedef void (*Destructor)(void *);
        ((Destructor)FIELD(void *, FIELD(void *, status, 0), 0))(status);
        GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, status, 0x1c));
    }
    void *menu = FIELD(void *, scene, 0x2b8);
    if (menu != 0)
        InventoryScroll_UpdatePresentation(FIELD(void *, menu, 0x30));
    void *effect = FIELD(void *, scene, 0x35c);
    if (effect != 0) {
        func_ov046_0220c1a4(effect);
        FIELD(s32, FIELD(void *, scene, 0xa0), 0x18) =
            0x80 - FIELD(s32, effect, 0x10c);
        FIELD(s32, FIELD(void *, scene, 0xa0), 0x1c) =
            0x60 - FIELD(s32, effect, 0x110);
    }
    void *owner = FIELD(void *, scene, 0x354);
    PresentationList_UpdateAndDeleteCompleted((u8 *)owner + 0x48);
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, owner, 0));
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, scene, 0x9c));
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, scene, 0xa0));
    if (FIELD(s32, scene, 0x370) < 0x10) {
        ++FIELD(s32, scene, 0x370);
        Presentation_BlendPalette16(FIELD(void *, scene, 0x368),
                      FIELD(void *, scene, 0x36c));
        func_020b1ff0(data_021f5ee8, 0, 0x20);
        func_020b2058(data_021f5ee8, 0x100, 0x20);
    }
}

/*
 * Moves the two embedded 0xAC controllers to x=128 and y=64/112. Only their
 * UI positions change; no value is returned.
 */
extern "C" void func_ov022_021ff1e4(void *scene)
{
    for (s32 i = 0; i < 2; ++i)
        func_02095820((u8 *)scene + 0x154 + i * 0xac,
                      0x80, 0x40 + i * 0x30);
}

/*
 * Presents a message resolved from the global context at data_021F5128 +0x1C
 * and the caller's numeric key. It sets dialog +0x2CC mode fields, installs the
 * text with style 4, evaluates layout data_021F5ED0, shows status text +0xE8
 * when result bit 9 is set (otherwise hides it), restores the scene font, and
 * resets the status widget. Dialog/font/status state changes; no return value.
 */
extern "C" void func_ov022_021ff220(void *scene, s32 key)
{
    void *dialog = FIELD(void *, scene, 0x2cc);
    FIELD(s32, dialog, 0xd0) = 0xd;
    FIELD(s32, dialog, 0xd4) = 0;
    const void *text = RecordMode_GetMessage(FIELD(void *, data_021f5128, 0x1c), key);
    TitleDialog_SetText(dialog, text, 4);
    s32 result = TitleDialog_UpdateTextPage(dialog, data_021f5ed0);
    if (result & 0x200)
        func_ov022_021fd5d4(FIELD(void *, scene, 0x350),
                            FIELD(void *, dialog, 0xe8));
    else
        func_ov022_021fd4d4(FIELD(void *, scene, 0x350));
    GraphicsSpriteRenderer_SetFontResource(gDebugFont, FIELD(void *, scene, 0x54));
    func_ov022_021fd2f4();
}

/*
 * Presents message ID `message_id` from data_021F3ECC. Dialog mode, style,
 * layout-bit handling, status visibility, font restoration, and widget reset
 * match func_ov022_021FF220. Dialog/font/status state change and no value is
 * returned.
 */
extern "C" void func_ov022_021ff2c4(void *scene, s32 message_id)
{
    void *dialog = FIELD(void *, scene, 0x2cc);
    FIELD(s32, dialog, 0xd0) = 0xd;
    FIELD(s32, dialog, 0xd4) = 0;
    const void *text = func_020791e0(data_021f3ecc, (u16)message_id);
    TitleDialog_SetText(dialog, text, 4);
    s32 result = TitleDialog_UpdateTextPage(dialog, data_021f5ed0);
    if (result & 0x200)
        func_ov022_021fd5d4(FIELD(void *, scene, 0x350),
                            FIELD(void *, dialog, 0xe8));
    else
        func_ov022_021fd4d4(FIELD(void *, scene, 0x350));
    GraphicsSpriteRenderer_SetFontResource(gDebugFont, FIELD(void *, scene, 0x54));
    func_ov022_021fd2f4();
}

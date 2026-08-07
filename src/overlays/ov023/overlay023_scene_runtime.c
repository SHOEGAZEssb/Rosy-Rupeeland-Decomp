#include "tingle/types.h"

/* Overlay 23 cursor, dialog, mode, controller, selection, and frame-cleanup helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_ov023_021ffb28[];
extern void *data_ov023_021ffb98[];
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02070e0c(s32, s32, s32);
extern void func_02075598(void *, void *);
extern void func_020755bc(void *);
extern void func_02092790(void *, s32);
extern void func_02092e9c(void *, const void *, s32);
extern s32 func_02093360(void *, const void *);
extern void func_020939d8(void *);
extern void func_02094574(void *);
extern s32 func_02095860(void *, void *, s32, s32);
extern void func_020958d8(void *);
extern void func_02095928(void *);
extern void func_02095988(void *, s32);
extern void func_02092260(void *, s32);
extern void func_02093af8(void *, s32);
extern void func_ov023_021fd9d0(void *, void *, void *);
extern void *func_ov023_021fd398(void *);
extern void func_ov023_021fe640(void *, s32);
extern void func_ov023_021fe77c(void *);
extern void func_ov045_0220c028(void *);
extern void func_ov045_0220c068(void *);
extern void func_ov045_0220c128(void *, void *);
extern void func_ov045_0220c174(void *);
extern void func_ov045_0220c18c(void *);
extern void *func_ov045_0220c48c(s32, u16, s32);
extern void func_ov045_0220c274(void *, s32);
extern void func_ov045_0220d2f8(s32, u16);
#ifdef __cplusplus
}
#endif

/*
 * Shows cursor sprite +0xCC and positions it beside the active selection. Mode
 * +0x388 value 0 uses main collection +0x390 with 26-pixel rows at x=134,
 * y=45; value 1 uses current group +0x430/+0x48C with 22-pixel rows at x=136,
 * y=62. Other modes only unhide it. Sprite state changes; returns void.
 */
extern "C" void func_ov023_021fe6e4(void *scene)
{
    void *sprite = FIELD(void *, scene, 0xcc);
    FIELD(u16, sprite, 0x24) &= (u16)~4;
    if (FIELD(s32, scene, 0x388) == 0) {
        void *ui = FIELD(void *, FIELD(void *, scene, 0x390), 0x38);
        FIELD(u16, sprite, 0x2c) = 0x86;
        FIELD(u16, sprite, 0x2e) = (u16)(0x2d + 0x1a *
            (FIELD(s32, ui, 0x14) - FIELD(s32, ui, 0xc)));
    } else if (FIELD(s32, scene, 0x388) == 1) {
        void *collection = FIELD(void *, scene,
            0x430 + FIELD(s32, scene, 0x48c) * 4);
        void *ui = FIELD(void *, collection, 0x48);
        FIELD(u16, sprite, 0x2c) = 0x88;
        FIELD(u16, sprite, 0x2e) = (u16)(0x3e + 0x16 *
            (FIELD(s32, ui, 0x14) - FIELD(s32, ui, 0xc)));
    }
}

/*
 * Performs per-frame shutdown/maintenance for four embedded controllers,
 * optional overlay-45 object +0x4BC, active collection UIs, and both navigation
 * effects through their virtual update at vtable +8. UI/effect/graphics state
 * changes; returns void.
 */
extern "C" void func_ov023_021fe77c(void *scene)
{
    func_020958d8((u8 *)scene + 0x17c);
    func_020958d8((u8 *)scene + 0xd0);
    func_020958d8((u8 *)scene + 0x228);
    func_020958d8((u8 *)scene + 0x2d4);
    if (FIELD(void *, scene, 0x4bc))
        func_ov045_0220c18c(FIELD(void *, scene, 0x4bc));
    if (FIELD(void *, scene, 0x390))
        func_02094574(FIELD(void *, FIELD(void *, scene, 0x390), 0x38));
    if (FIELD(void *, scene, 0x478))
        func_02094574(FIELD(void *, FIELD(void *, scene, 0x478), 0x48));
    for (s32 i = 0; i < 2; ++i) {
        void *effect = FIELD(void *, scene, 0x380 + i * 4);
        typedef void (*Update)(void *);
        ((Update)FIELD(void *, FIELD(void *, effect, 0), 8))(effect);
    }
}

/*
 * Installs `text` into dialog +0x4B8 with style 4, evaluates scene layout +0x2C,
 * shows overlay-45 text +0xE8 when result bit 9 is set (otherwise hides it),
 * restores debug font +0x54, and updates bank/text metadata from `record`.
 * Dialog/font/overlay state changes; returns void.
 */
extern "C" void func_ov023_021fe804(void *scene, const void *text, void *record)
{
    void *dialog = FIELD(void *, scene, 0x4b8);
    func_02092e9c(dialog, text, 4);
    s32 result = func_02093360(dialog, FIELD(void *, scene, 0x2c));
    if (result & 0x200)
        func_ov045_0220c128(FIELD(void *, scene, 0x4bc),
                            FIELD(void *, dialog, 0xe8));
    else func_ov045_0220c028(FIELD(void *, scene, 0x4bc));
    func_02075598(gDebugFont, FIELD(void *, scene, 0x54));
    void *descriptor = FIELD(void *, record, 4);
    func_ov045_0220d2f8(FIELD(u32, descriptor, 0xc) & 0xff,
                         FIELD(u16, descriptor, 4));
}

/*
 * Advances dialog input using a local copy of the 11-halfword layout at +0x2C.
 * Scene input flag bit 5 and dialog flag bit 1 select confirm/cancel layout bits
 * and overlay visibility. Result bit 0 acknowledges and resets the dialog and
 * returns one; bit 9 refreshes overlay text. Otherwise returns zero.
 */
extern "C" s32 func_ov023_021fe88c(void *scene)
{
    u16 layout[11];
    for (s32 i = 0; i < 11; ++i) layout[i] = FIELD(u16, scene, 0x2c + i * 2);
    void *dialog = FIELD(void *, scene, 0x4b8);
    u32 flags = FIELD(u32, dialog, 0x38);
    if (flags & 1) return 1;
    if (FIELD(u32, scene, 0x20) & 0x20) {
        if (flags & 2) {
            func_ov045_0220c028(FIELD(void *, scene, 0x4bc));
            layout[1] |= 1;
        } else layout[1] |= 2;
    } else if (flags & 2) {
        func_ov045_0220c174(FIELD(void *, scene, 0x4bc));
    }
    s32 result = func_02093360(dialog, layout);
    if (result & 1) {
        func_ov045_0220c068(FIELD(void *, scene, 0x4bc));
        func_020939d8(dialog);
        return 1;
    }
    if (FIELD(u32, dialog, 0x38) & 0x200)
        func_ov045_0220c128(FIELD(void *, scene, 0x4bc),
                            FIELD(void *, dialog, 0xe8));
    return 0;
}

/*
 * Switches scene interaction mode +0x388. Mode 0 selects controller animations
 * 12/16, touch mode 0, sub-resource mode 0, and disables navigation effects;
 * mode 1 selects animations 14/13, touch/sub-resource mode 1, and enables them.
 * UI/input/resource/effect state changes; other values only update +0x388.
 */
extern "C" void func_ov023_021fe994(void *scene, s32 mode)
{
    FIELD(s32, scene, 0x388) = mode;
    if (mode == 0) {
        func_02095988((u8 *)scene + 0x228, 12);
        func_02095988((u8 *)scene + 0x2d4, 16);
        func_02092790((u8 *)scene + 0x78, 0);
        func_02070e0c(1, 0, 0);
        func_ov023_021fe640(scene, 0);
    } else if (mode == 1) {
        func_02095988((u8 *)scene + 0x228, 14);
        func_02095988((u8 *)scene + 0x2d4, 13);
        func_02092790((u8 *)scene + 0x78, 1);
        func_02070e0c(1, 0, 0);
        func_ov023_021fe640(scene, 1);
    }
}

/* Hit-tests the two 0xAC controllers at +0x228/+0x2D4; returns index or -1. */
extern "C" s32 func_ov023_021fea34(void *scene)
{
    for (s32 i = 0; i < 2; ++i)
        if (func_02095860((u8 *)scene + 0x228 + i * 0xac,
                          (u8 *)scene + 0x30, 0, 2)) return i;
    return -1;
}

/*
 * Resolves the main collection's selected record bank to its group index,
 * selects that index in selector +0x480, and returns the corresponding pointer
 * collection +0x430. Returns null when no group matches.
 */
extern "C" void *func_ov023_021fea88(void *scene)
{
    void *entry = func_ov023_021fd398(FIELD(void *, scene, 0x390));
    void *record = FIELD(void *, entry, 0);
    u32 bank = FIELD(u32, FIELD(void *, record, 4), 0xc) & 0xff;
    for (s32 i = 0; i < FIELD(s32, scene, 0x398); ++i) {
        if (FIELD(u32, scene, 0x3a0 + i * 4) == bank) {
            func_02093af8((u8 *)scene + 0x480, i);
            return FIELD(void *, scene,
                         0x430 + FIELD(s32, scene, 0x48c) * 4);
        }
    }
    return 0;
}

/*
 * Exit callback: on step zero resets both font contexts, starts controller
 * +0x17C, sets scene flag bit 0, and installs callback pair data_ov023_021ffb28.
 * Every call performs runtime maintenance and returns zero.
 */
extern "C" s32 func_ov023_021feaf0(void *scene)
{
    if (FIELD(s32, scene, 4) == 0) {
        func_020755bc(data_020f4e14);
        func_020755bc(gDebugFont);
        func_02095928((u8 *)scene + 0x17c);
        FIELD(u32, scene, 0x20) = (FIELD(u32, scene, 0x20) & ~1u) | 1u;
        func_ov023_021fd9d0(scene, data_ov023_021ffb28[0],
                           data_ov023_021ffb28[1]);
    }
    func_ov023_021fe77c(scene);
    return 0;
}

/*
 * Confirms the main selection: plays effect 2, stores selected entry +0x394,
 * creates overlay-45 detail object +0x4BC from the selected bank/text ID,
 * moves it to x=-128, and installs callback pair data_ov023_021ffb98. Audio,
 * overlay, selection, and callback state change; returns void.
 */
extern "C" void func_ov023_021feb60(void *scene)
{
    func_02092260(scene, 2);
    void *entry = func_ov023_021fd398(FIELD(void *, scene, 0x390));
    FIELD(void *, scene, 0x394) = entry;
    void *descriptor = FIELD(void *, FIELD(void *, entry, 0), 4);
    void *detail = func_ov045_0220c48c(
        FIELD(u32, descriptor, 0xc) & 0xff,
        FIELD(u16, descriptor, 4), 1);
    FIELD(void *, scene, 0x4bc) = detail;
    func_ov045_0220c274(detail, -128);
    func_ov023_021fd9d0(scene, data_ov023_021ffb98[0],
                       data_ov023_021ffb98[1]);
}

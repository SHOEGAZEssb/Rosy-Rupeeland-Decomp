#include "tingle/types.h"

/* Overlay 22 menu text rendering, touch hit-testing, selection lookup, and state routing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern u8 data_021f3ecc[];
extern u8 gSystemState[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02075598(void *, void *);
extern void func_02076148(void *, const void *, s32, s32, ...);
extern void func_02076428(void *, s32, s32, s32, ...);
extern const void *func_02079f3c(const void *, u16);
extern s32 func_020befec(s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Redraws up to four visible menu rows. It clears a 176-pixel-wide text area,
 * derives the first row from UI +0x30 scroll +0xC, resolves each entry's
 * halfword text ID through data_021F3ECC, and draws at x=64 with 24-pixel row
 * spacing. Available rows use style 14 and flagged rows style 5; the final
 * style parameter is -1 only for system-state byte +0x5F value 4, otherwise
 * -2. Font/render state changes; the menu is otherwise read only.
 */
extern "C" void func_ov022_021fdb38(void *menu)
{
    func_02076428(data_020f4e14, 0, 0, 0xff, 0xb0, 0);
    s32 count = FIELD(s32, menu, 0x2c);
    if (count == 0)
        return;
    s32 final_style = gSystemState[0x5f] == 4 ? -1 : -2;
    func_02075598(data_020f4e14, FIELD(void *, menu, 0));
    for (s32 row = 0; row < 4; ++row) {
        void *ui = FIELD(void *, menu, 0x30);
        s32 index = row + FIELD(s32, ui, 0xc);
        if (index >= count)
            break;
        void *entry = (u8 *)FIELD(void *, menu, 0x24) + index * 8;
        const void *descriptor = FIELD(const void *, entry, 0);
        s32 style = FIELD(s32, entry, 4) != 0 ? 5 : 14;
        const u8 *text = (const u8 *)func_02079f3c(
            data_021f3ecc, FIELD(u16, descriptor, 0));
        func_02076148(data_020f4e14, text + 2,
                      0x40, row * 0x18 + 0x13,
                      style, 8, final_style);
    }
}

/*
 * Converts a touch coordinate structure (+4 x, +8 y) into a menu index. The
 * interactive rectangle is x=16..216 and y=24..120. Y is divided into
 * 24-pixel rows and clamped to visible row 3, then UI scroll +0xC is added.
 * Returns the absolute row when it is below count +0x2C, otherwise -1. The
 * menu and input are not modified.
 */
extern "C" s32 func_ov022_021fdc30(void *menu, const void *touch)
{
    s32 x = FIELD(s32, touch, 4) - 0x10;
    s32 y = FIELD(s32, touch, 8) - 0x18;
    if (x < 0 || x > 0xc8 || y < 0 || y > 0x60)
        return -1;
    s32 row = func_020befec(y, 0x18);
    if (row >= 4)
        row = 3;
    row += FIELD(s32, FIELD(void *, menu, 0x30), 0xc);
    return row < FIELD(s32, menu, 0x2c) ? row : -1;
}

/*
 * Returns the 8-byte menu entry selected by UI field +0x14. No validation is
 * performed and neither the menu nor UI state is changed.
 */
extern "C" void *func_ov022_021fdca0(void *menu)
{
    s32 selected = FIELD(s32, FIELD(void *, menu, 0x30), 0x14);
    return (u8 *)FIELD(void *, menu, 0x24) + selected * 8;
}

/*
 * Tests the UI object's midpoint/update condition. When +0x30 equals rounded
 * half of +0x2C, it redraws the menu if scroll +0xC differs from target +0x10
 * and returns one. Otherwise it returns zero. Rendering may change, but menu
 * data is not mutated directly.
 */
extern "C" s32 func_ov022_021fdcb4(void *menu)
{
    void *ui = FIELD(void *, menu, 0x30);
    s32 extent = FIELD(s32, ui, 0x2c);
    if (FIELD(s32, ui, 0x30) != (extent + (extent >> 31)) / 2)
        return 0;
    if (FIELD(s32, ui, 0xc) != FIELD(s32, ui, 0x10))
        func_ov022_021fdb38(menu);
    return 1;
}

/*
 * Empty destructor hook for the scene's two embedded 0xAC controllers. The
 * input is untouched and there is no return value or observable side effect.
 */
extern "C" void func_ov022_021fdd00(void *controller)
{
    (void)controller;
}

/*
 * Writes four dialog-layout values to offsets +0xA4, +0xA8, +0xAC, and +0xB0.
 * The fifth argument supplies +0xB0. Only the dialog object changes; no value
 * is returned and no SDK or hardware operation occurs.
 */
extern "C" void func_ov022_021fdd04(void *dialog, s32 a, s32 b,
                                      s32 c, s32 d)
{
    FIELD(s32, dialog, 0xa4) = a;
    FIELD(s32, dialog, 0xa8) = b;
    FIELD(s32, dialog, 0xac) = c;
    FIELD(s32, dialog, 0xb0) = d;
}

/*
 * Installs a scene-state callback and its argument at +0x24/+0x28, then clears
 * state step +4 and timer +8. The scene is mutated, no callback runs during
 * this call, and no value is returned.
 */
extern "C" void func_ov022_021fdd1c(void *scene, void *callback, void *argument)
{
    FIELD(void *, scene, 0x24) = callback;
    FIELD(void *, scene, 0x28) = argument;
    FIELD(s32, scene, 4) = 0;
    FIELD(s32, scene, 8) = 0;
}

#include "tingle/debug_hud_state.h"

/* Initialize a shared 8x17 HUD grid and maintain its display bounds. */

#ifdef __cplusplus
extern "C" {
#endif
extern u16 data_0210548c[8][17];
extern void *data_020f4e14;
extern void *gDebugFont;
extern u8 gSystemState[];
extern void *gGameWork;
extern void DebugHudState_Close(DebugHudState *self);
extern void func_020755bc(void *object);
extern s32 func_020befec(s32 value, s32 divisor);
#ifdef __cplusplus
}
#endif

/*
 * Zero all nine state words and the shared 8x17 halfword grid. Compute the
 * current HUD rectangle and retain its left/top plus derived width/height.
 * Returns self.
 */
DebugHudState *DebugHudState_Init(DebugHudState *self)
{
    DebugHudRect rect;
    s32 row;
    s32 column;
    u32 *words = (u32 *)self;

    for (row = 0; row < 9; row++)
        words[row] = 0;
    for (row = 0; row < 8; row++)
        for (column = 0; column < 17; column++)
            data_0210548c[row][column] = 0;
    DebugHud_GetCurrentRectangle(&rect);
    self->left = rect.left;
    self->top = rect.top;
    self->width = rect.right - rect.left;
    self->height = rect.bottom - rect.top;
    return self;
}

/* Clear active HUD resources through DebugHudState_Close and return self. */
DebugHudState *DebugHudState_Destroy(DebugHudState *self)
{
    DebugHudState_Close(self);
    return self;
}

/* Reset the normal debug object for selector 0, or the debug font otherwise. */
void DebugHudState_ResetSelectedFont(DebugHudState *self)
{
    func_020755bc(self->fontSelect == 0 ? data_020f4e14 : gDebugFont);
}

/* Return the count of base-10 digits in value; zero is one digit. */
s32 DebugHud_CountDecimalDigits(void *unused, s32 value)
{
    s32 digits = 1;
    (void)unused;
    while ((value = func_020befec(value, 10)) != 0)
        digits++;
    return digits;
}

/*
 * Build the HUD rectangle from GameWork offsets 0x20c/0x20e. Normal mode uses
 * x+32..224; alternate system-state byte 0x5f uses x+16..240. Both use
 * y+131..y+176.
 */
void DebugHud_GetCurrentRectangle(DebugHudRect *rect)
{
    u8 *work = (u8 *)gGameWork;
    if (gSystemState[0x5f] == 0) {
        rect->left = *(s16 *)(work + 0x20c) + 0x20;
        rect->right = 0xe0;
    } else {
        rect->left = *(s16 *)(work + 0x20c) + 0x10;
        rect->right = 0xf0;
    }
    rect->top = *(s16 *)(work + 0x20e) + 0x83;
    rect->bottom = rect->top + 0x2d;
}

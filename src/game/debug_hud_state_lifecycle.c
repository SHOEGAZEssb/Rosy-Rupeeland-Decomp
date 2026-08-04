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
extern void func_0200f52c(DebugHudState *self);
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
DebugHudState *func_0200f260(DebugHudState *self)
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
    func_0200f38c(&rect);
    self->left = rect.left;
    self->top = rect.top;
    self->width = rect.right - rect.left;
    self->height = rect.bottom - rect.top;
    return self;
}

/* Clear active HUD resources through func_0200f52c and return self. */
DebugHudState *func_0200f314(DebugHudState *self)
{
    func_0200f52c(self);
    return self;
}

/* Reset the normal debug object for selector 0, or the debug font otherwise. */
void func_0200f328(DebugHudState *self)
{
    func_020755bc(self->displaySelect == 0 ? data_020f4e14 : gDebugFont);
}

/* Return the count of base-10 digits in value; zero is one digit. */
s32 func_0200f360(void *unused, s32 value)
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
void func_0200f38c(DebugHudRect *rect)
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

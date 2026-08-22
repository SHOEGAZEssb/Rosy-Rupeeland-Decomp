#include "tingle/types.h"

/*
 * Overlay 11 font-resource viewer runtime. It selects a 24-byte record,
 * renders its glyph resource as a wrapping atlas, and exposes debug controls
 * for record, palette, grid, display-routing, and member reset state.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov011_021fe3b0[];
extern const char data_ov011_021fe6e4[];
extern const char data_ov011_021fe6ec[];
extern const char data_ov011_021fe6fc[];
extern void *gDebugFont;
extern void *data_020f4e14;
extern void *data_020f4e18;
extern u8 gSystemState[];

extern void *GraphicsArchive_AcquireVfdResource(void *archive, u32 resourceId);
extern void GraphicsArchive_ReleaseResourceE4(void *archive, void *resource);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *renderer);
extern void GraphicsSpriteRenderer_SetFontResource(void *renderer,
                                                    void *resource);
extern s32 GraphicsSpriteRenderer_DrawGlyph(void *renderer, u16 glyph,
                                            s32 x, s32 y, s32 palette);
extern void GraphicsSpriteRenderer_Printf(void *renderer, s32 x, s32 y,
                                          const char *format, ...);
extern void DebugText_Printf(void *renderer, s32 x, s32 y, s32 style,
                             const char *format, ...);
extern void GraphicsSpriteCanvas_FillRect(void *renderer, s32 left, s32 top,
                                          s32 right, s32 bottom, ...);
extern void func_020b44e8(void);
extern void func_ov011_021fce00(u32 select);
extern void func_ov011_021fce50(void *member, s32 x, s32 y, s32 mode);

/* Reset the embedded member from descriptor words 4/5 and return zero. */
s32 func_ov011_021fe02c(void *state)
{
    func_ov011_021fce50((u8 *)state + 0x24, data_ov011_021fe3b0[4],
                        data_ov011_021fe3b0[5] - 0x48, 0);
    return 0;
}

/* Draw one contiguous glyph range into 16-pixel wrapping atlas cells. */
static s32 overlay011_draw_glyph_range(void *renderer, s32 first, s32 end,
                                       s32 palette, s32 *x, s32 *y)
{
    s32 glyph;

    for (glyph = first; glyph < end; ++glyph) {
        *x += GraphicsSpriteRenderer_DrawGlyph(renderer, (u16)glyph, *x, *y,
                                               palette);
        if (*x + 0x10 >= 0x100) {
            *x = 0;
            *y += 0x10;
            if (*y + 0x10 >= 0xc0)
                return 0;
        }
    }
    return 1;
}

/*
 * Acquire the selected record's font resource, bind it to the debug renderer,
 * and draw glyphs 0..95 followed by the language-dependent retail range.
 * The scene retains the acquired handle at +0x78 until selection changes.
 */
void func_ov011_021fdea4(void *state)
{
    u8 *records = FIELD(u8 *, state, 0x7c);
    s32 index = FIELD(s32, state, 0xb8);
    u32 resourceId = FIELD(u32, records, index * 0x18);
    void *resource =
        GraphicsArchive_AcquireVfdResource(data_020f4e18, resourceId);
    s32 x = 0;
    s32 y = 0;

    FIELD(void *, state, 0x78) = resource;
    func_020b44e8();
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    GraphicsSpriteRenderer_SetFontResource(gDebugFont, resource);
    if (!overlay011_draw_glyph_range(gDebugFont, 0, 0x60,
                                     FIELD(s32, state, 0xc0), &x, &y))
        return;
    if (gSystemState[0x5f] == 0)
        overlay011_draw_glyph_range(gDebugFont, 0xf0, 0x1b0,
                                    FIELD(s32, state, 0xc0), &x, &y);
    else
        overlay011_draw_glyph_range(gDebugFont, 0x60, 0xc0,
                                    FIELD(s32, state, 0xc0), &x, &y);
}

/*
 * Update the font viewer from the canonical input words at +0x50. Pressed
 * 0x200 toggles the sub BG mode and pressed 0x400 swaps display routing.
 * Repeated directions select a record or one of fifteen palette values, then
 * release/reacquire the font and redraw its atlas. Render record/grid/palette
 * diagnostics and reset the embedded member on pressed bit 2. Return zero;
 * MMIO, renderer, resource ownership, and member state are observable effects.
 */
s32 func_ov011_021fe06c(void *state)
{
    u8 *input = FIELD(u8 *, state, 0x50);
    u16 pressed = FIELD(u16, input, 0x02);
    u16 repeat = FIELD(u16, input, 0x06);
    volatile u32 *subDispcnt = (volatile u32 *)0x04001000;
    s32 index;

    if (pressed & 0x200) {
        FIELD(s32, state, 0xbc) = !FIELD(s32, state, 0xbc);
        *subDispcnt = (*subDispcnt & ~0x1f00u) |
                      (FIELD(s32, state, 0xbc) ? 0x1100u : 0x1000u);
    } else if (pressed & 0x400) {
        u16 power = *(volatile u16 *)0x04000304;
        func_ov011_021fce00((power & 0x8000u) == 0);
    }

    if (repeat & 0xf0) {
        if (repeat & 0x80) {
            if (++FIELD(s32, state, 0xb8) >= FIELD(s32, state, 0xb4))
                FIELD(s32, state, 0xb8) = 0;
        } else if (repeat & 0x40) {
            if (--FIELD(s32, state, 0xb8) < 0)
                FIELD(s32, state, 0xb8) = FIELD(s32, state, 0xb4) - 1;
        } else if (repeat & 0x10) {
            if (++FIELD(s32, state, 0xc0) >= 14)
                FIELD(s32, state, 0xc0) = 0;
        } else if (repeat & 0x20) {
            if (--FIELD(s32, state, 0xc0) < 0)
                FIELD(s32, state, 0xc0) = 14;
        }
        GraphicsArchive_ReleaseResourceE4(data_020f4e18,
                                          FIELD(void *, state, 0x78));
        func_ov011_021fdea4(state);
    }

    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
    GraphicsSpriteRenderer_Printf(data_020f4e14, 1, 3,
                                  data_ov011_021fe6e4,
                                  FIELD(s32, state, 0xb8),
                                  FIELD(s32, state, 0xb4));
    DebugText_Printf(data_020f4e14, 1, 4, 3,
                     (const char *)FIELD(u8 *, state, 0x7c) +
                         FIELD(s32, state, 0xb8) * 0x18 + 4);
    GraphicsSpriteRenderer_Printf(data_020f4e14, 1, 0x12,
                                  data_ov011_021fe6ec);
    for (index = 0; index < 16; ++index) {
        GraphicsSpriteCanvas_FillRect(data_020f4e14, index * 0x10, 0x60,
                                      index * 0x10 + 0x0e, 0x6e, 0);
        GraphicsSpriteRenderer_Printf(data_020f4e14, index * 2, 0x0b,
                                      data_ov011_021fe6fc, index);
    }
    DebugText_Printf(data_020f4e14, FIELD(s32, state, 0xc0) * 2, 0x0b, 1,
                     data_ov011_021fe6fc, FIELD(s32, state, 0xc0));

    if (pressed & 2)
        func_ov011_021fce50((u8 *)state + 0x24,
                            data_ov011_021fe3b0[6],
                            data_ov011_021fe3b0[7] - 0x48, 0);
    return 0;
}

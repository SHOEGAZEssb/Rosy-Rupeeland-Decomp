#include "tingle/types.h"

/* Overlay 25 record-row label and numeric-value software-canvas redraw. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern u16 data_ov025_02202ef8[];
extern s32 data_ov025_02202f60[];
extern u8 gSystemState[];

#ifdef __cplusplus
extern "C" {
#endif
extern s64 func_020befec(s32, s32);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern s32 GraphicsSpriteRenderer_DrawGlyph(void *, s32, s32, s32, s32);
extern u16 GraphicsSpriteFont_MapCharacterToGlyph(u32);
extern void func_ov025_021fde58(void *);
#ifdef __cplusplus
}
#endif

/*
 * Clears and redraws the row at vertical adjustment `offset`. Active rows draw
 * up to eight label code units with font context +0x30, followed by numeric
 * value +0x84 as up to seven digits with locale separators and selected/un-
 * selected palette 3/5. Inactive rows are only cleared. Font state changes;
 * returns void. The reused label-index and x locals reproduce retail register
 * allocation when they become the numeric value and output-slot counter.
 */
extern "C" void func_ov025_021fdc60(void *widget, s32 offset)
{
    s32 locale = FIELD(u8, gSystemState, 0x5f);
    if (locale >= 6) locale = 5;
    func_ov025_021fde58(widget);
    if (!FIELD(s32, widget, 0x74)) return;
    GraphicsSpriteRenderer_SetFontResource(
        data_020f4e14, FIELD(void *, widget, 0x30));
    s32 row_y = FIELD(s32, widget, 0x78) * 0x3c + 0x14;
    s32 x = FIELD(s32, FIELD(void *, widget, 0xc), 0x18) - 0x18;
    s32 character_index = 0;
    u16 character;
    while (character_index < 8 &&
           (character = FIELD(
                u16, (u32)widget + (character_index << 1), 0x54)) != 0) {
        s32 advance = GraphicsSpriteRenderer_DrawGlyph(
            data_020f4e14, GraphicsSpriteFont_MapCharacterToGlyph(character),
            x, offset + row_y, 14);
        if (advance == 0)
            x += 5;
        else
            x += advance + 1;
        character_index++;
    }

    s32 color = 3;
    if (!FIELD(s32, widget, 0x88)) color += 2;
    GraphicsSpriteRenderer_SetFontResource(
        data_020f4e14, FIELD(void *, widget, 0x34));
    character_index = FIELD(s32, widget, 0x84);
    bool started = false;
    if (character_index < 0) character_index = started;
    if (character_index > 9999999) character_index = 9999999;
    s32 divisor = 1000000;
    s32 base_x = FIELD(s32, FIELD(void *, widget, 0xc), 0x18);
    s32 value_y = FIELD(s32, widget, 0x78) * 0x3c;
    value_y += 0x25;
    s32 y = offset + value_y;
    if (locale != 0) y -= 2;
    for (x = 0; x < 9; ++x) {
        if (x == 1 || x == 5) {
            if (started)
                GraphicsSpriteRenderer_DrawGlyph(
                    data_020f4e14, data_ov025_02202ef8[locale],
                    base_x + data_ov025_02202f60[x], y, color);
            continue;
        }
        s32 digit = (s32)func_020befec(character_index, divisor);
        if (digit || started || divisor == 1) {
            started = true;
            GraphicsSpriteRenderer_DrawGlyph(
                data_020f4e14, (u16)(digit + 0x10),
                base_x + data_ov025_02202f60[x], y, color);
            character_index =
                (s32)(func_020befec(character_index, divisor) >> 32);
        }
        divisor = (s32)func_020befec(divisor, 10);
    }
}

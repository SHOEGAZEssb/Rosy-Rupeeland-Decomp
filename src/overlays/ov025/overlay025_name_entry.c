#include "tingle/types.h"

/* Overlay 25 on-screen name-entry keyboard, glyph sprites, and secret-name check. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* Four-byte special-key glyph/position record; locale selects a group of four. */
struct SpecialGlyphRecord {
    u16 glyph;
    s16 x;
};

extern void *data_020f4e14;
extern void *data_020f4e18;
extern const SpecialGlyphRecord data_ov025_02202f40[];
extern const u16 data_ov025_02202fc0[];
extern const u16 data_ov025_022030f4[];
extern u8 gSystemState[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02071ea4(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GraphicsSpriteRenderer_DrawGlyph(void *, s32, s32, s32, s32);
extern s32 GraphicsSpriteRenderer_GetGlyphMetric(void *, s32);
extern s32 GraphicsSpriteFont_MapCharacterToGlyph(u16);
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
extern s32 func_02092910(void *, void *);
extern void func_ov025_021fd03c(void *, void *, s32);
#ifdef __cplusplus
}
#endif

static bool alternate_locale(void)
{
    return FIELD(u8, gSystemState, 0x5f) != 0;
}

/*
 * Constructs a name-entry widget. It loads resource triplet 0x4006..0x4008,
 * clones its sprite owner, clears sixteen UTF-16 input slots +0x180, creates
 * eight entered-glyph sprites, four locale-specific special-key sprites, and
 * a 7x11 character grid. The locale flag at system state +0x5F selects both
 * keyboard text +0x178 and special-key layout data. Graphics/archive state
 * changes; the initialized widget pointer is returned.
 */
extern "C" void *func_ov025_021fce00(void *widget)
{
    func_02071ea4((u8 *)widget + 4);
    s32 locale = 0;
    FIELD(s32, widget, 0x17c) = 0;
    FIELD(const u16 *, widget, 0x178) = data_ov025_022030f4;
    if (FIELD(u8, gSystemState, 0x5f) != 0) {
        FIELD(const u16 *, widget, 0x178) = data_ov025_02202fc0;
        locale = 1;
    }
    s32 resource_id = 0x4008;
    func_02071ee0((u8 *)widget + 4, data_020f4e18, resource_id - 2,
                  resource_id - 1, resource_id);
    FIELD(void *, widget, 0) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    for (s32 i = 0; i < 16; ++i)
        FIELD(u16, (u8 *)widget + i * 2 + 0x100, 0x80) = 0;

    for (s32 i = 0; i < 8; ++i) {
        ((void **)widget)[i + 4] = GraphicsSpriteGroup_CreateStateFromSource(
            FIELD(void *, widget, 0), (u8 *)widget + 4, 1);
        func_02073e48(((void **)widget)[i + 4], 5, 0x33 + 22 * i, 13,
                      2, 0x100, 1);
    }

    s32 special_index = 0;
    s32 create_source = 1;
    const SpecialGlyphRecord *special =
        data_ov025_02202f40 + locale * 4;
    s32 sprite_layer = 2;
    s32 sprite_scale = 0x100;
    s32 no_flag = special_index;
    s32 animation = 1;
    for (; special_index < 4; ++special_index) {
        ((void **)widget)[special_index + 12] =
            GraphicsSpriteGroup_CreateStateFromSource(
                FIELD(void *, widget, 0), (u8 *)widget + 4, create_source);
        func_02073e48(((void **)widget)[special_index + 12], animation,
                      special[special_index].x, 0xb3, sprite_layer,
                      sprite_scale, no_flag);
        if (special[special_index].glyph == 0)
            FIELD(u16, ((void **)widget)[special_index + 12], 0x24) |= 4;
    }

    for (s32 row = 0; row < 7; ++row) {
        s32 row_index = row * 11;
        s32 row_y = row * 20;
        s32 row_odd = row & 1;
        void **row_sprites = (void **)((u8 *)widget + row_index * 4);
        for (s32 column = 0; column < 11; ++column) {
            void *sprite = GraphicsSpriteGroup_CreateStateFromSource(
                FIELD(void *, widget, 0), (u8 *)widget + 4, 1);
            s32 x = 0x13 + 22 * column + (row_odd ? 2 : -2);
            row_sprites[column + 16] = sprite;
            func_02073e48(
                ((void **)widget)[row * 11 + column + 16], 0,
                x, row_y + 0x24, 2, 0x100, 0);
        }
    }
    FIELD(void *, widget, 0x174) = 0;
    return widget;
}

/*
 * Redraws the entered-name strip with `font_context`. It clears a 255x24 font
 * region, draws all characters before length +0x17C centered over their eight
 * sprites, and marks the next slot selected when `show_cursor` is nonzero.
 * Font and sprite flags/scale change; no value is returned.
 */
extern "C" void func_ov025_021fd03c(void *widget, void *font_context,
                                     s32 show_cursor)
{
    GraphicsSpriteRenderer_SetFontResource(data_020f4e14, font_context);
    GraphicsSpriteCanvas_FillRect(data_020f4e14, 0, 0, 0xff, 0x18, 0);
    s32 i = 0;
    s32 glyph_height = 14;
    s32 glyph_y = 6;
    for (; i < FIELD(s32, widget, 0x17c); ++i) {
        /* Loop-local spelling keeps MWCC's address CSE out of the long-lived
         * parameter registers and restores the retail function size. */
        void **renderer_address = &data_020f4e14;
        s32 glyph = GraphicsSpriteFont_MapCharacterToGlyph(
            FIELD(u16, (u8 *)widget + i * 2 + 0x100, 0x80));
        s32 width = GraphicsSpriteRenderer_GetGlyphMetric(*renderer_address, glyph);
        GraphicsSpriteRenderer_DrawGlyph(
            *renderer_address, glyph,
            /* This pointer-table spelling recovers the retail add/load form. */
            FIELD(s16, ((void **)widget)[i + 4], 0x2c) -
                ((width + (s32)((u32)width >> 31)) >> 1),
            glyph_y, glyph_height);
    }
    for (i = 0; i < 8; ++i) {
        if (FIELD(s32, widget, 0x17c) == i && show_cursor) {
            void *slot = FIELD(void *, (u8 *)widget + i * 4, 0x10);
            FIELD(u16, slot, 0x24) = (FIELD(u16, slot, 0x24) | 2) & ~1;
            FIELD(u16, FIELD(void *, (u8 *)widget + i * 4, 0x10), 0x28) = 0;
        } else {
            void *slot = FIELD(void *, (u8 *)widget + i * 4, 0x10);
            FIELD(u16, slot, 0x24) &= ~2;
            FIELD(u16, FIELD(void *, (u8 *)widget + i * 4, 0x10), 0x28) =
                0x100;
        }
    }
}

/*
 * Rebuilds all keyboard glyphs for `font_context`. It renders the four
 * locale-specific special keys, shows and centers each nonzero 7x11 table
 * character, hides zero entries, then redraws the entered strip with its
 * cursor enabled. Font and sprite visibility change; returns void.
 */
extern "C" void func_ov025_021fd160(void *widget, void *font_context)
{
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
    GraphicsSpriteRenderer_SetFontResource(data_020f4e14, font_context);
    s32 locale = 0;
    if (FIELD(u8, gSystemState, 0x5f) != 0)
        locale = 1;
    const SpecialGlyphRecord *special = data_ov025_02202f40 + locale * 4;
    for (s32 i = 0; i < 4; ++i)
        GraphicsSpriteRenderer_DrawGlyph(
            data_020f4e14, special[i].glyph,
            special[i].x - 5, 0xac,
            14);

    for (s32 row = 0; row < 7; ++row) {
        for (s32 column = 0; column < 11; ++column) {
            s32 index = row * 11 + column;
            if (FIELD(const u16, FIELD(const u16 *, widget, 0x178),
                      index * 2) != 0) {
                void *sprite = ((void **)widget)[index + 16];
                FIELD(u16, sprite, 0x24) &= ~4;
                s32 glyph = GraphicsSpriteFont_MapCharacterToGlyph(
                    FIELD(const u16, FIELD(const u16 *, widget, 0x178),
                          index * 2));
                s32 width = GraphicsSpriteRenderer_GetGlyphMetric(data_020f4e14, glyph);
                s32 x = 0x13 -
                        ((width + (s32)((u32)width >> 31)) >> 1);
                x += 22 * column;
                x += (row & 1) ? 2 : -2;
                GraphicsSpriteRenderer_DrawGlyph(data_020f4e14, glyph,
                              x, 0x1d + 20 * row, 14);
            } else {
                void *sprite = ((void **)widget)[index + 16];
                FIELD(u16, sprite, 0x24) |= 4;
            }
        }
    }
    func_ov025_021fd03c(widget, font_context, 1);
}

/* Restores active sprite phase to 0x100 and clears active pointer +0x174. */
extern "C" void func_ov025_021fd3dc(void *widget)
{
    FIELD(u16, FIELD(void *, widget, 0x174), 0x28) = 0x100;
    FIELD(void *, widget, 0x174) = 0;
}

/*
 * Copies entered non-space UTF-16 characters to `output` and checks a hidden
 * locale-specific name. Alternate locale accepts case-insensitive "TINGLE";
 * the default locale accepts four recovered hiragana codepoints or their
 * +0x60 katakana forms. On a match it appends zero and returns one; otherwise
 * it returns zero and does not append a terminator. Output always receives the
 * compacted non-space prefix.
 */
extern "C" s32 func_ov025_021fd488(void *widget, u16 *output)
{
    s32 i = 0;
    s32 count = 0;
    for (; i < FIELD(s32, widget, 0x17c); ++i) {
        u16 character = FIELD(u16, (u8 *)widget + i * 2 + 0x100, 0x80);
        if (character != 0x20) output[count++] = character;
    }
    if (FIELD(u8, gSystemState, 0x5f) != 0) {
        if (count != 6) goto no_match;
        if (output[0] != 'T' && output[0] != 't') goto no_match;
        if (output[1] != 'I' && output[1] != 'i') goto no_match;
        if (output[2] != 'N' && output[2] != 'n') goto no_match;
        if (output[3] != 'G' && output[3] != 'g') goto no_match;
        if (output[4] != 'L' && output[4] != 'l') goto no_match;
        if (output[5] != 'E' && output[5] != 'e') goto no_match;
        output[6] = 0;
        return 1;
    } else {
        if (count != 4) goto no_match;
        if (output[0] != 0x3061 && output[0] != 0x3061 + 0x60) goto no_match;
        if (output[1] != 0x3093 && output[1] != 0x3093 + 0x60) goto no_match;
        if (output[2] != 0x304f && output[2] != 0x304f + 0x60) goto no_match;
        if (output[3] != 0x308b && output[3] != 0x308b + 0x60) goto no_match;
        output[4] = 0;
        return 1;
    }
no_match:
    return 0;
}

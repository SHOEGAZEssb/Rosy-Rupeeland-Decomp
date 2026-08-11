#include "tingle/types.h"

/* Overlay 25 on-screen name-entry keyboard, glyph sprites, and secret-name check. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern const u8 data_ov025_02202f40[];
extern const u16 data_ov025_02202fc0[];
extern const u16 data_ov025_022030f4[];
extern void *gSystemState;

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
    FIELD(const u16 *, widget, 0x178) = data_ov025_022030f4;
    FIELD(s32, widget, 0x17c) = 0;
    s32 locale = alternate_locale() ? 1 : 0;
    if (locale) FIELD(const u16 *, widget, 0x178) = data_ov025_02202fc0;
    func_02071ee0((u8 *)widget + 4, data_020f4e18,
                  0x4006, 0x4007, 0x4008);
    FIELD(void *, widget, 0) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    for (s32 i = 0; i < 16; ++i) FIELD(u16, widget, 0x180 + i * 2) = 0;

    for (s32 i = 0; i < 8; ++i) {
        void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, widget, 0),
                                     (u8 *)widget + 4, 1);
        FIELD(void *, widget, 0x10 + i * 4) = sprite;
        func_02073e48(sprite, 5, 0x33 + 22 * i, 13, 2, 0x100, 1);
    }

    const u8 *special = data_ov025_02202f40 + locale * 16;
    for (s32 i = 0; i < 4; ++i) {
        void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, widget, 0),
                                     (u8 *)widget + 4, 1);
        FIELD(void *, widget, 0x30 + i * 4) = sprite;
        func_02073e48(sprite, 1, FIELD(s16, special, i * 4 + 2),
                      0xb3, 2, 0x100, 0);
        if (FIELD(u16, special, i * 4) == 0)
            FIELD(u16, sprite, 0x24) |= 4;
    }

    for (s32 row = 0; row < 7; ++row) {
        for (s32 column = 0; column < 11; ++column) {
            s32 index = row * 11 + column;
            void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, widget, 0),
                                         (u8 *)widget + 4, 1);
            FIELD(void *, widget, 0x40 + index * 4) = sprite;
            s32 x = 0x13 + 22 * column + ((row & 1) ? 2 : -2);
            func_02073e48(sprite, 0, x, 0x24 + 20 * row, 2, 0x100, 0);
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
        s32 glyph = GraphicsSpriteFont_MapCharacterToGlyph(
            FIELD(u16, (u8 *)widget + i * 2 + 0x100, 0x80));
        s32 width = GraphicsSpriteRenderer_GetGlyphMetric(data_020f4e14, glyph);
        GraphicsSpriteRenderer_DrawGlyph(
            data_020f4e14, glyph,
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
    const u8 *special = data_ov025_02202f40 +
                        (alternate_locale() ? 16 : 0);
    for (s32 i = 0; i < 4; ++i)
        GraphicsSpriteRenderer_DrawGlyph(data_020f4e14, FIELD(u16, special, i * 4),
                      FIELD(s16, special, i * 4 + 2) - 5, 0xac, 14);

    for (s32 row = 0; row < 7; ++row) {
        for (s32 column = 0; column < 11; ++column) {
            s32 index = row * 11 + column;
            u16 character = FIELD(const u16, FIELD(const u16 *, widget, 0x178),
                                  index * 2);
            void *sprite = FIELD(void *, widget, 0x40 + index * 4);
            if (character != 0) {
                FIELD(u16, sprite, 0x24) &= (u16)~4;
                s32 glyph = GraphicsSpriteFont_MapCharacterToGlyph(character);
                s32 width = GraphicsSpriteRenderer_GetGlyphMetric(data_020f4e14, glyph);
                s32 x = 0x13 + 22 * column + ((row & 1) ? 2 : -2) -
                        ((width + (s32)((u32)width >> 31)) >> 1);
                GraphicsSpriteRenderer_DrawGlyph(data_020f4e14, (u16)glyph,
                              x, 0x1d + 20 * row, 14);
            } else {
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
    s32 count = 0;
    for (s32 i = 0; i < FIELD(s32, widget, 0x17c); ++i) {
        u16 character = FIELD(u16, widget, 0x180 + i * 2);
        if (character != 0x20) output[count++] = character;
    }
    if (alternate_locale()) {
        static const char word[] = "TINGLE";
        if (count != 6) return 0;
        for (s32 i = 0; i < 6; ++i)
            if (output[i] != (u16)word[i] &&
                output[i] != (u16)(word[i] + ('a' - 'A'))) return 0;
    } else {
        static const u16 word[] = { 0x3061, 0x3093, 0x304f, 0x308b };
        if (count != 4) return 0;
        for (s32 i = 0; i < 4; ++i)
            if (output[i] != word[i] && output[i] != word[i] + 0x60) return 0;
    }
    output[count] = 0;
    return 1;
}

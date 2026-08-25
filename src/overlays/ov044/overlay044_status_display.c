#include "tingle/types.h"

/*
 * Overlay 44 status display. These recovered helpers draw a right-aligned
 * localized status string and select whether the debug-font preview displays
 * the currently selected panel item or its fallback/hidden state.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *gDebugFont;
extern "C" u8 data_021f3ecc[];
extern "C" void GraphicsSpriteCanvas_FillRect(void *font, s32 x, s32 y, s32 color,
                               s32 width, s32 flags);
extern "C" void *GraphicsSpriteRenderer_SetFontResource(void *font, void *presentation);
extern "C" const void *LanguageLookupDatabase_GetResourceById(const void *table, u16 index);
extern "C" s32 GraphicsSpriteRenderer_MeasureText(void *font, const void *text, s32 mode,
                              s32 flags);
extern "C" void GraphicsSpriteRenderer_DrawText(void *font, const void *text, s32 x, s32 y,
                               s32 color, s32 mode, s32 flags);
extern "C" void GraphicsSpriteRenderer_ClearTextBuffer(void *font);
extern "C" void *func_ov044_0220bd98(void *panel);
extern "C" u32 func_ov044_0220bb48(void *record, u32 mask);
extern "C" void Overlay001_PopulatePresentation(void *preview, void *item, s32 mode);
extern "C" void func_ov001_021fb81c(void *preview, s32 mode);

/*
 * Clear a 22-pixel-wide region at y=6 in the debug font, select scene font
 * presentation +0x54, look up the supplied low 16-bit message ID in
 * data_021f3ecc, measure it in mode 8, then draw it right-aligned to x=248 at
 * y=6 using color 14/mode 4. Font state and pixels change; no value is
 * returned.
 */
extern "C" void func_ov044_0220c74c(void *object, u32 messageId)
{
    GraphicsSpriteCanvas_FillRect(gDebugFont, 0, 6, 0xff, 0x16, 0);
    GraphicsSpriteRenderer_SetFontResource(gDebugFont,
                                           FIELD(void *, object, 0x54));
    const void *text = LanguageLookupDatabase_GetResourceById(data_021f3ecc, (u16)messageId);
    s32 width = GraphicsSpriteRenderer_MeasureText(gDebugFont, text, 8, 0);
    text = LanguageLookupDatabase_GetResourceById(data_021f3ecc, (u16)messageId);
    GraphicsSpriteRenderer_DrawText(gDebugFont, text, 0xf8 - width, 6, 14, 4, 0);
}

/*
 * Reset debug-font state, draw status message 0x2A, then update preview +0x22C.
 * When a panel exists and its selected record does not have item flag one,
 * show that record's item pointer +0x0C in mode zero; otherwise select fallback
 * mode one. Debug-font and preview state change; no value is returned.
 */
extern "C" void func_ov044_0220c80c(void *object)
{
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    func_ov044_0220c74c(object, 0x2a);
    void *panel = FIELD(void *, object, 0x228);
    if (panel) {
        void *record = func_ov044_0220bd98(panel);
        if (!func_ov044_0220bb48(record, 1)) {
            record = func_ov044_0220bd98(panel);
            Overlay001_PopulatePresentation(FIELD(void *, object, 0x22c),
                                FIELD(void *, record, 0xc), 0);
            return;
        }
    }
    func_ov001_021fb81c(FIELD(void *, object, 0x22c), 1);
}

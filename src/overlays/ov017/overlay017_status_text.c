#include "tingle/types.h"

/* Overlay 17 debug-font status labels and centered value-line rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern u8 data_021f3ecc[];
extern u8 data_ov017_022016e0[];
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern const char *func_020628c8(s32);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GraphicsSpriteText_FormatDecimal(char *, s32, s32, s32);
extern s32 GraphicsSpriteRenderer_DrawText(void *, const char *, s32, s32, s32, s32, s32);
extern s32 GraphicsSpriteRenderer_MeasureText(void *, const char *, s32, s32);
extern const char *func_020791e0(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Refresh the debug-font renderer and bind state component +0x1D8. Draw a label
 * selected by +0x3BC (message 0x2D4/0x2D5) at (0x90,0x41), then a second label
 * selected by overlay-global +0x80 at (0x90,0x51). Format numericValue with
 * lower bound -1000, resolve textValue through 0x020628C8, measure that text,
 * separator message 0x2D6, and the formatted number, and center the combined
 * line within 0x70 pixels when necessary. Draw the three pieces at Y=0x68.
 * Font/render state changes; the function returns void and has no direct MMIO.
 */
extern "C" void func_ov017_021ffdb4(void *state, s32 textValue,
                                     s32 numericValue)
{
    char numberText[32];
    const char *label;
    const char *valueText;
    const char *separator;
    s32 width;
    s32 x = 0x48;

    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    GraphicsSpriteRenderer_SetFontResource(gDebugFont, FIELD(void *, state, 0x1d8));
    label = func_020791e0(data_021f3ecc,
                          FIELD(s32, state, 0x3bc) ? 0x2d4 : 0x2d5);
    GraphicsSpriteRenderer_DrawText(gDebugFont, label, 0x90, 0x41, 0xe, 4, 0);
    label = func_020791e0(data_021f3ecc,
                          FIELD(s32, data_ov017_022016e0, 0x80) ? 0x2d5
                                                               : 0x2d4);
    GraphicsSpriteRenderer_DrawText(gDebugFont, label, 0x90, 0x51, 0xe, 4, 0);

    GraphicsSpriteText_FormatDecimal(numberText, numericValue, -1000, 0);
    valueText = func_020628c8(textValue);
    width = GraphicsSpriteRenderer_MeasureText(gDebugFont, valueText, 6, -1) + 2;
    separator = func_020791e0(data_021f3ecc, 0x2d6);
    width += GraphicsSpriteRenderer_MeasureText(gDebugFont, separator, 6, 0) + 2;
    width += GraphicsSpriteRenderer_MeasureText(gDebugFont, numberText, 6, 0);
    if (width > 0x70) {
        x += 0x38 - width / 2;
    }
    width = GraphicsSpriteRenderer_DrawText(gDebugFont, func_020628c8(textValue), x, 0x68,
                          0xe, 6, -1);
    x += width + 2;
    width = GraphicsSpriteRenderer_DrawText(gDebugFont,
                          func_020791e0(data_021f3ecc, 0x2d6), x + 2, 0x68,
                          0xe, 6, 0);
    x += width + 4;
    GraphicsSpriteRenderer_DrawText(gDebugFont, numberText, x + 2, 0x68, 0xe, 6, 0);
}

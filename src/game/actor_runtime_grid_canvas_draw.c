#include "tingle/actor_runtime_grid_canvas.h"

/* Draw numbered cells and selection outlines for the 10-by-9 grid canvas. */

#ifdef __cplusplus
extern "C" {
#endif
extern const char gDebugPhaseGridLabelFormat[];
extern void *gDebugFont;
extern void GraphicsSpriteCanvas_FillRect(void *font, s32 x0, s32 y0, s32 x1, s32 y1,
                          s32 color);
#ifdef __cplusplus
}
#endif

/*
 * Draw 90 numbered cells in nine rows and ten columns. Each label is
 * pageIndex*90 + row*10 + column + 1 and uses the recovered format string
 * gDebugPhaseGridLabelFormat. Then draw two nested selection outlines around
 * the requested row/column through the debug-font rectangle helper. Returns
 * no value; the software canvas and debug-font buffer are modified, with no
 * direct hardware writes.
 */
void DebugPhaseGridCanvas_DrawPage(DebugPhaseGridCanvas *self,
                                   s32 selectedColumn, s32 selectedRow)
{
    s32 gridRow;

    for (gridRow = 0; gridRow < 9; gridRow++) {
        s32 gridColumn;

        for (gridColumn = 0; gridColumn < 10; gridColumn++) {
            RectS32 rectangle = {0, 0, 24, 20};
            s32 value;

            RectS32_Translate(&rectangle, gridColumn * 24, gridRow * 20);
            RectS32_Translate(&rectangle, 9, 6);
            value = self->pageIndex * 90 + gridRow * 10 + gridColumn + 1;
            SoftwareCanvas_DrawFormattedText(&self->base, rectangle.left + 1,
                          rectangle.top + 4, gDebugPhaseGridLabelFormat, value);
        }
    }

    GraphicsSpriteCanvas_FillRect(gDebugFont, selectedColumn * 24 + 7,
                  selectedRow * 20 + 4, (selectedColumn + 1) * 24 + 11,
                  (selectedRow + 1) * 20 + 8, 9);
    GraphicsSpriteCanvas_FillRect(gDebugFont, selectedColumn * 24 + 11,
                  selectedRow * 20 + 8, (selectedColumn + 1) * 24 + 7,
                  (selectedRow + 1) * 20 + 4, 0);
}

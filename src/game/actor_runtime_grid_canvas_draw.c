#include "tingle/actor_runtime_grid_canvas.h"

/* Draw numbered cells and selection outlines for the 10-by-9 grid canvas. */

#ifdef __cplusplus
extern "C" {
#endif
extern const char data_020d52f4[];
extern void *gDebugFont;
extern void func_02076428(void *font, s32 x0, s32 y0, s32 x1, s32 y1,
                          s32 color);
#ifdef __cplusplus
}
#endif

/*
 * Draw 90 numbered cells in nine rows and ten columns. Each label is
 * selectedCell*90 + row*10 + column + 1 and uses the recovered format string
 * data_020d52f4. Then draw two nested selection outlines around the requested
 * row/column through the debug-font rectangle helper. Returns no value; the
 * software canvas and debug-font buffer are modified, with no direct hardware
 * writes.
 */
void func_0200c00c(ActorRuntimeGridCanvas *self, s32 row, s32 column)
{
    s32 gridRow;

    for (gridRow = 0; gridRow < 9; gridRow++) {
        s32 gridColumn;

        for (gridColumn = 0; gridColumn < 10; gridColumn++) {
            s32 rectangle[4] = {0, 0, 24, 20};
            s32 value;

            func_0200c144(rectangle, gridColumn * 24, gridRow * 20);
            func_0200c144(rectangle, 9, 6);
            value = self->selectedCell * 90 + gridRow * 10 + gridColumn + 1;
            func_02006078(&self->base, rectangle[0] + 1,
                          rectangle[1] + 4, data_020d52f4, value);
        }
    }

    func_02076428(gDebugFont, row * 24 + 7, column * 20 + 4,
                  (row + 1) * 24 + 11, (column + 1) * 20 + 8, 9);
    func_02076428(gDebugFont, row * 24 + 11, column * 20 + 8,
                  (row + 1) * 24 + 7, (column + 1) * 20 + 4, 0);
}

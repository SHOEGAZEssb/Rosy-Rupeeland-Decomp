#include "tingle/software_canvas.h"

/*
 * Formatted text rendering for SoftwareCanvas. This front end formats a line
 * into stack storage and sends each byte to the recovered 8x8 glyph blitter.
 */

enum { SOFTWARE_CANVAS_TEXT_LIMIT = 0x100,
       SOFTWARE_CANVAS_TEXT_BUFFER_SIZE = 0x104 };

#ifdef __cplusplus
extern "C" {
#endif

extern s32 func_020b3598(char *destination, const char *format, void *args);
extern void OS_Halt(void);

#ifdef __cplusplus
}
#endif

/*
 * Set the shared cursor to (x,y), format the variadic arguments, and draw the
 * returned byte count from left to right in eight-pixel steps. A length of 256
 * or more halts the system before termination or drawing; otherwise the stack
 * string is terminated and each signed byte selects a glyph. Destination
 * pixels and the shared cursor change, and no value is returned.
 */
void SoftwareCanvas_DrawFormattedText(SoftwareCanvas *self, s32 x, s32 y,
                   const char *format, ...)
{
    char buffer[SOFTWARE_CANVAS_TEXT_BUFFER_SIZE];
    void *args;
    s32 length;
    s32 i;

    gSoftwareCanvasTextCursor.x = x;
    gSoftwareCanvasTextCursor.y = y;
    args = (void *)(((u32)&format & ~3) + sizeof(format));
    length = func_020b3598(buffer, format, args);
    if (length >= SOFTWARE_CANVAS_TEXT_LIMIT)
        OS_Halt();

    buffer[length] = '\0';
    for (i = 0; i < length; i++) {
        SoftwareCanvas_DrawGlyph(self, (s8)buffer[i]);
        gSoftwareCanvasTextCursor.x += 8;
    }
}

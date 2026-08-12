#include "tingle/graphics_sprite_canvas.h"
#include "tingle/types.h"

/* Retail progress/status bar drawing used by the overlay-90 boss-stage controller. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern s32 func_020befec(s32 numerator, s32 denominator);

/*
 * Move signed fields +0x238/+0x23a toward countdown +0x220 at rates 16 and 6,
 * convert their ranges into a 176-pixel bar, and draw the three colored spans,
 * border, and active marker on the shared sprite canvas.
 */
void func_ov090_0221a8bc(void *self)
{
    s16 lower;
    s32 firstWidth;
    s32 secondWidth;

    if (FIELD(s16, self, 0x238) >= FIELD(s16, self, 0x220) + 0x10) {
        FIELD(s16, self, 0x238) -= 0x10;
    } else {
        FIELD(s16, self, 0x238) = FIELD(s16, self, 0x220);
        if (FIELD(s16, self, 0x23a) >= FIELD(s16, self, 0x220) + 6)
            FIELD(s16, self, 0x23a) -= 6;
        else
            FIELD(s16, self, 0x23a) = FIELD(s16, self, 0x220);
    }

    lower = FIELD(s16, self, 0x238);
    firstWidth = func_020befec(lower * 0xb0, 2000);
    secondWidth = func_020befec((FIELD(s16, self, 0x23a) - lower) * 0xb0,
                                2000);
    if (firstWidth > 0)
        GraphicsSpriteCanvas_FillRect(data_020f4e14, 0x30, 9,
                                      firstWidth + 0x30, 0x0f, 3);
    if (secondWidth > 0) {
        s32 secondStart = firstWidth + 0x30;

        GraphicsSpriteCanvas_FillRect(data_020f4e14, secondStart, 9,
                                      secondStart + secondWidth, 0x0f, 7);
    }
    if (0xb0 - (firstWidth + secondWidth) > 0)
        GraphicsSpriteCanvas_FillRect(data_020f4e14,
                                      firstWidth + secondWidth + 0x30, 9,
                                      0xe0, 0x0f, 6);
    GraphicsSpriteCanvas_FillRect(data_020f4e14, 0x30, 8, 0xe0, 9, 6);
    GraphicsSpriteCanvas_FillRect(data_020f4e14, 0x30, 0x0f, 0xe0, 0x10, 6);
    GraphicsSpriteCanvas_FillRect(data_020f4e14, 0xe0, 9, 0xe1, 0x0f, 6);
    if (FIELD(s16, self, 0x238) > 0)
        GraphicsSpriteCanvas_DrawLine(data_020f4e14, 0x2f, 0x0a, 0x2f, 0x0e,
                                      3);
}

#include "tingle/types.h"

/* Overlay 25 saved-record row font-canvas clearing helper. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Clears the row's 0x40..0xC0 font rectangle at the vertical band selected by
 * row index +0x78. Font-canvas pixels change; returns no value.
 */
extern "C" void func_ov025_021fde58(void *widget)
{
    s32 y = FIELD(s32, widget, 0x78) * 0x3c;
    GraphicsSpriteCanvas_FillRect(data_020f4e14, 0x40, y + 0x14,
                                  0xc0, y + 0x30, 0);
}

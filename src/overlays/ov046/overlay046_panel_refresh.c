#include "tingle/types.h"

/*
 * Overlay 46 panel refresh bridge. This recovered helper rebuilds the panel's
 * visible content and synchronizes its screen-relative font translation.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_ov046_0220bd14(void *panel);
extern "C" void func_020740a4(void *fontState);

/*
 * Rebuild visible panel content, write translation (128-x, 96-y) into font
 * state +0x18/+0x1C, and submit that state. The panel and renderer state
 * change; the function has no return value and no direct hardware access.
 */
extern "C" void func_ov046_0220c1a4(void *panel)
{
    func_ov046_0220bd14(panel);
    FIELD(s32, FIELD(void *, panel, 4), 0x18) =
        0x80 - FIELD(s32, panel, 0x10c);
    FIELD(s32, FIELD(void *, panel, 4), 0x1c) =
        0x60 - FIELD(s32, panel, 0x110);
    func_020740a4(FIELD(void *, panel, 4));
}

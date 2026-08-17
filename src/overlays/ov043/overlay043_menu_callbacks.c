#include "tingle/types.h"

/*
 * Overlay 43 menu callbacks. These recovered states enter the product menu
 * and dispatch touch selections among its three text-canvas regions.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *data_020f4e14;
extern "C" void *gDebugFont;
extern "C" u32 data_ov043_0220c448[];
extern "C" u32 data_ov043_0220c458[];
extern "C" u32 data_ov043_0220c488[];
extern "C" u32 data_ov043_0220c490[];
extern "C" void GraphicsSpriteRenderer_ClearTextBuffer(void *font);
extern "C" void func_ov043_0220b744(void *object, u32 first, u32 second);
extern "C" s32 func_02095860(void *canvas, const void *input,
                              s32 first, s32 second);
extern "C" void func_02092260(void *object, s32 mode);
extern "C" void Overlay043_UpdatePresentationResources(void *object);

/*
 * Enter the initial menu state. On state counter +0x04 zero, activate both
 * font resources, install callbacks from data_ov043_0220c448, and set flag bit
 * zero at +0x20. Returns zero; font/resource and controller state change.
 */
extern "C" s32 func_ov043_0220bd58(void *object)
{
    if (FIELD(s32, object, 4) == 0) {
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        func_ov043_0220b744(object, data_ov043_0220c448[0],
                             data_ov043_0220c448[1]);
        FIELD(u32, object, 0x20) |= 1;
    }
    return 0;
}

/*
 * Update menu selection. State zero advances to one and clears +0x08. Once
 * controller flag 0x20 is set, test canvases +0x13C, +0x1E8, and +0x90 against
 * input +0x30. A hit selects mode 2/2/3, stores page index zero/one at +0x58,
 * and installs the corresponding callback pair. Always flush presentation
 * resources through Overlay043_UpdatePresentationResources and return zero.
 */
extern "C" s32 func_ov043_0220bdb8(void *object)
{
    s32 state = FIELD(s32, object, 4);
    if (state == 0) {
        FIELD(s32, object, 4) = 1;
        FIELD(s32, object, 8) = 0;
        state = 1;
    }
    if (state == 1 && (FIELD(u32, object, 0x20) & 0x20)) {
        if (func_02095860((u8 *)object + 0x13c, (u8 *)object + 0x30, 0, 4)) {
            func_02092260(object, 2);
            FIELD(s32, object, 0x58) = 0;
            func_ov043_0220b744(object, data_ov043_0220c490[0],
                                 data_ov043_0220c490[1]);
        } else if (func_02095860((u8 *)object + 0x1e8,
                                  (u8 *)object + 0x30, 0, 4)) {
            func_02092260(object, 2);
            FIELD(s32, object, 0x58) = 1;
            func_ov043_0220b744(object, data_ov043_0220c488[0],
                                 data_ov043_0220c488[1]);
        } else if (func_02095860((u8 *)object + 0x90,
                                  (u8 *)object + 0x30, 0, 4)) {
            func_02092260(object, 3);
            func_ov043_0220b744(object, data_ov043_0220c458[0],
                                 data_ov043_0220c458[1]);
        }
    }
    Overlay043_UpdatePresentationResources(object);
    return 0;
}

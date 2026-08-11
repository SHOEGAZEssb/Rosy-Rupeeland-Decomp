#include "tingle/types.h"

/* Overlay 25 three-row controller layout and presentation selection. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095820(void *, s32, s32);
extern void func_02095928(void *);
extern void func_02095988(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Copy the retail 3-by-3 y-coordinate template, select `layout`, and apply its
 * rows to the three 0xAC-byte controllers at scene +0x2F4. Each controller is
 * placed at x=212, assigned animation 32/34/36, and shown. Returns void; sprite
 * position, animation, and visibility state change. The local initializer emits
 * the confirmed 36-byte template at overlay address 0x02202CCC.
 */
extern "C" void func_ov025_02200498(void *scene, s32 layout)
{
    s32 layoutPositions[3][3] = {
        {27, 55, 83},
        {72, 100, 128},
        {117, 145, 173},
    };
    s32 i;
    const s32 *positions = layoutPositions[layout];
    for (i = 0; i < 3; ++i) {
        void *controller = (u8 *)scene + 0x2f4 + i * 0xac;
        func_02095820(controller, 0xd4, (s16)positions[i]);
        func_02095988(controller, 0x20 + i * 2);
        func_02095928(controller);
    }
}

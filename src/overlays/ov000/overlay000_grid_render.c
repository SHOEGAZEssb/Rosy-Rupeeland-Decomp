#include "tingle/types.h"

/*
 * Overlay 0 grid rendering. This recovered helper redraws the scrolled panel
 * background and the numeric labels for its five-by-three visible cell window.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000GridRenderState {
    u8 field_000[0x04];
    void *surface_004;
    u8 field_008[0x220];
    void *resource_228;
    u8 field_22c[0x24];
    void *metadata_250;
    s32 cellCount_254;
    u8 field_258[0x0c];
    s32 scrollY_264;
    u8 field_268[0x04];
    void *controller_26c;
} Overlay000GridRenderState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02076428(void *surface, s32 left, s32 top, s32 right,
                          s32 bottom, s32 value);
extern void func_02075598(void *surface, void *resource);
extern s32 func_ov000_021fc834(void *metadata, s32 mode);
extern s32 func_02062ba4(void *cell);
extern void func_ov000_021fb6e0(void *surface, s32 value, s32 x, s32 y,
                                s32 offset);
#ifdef __cplusplus
}
#endif

/*
 * Clear/update the surface using the rectangle (0x3B, 0x3D-scrollY) through
 * (0xEF, 0xA9-scrollY), then attach resource_228. Visit up to three rows and
 * five columns beginning at controller field 0x0C. For each allocated metadata
 * record with a linked cell, draw its value from +0x1C only when the local
 * eligibility helper returns zero and func_02062ba4 returns nonzero. Labels use
 * an X offset of 13 below 99 and 7 otherwise. Rendering effects are delegated
 * to the graphics callees; this routine does not directly access hardware.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fc714(Overlay000GridRenderState *state)
{
    s32 row;

    func_02076428(state->surface_004, 0x3b, 0x3d - state->scrollY_264,
                  0xef, 0xa9 - state->scrollY_264, 0);
    func_02075598(state->surface_004, state->resource_228);

    for (row = 0; row < 3; row++) {
        s32 baseIndex =
            (row + FIELD(s32, state->controller_26c, 0x0c)) * 5;
        s32 column;

        for (column = 0; column < 5; column++) {
            s32 index = baseIndex + column;
            void *metadata;
            void *cell;
            s32 value;

            if (index >= state->cellCount_254) {
                break;
            }
            metadata = (u8 *)state->metadata_250 + index * 0x20;
            cell = FIELD(void *, metadata, 0x0c);
            if (cell == 0 || func_ov000_021fc834(metadata, 1) != 0) {
                continue;
            }
            value = FIELD(s32, metadata, 0x1c);
            if (func_02062ba4(cell) != 0) {
                func_ov000_021fb6e0(state->surface_004, value,
                                    column * 0x24 + 0x3b,
                                    row * 0x24 - state->scrollY_264 + 0x3d,
                                    value >= 99 ? 7 : 13);
            }
        }
    }
}

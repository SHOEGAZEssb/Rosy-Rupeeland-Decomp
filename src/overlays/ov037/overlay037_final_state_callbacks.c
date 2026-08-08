#include "tingle/types.h"

/* Overlay 37 final presentation setup and outer input/completion state callbacks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov037_021fec88[2];
extern u8 gSystemState[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov037_021fe4d4(void *node, void *value24, void *value28);
extern s32 func_ov037_021fce48(void *controller);
extern void func_ov037_021fe81c(void *presentation);
#ifdef __cplusplus
}
#endif

/*
 * Runs a two-stage presentation setup at +4. Stage 0 advances to stage 1 and
 * clears +8, then falls through; stage 1 enables flag bit 0 at +0x20 and loads
 * the node values from data_ov037_021fec88. Other states do nothing. Always
 * returns 0; only presentation state changes.
 */
extern "C" s32 func_ov037_021fe8bc(void *presentation)
{
    switch (FIELD(s32, presentation, 4)) {
    case 0:
        ++FIELD(s32, presentation, 4);
        FIELD(s32, presentation, 8) = 0;
        /* Intentional fallthrough. */
    case 1:
        FIELD(u32, presentation, 0x20) |= 1;
        func_ov037_021fe4d4(presentation,
                            (void *)data_ov037_021fec88[0],
                            (void *)data_ov037_021fec88[1]);
        break;
    default:
        break;
    }
    return 0;
}

/*
 * Drives the outer three-stage presentation state at +4. Stage 0 copies the
 * global system word at +0x64 to +0x4B8, advances, clears +8, and immediately
 * samples input. Stage 1 advances when the embedded scene input controller at
 * +0x5C reports nonzero. Stage 2 draws once and returns 1; all other paths draw
 * and return 0. Presentation, scene/input, and geometry state may change.
 */
extern "C" s32 func_ov037_021fe910(void *presentation)
{
    switch (FIELD(s32, presentation, 4)) {
    case 0:
        FIELD(s32, presentation, 0x4b8) = FIELD(s32, gSystemState, 0x64);
        ++FIELD(s32, presentation, 4);
        FIELD(s32, presentation, 8) = 0;
        /* Intentional fallthrough. */
    case 1:
        if (func_ov037_021fce48(FIELD(void *, presentation, 0x5c))) {
            ++FIELD(s32, presentation, 4);
            FIELD(s32, presentation, 8) = 0;
        }
        break;
    case 2:
        func_ov037_021fe81c(presentation);
        return 1;
    default:
        break;
    }
    func_ov037_021fe81c(presentation);
    return 0;
}

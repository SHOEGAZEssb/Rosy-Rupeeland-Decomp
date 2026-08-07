#include "tingle/types.h"

/*
 * Overlay 5 scene-selection update. This recovered helper toggles a draw-item
 * flag, records the selected index, and starts two associated animations.
 */

typedef struct Overlay005SceneSelectionState {
    u8 field_000[0x100];
    s32 selectedIndex_100;
    s32 field_104;
    s32 upperIndex_108;
    u8 field_10c[0x04];
    u8 animation_110[0x10];
    s32 animationValue_120;
    u8 field_124[0x08];
    u8 animation_12c[0x1c];
} Overlay005SceneSelectionState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02091bac(void *animation, s32 mode, s32 value, s32 target,
                          s32 duration);
extern void func_02091b98(void *animation, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * For indices 0 through upperIndex_108 inclusive, set bit 2 in the halfword
 * at +0x24 of each draw pointer stored at state +0xC8+index*4. Clear that bit
 * on the selected draw when its pointer is non-null, retain selectedIndex at
 * +0x100, start animation +0x110 in mode 2 from animationValue_120 to 0xA000
 * over 10 frames, then submit value 1 to animation +0x12C. Return no value.
 * The flag's visual meaning is unknown; all pointer offsets and animation
 * arguments are confirmed and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov005_021fbd74(Overlay005SceneSelectionState *state,
                          s32 selectedIndex)
{
    s32 index;
    void **draws = (void **)((u8 *)state + 0xc8);
    void *selected;

    for (index = 0; index <= state->upperIndex_108; index++) {
        *(u16 *)((u8 *)draws[index] + 0x24) |= 4;
    }
    selected = draws[selectedIndex];
    if (selected != 0) {
        *(u16 *)((u8 *)selected + 0x24) &= ~4;
    }
    state->selectedIndex_100 = selectedIndex;
    func_02091bac(state->animation_110, 2, state->animationValue_120, 0xa000,
                  10);
    func_02091b98(state->animation_12c, 1);
}

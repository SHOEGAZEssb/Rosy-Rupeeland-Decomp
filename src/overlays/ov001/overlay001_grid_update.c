#include "tingle/types.h"

/*
 * Overlay 1 grid animation update. This recovered helper advances owned UI
 * objects and drives a target halfword from the Nitro fixed-point sine table.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001GridUpdateState {
    u8 field_000[0x08];
    void *spriteGroup_008;
    void *spriteGroup_00c;
    u8 field_010[0x0c];
    void *animatedTarget_01c;
    u8 field_020[0x08];
    u8 element_028[0xac];
    u8 element_0d4[0xe8];
    void *controller_1bc;
    u8 field_1c0[0x38];
    u32 phase_1f8;
    s32 delay_1fc;
    u32 phaseStep_200;
} Overlay001GridUpdateState;

#ifdef __cplusplus
extern "C" {
#endif
extern const s16 gFx32CosSinTable[];
extern void GraphicsSpriteGroup_AdvanceAnimations(void *group);
extern void InventoryScroll_UpdatePresentation(void *controller);
extern void SpriteMotionController_Update(void *element);
#ifdef __cplusplus
}
#endif

/*
 * Advance elements +0x28/+0xD4, sprite groups +8/+0x0C, and controller +0x1BC.
 * Return if animatedTarget_01C is null. While delay_1FC is positive, decrement
 * it and return. Otherwise advance phase_1F8 by phaseStep_200, sample the odd
 * sine-table component, scale by 0x1052 with fixed-point rounding, divide by
 * 16, clamp to +/-0x100, replace zero with 0x10, and store target halfword
 * +0x32. Helpers may update graphics state; no hardware register is touched.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fbf7c(Overlay001GridUpdateState *state)
{
    s32 value;
    s64 product;
    u32 phase;
    u32 tableIndex;

    SpriteMotionController_Update(state->element_028);
    SpriteMotionController_Update(state->element_0d4);
    GraphicsSpriteGroup_AdvanceAnimations(state->spriteGroup_008);
    GraphicsSpriteGroup_AdvanceAnimations(state->spriteGroup_00c);
    InventoryScroll_UpdatePresentation(state->controller_1bc);
    if (state->animatedTarget_01c == 0) {
        return;
    }
    if (state->delay_1fc > 0) {
        state->delay_1fc--;
        return;
    }
    phase = state->phase_1f8 + state->phaseStep_200;
    state->phase_1f8 = phase;
    tableIndex = ((u16)phase >> 4) * 2 + 1;
    product = (s64)gFx32CosSinTable[tableIndex] * 0x1052 + 0x800;
    value = (s32)(product >> 12);
    value /= 0x10;
    if (value < -0x100) {
        value = -0x100;
    } else if (value > 0x100) {
        value = 0x100;
    }
    if (value == 0) {
        value = 0x10;
    }
    FIELD(s16, state->animatedTarget_01c, 0x32) = (s16)value;
}

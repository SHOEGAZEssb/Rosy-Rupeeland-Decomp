#include "tingle/types.h"

/*
 * Overlay 0 grid-presentation animation update. It advances owned UI objects
 * and drives a signed target field from the Nitro fixed-point sine table.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000GridState {
    u8 field_000[0x08];
    void *spriteGroup_008;
    void *spriteGroup_00c;
    u8 field_010[0x0c];
    void *animatedTarget_01c;
    u8 field_020[4];
    u8 element_024[0xac];
    u8 element_0d0[0xac];
    u8 element_17c[0xf0];
    void *controller_26c;
    u8 field_270[0x38];
    u32 phase_2a8;
    s32 delay_2ac;
} Overlay000GridState;

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
 * Advance all three embedded elements, both sprite groups, and controller.
 * If animatedTarget_01c is null, return. While delay_2ac is positive, decrement
 * it and return. Otherwise add 0x200 to phase_2a8, sample the odd sine-table
 * component selected by the phase, scale it by 0x1052 with fixed-point
 * rounding, divide by 16, clamp to +/-0x100, replace zero with 0x10, and
 * write target halfword 0x32. UI state changes; helpers may update sprite
 * presentation, but this wrapper accesses no hardware registers directly.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay000_Grid_Update(Overlay000GridState *state)
{
    s32 value;
    s64 product;
    u32 phase;
    u32 tableIndex;

    SpriteMotionController_Update(state->element_024);
    SpriteMotionController_Update(state->element_0d0);
    SpriteMotionController_Update(state->element_17c);
    GraphicsSpriteGroup_AdvanceAnimations(state->spriteGroup_008);
    GraphicsSpriteGroup_AdvanceAnimations(state->spriteGroup_00c);
    InventoryScroll_UpdatePresentation(state->controller_26c);
    if (state->animatedTarget_01c == 0) {
        return;
    }
    if (state->delay_2ac > 0) {
        state->delay_2ac--;
        return;
    }

    phase = state->phase_2a8 + 0x200;
    state->phase_2a8 = phase;
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

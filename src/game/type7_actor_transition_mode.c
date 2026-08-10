#include "tingle/types.h"

/*
 * Recovered type-seven transition-mode controls. They toggle the actor's
 * boundary-mode presentation and configure its embedded transition helper.
 */

extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void AttachmentController_SetEnabled(void *state, s32 enabled);
extern void ActorDerivedType1_SetSpecialModeEnabled(void *object, s32 value);
extern void Type7Actor_ResetMotionAndCooldown(void *actor);
extern void func_0204ced8(void *state, u32 value);
extern void func_0204cf28(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are a type-seven actor and a zero/nonzero mode selector. A nonzero
 * selector clears +0x268 bit 0x400, calls Type7Actor_ResetMotionAndCooldown, clears +0x14 bits
 * two and four, and, when attachment +0xa8 exists, clears its +0x24 bit 0x10
 * while setting actor +0x14 bit 0x02000000. Zero sets bit 0x400, clears bits
 * 0x1000/0x2000, disables embedded state +0x2a8, sets actor +0x14 bits two and
 * four, sets presentation-object +0x54 bit 0x10, applies the corresponding
 * attachment changes, and notifies global state +0x2ea4 with zero. No value is
 * returned. Actor and presentation/global state may change; there are no
 * direct hardware effects.
 */
void func_0204b078(void *self, s32 enabled)
{
    u8 *actor = (u8 *)self;
    u8 *attachment;

    if (enabled != 0) {
        *(u32 *)(actor + 0x268) &= ~0x400;
        Type7Actor_ResetMotionAndCooldown(actor);
        *(u32 *)(actor + 0x14) &= ~6;
        attachment = *(u8 **)(actor + 0xa8);
        if (attachment != 0) {
            *(u16 *)(attachment + 0x24) &= (u16)~0x10;
            *(u32 *)(actor + 0x14) |= 0x02000000;
        }
        return;
    }

    *(u32 *)(actor + 0x268) =
        (*(u32 *)(actor + 0x268) | 0x400) & ~0x3000;
    AttachmentController_SetEnabled(actor + 0x2a8, 0);
    *(u32 *)(actor + 0x14) |= 6;
    *(u16 *)(*(u8 **)(actor + 0x54) + 0x24) |= 0x10;
    attachment = *(u8 **)(actor + 0xa8);
    if (attachment != 0) {
        *(u16 *)(attachment + 0x24) |= 0x10;
        *(u32 *)(actor + 0x14) &= ~0x02000000;
    }
    ActorDerivedType1_SetSpecialModeEnabled(*(void **)(data_021052fc + 0x2ea4), 0);
}

/*
 * Inputs are a type-seven actor and an animation/configuration index. Value
 * -2 clears embedded flags 0x3000 and disables helper +0x2a8; -1 sets both
 * flags and disables it. Other values set bit 0x1000, reset the helper through
 * func_0204cf28 when signed halfword +0x2b6 is nonzero, select the low byte via
 * func_0204ced8, and enable the helper. No value is returned. Actor/helper
 * state changes, with no direct SDK or hardware effects.
 */
void func_0204b148(void *self, s32 index)
{
    u8 *actor = (u8 *)self;
    if (index == -2) {
        *(u32 *)(actor + 0x268) &= ~0x3000;
        AttachmentController_SetEnabled(actor + 0x2a8, 0);
        return;
    }
    if (index == -1) {
        *(u32 *)(actor + 0x268) |= 0x3000;
        AttachmentController_SetEnabled(actor + 0x2a8, 0);
        return;
    }
    *(u32 *)(actor + 0x268) |= 0x1000;
    if (*(s16 *)(actor + 0x2b6) != 0)
        func_0204cf28(actor + 0x2a8);
    func_0204ced8(actor + 0x2a8, (u8)index);
    AttachmentController_SetEnabled(actor + 0x2a8, 1);
}

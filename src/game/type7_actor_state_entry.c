#include "tingle/types.h"

/*
 * Recovered type-seven state-entry and reset routines. They install one of
 * three indefinite callback pairs, clear shared motion vectors, or perform the
 * deeper timer/subobject reset used when the controlling condition is false.
 */
extern u32 data_020e18a8[];
extern u32 data_020e18b0[];
extern u32 data_020e18b8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200b2c0(void *value, s32 x, s32 y, s32 z);
extern void AttachmentController_SetEnabled(void *value, s32 mode);
extern void Type7Actor_ResetMotionAndCooldown(void *actor);
extern void func_020481dc(void *actor, u32 first, u32 second, s32 duration);
#ifdef __cplusplus
}
#endif

/* Clear the three vector-like fields shared by these state entries. */
static void clear_motion_vectors(u8 *actor)
{
    func_0200b2c0(actor + 0x38, 0, 0, 0);
    func_0200b2c0(actor + 0x88, 0, 0, 0);
    func_0200b2c0(actor + 0x98, 0, 0, 0);
}

/*
 * Inputs are a type-seven actor and a condition. When nonzero, null related
 * object +0x210, install callback pair data_020e18b8 indefinitely, select
 * presentation four, clear actor flag 0x20 while setting 0x40, and clear the
 * three motion vectors.
 *
 * When zero, clear actor flags 0x84c, zero halfwords +0x250/+0x264/+0x24e,
 * set +0x256/+0x25a to 30, clear flags 0x3000, reset subobject +0x2a8 in mode
 * zero, clear +0x246/+0x266, and run the full Type7Actor_ResetMotionAndCooldown reset. Actor,
 * callback, timer, subobject, flag, and motion state may change. No value is
 * returned and there are no direct SDK or hardware effects.
 */
void func_0204a200(void *self, s32 condition)
{
    u8 *actor = (u8 *)self;
    if (condition != 0) {
        *(void **)(actor + 0x210) = 0;
        func_020481dc(actor, data_020e18b8[0], data_020e18b8[1], -1);
        *(u16 *)(actor + 0xd6) = 4;
        *(u32 *)(actor + 0x268) =
            (*(u32 *)(actor + 0x268) & ~0x20) | 0x40;
        clear_motion_vectors(actor);
        return;
    }
    *(u32 *)(actor + 0x268) &= 0xfffff7b3;
    *(u16 *)(actor + 0x250) = 0;
    *(u16 *)(actor + 0x256) = 30;
    *(u16 *)(actor + 0x25a) = 30;
    *(u16 *)(actor + 0x264) = 0;
    *(u16 *)(actor + 0x24e) = 0;
    *(u32 *)(actor + 0x268) &= ~0x3000;
    AttachmentController_SetEnabled(actor + 0x2a8, 0);
    *(u16 *)(actor + 0x246) = 0;
    *(u16 *)(actor + 0x266) = 0;
    Type7Actor_ResetMotionAndCooldown(actor);
}

/*
 * Input is a type-seven actor. Null related object +0x210, install callback
 * pair data_020e18b0 indefinitely, set actor flag 0x20, select presentation
 * five, and clear the three shared motion vectors. Actor, callback, flag,
 * presentation, relationship, and motion state may change. No value is
 * returned and no SDK or hardware effects occur directly.
 */
void func_0204a2e8(void *self)
{
    u8 *actor = (u8 *)self;
    *(void **)(actor + 0x210) = 0;
    func_020481dc(actor, data_020e18b0[0], data_020e18b0[1], -1);
    *(u32 *)(actor + 0x268) |= 0x20;
    *(u16 *)(actor + 0xd6) = 5;
    clear_motion_vectors(actor);
}

/*
 * Input is a type-seven actor. Null related object +0x210, install callback
 * pair data_020e18a8 indefinitely, set actor flag 0x80, select presentation
 * four, and clear the three shared motion vectors. Actor, callback, flag,
 * presentation, relationship, and motion state may change. No value is
 * returned and no SDK or hardware effects occur directly.
 */
void func_0204a360(void *self)
{
    u8 *actor = (u8 *)self;
    *(void **)(actor + 0x210) = 0;
    func_020481dc(actor, data_020e18a8[0], data_020e18a8[1], -1);
    *(u32 *)(actor + 0x268) |= 0x80;
    *(u16 *)(actor + 0xd6) = 4;
    clear_motion_vectors(actor);
}

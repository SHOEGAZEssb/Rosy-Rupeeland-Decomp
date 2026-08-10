#include "tingle/types.h"

/*
 * Recovered extended type-three actor countdown motion. It resets on expiry or
 * moves relative to the current target while the class-specific timer remains.
 */
extern u8 data_020e0224[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorExtendedType3_ResetInteractionState(void *actor);
extern void func_02005030(void *temporary, const void *source);
extern void func_02005058(void *temporary);
#ifdef __cplusplus
}
#endif

/*
 * Decrement signed halfword actor +0x29a. At zero or below, invoke
 * ActorExtendedType3_ResetInteractionState and return zero. Otherwise set
 * +0x260 bit 0x20, set mode byte
 * +0x24c to two, and stop if virtual +0x38 reports busy. Descriptor +0x1a bit
 * one installs callback pair data_020e0224+0x10/+0x14 at +0x218/+0x21c.
 * Otherwise copy transform +0x18, compute integer displacement from target
 * +0x228, and compare its squared length with signed descriptor +0x12 squared.
 * Below the threshold add the displacement back to temporary X/Y; at or above
 * subtract it. Pass the result to virtual +0xd0 and finalize it. Always returns
 * zero. Actor, target, transform, callback, and virtual state may change; no
 * direct SDK or hardware access occurs.
 */
s32 ActorExtendedType3_UpdateCountdownMotion(void *self, const void *descriptorRecord)
{
    u8 *actor = (u8 *)self;
    const u8 *record = (const u8 *)descriptorRecord;
    u32 temporary[4];
    s32 dx;
    s32 dy;
    s16 threshold;

    --*(s16 *)(actor + 0x29a);
    if (*(s16 *)(actor + 0x29a) <= 0) {
        ActorExtendedType3_ResetInteractionState(actor);
        return 0;
    }
    *(u32 *)(actor + 0x260) |= 0x20;
    actor[0x24c] = 2;
    if ((*(s32 (**)(void *))(*(u8 **)actor + 0x38))(actor) != 0)
        return 0;
    if ((*(u16 *)(record + 0x1a) & 2) != 0) {
        *(u32 *)(actor + 0x218) = *(u32 *)(data_020e0224 + 0x10);
        *(u32 *)(actor + 0x21c) = *(u32 *)(data_020e0224 + 0x14);
        return 0;
    }

    func_02005030(temporary, actor + 0x18);
    {
        u8 *target = *(u8 **)(actor + 0x228);
        dy = (*(s32 *)(actor + 0x20) - *(s32 *)(target + 0x20)) >> 12;
        dx = (*(s32 *)(actor + 0x1c) - *(s32 *)(target + 0x1c)) >> 12;
    }
    threshold = *(const s16 *)(record + 0x12);
    if (dx * dx + dy * dy < threshold * threshold) {
        temporary[1] += dx << 12;
        temporary[2] += dy << 12;
    } else {
        temporary[1] -= dx << 12;
        temporary[2] -= dy << 12;
    }
    (*(void (**)(void *, void *))(*(u8 **)actor + 0xd0))(actor, temporary);
    func_02005058(temporary);
    return 0;
}

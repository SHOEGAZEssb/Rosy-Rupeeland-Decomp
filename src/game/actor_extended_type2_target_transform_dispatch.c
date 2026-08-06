#include "tingle/types.h"

/*
 * Recovered extended type-two actor target-transform dispatch. It gates a
 * descriptor and forwards an in-range target transform to the actor.
 */
extern u8 data_020df9e8[];

/*
 * Clear actor +0x260 bit zero. A busy virtual +0x38 sets mode byte +0x24c to
 * seven and stops. Descriptor +0x1a bit one installs global pair +0x250/+0x254.
 * Otherwise virtual predicates +0x11c, +0x124, and +0x130 may stop processing,
 * after which mode seven is selected. The squared integer distance to target
 * +0x228 is compared with the signed radius at descriptor +0x0e; an excessive
 * distance invokes virtual +0xe8, while an accepted target passes its transform
 * +0x18 to virtual +0xd0. The retail control flow duplicates this same distance
 * operation for target type byte +0x4d equal to one and all other types; that
 * split has no observable semantic difference. Always returns zero. Actor and
 * virtual state may change; no direct SDK or hardware operation occurs.
 */
s32 func_0204194c(void *self, void *descriptorRecord)
{
    u8 *actor = (u8 *)self;
    u8 *record = (u8 *)descriptorRecord;
    u8 *vtable = *(u8 **)actor;
    u8 *target;
    s32 dy;
    s32 dx;
    s16 radius;

    *(u32 *)(actor + 0x260) &= ~1;
    if ((*(s32 (**)(void *))(vtable + 0x38))(actor) != 0) {
        actor[0x24c] = 7;
        return 0;
    }
    if ((*(u16 *)(record + 0x1a) & 2) != 0) {
        *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x250);
        *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x254);
        return 0;
    }
    if ((*(s32 (**)(void *, void *))(vtable + 0x11c))(actor, record) != 0)
        return 0;
    if ((*(s32 (**)(void *, void *))(vtable + 0x124))(actor, record) != 0)
        return 0;
    if ((*(s32 (**)(void *, void *))(vtable + 0x130))(actor, record) != 0)
        return 0;

    actor[0x24c] = 7;
    target = *(u8 **)(actor + 0x228);
    dy = (*(s32 *)(actor + 0x20) - *(s32 *)(target + 0x20)) >> 12;
    dx = (*(s32 *)(actor + 0x1c) - *(s32 *)(target + 0x1c)) >> 12;
    radius = *(s16 *)(record + 0x0e);
    if (dx * dx + dy * dy > radius * radius)
        (*(void (**)(void *))(vtable + 0xe8))(actor);
    else
        (*(void (**)(void *, void *))(vtable + 0xd0))(actor, target + 0x18);
    return 0;
}

#include "tingle/types.h"

/* Recovered descriptor validation and callback dispatch for the table-configured actor. */
extern u8 data_020e0ac8[];

/*
 * Set actor +0x260 bits zero and one, invoke vtable +0x54 with argument one,
 * then stop with return zero if vtable predicates +0x38 or +0x134 reject the
 * actor/record. Record +0x1a bit one installs callback representation
 * data_020e0ac8+0x20/+0x24 and returns. Otherwise, when signed record +0 is
 * positive and the actor +0x1c/+0x20 distance from +0x230/+0x234 exceeds signed
 * record radius +8, invoke vtable +0x1b0 and return. Next call record predicates
 * at vtable +0x11c, +0x124, +0x12c, and +0x130 in order, returning after the
 * first nonzero result. If all accept, invoke the member-callback representation
 * at actor +0x220/+0x224 with record. Always return zero. Actor, callback, and
 * virtual interaction state may change; no direct SDK or hardware access.
 */
s32 ActorExtendedTable_ProcessDescriptorRecord(void *self, void *descriptorRecord)
{
    u8 *actor = (u8 *)self;
    u8 *record = (u8 *)descriptorRecord;
    u8 *vtable = *(u8 **)actor;

    *(u32 *)(actor + 0x260) |= 3;
    (*(void (**)(void *, s32))(vtable + 0x54))(actor, 1);
    if ((*(s32 (**)(void *))(vtable + 0x38))(actor) != 0)
        return 0;
    if ((*(s32 (**)(void *, void *))(vtable + 0x134))(actor, record) != 0)
        return 0;
    if ((*(u16 *)(record + 0x1a) & 2) != 0) {
        *(u32 *)(actor + 0x218) = *(u32 *)(data_020e0ac8 + 0x20);
        *(u32 *)(actor + 0x21c) = *(u32 *)(data_020e0ac8 + 0x24);
        return 0;
    }
    if (*(s16 *)record > 0) {
        s32 dx = (*(s32 *)(actor + 0x20) - *(s32 *)(actor + 0x234)) >> 12;
        s32 dy = (*(s32 *)(actor + 0x1c) - *(s32 *)(actor + 0x230)) >> 12;
        s32 radius = *(s16 *)(record + 8);
        if (dx * dx + dy * dy > radius * radius) {
            (*(void (**)(void *))(vtable + 0x1b0))(actor);
            return 0;
        }
    }
    if ((*(s32 (**)(void *, void *))(vtable + 0x11c))(actor, record) != 0)
        return 0;
    if ((*(s32 (**)(void *, void *))(vtable + 0x124))(actor, record) != 0)
        return 0;
    if ((*(s32 (**)(void *, void *))(vtable + 0x12c))(actor, record) != 0)
        return 0;
    if ((*(s32 (**)(void *, void *))(vtable + 0x130))(actor, record) != 0)
        return 0;
    {
        s32 adjustment = *(s32 *)(actor + 0x224);
        if ((adjustment & 1) != 0) {
            u8 *object = actor + (adjustment >> 1);
            s32 slot = *(s32 *)(actor + 0x220);
            (*(void (**)(void *, void *))(*(u8 **)object + slot))(object, record);
        } else {
            ((void (*)(s32, void *))*(u32 *)(actor + 0x220))(
                adjustment, record);
        }
    }
    return 0;
}

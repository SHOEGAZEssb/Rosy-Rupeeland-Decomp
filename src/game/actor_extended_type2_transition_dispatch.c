#include "tingle/types.h"

/*
 * Recovered extended type-two actor transition dispatch. The handler runs a
 * sequence of virtual eligibility checks, applies a distance gate, and either
 * selects or invokes a stored callback pair.
 */
extern u8 data_020df9e8[];

/*
 * Process descriptorRecord for actor. The routine sets actor +0x260 bits zero
 * and one and calls virtual +0x54 with argument one. It returns zero after all
 * paths. A nonzero result from virtual +0x38, +0x134, +0x11c, +0x124, +0x12c,
 * or +0x130 stops processing. Descriptor +0x1a bit one instead copies global
 * callback pair +0x2b8/+0x2bc to actor +0x218/+0x21c. Otherwise, positions
 * +0x1c/+0x20 and +0x230/+0x234 are compared in integer units against the
 * signed radius at descriptor +8; an out-of-range actor invokes virtual
 * +0x1b0, while an in-range actor invokes the member-function representation
 * held at +0x220/+0x224 with descriptorRecord. Virtual and actor state may
 * change; no direct SDK or hardware access occurs.
 */
s32 ActorExtendedType2_DispatchTransitionCallback(void *self, void *descriptorRecord)
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
        *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x2b8);
        *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x2bc);
        return 0;
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
        s32 dy = (*(s32 *)(actor + 0x20) - *(s32 *)(actor + 0x234)) >> 12;
        s32 dx = (*(s32 *)(actor + 0x1c) - *(s32 *)(actor + 0x230)) >> 12;
        s16 radius = *(s16 *)(record + 8);
        if (dx * dx + dy * dy > radius * radius) {
            (*(void (**)(void *))(vtable + 0x1b0))(actor);
            return 0;
        }
    }

    {
        u32 adjustment = *(u32 *)(actor + 0x224);
        void (*callback)(void *, void *);
        if ((adjustment & 1) != 0) {
            u8 *adjusted = actor + ((s32)adjustment >> 1);
            callback = *(void (**)(void *, void *))
                (*(u8 **)adjusted + *(u32 *)(actor + 0x220));
        } else {
            callback = *(void (**)(void *, void *))(actor + 0x220);
        }
        callback(actor, record);
    }
    return 0;
}

#include "tingle/types.h"

/*
 * Recovered extended type-two actor near-target dispatch. It runs virtual
 * descriptor gates, then selects callbacks or submits the stored transform.
 */
extern u8 data_020df9e8[];

/*
 * Return zero after processing actor and descriptorRecord. Nonzero results from
 * virtual +0x38 or +0x134 stop immediately. The accepted actor clears +0x260
 * bit zero and sets bit one. Descriptor +0x1a bit one installs global pair
 * +0x268/+0x26c. Otherwise virtual predicates +0x11c, +0x124, +0x12c, and
 * +0x130 run in sequence and may stop processing. The squared integer distance
 * from +0x1c/+0x20 to +0x230/+0x234 is then compared with 36: below it, pairs
 * +0x260/+0x264 and +0x258/+0x25c are installed at +0x218..+0x224; otherwise
 * virtual +0xd0 receives actor +0x22c. Actor and virtual state may change; no
 * direct SDK or hardware operation occurs.
 */
s32 func_020417dc(void *self, void *descriptorRecord)
{
    u8 *actor = (u8 *)self;
    u8 *record = (u8 *)descriptorRecord;
    u8 *vtable = *(u8 **)actor;
    s32 dy;
    s32 dx;

    if ((*(s32 (**)(void *))(vtable + 0x38))(actor) != 0)
        return 0;
    if ((*(s32 (**)(void *, void *))(vtable + 0x134))(actor, record) != 0)
        return 0;
    *(u32 *)(actor + 0x260) = (*(u32 *)(actor + 0x260) & ~1) | 2;
    if ((*(u16 *)(record + 0x1a) & 2) != 0) {
        *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x268);
        *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x26c);
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

    dy = (*(s32 *)(actor + 0x20) - *(s32 *)(actor + 0x234)) >> 12;
    dx = (*(s32 *)(actor + 0x1c) - *(s32 *)(actor + 0x230)) >> 12;
    if (dx * dx + dy * dy < 36) {
        *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x260);
        *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x264);
        *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0x258);
        *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0x25c);
    } else {
        (*(void (**)(void *, void *))(vtable + 0xd0))(actor, actor + 0x22c);
    }
    return 0;
}

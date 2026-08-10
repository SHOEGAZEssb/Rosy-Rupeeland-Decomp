#include "tingle/types.h"

/*
 * Recovered extended type-two actor special-target lookup. It locates target
 * kind 0x65 and conditionally forwards that target's transform.
 */
extern u8 data_020df9e8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020536b8(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Clear actor +0x260 bits zero and 0x20. A busy virtual +0x38 sets mode byte
 * +0x24c to seven and returns zero. Descriptor +0x1a bit one instead installs
 * global callback pair +0x248/+0x24c. Otherwise mode seven is selected and
 * func_020536b8 supplies target +0x228. A null target invokes virtual +0xe8 and
 * clears counter +0x254. A target whose halfword +0x4e is not 0x65 is retained
 * without further action. For kind 0x65, squared integer distance is compared
 * with the signed descriptor +0x0e radius: an excessive distance invokes +0xe8
 * and clears +0x254, while an accepted target passes transform +0x18 to virtual
 * +0xd0. Always returns zero. Actor, target, lookup, and virtual state may
 * change; no direct SDK or hardware operation occurs.
 */
s32 ActorExtendedType2_LookupSpecialTarget65(void *self, void *descriptorRecord)
{
    u8 *actor = (u8 *)self;
    u8 *record = (u8 *)descriptorRecord;
    u8 *vtable = *(u8 **)actor;
    u8 *target;

    *(u32 *)(actor + 0x260) &= ~(1 | 0x20);
    if ((*(s32 (**)(void *))(vtable + 0x38))(actor) != 0) {
        actor[0x24c] = 7;
        return 0;
    }
    if ((*(u16 *)(record + 0x1a) & 2) != 0) {
        *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x248);
        *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x24c);
        return 0;
    }

    actor[0x24c] = 7;
    target = (u8 *)func_020536b8(actor);
    if (target == 0) {
        (*(void (**)(void *))(vtable + 0xe8))(actor);
        *(u16 *)(actor + 0x254) = 0;
        return 0;
    }
    *(u8 **)(actor + 0x228) = target;
    if (*(u16 *)(target + 0x4e) == 0x65) {
        s32 dy = (*(s32 *)(actor + 0x20) - *(s32 *)(target + 0x20)) >> 12;
        s32 dx = (*(s32 *)(actor + 0x1c) - *(s32 *)(target + 0x1c)) >> 12;
        s16 radius = *(s16 *)(record + 0x0e);
        if (dx * dx + dy * dy > radius * radius) {
            (*(void (**)(void *))(vtable + 0xe8))(actor);
            *(u16 *)(actor + 0x254) = 0;
        } else {
            (*(void (**)(void *, void *))(vtable + 0xd0))(actor, target + 0x18);
        }
    }
    return 0;
}

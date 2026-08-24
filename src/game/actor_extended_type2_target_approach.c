#include "tingle/types.h"

/*
 * Recovered extended type-two actor target-approach handler. It gates motion
 * on primary-actor state, a virtual predicate, a cooldown, and target range.
 */
extern u8 data_020df9e8[];
extern u8 *gGamePhaseRuntime;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02007f0c(void *context, s32 index);
extern void VecFx32Object_InitCopy(void *temporary, const void *source);
extern void VecFx32Object_Destroy(void *temporary);
#ifdef __cplusplus
}
#endif

/*
 * Set actor +0x260 bits zero and one and stop with zero if virtual +0x38 is
 * busy. Descriptor +0x1a bit one installs global callback pair +0x290/+0x294.
 * Otherwise the routine resolves the primary actor through gGamePhaseRuntime; its
 * +0xd0 bit 0x100 invokes actor virtual +0xe8. After virtual +0x11c accepts the
 * descriptor, positive signed cooldown +0x25a is decremented. At zero, actor
 * and target +0x228 positions are compared against (descriptor +0x0a + 32)^2.
 * An out-of-range target invokes virtual +0xe8. An in-range target creates a
 * temporary transform from actor +0x18, adds the integer target deltas back in
 * fixed-point form, sets actor +0xd0 bit one, passes it to virtual +0xd0, and
 * finalizes it. The routine always returns zero; actor and virtual state may
 * change, with no direct hardware access.
 */
s32 ActorExtendedType2_UpdateTargetApproach(void *self, const void *descriptorRecord)
{
    u8 *actor = (u8 *)self;
    const u8 *record = (const u8 *)descriptorRecord;
    u8 *vtable = *(u8 **)actor;
    u32 temporary[4];

    *(u32 *)(actor + 0x260) |= 3;
    if ((*(s32 (**)(void *))(vtable + 0x38))(actor) != 0)
        return 0;
    if ((*(u16 *)(record + 0x1a) & 2) != 0) {
        *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x290);
        *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x294);
        return 0;
    }

    {
        u8 *collection = (u8 *)func_02007f0c(gGamePhaseRuntime, 1);
        u8 *primary = *(u8 **)(collection + 0x2e7c);
        if ((*(u32 *)(primary + 0xd0) & 0x100) != 0) {
            (*(void (**)(void *))(vtable + 0xe8))(actor);
            return 0;
        }
    }
    if ((*(s32 (**)(void *, const void *))(vtable + 0x11c))(actor, record) != 0)
        return 0;
    if (*(s16 *)(actor + 0x25a) != 0) {
        --*(s16 *)(actor + 0x25a);
        return 0;
    }

    {
        u8 *target = *(u8 **)(actor + 0x228);
        s32 dy = (*(s32 *)(actor + 0x20) - *(s32 *)(target + 0x20)) >> 12;
        s32 dx = (*(s32 *)(actor + 0x1c) - *(s32 *)(target + 0x1c)) >> 12;
        s32 radius = *(const s16 *)(record + 0x0a) + 0x20;
        if (dx * dx + dy * dy >= radius * radius) {
            (*(void (**)(void *))(vtable + 0xe8))(actor);
            return 0;
        }

        VecFx32Object_InitCopy(temporary, actor + 0x18);
        temporary[2] += dy << 12;
        temporary[1] += dx << 12;
        *(u32 *)(actor + 0xd0) |= 2;
        (*(void (**)(void *, void *))(vtable + 0xd0))(actor, temporary);
        VecFx32Object_Destroy(temporary);
    }
    return 0;
}

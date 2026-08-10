#include "tingle/types.h"

/*
 * Recovered extended type-two actor target-validation handler. It validates a
 * descriptor and target, applies containment and distance gates, then builds a
 * temporary transform used to move relative to the target.
 */
extern u8 data_020df9e8[];
extern u8 data_020dfad8[];
extern u8 data_020dfba0[];
extern u8 data_020dfa50[];
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorExtendedRecordArray_ContainsPoint(const void *records, s32 x, s32 y);
extern void VecFx32Object_InitCopy(void *temporary, const void *source);
extern void VecFx32Object_Destroy(void *temporary);
#ifdef __cplusplus
}
#endif

/* Confirm a stored member-callback representation, including its null form. */
static s32 callback_pair_matches(const u8 *object, u32 firstOffset,
                                 const u8 *secondObject)
{
    u32 first = *(const u32 *)(object + 0x208);
    if (first != *(const u32 *)(data_020df9e8 + firstOffset))
        return 0;
    return *(const u32 *)(object + 0x20c) == *(const u32 *)(secondObject + 4) ||
           first == 0;
}

/*
 * Put actor in state six, set +0xd0 bit one, clear +0x260 bit zero, and run
 * virtual +0x38. A busy result selects mode byte two and returns zero. Record
 * +0x1a bit one instead installs pair +0x298/+0x29c. Otherwise the routine may
 * ask virtual +0x120 about the primary actor, then validates target +0x228
 * against optional rectangle records +0x278 or the record +0x0c radius. Target
 * +0xd0 bit 0x100, failed containment/range, or excess ordinary-target range
 * invokes virtual +0xe8. Type-seven targets carrying one of three confirmed
 * callback pairs bypass that latter range rejection. Accepted targets produce
 * a 16-byte temporary copied from actor +0x18; its X/Y fields are displaced
 * toward or away from the target according to record +0x12, passed to virtual
 * +0xd0, then finalized by VecFx32Object_Destroy. The function always returns zero.
 * Actor, target, virtual, and temporary transform state may change; no direct
 * hardware access occurs.
 */
s32 ActorExtendedType2_UpdateTargetValidationMotion(void *self, const void *descriptorRecord)
{
    u8 *actor = (u8 *)self;
    const u8 *record = (const u8 *)descriptorRecord;
    u8 *vtable = *(u8 **)actor;
    u8 *target;
    s32 anchorDx;
    s32 anchorDy;
    s32 targetDx;
    s32 targetDy;
    s32 targetDistance;
    s32 contained = 0;
    u32 temporary[4];

    *(u32 *)(actor + 0xd0) |= 2;
    *(u32 *)(actor + 0x260) &= ~1;
    *(u16 *)(actor + 0xd6) = 6;
    if ((*(s32 (**)(void *))(vtable + 0x38))(actor) != 0) {
        actor[0x24c] = 2;
        return 0;
    }

    if ((*(u16 *)(record + 0x1a) & 2) != 0) {
        *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x298);
        *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x29c);
        return 0;
    }

    target = *(u8 **)(actor + 0x228);
    if (target[0x4d] == 7 && (*(u16 *)(record + 0x1a) & 0x10) == 0) {
        void *primary = *(void **)(data_021052fc + 0x2ea4);
        if ((*(s32 (**)(void *, void *, const void *))(vtable + 0x120))
                (actor, primary, record) != 0)
            return 0;
    }

    actor[0x24c] = 2;
    anchorDx = (*(s32 *)(actor + 0x1c) - *(s32 *)(actor + 0x240)) >> 12;
    anchorDy = (*(s32 *)(actor + 0x20) - *(s32 *)(actor + 0x244)) >> 12;
    if (*(void **)(actor + 0x278) != 0) {
        contained = ActorExtendedRecordArray_ContainsPoint(*(void **)(actor + 0x278),
                                  *(s32 *)(target + 0x1c),
                                  *(s32 *)(target + 0x20));
        if (!contained) {
            (*(void (**)(void *))(vtable + 0xe8))(actor);
            return 0;
        }
    } else {
        s16 radius = *(const s16 *)(record + 0x0c);
        if (anchorDx * anchorDx + anchorDy * anchorDy > radius * radius) {
            (*(void (**)(void *))(vtable + 0xe8))(actor);
            return 0;
        }
    }

    if ((*(u32 *)(target + 0xd0) & 0x100) != 0) {
        (*(void (**)(void *))(vtable + 0xe8))(actor);
        return 0;
    }

    targetDy = (*(s32 *)(actor + 0x20) - *(s32 *)(target + 0x20)) >> 12;
    targetDx = (*(s32 *)(actor + 0x1c) - *(s32 *)(target + 0x1c)) >> 12;
    targetDistance = targetDx * targetDx + targetDy * targetDy;
    if (!contained) {
        s32 special = 0;
        if (target[0x4d] == 7) {
            special = callback_pair_matches(target, 0xf0, data_020dfad8) ||
                      callback_pair_matches(target, 0x1b8, data_020dfba0) ||
                      callback_pair_matches(target, 0x68, data_020dfa50);
        }
        if (!special) {
            s32 radius = *(const s16 *)(record + 0x0a) + 0x20;
            if (targetDistance > radius * radius) {
                (*(void (**)(void *))(vtable + 0xe8))(actor);
                return 0;
            }
        }
    }

    VecFx32Object_InitCopy(temporary, actor + 0x18);
    {
        s16 threshold = *(const s16 *)(record + 0x12);
        if (targetDistance < threshold * threshold) {
            temporary[1] += targetDx << 12;
            temporary[2] += targetDy << 12;
        } else {
            temporary[1] -= targetDx << 12;
            temporary[2] -= targetDy << 12;
        }
    }
    (*(void (**)(void *, void *))(vtable + 0xd0))(actor, temporary);
    VecFx32Object_Destroy(temporary);
    return 0;
}

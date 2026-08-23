#include "tingle/types.h"

/* Apply table-record actor collision force, recoil, sound, and follow-up effects. */
extern s16 data_020c9670[];
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Fx32Vector2_Magnitude(s32 x, s32 y);
extern s32 func_020ae024(s32 y, s32 x);
extern s32 func_020adc90(s32 numerator, s32 denominator);
extern s32 func_020adae4(s32 numerator, s32 denominator);
extern s32 func_02007868(void *actor);
extern void ActorDerivedType1_StartRecordOrHandleType6D66(void *manager, s32 value);
extern void Actor_PlayHorizontalSpatialSound(void *actor, u32 packedSound, s32 pitch);
extern void ActorTableRecord_ApplySeparationImpulse(void *actor, void *target);
void ActorTableRecord_ApplyCollisionResponse(void *self, void *other,
                                             s32 directionalMode, s32 scale);
#ifdef __cplusplus
}
#endif

/* Multiply fixed-point values and round to 20.12. */
static s32 multiplyFxRound(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/* Return whether the target type/id combination participates in this response. */
static s32 isEligibleTarget(const u8 *target)
{
    u8 type = target[0x4d];
    return type == 1 || type == 7 || type == 2 || type == 4 ||
           (type == 3 && *(u16 *)(target + 0x4e) == 0x17);
}

/*
 * Forward self, other, and scale to ActorTableRecord_ApplyCollisionResponse
 * with directionalMode zero. Returns no value; all interaction effects are
 * performed by the target.
 */
void ActorTableRecord_ApplyNonDirectionalCollisionResponse(void *self,
                                                           void *other,
                                                           s32 scale)
{
    ActorTableRecord_ApplyCollisionResponse(self, other, 0, scale);
}

/*
 * Return without changes unless other is type 1, 2, 4, 7, or type 3 with ID
 * halfword +0x4e equal to 0x17. Compute other-minus-self X/Y displacement and
 * distance. Distances below 0x1000 use a horizontal unit vector whose sign is
 * chosen from signed bytes +0x48. With directionalMode nonzero, quantize the
 * displacement angle to the shared eight-way table; otherwise divide each
 * component by distance. Halve the vector for self +0xd0 bit 0x10 and scale it
 * by scale when scale differs from 0x1000.
 *
 * When other virtual +0x08 is true, add twice other low-13-bit word +0x20c to
 * self halfword +0x20a. Add the response to other secondary X/Y +0x9c/+0xa0,
 * subtract response divided by self low-13-bit +0x20c from self +0x8c/+0x90,
 * and store max(30-magnitude,0) at self byte +0x210. For type-one other and a
 * nonnegative signed self record +0x214 halfword +0x02, dispatch that value
 * through ActorDerivedType1_StartRecordOrHandleType6D66 when func_02007868(other) is true.
 *
 * If byte +0x211 is zero, play nonzero record sound +0x0a through
 * Actor_PlayHorizontalSpatialSound, then copy record byte +0x0c to +0x211. Self word +0x20c bit
 * 0x4000 invokes ActorTableRecord_ApplySeparationImpulse with runtime +0x2ea4;
 * bit 0x8000 does likewise with nonnull runtime +0x2ea8. Finally set bits
 * 0x4000/0x8000 when other is type one/seven. Returns no value. Math, virtual,
 * sound, manager, and effect calls have observable engine state.
 */
void ActorTableRecord_ApplyCollisionResponse(void *self, void *other,
                                             s32 directionalMode, s32 scale)
{
    u8 *actor = (u8 *)self;
    u8 *target = (u8 *)other;
    u8 *record = *(u8 **)(actor + 0x214);
    s32 x;
    s32 y;
    s32 distance;
    s32 magnitude;

    if (!isEligibleTarget(target))
        return;
    x = *(s32 *)(target + 0x1c) - *(s32 *)(actor + 0x1c);
    y = *(s32 *)(target + 0x20) - *(s32 *)(actor + 0x20);
    distance = Fx32Vector2_Magnitude(x, y);
    if (distance < 0x1000) {
        x = *(s8 *)(target + 0x48) >= *(s8 *)(actor + 0x48)
                ? -0x1000 : 0x1000;
        y = 0;
        distance = 0x1000;
    }
    if (directionalMode != 0) {
        u32 angle = (func_020ae024(y, x) + 0x1000) & 0xe000;
        u32 index = (angle >> 4) * 2;
        x = data_020c9670[index];
        y = data_020c9670[index + 1];
    } else {
        x = func_020adc90(x, distance);
        y = func_020adc90(y, distance);
    }
    if ((*(u32 *)(actor + 0xd0) & 0x10) != 0) {
        x = func_020adae4(x, 2);
        y = func_020adae4(y, 2);
    }
    if (scale != 0x1000) {
        x = multiplyFxRound(x, scale);
        y = multiplyFxRound(y, scale);
    }
    if ((*(s32 (**)(void *))(*(u8 **)target + 8))(target) != 0)
        *(u16 *)(actor + 0x20a) +=
            (u16)((*(u32 *)(target + 0x20c) & 0x1fff) * 2);
    *(s32 *)(target + 0x9c) += x;
    *(s32 *)(target + 0xa0) += y;
    magnitude = *(u32 *)(actor + 0x20c) & 0x1fff;
    *(s32 *)(actor + 0x8c) -= func_020adae4(x, magnitude);
    *(s32 *)(actor + 0x90) -= func_020adae4(y, magnitude);
    actor[0x210] = (u8)(magnitude < 30 ? 30 - magnitude : 0);

    if (target[0x4d] == 1 && *(s16 *)(record + 2) != -1 &&
        func_02007868(target) != 0)
        ActorDerivedType1_StartRecordOrHandleType6D66(*(void **)(data_021052fc + 0x2ea4),
                      *(s16 *)(record + 2));
    if (actor[0x211] == 0 && *(u16 *)(record + 0x0a) != 0)
        Actor_PlayHorizontalSpatialSound(actor, *(u16 *)(record + 0x0a), 0);
    actor[0x211] = record[0x0c];
    if ((*(u32 *)(actor + 0x20c) & 0x4000) != 0)
        ActorTableRecord_ApplySeparationImpulse(
            actor, *(void **)(data_021052fc + 0x2ea4));
    if ((*(u32 *)(actor + 0x20c) & 0x8000) != 0 &&
        *(void **)(data_021052fc + 0x2ea8) != 0)
        ActorTableRecord_ApplySeparationImpulse(
            actor, *(void **)(data_021052fc + 0x2ea8));
    if (target[0x4d] == 1)
        *(u32 *)(actor + 0x20c) |= 0x4000;
    if (target[0x4d] == 7)
        *(u32 *)(actor + 0x20c) |= 0x8000;
}

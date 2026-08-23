#include "tingle/scene_touch.h"
#include "tingle/types.h"

/* Update randomized probe motion, attachment oscillation, and a forwarded touch point. */
extern s16 data_020c9670[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_UpdatePresentation(void *screenPosition, void *actor,
                                     const void *viewPosition);
extern u32 genrand_int32(void);
extern u64 func_020bf1f8(u32 value, u32 divisor);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32_Subtract(void *output, const void *first,
                          const void *second);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
extern void VecFx32Object_Add(void *destination, const void *delta);
extern s32 func_020befec(s32 numerator, s32 denominator);
extern void ActorAttachment_CopyTouchState(void *actor, const TouchPoint *point);
#ifdef __cplusplus
}
#endif

/* Multiply two recovered fixed-point values and round by adding 0x800 before shifting 12. */
static s32 multiplyFxRound(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/* Return a centered RNG remainder in approximately [-range/2,range/2). */
static s32 centeredRandom(s32 range)
{
    s32 remainder = (s32)(func_020bf1f8(genrand_int32(), (u32)range) >> 32);
    return remainder - ((range + (range < 0)) >> 1);
}

/*
 * Run Actor_UpdatePresentation(screenPosition, actor, viewPosition), preserve signed attachment
 * offsets +0x2c/+0x2e, and decrement actor timer +0x240. On expiry reset it
 * from +0x24c, choose
 * centered random X/Y within ranges +0x244/+0x248, scale both by fixed value
 * +0x20c, and form a target vector. Store target minus current vector +0x210
 * at delta +0x230, divide its Y/Z components +0x234/+0x238 by duration +0x24c,
 * and retain the target at +0x220. While the timer remains nonnegative, add
 * delta +0x230 into current vector +0x210 instead.
 *
 * Advance phase halfword +0x208 by +0x254, sample data_020c9670 at recovered
 * doubled index (phase>>4), scale it by +0x250 * +0x20c, and add that vertical
 * oscillation to current vector. Apply current X/Y offsets to attachment
 * halfwords +0x2c/+0x2e and screen-position words +0x04/+0x08. Build a TouchPoint using
 * gSceneTouchInitialData's point vtable and forward it to actor through
 * ActorAttachment_CopyTouchState. Returns no value; RNG, vector lifecycles, attachment writes,
 * and touch dispatch mutate global/actor/presentation state.
 */
void ActorMotionProbe_UpdateTouchMotion(void *screenPosition, void *self,
                                        const void *viewPosition)
{
    u8 *screenPositionBytes = (u8 *)screenPosition;
    u8 *actor = (u8 *)self;
    u8 *attachment;
    s16 baseX;
    s16 baseY;
    s32 oscillation;

    Actor_UpdatePresentation(screenPosition, self, viewPosition);
    attachment = *(u8 **)(actor + 0x54);
    baseX = *(s16 *)(attachment + 0x2c);
    baseY = *(s16 *)(attachment + 0x2e);
    --*(s32 *)(actor + 0x240);
    if (*(s32 *)(actor + 0x240) < 0) {
        s32 target[4];
        s32 delta[4];
        s32 x;
        s32 y;
        *(s32 *)(actor + 0x240) = *(s32 *)(actor + 0x24c);
        x = multiplyFxRound(centeredRandom(*(s32 *)(actor + 0x244)) << 12,
                            *(s32 *)(actor + 0x20c));
        y = multiplyFxRound(centeredRandom(*(s32 *)(actor + 0x248)) << 12,
                            *(s32 *)(actor + 0x20c));
        VecFx32Object_InitComponents(target, x, y, 0);
        VecFx32_Subtract(delta, target, actor + 0x210);
        VecFx32Object_Assign(actor + 0x230, delta);
        VecFx32Object_Destroy(delta);
        *(s32 *)(actor + 0x234) = func_020befec(
            *(s32 *)(actor + 0x234), *(s32 *)(actor + 0x24c));
        *(s32 *)(actor + 0x238) = func_020befec(
            *(s32 *)(actor + 0x238), *(s32 *)(actor + 0x24c));
        VecFx32Object_Assign(actor + 0x220, target);
        VecFx32Object_Destroy(target);
    } else {
        VecFx32Object_Add(actor + 0x210, actor + 0x230);
    }

    *(u16 *)(actor + 0x208) += (u16)*(s32 *)(actor + 0x254);
    oscillation = multiplyFxRound(
        data_020c9670[((u16)*(u16 *)(actor + 0x208) >> 4) * 2],
        *(s32 *)(actor + 0x250) * *(s32 *)(actor + 0x20c));
    *(s16 *)(attachment + 0x2c) =
        (s16)(baseX + (*(s32 *)(actor + 0x214) >> 12));
    *(s16 *)(attachment + 0x2e) =
        (s16)(baseY + ((*(s32 *)(actor + 0x218) + oscillation) >> 12));
    *(s32 *)(screenPositionBytes + 4) =
        baseX + (*(s32 *)(actor + 0x214) >> 12);
    *(s32 *)(screenPositionBytes + 8) =
        baseY + ((*(s32 *)(actor + 0x218) + oscillation) >> 12);
    {
        TouchPoint point;
        point.vtable = &gSceneTouchInitialData.pointVTable;
        point.x = *(u32 *)(screenPositionBytes + 4);
        point.y = *(u32 *)(screenPositionBytes + 8);
        ActorAttachment_CopyTouchState(actor, &point);
    }
}

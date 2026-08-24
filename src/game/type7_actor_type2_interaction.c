#include "tingle/types.h"

/*
 * Recovered type-two interaction response for the type-seven actor. It applies
 * an interpolated directional impulse and emits a world-space feedback effect.
 */
extern s16 data_020c9670[];
extern u8 *gGamePhaseRuntime;

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32_Subtract(void *output, const void *first, const void *second);
extern void VecFx32Object_Destroy(void *value);
extern void VecFx32Object_Subtract(void *first, const void *second);
extern s32 func_020adae4(s32 value, s32 divisor);
extern s32 func_020ae024(s32 y, s32 x);
extern void Fx32Vector2_LimitMagnitude(s32 *x, s32 *y, s32 limit);
extern void VecFx32Object_DivideByScalar(void *output, const void *input,
                                         s32 divisor);
extern void VecFx32Object_InitSum(void *output, const void *first, const void *second);
/*
 * The extra arguments are ignored by the one-argument accessor but preserve
 * the retail caller's r1/r2 scheduling in the exact ARM build.
 */
extern void *RuntimePresentationManager_GetGraphics3dPresentation(
    void *manager, s32 preparedY, s32 originalY);
extern void Graphics3dPresentation_CreatePreset20To21ScaledPointSpriteEffectAt(void *effect, s32 mode, s32 x, s32 y, s32 extra);
extern s32 ActorDerivedType1_IsTargetStateEligible(void *actor);
extern void Type7Actor_ResetInteractionState(void *actor);
extern void Type7Actor_PlayStateSound(void *actor, s32 mode);
#ifdef __cplusplus
}
#endif

/* Multiply two signed 20.12 fixed-point values with retail +0x800 rounding. */
static s32 multiply_fx_round(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/* Scale a signed value by 2^shift with the same fixed-point rounding sequence. */
static s32 scale_shift_round(s32 value, s32 shift)
{
    return (s32)(((s64)value * ((s64)1 << shift) + 0x800) >> 12);
}

/*
 * Inputs are actor, other type-two actor, value, and extra. Derive center-like
 * transforms from each object's +0x18/+0x28 and combine them through
 * VecFx32Object_Subtract. Let t=(value+extra)<<12 divided by 50. Evaluate the recovered
 * fixed-point polynomial from t, 1-t, t^2, (1-t)^2, and 2t(1-t), including a
 * 0x5000 coefficient, and clamp the resulting impulse magnitude to 0xa000.
 * Compute the actor-to-other angle, halve the combined-center +4/+8 components,
 * add the data_020c9670 direction pair, and scale by that magnitude. Subtract
 * impulses weighted by extra/(3*(value+extra)) from actor +0x8c/+0x90, halving
 * them when resource +0x234 exists, clamp to 0x3000, and clear +0x3c/+0x40.
 * Unless other +0x260 bit 0x8000 is set, add impulses weighted by
 * value/(value+extra) to other +0x8c/+0x90, clamp to 0x6000, and clear its
 * +0x3c/+0x40.
 *
 * Build a transform from other +0x18 relative to actor +0x18 at scale 0x2000,
 * combine it with actor +0x18, adjust word +8 by 0x18000 minus word +0x0c,
 * submit a point effect through the presentation manager's 3D presentation.
 * When ActorDerivedType1_IsTargetStateEligible(other) succeeds or other byte
 * +0x24c is three, invoke Type7Actor_ResetInteractionState, ensure actor response mode one below
 * timer 60, and set signed halfword +0x246 to 90. Finalize all three
 * temporaries. Actor, other, 3D presentation, motion, and callback state may
 * change; the effect may reach rendering.
 */
void Type7Actor_ApplyType2InteractionResponse(void *self, void *otherObject, s32 value, s32 extra)
{
    u8 *actor = (u8 *)self;
    u8 *other = (u8 *)otherObject;
    u32 actorCenter[4];
    u32 otherCenter[4];
    u32 displacement[4];
    u32 scaled[4];
    u32 effectTransform[4];
    s32 combined = value + extra;
    s32 t;
    s32 remaining;
    s32 strength;
    s32 angle;
    s32 impulseX;
    s32 impulseY;

    VecFx32_Subtract(actorCenter, actor + 0x18, actor + 0x28);
    VecFx32_Subtract(otherCenter, other + 0x18, other + 0x28);
    VecFx32Object_Subtract(actorCenter, otherCenter);
    t = func_020adae4(combined << 12, 50);
    remaining = 0x1000 - t;
    strength = multiply_fx_round(multiply_fx_round(t, t), 0x5000)
        + scale_shift_round(multiply_fx_round(remaining, remaining), 13)
        + scale_shift_round(multiply_fx_round(t * 2, remaining), 14);
    if (strength > 0xa000)
        strength = 0xa000;

    angle = func_020ae024(*(s32 *)(other + 0x20) - *(s32 *)(actor + 0x20),
                          *(s32 *)(other + 0x1c) - *(s32 *)(actor + 0x1c));
    *(s32 *)(actorCenter + 1) = func_020adae4(*(s32 *)(actorCenter + 1), 2);
    *(s32 *)(actorCenter + 2) = func_020adae4(*(s32 *)(actorCenter + 2), 2);
    angle >>= 4;
    impulseX = multiply_fx_round(
        *(s32 *)(actorCenter + 1) + data_020c9670[angle * 2 + 1], strength);
    impulseY = multiply_fx_round(
        *(s32 *)(actorCenter + 2) + data_020c9670[angle * 2], strength);
    *(s32 *)(actor + 0x8c) -= func_020adae4(impulseX * extra, combined * 3);
    *(s32 *)(actor + 0x90) -= func_020adae4(impulseY * extra, combined * 3);
    if (*(void **)(actor + 0x234) != 0) {
        *(s32 *)(actor + 0x8c) = func_020adae4(*(s32 *)(actor + 0x8c), 2);
        *(s32 *)(actor + 0x90) = func_020adae4(*(s32 *)(actor + 0x90), 2);
    }
    Fx32Vector2_LimitMagnitude((s32 *)(actor + 0x8c), (s32 *)(actor + 0x90), 0x3000);
    *(u32 *)(actor + 0x3c) = 0;
    *(u32 *)(actor + 0x40) = 0;
    if ((*(u32 *)(other + 0x260) & 0x8000) == 0) {
        *(s32 *)(other + 0x8c) += func_020adae4(impulseX * value, combined);
        *(s32 *)(other + 0x90) += func_020adae4(impulseY * value, combined);
        Fx32Vector2_LimitMagnitude((s32 *)(other + 0x8c), (s32 *)(other + 0x90), 0x6000);
        *(u32 *)(other + 0x3c) = 0;
        *(u32 *)(other + 0x40) = 0;
    }

    VecFx32_Subtract(displacement, other + 0x18, actor + 0x18);
    VecFx32Object_DivideByScalar(scaled, displacement, 0x2000);
    VecFx32Object_InitSum(effectTransform, actor + 0x18, scaled);
    VecFx32Object_Destroy(scaled);
    VecFx32Object_Destroy(displacement);
    {
        s32 originalY = *(s32 *)(effectTransform + 2);
        void *graphics3dPresentation;
        *(s32 *)(effectTransform + 2) =
            originalY + 0x18000 - *(s32 *)(effectTransform + 3);
        graphics3dPresentation = RuntimePresentationManager_GetGraphics3dPresentation(
            gGamePhaseRuntime + 0x2f7c,
            *(s32 *)(effectTransform + 2), originalY);
        Graphics3dPresentation_CreatePreset20To21ScaledPointSpriteEffectAt(graphics3dPresentation, 1,
                      *(s32 *)(effectTransform + 1),
                      *(s32 *)(effectTransform + 2), 0);
    }
    if (ActorDerivedType1_IsTargetStateEligible(other) != 0 || other[0x24c] == 3) {
        Type7Actor_ResetInteractionState(actor);
        if (*(s16 *)(actor + 0x246) < 60)
            Type7Actor_PlayStateSound(actor, 1);
        *(u16 *)(actor + 0x246) = 90;
    }
    VecFx32Object_Destroy(effectTransform);
    VecFx32Object_Destroy(otherCenter);
    VecFx32Object_Destroy(actorCenter);
}

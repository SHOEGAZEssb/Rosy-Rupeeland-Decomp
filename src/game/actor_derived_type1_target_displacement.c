#include "tingle/heap.h"
#include "tingle/types.h"

/* Resolve weighted type-1/target displacement and its collision presentation effects. */
extern s16 data_020c9670[];
extern u8 *data_021052fc;
extern void *gLupyContext;
extern const char data_020df4a4[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020066a4(void *output, const void *first, const void *second);
extern s32 func_020050f0(const void *first, const void *second);
extern s32 func_020adae4(s32 numerator, s32 denominator);
extern s32 func_020ae024(s32 y, s32 x);
extern void func_0204cff4(s32 *x, s32 *y, s32 maximum);
extern void func_02005058(void *vector);
extern void ActorVector_DivideByScalar(void *output, const void *direction, s32 scale);
extern void func_02008378(void *output, const void *left, const void *right);
extern void *func_0201e0ec(void *manager);
extern void func_020a2894(void *effect, s32 kind, s32 x, s32 y, s32 extra);
extern s32 ActorDerivedType1_IsTargetStateEligible(void *target);
extern s32 ActorExtendedType2_GetDescriptorValue28(void *target);
extern u32 genrand_int32(void);
extern s32 func_020ada8c(s32 value, s32 divisor);
extern void func_02010c00(void *context, s32 value, s32 extra);
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_02004fe0(void *vector);
extern void *func_02009d78(void *manager);
extern void *func_02022cb0(void *allocation, void *resource, void *owner,
                           s32 value, s32 first, s32 second);
extern void func_0201ded4(void *manager, void *object);
extern void func_020099c0(void *manager, s32 first, s32 second);
extern void func_020349b8(void *actor, u32 sound, s32 extra);
extern void Type1Actor_TryEnterFailureState(void *actor);
#ifdef __cplusplus
}
#endif

/* Multiply two 20.12 fixed-point values with the retail rounding bias. */
static s32 multiplyFx(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/*
 * Compute a confirmed quadratic blend of 0x2000/0x4000/0x5000 weights for
 * total = firstWeight + secondWeight. The result is capped at 0xa000.
 */
static s32 displacementStrength(s32 total)
{
    s32 t = func_020adae4(total << 12, 50);
    s32 inverse = 0x1000 - t;
    s32 value = multiplyFx(multiplyFx(t, t), 0x5000) +
                multiplyFx(multiplyFx(inverse, inverse), 0x2000) +
                multiplyFx(multiplyFx(t << 1, inverse), 0x4000);
    return value > 0xa000 ? 0xa000 : value;
}

/*
 * Use actor/target current and previous positions to compute a weighted radial
 * impulse. The actor receives secondWeight/total of the impulse in reverse;
 * unless target +0x260 bit 0x8000 is set, the target receives firstWeight/total.
 * Both secondary vectors are clamped to 0x6000, primary motion is cleared, and
 * target virtual +0xf0 is called when +0x264 exists. With actor cooldown +0x268
 * clear, emit a scene impact at a normalized offset. A target predicate and
 * relative-angle gate then derive a randomized positive magnitude; when valid,
 * set cooldown 30, update Lupy state, allocate/register an object using manager
 * resource +0x2ea4, dispatch event (0x14,7), play actor sounds 0x26/0x0e, and
 * call Type1Actor_TryEnterFailureState. Returns no value. Vector, target virtual,
 * manager, random,
 * Lupy, heap, sound, and effect calls have observable engine/SDK effects.
 */
void ActorDerivedType1_ApplyWeightedCollisionDisplacement(
    void *self, void *other, s32 firstWeight, s32 secondWeight)
{
    u8 *actor = (u8 *)self;
    u8 *target = (u8 *)other;
    s32 actorCenter[4];
    s32 targetCenter[4];
    s32 total = firstWeight + secondWeight;
    s32 strength;
    s32 angle;
    s32 directionX;
    s32 directionY;
    s32 tableIndex;

    func_020066a4(actorCenter, actor + 0x18, actor + 0x28);
    func_020066a4(targetCenter, target + 0x18, target + 0x28);
    (void)func_020050f0(actorCenter, targetCenter);
    strength = displacementStrength(total);
    angle = func_020ae024(*(s32 *)(target + 0x20) - *(s32 *)(actor + 0x20),
                          *(s32 *)(target + 0x1c) - *(s32 *)(actor + 0x1c));
    actorCenter[1] = func_020adae4(actorCenter[1], 2);
    actorCenter[2] = func_020adae4(actorCenter[2], 2);
    tableIndex = (angle >> 4) * 2;
    directionX = multiplyFx(actorCenter[1] + data_020c9670[tableIndex + 1],
                            strength);
    directionY = multiplyFx(actorCenter[2] + data_020c9670[tableIndex],
                            strength);

    *(s32 *)(actor + 0x8c) -=
        func_020adae4(directionX * secondWeight, total);
    *(s32 *)(actor + 0x90) -=
        func_020adae4(directionY * secondWeight, total);
    func_0204cff4((s32 *)(actor + 0x8c), (s32 *)(actor + 0x90), 0x6000);
    *(s32 *)(actor + 0x3c) = 0;
    *(s32 *)(actor + 0x40) = 0;

    if ((*(u32 *)(target + 0x260) & 0x8000) == 0) {
        *(s32 *)(target + 0x8c) +=
            func_020adae4(directionX * firstWeight, total);
        *(s32 *)(target + 0x90) +=
            func_020adae4(directionY * firstWeight, total);
        func_0204cff4((s32 *)(target + 0x8c), (s32 *)(target + 0x90), 0x6000);
        *(s32 *)(target + 0x3c) = 0;
        *(s32 *)(target + 0x40) = 0;
    }
    if (*(void **)(target + 0x264) != 0)
        (*(void (**)(void *))(*(u8 **)target + 0xf0))(target);

    if (*(s16 *)(actor + 0x268) <= 0) {
        s32 separation[4];
        s32 normalized[4];
        s32 effectPosition[4];
        void *effect;
        s32 angleBonus = 0;
        s32 baseCount;
        s32 countGate;
        s32 targetValue;
        s32 tenth;
        s32 magnitude;

        func_020066a4(separation, target + 0x18, actor + 0x18);
        ActorVector_DivideByScalar(normalized, separation, 0x2000);
        func_02008378(effectPosition, actor + 0x18, normalized);
        func_02005058(normalized);
        func_02005058(separation);
        effectPosition[2] += 0x18000 - effectPosition[3];
        effect = func_0201e0ec(data_021052fc + 0x2f7c);
        func_020a2894(effect, 1, effectPosition[1], effectPosition[2], 0);

        if (ActorDerivedType1_IsTargetStateEligible(target) != 0) {
            s32 relative;
            baseCount = *(s16 *)(target + 0x29e) + 4;
            relative = func_020ae024(*(s32 *)(actor + 0x20) -
                                         *(s32 *)(target + 0x20),
                                     *(s32 *)(actor + 0x1c) -
                                         *(s32 *)(target + 0x1c));
            relative -= 0x4000;
            if (relative < *(s32 *)(actor + 0xc8)) relative += 0x10000;
            relative -= *(s32 *)(actor + 0xc8);
            if (relative > 0x8000) relative = 0x10000 - relative;
            if (relative < 0x4000) angleBonus = 1;
        } else {
            baseCount = 1;
        }

        countGate = baseCount + angleBonus;
        targetValue = ActorExtendedType2_GetDescriptorValue28(target);
        tenth = func_020adae4(targetValue, 10);
        magnitude = targetValue - func_020adae4(tenth, 2) +
                    func_020adae4(tenth *
                                      func_020ada8c(
                                          (s32)(genrand_int32() & 0x7fffffff),
                                          10),
                                  10);
        if (countGate != 0 && magnitude > 0) {
            s32 position[4];
            s32 temporary[4];
            void *object;
            s32 negative = -magnitude;
            *(s16 *)(actor + 0x268) = 30;
            func_02010c00(gLupyContext, negative, 0);
            func_0200500c(position, *(s32 *)(actor + 0x1c),
                          *(s32 *)(actor + 0x20),
                          *(s32 *)(actor + 0x24) + 0x18000);
            func_02004fe0(temporary);
            object = Heap_Alloc(0x44, data_020df4a4, 4, &gHeapContext);
            if (object != 0) {
                void *managerResource =
                    func_02009d78(data_021052fc + 0x2fbc);
                object = func_02022cb0(object, managerResource,
                                      *(void **)(data_021052fc + 0x2ea4),
                                      negative, 0x2000, -0xc0);
            }
            func_0201ded4(data_021052fc + 0x2f7c, object);
            func_020099c0(data_021052fc + 0x2fbc, 0x14, 7);
            func_020349b8(actor, 0x26, 0);
            func_020349b8(actor, 0x0e, 0);
            Type1Actor_TryEnterFailureState(actor);
            func_02005058(temporary);
            func_02005058(position);
        }
        func_02005058(effectPosition);
    }
    func_02005058(targetCenter);
    func_02005058(actorCenter);
}

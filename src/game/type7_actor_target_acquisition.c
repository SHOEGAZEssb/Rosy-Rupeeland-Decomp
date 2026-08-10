#include "tingle/types.h"

/*
 * Recovered target acquisition for the type-seven actor. It first considers a
 * global target, then scans a ten-entry actor registry using layer, height,
 * range, and priority gates.
 */
extern u8 *data_021052fc;
extern void *data_02105690[10];
extern s32 data_021056b8[10];
extern u32 data_020e16e8[];
extern u32 data_020e18f0[];
extern u32 data_020e18e8[];
extern u32 data_020e18e0[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorDerivedType1_IsSpecialRecordActive(void *object);
extern s32 Type7Actor_HasSpecialCallbackPair(const void *actor);
extern void func_020481dc(void *actor, u32 first, u32 second, s32 duration);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern s32 func_020be334(s32 value);
extern s32 func_020adcac(const void *first, const void *second);
#ifdef __cplusplus
}
#endif

/* Invoke virtual predicate +0xa8 on an actor-like object. */
static s32 invoke_a8_predicate(void *object)
{
    typedef s32 (*Predicate)(void *object);
    u8 *value = (u8 *)object;
    Predicate predicate = *(Predicate *)(*(u8 **)value + 0xa8);
    return predicate(value);
}

/*
 * Inputs are a type-seven actor and a mode selecting finite or indefinite
 * callback duration. Return zero without acquisition when target +0x280 is
 * null, counter +0x2a0 is nonzero, an active flag-four state also has flag
 * 0x100 or animation other than one/two, or no candidate is found. Return one
 * immediately while either counter +0x256/+0x25a is nonzero.
 *
 * Except for record subtype two, first consider the global object at
 * data_021052fc+0x2ea4 when its virtual +0xa8 predicate or ActorDerivedType1_IsSpecialRecordActive
 * accepts it. Bind it at +0x210; unless Type7Actor_HasSpecialCallbackPair recognizes the actor
 * callback, install data_020e16e8 for 20 ticks in finite mode or
 * data_020e18f0 indefinitely. Return one after binding.
 *
 * Otherwise reject actor flag 0x4000 and scan ten pointers in data_02105690.
 * A candidate needs +0x260 bit two, must fail its virtual +0xa8 predicate, must
 * clear +0x260 bit 0x10000, share the Actor_GetCachedTerrainHeight value with the actor, lie
 * within 0x20000 vertically, and have planar distance below actor +0x260 plus
 * 0x30000 when Type7Actor_HasSpecialCallbackPair recognizes the callback. Choose the eligible entry
 * with the smallest parallel data_021056b8 priority. Bind it at +0x210 and,
 * for an unrecognized callback, install data_020e18e8 for 20 ticks or
 * data_020e18e0 indefinitely, then set +0x256/+0x25a to 60/0. Actor relation,
 * callback, and counters may change; no SDK or hardware effect occurs.
 */
s32 func_0204876c(void *self, s32 finiteMode)
{
    u8 *actor = (u8 *)self;
    u8 subtype;
    s32 bestIndex = -1;
    s32 bestPriority = 0;
    s32 i;

    if (*(void **)(actor + 0x280) == 0 || *(u16 *)(actor + 0x2a0) != 0)
        return 0;
    if (*(u16 *)(actor + 0x256) != 0 || *(u16 *)(actor + 0x25a) != 0)
        return 1;
    if ((*(u32 *)(actor + 0x268) & 4) != 0) {
        s16 animation;
        if ((*(u32 *)(actor + 0x268) & 0x100) != 0)
            return 0;
        animation = *(s16 *)(actor + 0xd6);
        if (animation != 1 && animation != 2)
            return 0;
    }

    subtype = (*(u8 **)(actor + 0x29c))[0x54];
    if (subtype != 2) {
        u8 *globalObject = *(u8 **)(data_021052fc + 0x2ea4);
        if (invoke_a8_predicate(globalObject) != 0
            || ActorDerivedType1_IsSpecialRecordActive(globalObject) != 0) {
            *(void **)(actor + 0x210) = globalObject;
            if (Type7Actor_HasSpecialCallbackPair(actor) == 0) {
                if (finiteMode != 0)
                    func_020481dc(actor, data_020e16e8[0],
                                  data_020e16e8[1], 20);
                else
                    func_020481dc(actor, data_020e18f0[0],
                                  data_020e18f0[1], -1);
            }
            return 1;
        }
    }
    if ((*(u32 *)(actor + 0x268) & 0x4000) != 0)
        return 0;

    for (i = 0; i < 10; ++i) {
        u8 *candidate = (u8 *)data_02105690[i];
        s32 distance;
        s32 range;
        if (candidate == 0)
            continue;
        if ((*(u32 *)(candidate + 0x260) & 2) == 0
            || invoke_a8_predicate(candidate) != 0
            || (*(u32 *)(candidate + 0x260) & 0x10000) != 0)
            continue;
        if (Actor_GetCachedTerrainHeight(candidate) != Actor_GetCachedTerrainHeight(actor))
            continue;
        if (func_020be334(*(s32 *)(candidate + 0x24)
                          - Actor_GetCachedTerrainHeight(actor)) > 0x20000)
            continue;
        distance = func_020adcac(actor + 0x1c, candidate + 0x1c);
        range = *(s32 *)(actor + 0x260);
        if (Type7Actor_HasSpecialCallbackPair(actor) != 0)
            range += 0x30000;
        if (distance >= range)
            continue;
        if (bestIndex == -1 || bestPriority > data_021056b8[i]) {
            bestIndex = i;
            bestPriority = data_021056b8[i];
        }
    }
    if (bestIndex == -1)
        return 0;

    *(void **)(actor + 0x210) = data_02105690[bestIndex];
    if (Type7Actor_HasSpecialCallbackPair(actor) == 0) {
        if (finiteMode != 0)
            func_020481dc(actor, data_020e18e8[0], data_020e18e8[1], 20);
        else
            func_020481dc(actor, data_020e18e0[0], data_020e18e0[1], -1);
        *(u16 *)(actor + 0x256) = 60;
        *(u16 *)(actor + 0x25a) = 0;
    }
    return 1;
}

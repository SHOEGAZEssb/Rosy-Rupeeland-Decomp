#include "tingle/types.h"

/*
 * Recovered touch-driven interaction handler for the type-seven actor. It
 * filters actor/callback states, starts one of two reactions, and forwards a
 * converted touch position to a compatible target actor.
 */
extern u8 data_020e16b0[];
extern u8 data_020e16e0[];
extern u32 data_020e1730[];
extern u8 data_020e1790[];
extern u8 data_020e1870[];
extern u32 data_020e18f8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorDerivedRuntime_AcceptInteractionQuery(void *actor, const void *input);
extern void Actor_SetInteractionFlag2000(void *actor, const void *input);
extern s32 func_0204c74c(void *actor, const void *input);
extern s32 func_02046d8c(const void *actor);
extern void func_0204b7bc(void *actor, s32 mode);
extern void func_020481dc(void *actor, u32 first, u32 second, s32 duration);
extern void TouchPoint_Init(void *point, s32 x, s32 y);
extern void func_02005030(void *destination, const void *source);
extern void func_02005058(void *value);
extern void ActorDerivedType1_TrySetStateVector(void *target, const void *transform, s32 duration,
                          s32 mode);
extern s32 Actor_TestQueryPoint(void *actor, const void *input);
extern s32 func_020486a8(void *actor);
extern void *func_020050a4(void *destination, const void *source);
extern u32 genrand_int32(void);
extern s32 func_020ada8c(s32 value, s32 divisor);
#ifdef __cplusplus
}
#endif

/* Return whether the callback pair at +0x208/+0x20c has the retail encoding. */
static s32 callback_pair_matches(const u8 *actor, void *first, void *second)
{
    void *actorFirst = *(void *const *)(actor + 0x208);
    return actorFirst == first
        && (*(void *const *)(actor + 0x20c) == second || actorFirst == 0);
}

/* Convert input words +4/+8 from screen-like coordinates into actor-relative units. */
static void initialize_relative_touch(u32 point[3], const u8 *actor,
                                      const u8 *input)
{
    s32 x = *(const s32 *)(input + 4) - (*(const s32 *)(actor + 0x1c) >> 12);
    s32 y = *(const s32 *)(input + 8)
        - ((*(const s32 *)(actor + 0x20) >> 12)
           - (*(const s32 *)(actor + 0x24) >> 12));
    TouchPoint_Init(point, x, y);
}

/*
 * Inputs are a type-seven actor and a touch/input record whose words +4/+8
 * supply coordinates. Return one on every path, matching the dispatcher
 * contract. A +0x01000000 actor is delegated immediately to
 * ActorDerivedRuntime_AcceptInteractionQuery.
 * Otherwise require the recovered readiness bits, timers, target pointer, and
 * func_0204c74c gate. Set actor flag 0x100 once those preliminary gates pass.
 * Three callback-pair representations are exclusion states; their symbol
 * offsets are retained because their semantic identities are not confirmed.
 *
 * For callback forms recognized by func_02046d8c, require a non-null +0x210
 * object whose type byte is not one. Start either the flag-0x4000 response or
 * the data_020e1730 response. If target +0x280 has type one, convert the touch
 * to actor-relative coordinates, add it to a temporary transform, forward it
 * through ActorDerivedType1_TrySetStateVector, and set timer +0x250 to -10.
 *
 * For other callback forms, require actor flag 0x2000 and a clear flag four.
 * Successful Actor_TestQueryPoint/func_020486a8 gates initialize the
 * data_020e18f8
 * response, save the transform at +0x224, set timer +0x250 to 90, optionally
 * randomize +0x24e to 90..209 for record subtype two, clear +0x210, and select
 * response mode four. Touch forwarding to a type-one target still occurs when
 * either gate declines the state transition. Actor, target, callback, random,
 * and animation state may change; no direct hardware access occurs.
 */
s32 func_02047248(void *self, const void *inputRecord)
{
    u8 *actor = (u8 *)self;
    const u8 *input = (const u8 *)inputRecord;
    u8 *record;
    u8 *target;
    u32 point[3];
    u32 transform[4];
    u32 flags;

    if ((*(u32 *)(actor + 0x10) & 0x01000000) != 0) {
        ActorDerivedRuntime_AcceptInteractionQuery(actor, input);
        return 1;
    }
    if (*(u16 *)(actor + 0x2a6) != 0)
        return 1;
    Actor_SetInteractionFlag2000(actor, input);
    if (func_0204c74c(actor, input) == 0)
        return 1;

    target = *(u8 **)(actor + 0x280);
    if (target == 0)
        return 1;
    record = *(u8 **)(actor + 0x29c);
    if ((*(u16 *)(record + 0x38) & 2) == 0)
        return 1;
    flags = *(u32 *)(actor + 0x268);
    if ((flags & 0x8000) == 0 || *(void **)(actor + 0x234) != 0
        || *(s16 *)(actor + 0x246) > 0)
        return 1;
    *(u32 *)(actor + 0x268) = flags | 0x100;

    if (callback_pair_matches(actor, *(void **)(data_020e16b0 + 0x30),
                              *(void **)(data_020e16e0 + 4)))
        return 1;
    if (callback_pair_matches(actor, *(void **)(data_020e16b0 + 0x1c0),
                              *(void **)(data_020e1870 + 4)))
        return 1;
    if (callback_pair_matches(actor, *(void **)(data_020e16b0 + 0xe0),
                              *(void **)(data_020e1790 + 4)))
        return 1;
    if (*(s16 *)(actor + 0x250) < 0
        || (*(u32 *)(actor + 0x268) & 0x68) != 0)
        return 1;

    if (func_02046d8c(actor) != 0) {
        u8 *related = *(u8 **)(actor + 0x210);
        if (related == 0 || related[0x4d] == 1)
            return 1;
        if ((*(u32 *)(actor + 0x268) & 0x4000) != 0) {
            *(u16 *)(actor + 0x2a0) = 180;
            *(s16 *)(actor + 0x264) = -20;
            func_0204b7bc(actor, 4);
        } else {
            func_020481dc(actor, data_020e1730[0], data_020e1730[1], 60);
            *(u16 *)(actor + 0x2a2) = 0;
        }
        if (target[0x4d] == 1) {
            initialize_relative_touch(point, actor, input);
            func_02005030(transform, actor + 0x18);
            transform[1] += (s32)point[1] << 12;
            transform[2] += (s32)point[2] << 12;
            ActorDerivedType1_TrySetStateVector(target, transform, 20, 0);
            *(s16 *)(actor + 0x250) = -10;
            func_02005058(transform);
        }
        return 1;
    }

    if ((*(u32 *)(actor + 0x10) & 0x2000) == 0
        || (*(u32 *)(actor + 0x268) & 4) != 0)
        return 1;
    if (Actor_TestQueryPoint(actor, input) != 0 && func_020486a8(actor) != 0) {
        *(u16 *)(actor + 0x266) = 0;
        flags = *(u32 *)(actor + 0x268);
        *(u32 *)(actor + 0x268) = (flags | 4) & ~0xa0;
        func_020481dc(actor, data_020e18f8[0], data_020e18f8[1], 20);
        func_020050a4(actor + 0x224, actor + 0x18);
        *(u16 *)(actor + 0x250) = 90;
        if (record[0x54] == 2)
            *(u16 *)(actor + 0x24e) =
                (u16)(func_020ada8c((s32)(genrand_int32() & 0x7fffffff), 120)
                      + 90);
        *(void **)(actor + 0x210) = 0;
        func_0204b7bc(actor, 4);
    }

    initialize_relative_touch(point, actor, input);
    if (target[0x4d] == 1) {
        func_02005030(transform, actor + 0x18);
        transform[1] += (s32)point[1] << 12;
        transform[2] += (s32)point[2] << 12;
        ActorDerivedType1_TrySetStateVector(target, transform, 20, 0);
        func_02005058(transform);
    }
    return 1;
}

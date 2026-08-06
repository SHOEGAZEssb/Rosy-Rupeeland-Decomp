#include "tingle/types.h"

/*
 * Recovered type-seven target-state predicates. They cancel or install callback
 * states according to the global target object, actor distance, and flags.
 */
extern u8 *data_021052fc;
extern u8 data_020e16b0[];
extern u8 data_020e17b8[];
extern u32 data_020e1928[];
extern u32 data_020e1920[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02046d8c(const void *actor);
extern s32 func_020adcac(const void *first, const void *second);
extern void *func_020050a4(void *destination, const void *source);
extern void func_020481dc(void *actor, u32 first, u32 second, s32 duration);
#ifdef __cplusplus
}
#endif

/* Test an offset-derived callback pair whose semantic identity is unconfirmed. */
static s32 callback_pair_matches(const u8 *actor, void *first, void *second)
{
    void *actorFirst = *(void *const *)(actor + 0x208);
    return actorFirst == first
        && (*(void *const *)(actor + 0x20c) == second || actorFirst == 0);
}

/*
 * Input is a type-seven actor. Return zero immediately when related object
 * +0x210 equals the global object at data_021052fc+0x2ea4, or actor flag
 * 0x20000 is set. Build a distance limit from +0x25c, multiplying it by three
 * for callback pair data_020e16b0+0x108/data_020e17b8 and by one otherwise,
 * then add 0x20000 for collision bit +0xd0/0x40000 or 0x10000 otherwise.
 *
 * When flag four is clear or func_02046d8c recognizes the callback, compare
 * the recovered distance between actor fields +0x1c and +0x218 to that limit
 * and return zero when within it. Otherwise, or when beyond it, restore +0x214
 * from saved transform +0x224 if flag four is set, null +0x210, install
 * data_020e1928 for 120 ticks, and return one. Actor transform and callback
 * state may change; there are no SDK or hardware effects.
 */
s32 func_0204820c(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *globalObject = *(u8 **)(data_021052fc + 0x2ea4);
    u32 flags = *(u32 *)(actor + 0x268);
    s32 multiplier;
    s32 limit;

    if (*(u8 **)(actor + 0x210) == globalObject || (flags & 0x20000) != 0)
        return 0;
    multiplier = callback_pair_matches(
        actor, *(void **)(data_020e16b0 + 0x108),
        *(void **)(data_020e17b8 + 4)) ? 3 : 1;
    limit = *(s32 *)(actor + 0x25c) * multiplier;
    limit += (*(u32 *)(actor + 0xd0) & 0x40000) != 0
        ? 0x20000 : 0x10000;
    if ((flags & 4) == 0 || func_02046d8c(actor) != 0) {
        if (func_020adcac(actor + 0x1c, actor + 0x218) <= limit)
            return 0;
    }
    if ((*(u32 *)(actor + 0x268) & 4) != 0)
        func_020050a4(actor + 0x214, actor + 0x224);
    *(void **)(actor + 0x210) = 0;
    func_020481dc(actor, data_020e1928[0], data_020e1928[1], 120);
    return 1;
}

/*
 * Input is a type-seven actor. Read the global object at
 * data_021052fc+0x2ea4 and return zero when its +0x270 pointer is null.
 * Otherwise null actor +0x210, install data_020e1920 with duration -1, and
 * return one. Actor callback state may change; no SDK or hardware effect occurs.
 */
s32 func_0204832c(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *globalObject = *(u8 **)(data_021052fc + 0x2ea4);
    if (*(void **)(globalObject + 0x270) == 0)
        return 0;
    *(void **)(actor + 0x210) = 0;
    func_020481dc(actor, data_020e1920[0], data_020e1920[1], -1);
    return 1;
}

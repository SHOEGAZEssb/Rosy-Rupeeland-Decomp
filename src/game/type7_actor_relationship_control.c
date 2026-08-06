#include "tingle/types.h"

/*
 * Recovered type-seven relationship controls. They gate assignment of a
 * related object by installed callback pairs and clear a reciprocal global
 * relationship when an actor is removed.
 */
extern u8 data_020e16b0[];
extern u8 data_020e1758[];
extern u32 data_020e1760[];
extern u8 data_020e1768[];
extern u8 data_020e1890[];
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020481dc(void *actor, u32 first, u32 second, s32 duration);
#ifdef __cplusplus
}
#endif

/* Test an offset-derived callback pair whose semantic identity is unconfirmed. */
static s32 callback_pair_matches(const u8 *actor, const void *first,
                                 const void *second)
{
    const void *actorFirst = *(void *const *)(actor + 0x208);
    return actorFirst == first
        && (*(void *const *)(actor + 0x20c) == second || actorFirst == 0);
}

/*
 * Inputs are a type-seven actor and a candidate related object. Continue only
 * when the installed pair matches either data_020e16b0+0xb8/data_020e1768+4
 * or data_020e16b0+0x1e0/data_020e1890+4. If it instead matches the excluded
 * pair data_020e16b0+0xa8/data_020e1758+4, return unchanged. Otherwise store
 * the candidate at +0x210 and install callback pair data_020e1760 indefinitely.
 * Actor relationship and callback state may change; there is no return value
 * and no SDK or hardware effect.
 */
void func_0204a3d8(void *self, void *candidate)
{
    u8 *actor = (u8 *)self;
    s32 allowed = callback_pair_matches(
        actor, *(void **)(data_020e16b0 + 0xb8),
        *(void **)(data_020e1768 + 4));
    if (!allowed) {
        allowed = callback_pair_matches(
            actor, *(void **)(data_020e16b0 + 0x1e0),
            *(void **)(data_020e1890 + 4));
    }
    if (!allowed)
        return;
    if (callback_pair_matches(actor, *(void **)(data_020e16b0 + 0xa8),
                              *(void **)(data_020e1758 + 4)))
        return;
    *(void **)(actor + 0x210) = candidate;
    func_020481dc(actor, data_020e1760[0], data_020e1760[1], -1);
}

/*
 * Input is an actor pointer that may be referenced by the global actor at
 * data_021052fc+0x2ea8. If that global actor and its related pointer +0x210
 * both exist and the pointer equals the input, clear the reciprocal link.
 * Global relationship state may change; there is no return value or direct
 * SDK/hardware effect.
 */
void func_0204a4bc(void *actor)
{
    u8 *globalActor = *(u8 **)(data_021052fc + 0x2ea8);
    if (globalActor != 0 && *(void **)(globalActor + 0x210) != 0
        && *(void **)(globalActor + 0x210) == actor)
        *(void **)(globalActor + 0x210) = 0;
}

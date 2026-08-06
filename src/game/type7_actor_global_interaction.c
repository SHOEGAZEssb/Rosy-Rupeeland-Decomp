#include "tingle/types.h"

/*
 * Recovered global interaction callback for the type-seven actor. It updates
 * the global object against the active type-seven actor and conditionally
 * forwards the triggering object into the actor's interaction handler.
 */
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02038d38(void *globalObject, const void *transform,
                          s32 distance, s32 mode);
extern void func_02048378(void *actor, void *trigger);
extern s32 func_0204aff4(void *actor);
extern s32 func_0204c74c(void);
#ifdef __cplusplus
}
#endif

/*
 * Input is an interaction trigger. Return immediately unless func_0204c74c
 * permits processing and the global actor at data_021052fc+0x2ea8 exists.
 * Update the global object at +0x2ea4 from that actor's transform +0x18 with
 * recovered distance 20 and mode zero. Continue only when descriptor +0x29c
 * halfword +0x38 has bit three set and func_0204aff4 returns zero or one; then
 * call func_02048378 with the global actor and input trigger. Global object,
 * actor interaction, and callback state may change. No value is returned and
 * no direct SDK or hardware effects occur.
 */
void func_0204a4f0(void *trigger)
{
    u8 *state;
    u8 *actor;

    if (func_0204c74c() == 0)
        return;
    state = data_021052fc;
    actor = *(u8 **)(state + 0x2ea8);
    if (actor == 0)
        return;
    func_02038d38(*(void **)(state + 0x2ea4), actor + 0x18, 20, 0);
    if ((*(u16 *)(*(u8 **)(actor + 0x29c) + 0x38) & 8) == 0)
        return;
    if (func_0204aff4(actor) < 2)
        func_02048378(actor, trigger);
}

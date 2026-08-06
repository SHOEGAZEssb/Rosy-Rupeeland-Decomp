#include "tingle/types.h"

/*
 * Recovered callbacks for querying and releasing the partner stored at actor
 * offset +0x298 by the cross-type pairing pass.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02040400(void *actor);
extern void func_02042408(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Return one when func_02040400 reports actor activity, or when a partner at
 * +0x298 exists and its virtual predicate at vtable +0xa8 returns nonzero;
 * otherwise return zero. Predicate calls may observe or change actor state.
 */
s32 func_02043d78(void *self)
{
    u8 *actor = (u8 *)self;
    void *partner;
    if (func_02040400(actor) != 0)
        return 1;
    partner = *(void **)(actor + 0x298);
    if (partner != 0
        && (*(s32 (**)(void *))(*(u8 **)partner + 0xa8))(partner) != 0) {
        return 1;
    }
    return 0;
}

/*
 * Apply func_02042408 to actor, then, when partner +0x298 is nonnull, invoke
 * its vtable callback at +0x1d8. Returns no value; both actors' state may
 * change, with no direct SDK or hardware access.
 */
void func_02043dbc(void *self)
{
    u8 *actor = (u8 *)self;
    void *partner;
    func_02042408(actor);
    partner = *(void **)(actor + 0x298);
    if (partner != 0)
        (*(void (**)(void *))(*(u8 **)partner + 0x1d8))(partner);
}

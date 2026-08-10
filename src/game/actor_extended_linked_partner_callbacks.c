#include "tingle/types.h"

/*
 * Recovered callbacks for querying and releasing the partner stored at actor
 * offset +0x298 by the cross-type pairing pass.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorExtendedType2_CheckRuntimeGroupProximity(void *actor);
extern void func_02042408(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Return one when ActorExtendedType2_CheckRuntimeGroupProximity succeeds, or
 * when a partner at +0x298 exists and its virtual predicate at vtable +0xa8
 * returns nonzero; otherwise return zero. The matching proximity call passes
 * only actor explicitly, preserving the caller's incoming r1 as the descriptor
 * argument. Predicate calls may observe or change actor state.
 */
s32 ActorExtendedLinked_CheckGroupProximityOrPartnerActive(void *self)
{
    u8 *actor = (u8 *)self;
    void *partner;
    if (ActorExtendedType2_CheckRuntimeGroupProximity(actor) != 0)
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
void ActorExtendedLinked_NotifyPartner(void *self)
{
    u8 *actor = (u8 *)self;
    void *partner;
    func_02042408(actor);
    partner = *(void **)(actor + 0x298);
    if (partner != 0)
        (*(void (**)(void *))(*(u8 **)partner + 0x1d8))(partner);
}

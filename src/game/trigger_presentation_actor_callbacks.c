#include "tingle/types.h"

/*
 * Recovered update and interaction callbacks for the trigger-presentation
 * actor, including a thin inherited callback thunk.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_SetRuntimeFlag80(void *actor);
extern void ActorContactState_AddContact(void *actor);
extern void func_02032abc(void);
extern void Actor_TryDispatchActivationMode2(void *actor);
extern s32 Actor_UpdateTimedResourceState(void *actor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is an actor. Run Actor_SetRuntimeFlag80 and then Actor_UpdateTimedResourceState, discarding the
 * latter's result after the retail comparison against zero. Returns nothing;
 * only the callees' engine effects are observable and hardware is untouched directly.
 */
void func_0204eaac(void *actor)
{
    Actor_SetRuntimeFlag80(actor);
    (void)(Actor_UpdateTimedResourceState(actor) == 0);
}

/*
 * Inputs are an actor, another actor, and a condition value. Run the inherited
 * callback ActorContactState_AddContact. If pointer 0x188 is non-null, the other actor's byte
 * 0x4D equals one, and the condition is zero, invoke Actor_TryDispatchActivationMode2 on the first
 * actor. Always return one. Engine state may change; no direct hardware effects.
 */
s32 func_0204eac8(void *actor, const void *other, s32 condition)
{
    ActorContactState_AddContact(actor);
    if (FIELD(void *, actor, 0x188) != 0 &&
        FIELD(u8, other, 0x4d) == 1 && condition == 0) {
        Actor_TryDispatchActivationMode2(actor);
    }
    return 1;
}

/*
 * Forward all register inputs to func_02032abc and propagate its return value.
 * This tail-call thunk has only the callee's engine effects.
 */
void func_0204eb0c(void)
{
    func_02032abc();
}


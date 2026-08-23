#include "tingle/types.h"

/*
 * Recovered type-seven target scan and binding helpers. They search a global
 * object collection for nearby compatible type-four actors and manage the
 * actor's persistent +0x280 target.
 */
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void **GamePhaseRuntime_GetActorCollection(void *world, s32 collection);
extern s32 func_020adcac(const void *first, const void *second);
extern void Type7Actor_HandleObjectInteraction(void *actor, void *other);
/* The loose second parameter preserves retail r1 traffic; the callee uses r0. */
extern void Actor_DestroyInteractionIcon(void *actor, void *ignoredIcon);
extern void AttachmentController_SetEnabled(void *value, s32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Return one while counter +0x256 or +0x25a is
 * nonzero. With actor flag four set, return zero when flag 0x100 is also set or
 * animation +0xd6 is neither one nor two. Record subtype two also returns zero.
 *
 * Otherwise repeatedly query collection one through GamePhaseRuntime_GetActorCollection and scan its
 * count at returned-base +0x2e74. Consider non-null type-four entries whose
 * halfword +0x4e is 0x21 or 0x12. Their planar distance from actor +0x1c must
 * be below 0x60000 for kind 0x21 or 0xa0000 for kind 0x12. Select the nearest
 * eligible object, pass it to Type7Actor_HandleObjectInteraction, and return one; return zero when
 * none exists. Actor interaction state may change through that dispatcher; no
 * direct SDK or hardware effects occur.
 */
s32 Type7Actor_TryInteractWithNearbyType4Object(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *best = 0;
    s32 bestDistance = 0;
    s32 index = 0;

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
    if ((*(u8 **)(actor + 0x29c))[0x54] == 2)
        return 0;

    while (index < *(s32 *)((u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1)
                            + 0x2e74)) {
        u8 *candidate =
            (u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1)[index];
        if (candidate != 0 && candidate[0x4d] == 4) {
            u16 kind = *(u16 *)(candidate + 0x4e);
            if (kind == 0x21 || kind == 0x12) {
                s32 distance = func_020adcac(actor + 0x1c,
                                             candidate + 0x1c);
                s32 limit = kind == 0x21 ? 0x60000 : 0xa0000;
                if (distance < limit
                    && (best == 0 || distance < bestDistance)) {
                    best = candidate;
                    bestDistance = distance;
                }
            }
        }
        ++index;
    }
    if (best == 0)
        return 0;
    Type7Actor_HandleObjectInteraction(actor, best);
    return 1;
}

/*
 * Inputs are actor and target. Store target at +0x280, set actor flag 0x10,
 * destroy the interaction icon when non-null, forwarding that icon as the
 * retail call's ignored second argument, and clear +0xd0 bit 0x100.
 * Actor relation, callback, and subordinate object state may change; no value
 * is returned and there is no direct hardware effect.
 */
void Type7Actor_SetTarget(void *self, void *target)
{
    u8 *actor = (u8 *)self;
    *(void **)(actor + 0x280) = target;
    *(u32 *)(actor + 0x268) |= 0x10;
    if (*(void **)(actor + 0x1e0) != 0)
        Actor_DestroyInteractionIcon(
            actor, *(void **)(actor + 0x1e0));
    *(u32 *)(actor + 0xd0) &= ~0x100;
}

/*
 * Input is a type-seven actor. Null target +0x280, clear actor flag 0x10,
 * destroy the interaction icon when non-null, reset subobject +0x2a8 with mode
 * zero, and clear word +0x108. Actor relation and subordinate state may change;
 * no value is returned and no hardware is accessed directly.
 */
void Type7Actor_ClearTarget(void *self)
{
    u8 *actor = (u8 *)self;
    *(void **)(actor + 0x280) = 0;
    *(u32 *)(actor + 0x268) &= ~0x10;
    if (*(void **)(actor + 0x1e0) != 0)
        Actor_DestroyInteractionIcon(
            actor, *(void **)(actor + 0x1e0));
    AttachmentController_SetEnabled(actor + 0x2a8, 0);
    *(u32 *)(actor + 0x108) = 0;
}

#include "tingle/types.h"

/*
 * Recovered type-seven animation-state callbacks. They clear or validate motion
 * state, select animation IDs, and invoke the actor reset on proximity events.
 */
#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_SetComponents(void *value, s32 x, s32 y, s32 z);
extern s32 Type7Actor_HasFlag4Target(void *actor);
extern void Type7Actor_ResetInteractionState(void *actor);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern s32 SignedAbsoluteValueVariant(s32 value);
extern void Type7Actor_PlayStateSound(void *actor, s32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Clear flag 0x8000 and select animation eleven
 * when +0x1dc is below +0x24, or animation three otherwise. Return zero. Actor
 * flags and animation change; no SDK or hardware effects occur.
 */
s32 Type7Actor_UpdateAnimation3ByHeight(void *self)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0x268) &= ~0x8000;
    *(u16 *)(actor + 0xd6) =
        *(s32 *)(actor + 0x1dc) < *(s32 *)(actor + 0x24) ? 11 : 3;
    return 0;
}

/*
 * Input is a type-seven actor. Clear directional words +0x3c/+0x40 and zero
 * vector-like values +0x88/+0x98. With no +0x280 target, return zero. Unless
 * actor flag 0x40 is set, flag 0x20 plus Type7Actor_HasFlag4Target acceptance clears that
 * flag and runs Type7Actor_ResetInteractionState; otherwise flag 0x80 resets when the absolute
 * Actor_GetCachedTerrainHeight difference between actor and target is below 0x20000.
 *
 * If no reset occurs, select animation eleven below height +0x1dc, animation
 * five when flag 0x20 is set, or animation four otherwise. Return zero on every
 * path. Actor motion, callback, resource, flags, and animation may change; no
 * direct hardware access occurs.
 */
s32 Type7Actor_UpdateTargetProximityState(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *target;
    *(s32 *)(actor + 0x40) = 0;
    *(s32 *)(actor + 0x3c) = 0;
    VecFx32Object_SetComponents(actor + 0x88, 0, 0, 0);
    VecFx32Object_SetComponents(actor + 0x98, 0, 0, 0);
    target = *(u8 **)(actor + 0x280);
    if (target == 0)
        return 0;
    if ((*(u32 *)(actor + 0x268) & 0x40) == 0) {
        if ((*(u32 *)(actor + 0x268) & 0x20) != 0
            && Type7Actor_HasFlag4Target(actor) != 0) {
            *(u32 *)(actor + 0x268) &= ~0x20;
            Type7Actor_ResetInteractionState(actor);
            return 0;
        }
        if ((*(u32 *)(actor + 0x268) & 0x80) != 0
            && SignedAbsoluteValueVariant(Actor_GetCachedTerrainHeight(actor)
                             - Actor_GetCachedTerrainHeight(target)) < 0x20000) {
            Type7Actor_ResetInteractionState(actor);
            return 0;
        }
    }
    if (*(s32 *)(actor + 0x1dc) < *(s32 *)(actor + 0x24))
        *(u16 *)(actor + 0xd6) = 11;
    else
        *(u16 *)(actor + 0xd6) =
            (*(u32 *)(actor + 0x268) & 0x20) != 0 ? 5 : 4;
    return 0;
}

/*
 * Input is a type-seven actor. Select animation seven when flag four is set,
 * or animation six otherwise, then return zero. No SDK or hardware effects
 * occur.
 */
s32 Type7Actor_SelectAnimation6Or7(void *self)
{
    u8 *actor = (u8 *)self;
    *(u16 *)(actor + 0xd6) =
        (*(u32 *)(actor + 0x268) & 4) != 0 ? 7 : 6;
    return 0;
}

/*
 * Input is a type-seven actor. When signed counter +0x248 equals ten, select
 * response mode zero through Type7Actor_PlayStateSound. Select animation six and return
 * zero. Actor response and animation may change; no hardware effect occurs.
 */
s32 Type7Actor_UpdateAnimation6Response(void *self)
{
    u8 *actor = (u8 *)self;
    if (*(s16 *)(actor + 0x248) == 10)
        Type7Actor_PlayStateSound(actor, 0);
    *(u16 *)(actor + 0xd6) = 6;
    return 0;
}

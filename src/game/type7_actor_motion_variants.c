#include "tingle/types.h"

/*
 * Recovered motion callbacks for three related type-seven actor states. They
 * prepare a temporary destination, run the shared target gates, and either
 * return the actor to its idle state or hand the destination to its motion
 * controller.
 */
extern s16 gFx32CosSinTable[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *VecFx32Object_Assign(void *destination, const void *source);
extern u32 genrand_int32(void);
extern s32 func_020ada8c(s32 value, s32 divisor);
extern s32 func_020adcac(const void *first, const void *second);
extern s32 SignedAbsoluteValueVariant(s32 value);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern void Type7Actor_UpdateMotionTowardTransform(void *actor, const void *transform);
extern void Type7Actor_ResetInteractionState(void *actor);
extern s32 Type7Actor_TryCancelDistantTarget(void *actor);
extern s32 Type7Actor_TryInstallGlobalTargetCallback(void *actor);
extern s32 Type7Actor_TryAcquireTarget(void *actor, s32 finiteMode);
extern void Type7Actor_EnterFlag20State(void *actor);
extern void Type7Actor_EnterFlag80State(void *actor);
extern void Type7Actor_AdjustDestinationForCollisions(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Set actor flag 0x8000 and clear +0xd0 bit one.
 * When signed counter +0x248 is zero, copy saved transform +0x214 to +0x78,
 * use one sign-cleared random value modulo 0x10000 to choose a direction-table
 * entry, add a fixed 0x80 displacement for record subtype two or 0x18 for the
 * other subtypes, and clear related object +0x210.
 *
 * Try the shared object, target-state, and finite acquisition gates in order.
 * If none handles the actor, choose +0x18 while signed counter +0x264 is
 * positive or +0x224 while flag four is set, then update motion toward +0x78.
 * Return the actor to its idle state when both motion words +0x3c/+0x40 become
 * zero. The function always returns zero; it mutates actor, target, random,
 * and motion state and has no direct hardware effects.
 */
s32 Type7Actor_UpdateRandomOffsetMotion(void *self)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0x268) |= 0x8000;
    *(u32 *)(actor + 0xd0) &= ~2;

    if (*(s16 *)(actor + 0x248) == 0) {
        u32 direction;
        s32 displacement;
        s32 index;

        VecFx32Object_Assign(actor + 0x78, actor + 0x214);
        direction = (u32)func_020ada8c(
            (s32)(genrand_int32() & 0x7fffffff), 0x10000);
        displacement = (*(u8 **)(actor + 0x29c))[0x54] == 2 ? 0x80 : 0x18;
        index = (s32)(direction & 0xffff) >> 4;
        *(s32 *)(actor + 0x7c) +=
            displacement * gFx32CosSinTable[index * 2 + 1];
        *(s32 *)(actor + 0x80) +=
            displacement * gFx32CosSinTable[index * 2];
        *(void **)(actor + 0x210) = 0;
    }

    if (Type7Actor_TryInstallGlobalTargetCallback(actor) != 0 || Type7Actor_TryCancelDistantTarget(actor) != 0
        || Type7Actor_TryAcquireTarget(actor, 1) != 0)
        return 0;
    if (*(s16 *)(actor + 0x264) > 0)
        VecFx32Object_Assign(actor + 0x78, actor + 0x18);
    else if ((*(u32 *)(actor + 0x268) & 4) != 0)
        VecFx32Object_Assign(actor + 0x78, actor + 0x224);
    Type7Actor_UpdateMotionTowardTransform(actor, actor + 0x78);
    if (*(s32 *)(actor + 0x3c) == 0 && *(s32 *)(actor + 0x40) == 0)
        Type7Actor_ResetInteractionState(actor);
    return 0;
}

/*
 * Input and return behavior match Type7Actor_UpdateRandomOffsetMotion, but set +0xd0 bit one instead
 * of clearing it. After the shared gates and destination selection, call
 * Type7Actor_AdjustDestinationForCollisions before updating motion. The exact additional state maintained
 * by that helper is not yet known. Actor, target, random, and motion state may
 * change; no direct hardware access occurs.
 */
s32 Type7Actor_UpdateRandomOffsetMotionVariant(void *self)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0x268) |= 0x8000;
    *(u32 *)(actor + 0xd0) |= 2;

    if (*(s16 *)(actor + 0x248) == 0) {
        u32 direction;
        s32 displacement;
        s32 index;

        VecFx32Object_Assign(actor + 0x78, actor + 0x214);
        direction = (u32)func_020ada8c(
            (s32)(genrand_int32() & 0x7fffffff), 0x10000);
        displacement = (*(u8 **)(actor + 0x29c))[0x54] == 2 ? 0x80 : 0x18;
        index = (s32)(direction & 0xffff) >> 4;
        *(s32 *)(actor + 0x7c) +=
            displacement * gFx32CosSinTable[index * 2 + 1];
        *(s32 *)(actor + 0x80) +=
            displacement * gFx32CosSinTable[index * 2];
        *(void **)(actor + 0x210) = 0;
    }

    if (Type7Actor_TryInstallGlobalTargetCallback(actor) != 0 || Type7Actor_TryCancelDistantTarget(actor) != 0
        || Type7Actor_TryAcquireTarget(actor, 1) != 0)
        return 0;
    if (*(s16 *)(actor + 0x264) > 0)
        VecFx32Object_Assign(actor + 0x78, actor + 0x18);
    else if ((*(u32 *)(actor + 0x268) & 4) != 0)
        VecFx32Object_Assign(actor + 0x78, actor + 0x224);
    Type7Actor_AdjustDestinationForCollisions(actor);
    Type7Actor_UpdateMotionTowardTransform(actor, actor + 0x78);
    if (*(s32 *)(actor + 0x3c) == 0 && *(s32 *)(actor + 0x40) == 0)
        Type7Actor_ResetInteractionState(actor);
    return 0;
}

/*
 * Input is a type-seven actor. Set actor flag 0x8000 and +0xd0 bit one. When
 * related actor +0x280 exists, compare integer X/Y separation against 0x24000;
 * if outside that squared threshold while actor flag four is clear, dispatch
 * Type7Actor_EnterFlag20State. Otherwise compare the actors' Actor_GetCachedTerrainHeight values by absolute
 * difference and dispatch Type7Actor_EnterFlag80State when it reaches 0x20000.
 *
 * If neither relationship check dispatches, run the shared object and finite
 * acquisition gates. Select destination +0x18 while +0x264 is positive,
 * +0x224 while flag four is set, or saved transform +0x214 otherwise. Maintain
 * the extra state through Type7Actor_AdjustDestinationForCollisions, then update motion. While flag four is
 * clear, return to idle once the distance-like query between the actor and
 * temporary destination falls below 0x28000. Always return zero. The helper
 * calls may change actor and target state; no direct hardware access occurs.
 */
s32 Type7Actor_UpdateRelatedTargetMotion(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *related;

    *(u32 *)(actor + 0x268) |= 0x8000;
    *(u32 *)(actor + 0xd0) |= 2;
    related = *(u8 **)(actor + 0x280);
    if (related != 0) {
        s32 dy = (*(s32 *)(related + 0x20) >> 12)
            - (*(s32 *)(actor + 0x20) >> 12);
        s32 dx = (*(s32 *)(related + 0x1c) >> 12)
            - (*(s32 *)(actor + 0x1c) >> 12);
        if (dx * dx + dy * dy > 0x24000
            && (*(u32 *)(actor + 0x10) & 4) == 0) {
            Type7Actor_EnterFlag20State(actor);
            return 0;
        }
        if (SignedAbsoluteValueVariant(Actor_GetCachedTerrainHeight(actor) - Actor_GetCachedTerrainHeight(related))
            >= 0x20000) {
            Type7Actor_EnterFlag80State(actor);
            return 0;
        }
    }

    if (Type7Actor_TryInstallGlobalTargetCallback(actor) != 0 || Type7Actor_TryAcquireTarget(actor, 1) != 0)
        return 0;
    if (*(s16 *)(actor + 0x264) > 0)
        VecFx32Object_Assign(actor + 0x78, actor + 0x18);
    else if ((*(u32 *)(actor + 0x268) & 4) != 0)
        VecFx32Object_Assign(actor + 0x78, actor + 0x224);
    else
        VecFx32Object_Assign(actor + 0x78, actor + 0x214);
    Type7Actor_AdjustDestinationForCollisions(actor);
    Type7Actor_UpdateMotionTowardTransform(actor, actor + 0x78);
    if ((*(u32 *)(actor + 0x268) & 4) == 0
        && func_020adcac(actor + 0x1c, actor + 0x7c) < 0x28000)
        Type7Actor_ResetInteractionState(actor);
    return 0;
}

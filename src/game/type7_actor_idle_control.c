#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered type-seven target-disable, resource interaction, and idle-state
 * callbacks. They coordinate callback transitions with global presentation
 * state and target acquisition.
 */
extern void *gGameWork;
extern u8 *gGamePhaseRuntime;
extern u32 data_020e1788[];
extern u32 data_020e18d0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Type7Actor_ClearTarget(void *actor);
extern s32 AuxiliaryInteraction_MergeFrom(void *object, void *resource);
extern void AuxiliaryInteraction_Destroy(void *resource);
extern void GameWork_ClearFlag(void *gameWork, u32 flag);
extern void Type7Actor_SetCallbackPair(void *actor, u32 first, u32 second, s32 duration);
extern s32 func_0206cc68(void *object, void *actor, s32 mode);
extern void ActorMotionJitter_EnsureMinimum(void *context, s32 id, s32 mode);
extern s32 Type7Actor_TryInstallGlobalTargetCallback(void *actor);
extern s32 Type7Actor_TryCancelDistantTarget(void *actor);
extern s32 Type7Actor_TryAcquireTarget(void *actor, s32 finiteMode);
extern s32 Type7Actor_TryInteractWithNearbyType4Object(void *actor);
#ifdef __cplusplus
}
#endif

/* Invoke the actor's virtual +0x54 mode callback. */
static void set_virtual_mode(u8 *actor, s32 mode)
{
    typedef void (*ModeCallback)(void *actor, s32 mode);
    ModeCallback callback = *(ModeCallback *)(*(u8 **)actor + 0x54);
    callback(actor, mode);
}

/*
 * Input is a type-seven actor. Run Type7Actor_ClearTarget to clear its target, then set
 * actor flag 0x10000. Target, subordinate, and flag state may change; this
 * routine has no return value or direct SDK/hardware effect.
 */
void Type7Actor_DisableTargeting(void *self)
{
    u8 *actor = (u8 *)self;
    Type7Actor_ClearTarget(actor);
    *(u32 *)(actor + 0x268) |= 0x10000;
}

/*
 * Inputs are a type-seven actor and object; null object is ignored. When actor
 * resource +0x234 exists, require AuxiliaryInteraction_MergeFrom(object, resource), destroy and
 * free the resource, clear game-work flag 0x3fd, null +0x234, and install
 * data_020e1788 indefinitely. Without a resource, require
 * func_0206cc68(object, actor, 1) and install data_020e18d0 indefinitely.
 * On either accepted path set actor +0x14 bits two/four, invoke virtual mode
 * zero, and call ActorMotionJitter_EnsureMinimum on global context +0x2fbc with ID 0x28/mode four.
 * Actor callback, resource, heap, global flag, and presentation/audio-like
 * state may change. Heap_Free is the allocator effect; no value is returned.
 */
void Type7Actor_HandleResourceInteraction(void *self, void *object)
{
    u8 *actor = (u8 *)self;
    void *resource;
    if (object == 0)
        return;
    resource = *(void **)(actor + 0x234);
    if (resource != 0) {
        if (AuxiliaryInteraction_MergeFrom(object, resource) == 0)
            return;
        AuxiliaryInteraction_Destroy(resource);
        Heap_Free(resource);
        GameWork_ClearFlag(gGameWork, 0x3fd);
        *(void **)(actor + 0x234) = 0;
        Type7Actor_SetCallbackPair(actor, data_020e1788[0], data_020e1788[1], -1);
    } else {
        if (func_0206cc68(object, actor, 1) == 0)
            return;
        Type7Actor_SetCallbackPair(actor, data_020e18d0[0], data_020e18d0[1], -1);
    }
    *(u32 *)(actor + 0x14) |= 6;
    set_virtual_mode(actor, 0);
    ActorMotionJitter_EnsureMinimum(gGamePhaseRuntime + 0x2fbc, 0x28, 4);
}

/*
 * Input is a type-seven actor. Set flag 0x8000 and try, in order,
 * Type7Actor_TryInstallGlobalTargetCallback,
 * Type7Actor_TryCancelDistantTarget, and finite-mode Type7Actor_TryAcquireTarget. If none
 * changes state, select animation eleven when +0x1dc is below +0x24, or
 * animation one otherwise. Return zero on every path, matching the callback
 * contract. Actor relation, callback, flags, and animation may change; no
 * direct hardware effect occurs.
 */
s32 Type7Actor_UpdateIdleTargeting(void *self)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0x268) |= 0x8000;
    if (Type7Actor_TryInstallGlobalTargetCallback(actor) != 0 || Type7Actor_TryCancelDistantTarget(actor) != 0
        || Type7Actor_TryAcquireTarget(actor, 1) != 0)
        return 0;
    *(u16 *)(actor + 0xd6) =
        *(s32 *)(actor + 0x1dc) < *(s32 *)(actor + 0x24) ? 11 : 1;
    return 0;
}

/*
 * Input is a type-seven actor. Set flag 0x8000 and run the same three target
 * transitions as Type7Actor_UpdateIdleTargeting. If none succeeds and collision bit
 * +0xd0/0x40000 is set, also scan type-four objects through Type7Actor_TryInteractWithNearbyType4Object.
 * When all decline, select animation eleven below the +0x1dc height or two
 * otherwise. Return zero on every path. Actor target, callback, flags, and
 * animation may change; no SDK or hardware effect occurs directly.
 */
s32 Type7Actor_UpdateIdleTargetingWithType4Scan(void *self)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0x268) |= 0x8000;
    if (Type7Actor_TryInstallGlobalTargetCallback(actor) != 0 || Type7Actor_TryCancelDistantTarget(actor) != 0
        || Type7Actor_TryAcquireTarget(actor, 1) != 0)
        return 0;
    if ((*(u32 *)(actor + 0xd0) & 0x40000) != 0
        && Type7Actor_TryInteractWithNearbyType4Object(actor) != 0)
        return 0;
    *(u16 *)(actor + 0xd6) =
        *(s32 *)(actor + 0x1dc) < *(s32 *)(actor + 0x24) ? 11 : 2;
    return 0;
}

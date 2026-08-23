#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Reset actor motion and evaluate collision queries against actor geometry. */
#ifdef __cplusplus
extern "C" {
#endif
extern u32 GamePhaseRegion_ContainsPoint(const void *rectangle, s32 x, s32 y);
extern void S8BoundsCenter_Init(void *center, const void *bounds);
extern s32 ActorInteractionIcon_IsActive(const void *icon);
extern void ActorInteractionIcon_BuildHitBounds(
    s16 hitBounds[4], const void *icon,
    const VecFx32Object *actorCollisionCenter);
extern u32 Actor_TestQueryPoint(void *self, const void *query);
#ifdef __cplusplus
}
#endif

/*
 * Set actor flag 0x100 at +0xd0, invoke vtable slot 0x94 with argument zero,
 * then clear the two three-component motion vectors at +0x3c and +0x8c.
 * Returns no value; the virtual callback may update actor or presentation state.
 */
void func_020338e4(void *self)
{
    u8 *actor = (u8 *)self;
    void (*callback)(void *, s32);

    *(u32 *)(actor + 0xd0) |= 0x100;
    callback = *(void (**)(void *, s32))(*(u8 **)actor + 0x94);
    callback(actor, 0);
    *(s32 *)(actor + 0x3c) = 0;
    *(s32 *)(actor + 0x40) = 0;
    *(s32 *)(actor + 0x44) = 0;
    *(s32 *)(actor + 0x8c) = 0;
    *(s32 *)(actor + 0x90) = 0;
    *(s32 *)(actor + 0x94) = 0;
}

/* Empty recovered lifecycle hook; ignores self and returns no value. */
void func_02033928(void *self)
{
    (void)self;
}

/*
 * Mark the actor's interaction-query flag 0x2000 at +0x10 and return zero.
 * The flag's broader gameplay meaning is not yet confirmed.
 */
s32 Actor_SetInteractionFlag2000(void *self)
{
    *(u32 *)((u8 *)self + 0x10) |= 0x2000;
    return 0;
}

/*
 * Clear the actor's interaction-query flag 0x2000 at +0x10 and return zero.
 * No callbacks or hardware operations occur.
 */
s32 Actor_ClearInteractionFlag2000(void *self)
{
    *(u32 *)((u8 *)self + 0x10) &= ~0x2000;
    return 0;
}

/*
 * Run Actor_TestQueryPoint with the supplied query. If it returns zero, clear
 * actor flag 0x2000 and return the resulting entire flags word; otherwise
 * return the nonzero query result unchanged. This unusual zero-path return is
 * confirmed.
 */
u32 Actor_TestQueryPointAndClearFlag2000(void *self, const void *query)
{
    u8 *actor = (u8 *)self;
    u32 result = Actor_TestQueryPoint(actor, query);

    if (result == 0) {
        *(u32 *)(actor + 0x10) &= ~0x2000;
        result = *(u32 *)(actor + 0x10);
    }
    return result;
}

/*
 * Test query coordinates at query+4/+8 against an s16 rectangle recovered
 * from actor+0x60..+0x66 and translated by X and by Y-minus-Z in 20.12 space.
 * If actor +0x1e0 owns an active interaction icon, also build the center of
 * actor bounds +8, ask the icon for its directional hit bounds, and OR that
 * point test into the actor-bounds result. Returns the combined nonzero/zero
 * result. Vector helpers manage temporary state; actor and icon are unchanged.
 */
u32 Actor_TestQueryPoint(void *self, const void *query)
{
    u8 *actor = (u8 *)self;
    const u8 *queryBytes = (const u8 *)query;
    s16 actorHitBounds[4];
    u8 collisionBoundsCenter[8];
    VecFx32Object actorCollisionCenter;
    s16 iconHitBounds[4];
    s32 x = *(s32 *)(actor + 0x1c) >> 12;
    s32 y = (*(s32 *)(actor + 0x20) >> 12) -
            (*(s32 *)(actor + 0x24) >> 12);
    void *interactionIcon;
    u32 result;

    actorHitBounds[0] = *(s16 *)(actor + 0x60) + x;
    actorHitBounds[1] = *(s16 *)(actor + 0x62) + y;
    actorHitBounds[2] = *(s16 *)(actor + 0x64) + x;
    actorHitBounds[3] = *(s16 *)(actor + 0x66) + y;
    result = GamePhaseRegion_ContainsPoint(actorHitBounds,
                           *(s32 *)(queryBytes + 4),
                           *(s32 *)(queryBytes + 8));

    interactionIcon = *(void **)(actor + 0x1e0);
    if (interactionIcon != 0 &&
        ActorInteractionIcon_IsActive(interactionIcon) != 0) {
        S8BoundsCenter_Init(collisionBoundsCenter, actor + 8);
        VecFx32Object_InitComponents(
            &actorCollisionCenter,
            *(s32 *)(actor + 0x1c) +
                ((s8)collisionBoundsCenter[4] << 12),
            *(s32 *)(actor + 0x20) +
                ((s8)collisionBoundsCenter[5] << 12) -
                *(s32 *)(actor + 0x24),
            0);
        ActorInteractionIcon_BuildHitBounds(
            iconHitBounds, interactionIcon, &actorCollisionCenter);
        VecFx32Object_Destroy(&actorCollisionCenter);
        result |= GamePhaseRegion_ContainsPoint(
            iconHitBounds, *(s32 *)(queryBytes + 4),
            *(s32 *)(queryBytes + 8));
    }
    return result;
}

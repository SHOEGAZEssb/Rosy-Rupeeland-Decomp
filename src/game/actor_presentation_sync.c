#include "tingle/types.h"

/*
 * Project actor state into screen attachments, update the optional interaction
 * icon, and place the auxiliary height indicator.
 */
typedef struct ActorScreenPoint {
    void *vtable;
    s32 screenX;
    s32 screenY;
} ActorScreenPoint;

extern u8 gSceneTouchInitialData[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020adae4(s32, s32);
extern void *Actor_GetOwningCollection(void *);
extern s32 ActorCollection_GetFlagBit1(void *);
extern void ActorInteractionIcon_UpdateEnabledState(void *, s32);
extern void Actor_GetCollisionCenter(void *, void *);
extern void ActorInteractionIcon_UpdatePresentation(void *, const void *, const void *);
extern void VecFx32Object_Destroy(void *);
extern u32 Actor_QueryTerrainCell(void *, s32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
#ifdef __cplusplus
}
#endif

static s32 multiplyFx(s32 a, s32 b)
{
    return (s32)(((s64)a * b + 0x800) >> 12);
}

/*
 * Initialize the output TouchPoint-compatible screen position, derive screen
 * X/Y from actor world coordinates +0x1c/+0x20/+0x24 and borrowed view-origin
 * coordinates +0x04/+0x08, and optionally apply scale +0x1d0. Actor bounds
 * +0x68..+0x6e control primary +0x54 visibility and runtime flag mask 0x4.
 * Update primary position, priority +0x28, and optional scale; synchronize the
 * optional interaction icon +0x1e0; then update height-indicator attachment
 * +0xa8 from terrain, baseline +0x1dc, and height delta. Returns no value;
 * borrowed actor/presentation state changes, with no direct hardware access.
 *
 * Matching assembly is canonical. This compact portable source does not yet
 * reproduce five retail details: direct-coordinate mask 0x01000000 returns
 * before +0x1e0/+0xa8 work; non-direct primary priority uses view-relative Y;
 * auxiliary display requires mask 0x10000000 clear; terrain classes 17, 18,
 * and 20 hide the height indicator; and +0x1e0 enablement includes
 * reserved-peer, actor-bounds-overlap, and identity-byte gates. Keep those
 * discrepancies explicit until the complete matching control flow replaces
 * this host approximation.
 */
void Actor_UpdatePresentation(ActorScreenPoint *screenPosition,
                              void *actorObject,
                              const void *viewPositionPointer)
{
    u8 *actor = (u8 *)actorObject;
    const u8 *viewPosition = (const u8 *)viewPositionPointer;
    u8 *primaryAttachment = *(u8 **)(actor + 0x54);
    u8 *heightIndicatorAttachment;
    s32 worldX;
    s32 worldY;
    s32 worldZ;
    s32 isWithinViewBounds;

    screenPosition->vtable = gSceneTouchInitialData;
    screenPosition->screenX = 0;
    screenPosition->screenY = 0;
    if (*(u32 *)(actor + 0x14) & 0x200000) {
        if (primaryAttachment)
            *(u16 *)(primaryAttachment + 0x24) |= 8;
        return;
    }

    worldX = *(s32 *)(actor + 0x1c);
    worldY = *(s32 *)(actor + 0x20);
    worldZ = *(s32 *)(actor + 0x24);
    if (*(u32 *)(actor + 0x14) & 0x01000000) {
        screenPosition->screenX = worldX >> 12;
        screenPosition->screenY = worldY >> 12;
    } else {
        if (*(u32 *)(actor + 0x14) & 0x80000) {
            s32 scale = *(s32 *)(actor + 0x1d0);
            worldX = multiplyFx(worldX, scale);
            worldY = multiplyFx(worldY, scale);
            worldZ = multiplyFx(worldZ, scale);
        }
        screenPosition->screenX =
            (worldX >> 12) - (*(s32 *)(viewPosition + 0x04) >> 12);
        screenPosition->screenY =
            (worldY >> 12) - (*(s32 *)(viewPosition + 0x08) >> 12) -
            (worldZ >> 12);
    }

    isWithinViewBounds =
        screenPosition->screenX >= -*(s16 *)(actor + 0x6c) &&
        screenPosition->screenX < 0x100 - *(s16 *)(actor + 0x68) &&
        screenPosition->screenY >= -*(s16 *)(actor + 0x6e) &&
        screenPosition->screenY < 0xc0 - *(s16 *)(actor + 0x6a);
    if (primaryAttachment) {
        *(s16 *)(primaryAttachment + 0x2c) = (s16)screenPosition->screenX;
        *(s16 *)(primaryAttachment + 0x2e) = (s16)screenPosition->screenY;
        if (isWithinViewBounds)
            *(u16 *)(primaryAttachment + 0x24) &= ~8;
        else
            *(u16 *)(primaryAttachment + 0x24) |= 8;
    }
    if (isWithinViewBounds)
        *(u32 *)(actor + 0x10) |= 4;
    else
        *(u32 *)(actor + 0x10) &= ~4;

    if (primaryAttachment) {
        if ((*(u32 *)(actor + 0x14) & 0x01000000) ||
            !(*(u32 *)(actor + 0x14) & 0x4000))
            *(s16 *)(primaryAttachment + 0x28) =
                (s16)(0x8000 - (worldY >> 12) + *(s16 *)(actor + 0x5c));
        if (*(u32 *)(actor + 0x10) & 0x04000000) {
            s32 scale = *(s32 *)(actor + 0x1d0);
            *(s16 *)(primaryAttachment + 0x32) =
                (s16)func_020adae4(
                    multiplyFx(*(s32 *)(actor + 0x1d4), scale), 0x10);
            *(s16 *)(primaryAttachment + 0x34) =
                (s16)func_020adae4(
                    multiplyFx(*(s32 *)(actor + 0x1d8), scale), 0x10);
        }
    }

    if (!(*(u32 *)(actor + 0x14) & 0x01000000) &&
        *(void **)(actor + 0x1e0)) {
        void *interactionIcon = *(void **)(actor + 0x1e0);
        u8 actorCollisionCenter[0x10];
        s32 shouldShowInteractionIcon =
            *(void **)(actor + 0x184) &&
            (ActorCollection_GetFlagBit1(Actor_GetOwningCollection(actor)) & 1);
        if (!*(void **)(actor + 0x184) &&
            !(*(u32 *)(actor + 0x14) & 0x1000))
            shouldShowInteractionIcon = 0;
        ActorInteractionIcon_UpdateEnabledState(
            interactionIcon, shouldShowInteractionIcon);
        Actor_GetCollisionCenter(actorCollisionCenter, actor);
        ActorInteractionIcon_UpdatePresentation(
            interactionIcon, viewPosition, actorCollisionCenter);
        VecFx32Object_Destroy(actorCollisionCenter);
    }

    heightIndicatorAttachment = *(u8 **)(actor + 0xa8);
    if (heightIndicatorAttachment) {
        u32 terrain = Actor_QueryTerrainCell(actor, *(s32 *)(actor + 0x1c) >> 16,
                                    *(s32 *)(actor + 0x20) >> 16);
        s32 terrainHeight = (s32)(terrain << 27) >> 27;
        s32 baseline = *(s32 *)(actor + 0x1dc);
        s32 delta = *(s32 *)(actor + 0x24) - baseline;
        u32 flags = *(u32 *)(actor + 0x14);

        if (!(flags & 0x10000000) || !(flags & 0x02000000) ||
            (*(u16 *)(*(u8 **)(actor + 0x54) + 0x24) & 4) || delta <= 0) {
            *(u16 *)(heightIndicatorAttachment + 0x24) |= 8;
        } else {
            s32 mode = delta < 0x5800 ? 1 : (delta > 0x20000 ? 3 : 2);
            if (heightIndicatorAttachment[0x38] != mode)
                GraphicsSpriteState_SetAnimationIndex(
                    heightIndicatorAttachment, mode);
            *(u16 *)(heightIndicatorAttachment + 0x24) &= ~8;
            *(s16 *)(heightIndicatorAttachment + 0x2c) =
                (s16)((*(s32 *)(actor + 0x1c) -
                       *(s32 *)(viewPosition + 0x04)) >> 12);
            *(s16 *)(heightIndicatorAttachment + 0x2e) =
                (s16)(((*(s32 *)(actor + 0x20) -
                         *(s32 *)(viewPosition + 0x08)) >> 12) - 2 -
                      (baseline >> 12));
            heightIndicatorAttachment[0x3a] =
                baseline < (terrainHeight << 16) ? 2 : 1;
            *(s16 *)(heightIndicatorAttachment + 0x28) =
                (s16)(0x8007 - (((*(s32 *)(actor + 0x20) -
                                    *(s32 *)(viewPosition + 0x08)) >> 12) - 2));
        }
    }
}

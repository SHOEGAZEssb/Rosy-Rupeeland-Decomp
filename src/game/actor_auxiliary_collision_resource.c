#include "tingle/heap.h"
#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Own, animate, and position the actor's optional interaction icon. */
extern const char gActorInteractionIconAllocationTag[];

typedef struct AnimationResourceState {
    void *character;
    void *palette;
    void *cell;
} AnimationResourceState;

typedef struct ActorInteractionIcon {
    void *spriteGroup;
    void *spriteState;
    AnimationResourceState spriteResources;
    VecFx32Object offsetFx32;
    u32 stateFlags;
    u32 directionAngle;
} ActorInteractionIcon;

typedef char ActorInteractionIconSizeCheck[
    sizeof(ActorInteractionIcon) == 0x2c ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Actor_GetOwningCollection(void *actor);
extern void *ActorCollection_GetSpriteGroup(void *collection);
extern void *data_020f4e18;
extern void *AnimationResourceState_InitEmbedded(void *state);
extern void AnimationResourceState_ReplaceResources(void *state, void *archive, u32 characterId,
                          u32 paletteId, u32 cellId);
extern void *AnimationResourceState_Destroy(void *state);
extern void AnimationResourceState_ReleaseResources(void *state);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *group, const void *source, s32 attach);
extern void GraphicsSpriteState_SetAnimationIndex(void *state, s32 index);
extern void GraphicsSpriteGroup_ReleaseState(void *group, void *state);
extern void VecFx32_Subtract(VecFx32Object *result,
                             const VecFx32Object *left,
                             const VecFx32Object *right);
extern void VecFx32Object_InitPlanarProjection(void *destination, const void *source);
#ifdef __cplusplus
}
#endif

/*
 * Construct the interaction icon from retail resources 0x32ae, 0x3299, and
 * 0x32af. The icon borrows its sprite group, retains the three loaded resource
 * handles, owns the created sprite state, starts with a zero FX32 offset and
 * direction, and returns its caller-owned storage.
 */
ActorInteractionIcon *ActorInteractionIcon_Init(ActorInteractionIcon *self,
                                                void *spriteGroup)
{
    self->spriteGroup = spriteGroup;
    AnimationResourceState_InitEmbedded(&self->spriteResources);
    VecFx32Object_Init(&self->offsetFx32);
    self->stateFlags = (self->stateFlags & ~0x1fu) | 1u;
    self->directionAngle = 0;
    AnimationResourceState_ReplaceResources(&self->spriteResources, data_020f4e18, 0x32ae, 0x3299,
                  0x32af);
    self->spriteState = GraphicsSpriteGroup_CreateStateFromSource(
        self->spriteGroup, &self->spriteResources, 2);
    GraphicsSpriteState_SetAnimationIndex(self->spriteState, 0);
    *(u16 *)((u8 *)self->spriteState + 0x24) |= 2;
    *(u16 *)((u8 *)self->spriteState + 0x2c) = 0x80;
    *(u16 *)((u8 *)self->spriteState + 0x2e) = 0x60;
    *(u16 *)((u8 *)self->spriteState + 0x24) |= 4;
    return self;
}

/* Release the owned sprite and retained resource triplet, then return self. */
ActorInteractionIcon *ActorInteractionIcon_Destroy(ActorInteractionIcon *self)
{
    GraphicsSpriteGroup_ReleaseState(self->spriteGroup, self->spriteState);
    AnimationResourceState_ReleaseResources(&self->spriteResources);
    VecFx32Object_Destroy(&self->offsetFx32);
    AnimationResourceState_Destroy(&self->spriteResources);
    return self;
}

/*
 * Advance the icon's six-state show/hide animation and synchronize its screen
 * position with the borrowed view position and actor collision center. The
 * icon retains neither input.
 */
void ActorInteractionIcon_UpdatePresentation(
    ActorInteractionIcon *self, const VecFx32Object *viewPosition,
    const VecFx32Object *actorCollisionCenter)
{
    VecFx32Object relativePosition;
    VecFx32Object screenPositionFx32;
    u16 *spriteFlags = (u16 *)((u8 *)self->spriteState + 0x24);
    u32 state = (self->stateFlags >> 1) & 0xfu;

    switch (state) {
    case 1:
        *spriteFlags &= 0xfffbu;
        *spriteFlags &= 0xfffdu;
        GraphicsSpriteState_SetAnimationIndex(self->spriteState, 2);
        self->stateFlags = (self->stateFlags & ~0x1eu) | 4u;
        /* fall through */
    case 2:
        if ((*spriteFlags & 1u) != 0) {
            GraphicsSpriteState_SetAnimationIndex(self->spriteState, 0);
            *spriteFlags |= 2u;
            self->stateFlags = (self->stateFlags & ~0x1eu) | 6u;
        }
        break;
    case 4:
        *spriteFlags &= 0xfffbu;
        *spriteFlags &= 0xfffdu;
        GraphicsSpriteState_SetAnimationIndex(self->spriteState, 1);
        self->stateFlags = (self->stateFlags & ~0x1eu) | 10u;
        /* fall through */
    case 5:
        if ((*spriteFlags & 1u) != 0) {
            *spriteFlags |= 4u;
            self->stateFlags &= ~0x1eu;
        }
        break;
    default:
        break;
    }

    *(u16 *)((u8 *)self->spriteState + 0x30) =
        (u16)self->directionAngle;
    VecFx32_Subtract(&relativePosition, actorCollisionCenter, viewPosition);
    VecFx32Object_InitPlanarProjection(&screenPositionFx32, &relativePosition);
    VecFx32Object_Destroy(&relativePosition);
    screenPositionFx32.value.x += self->offsetFx32.value.x;
    screenPositionFx32.value.y += self->offsetFx32.value.y;
    *(u16 *)((u8 *)self->spriteState + 0x2c) =
        (u16)(screenPositionFx32.value.x >> 12);
    *(u16 *)((u8 *)self->spriteState + 0x2e) =
        (u16)(screenPositionFx32.value.y >> 12);
    *(u8 *)((u8 *)self->spriteState + 0x3a) = 0;
    *(u16 *)((u8 *)self->spriteState + 0x28) = 0x100;
    VecFx32Object_Destroy(&screenPositionFx32);
}

/* Advance the icon toward shown or hidden according to shouldShow. */
void ActorInteractionIcon_UpdateEnabledState(ActorInteractionIcon *self,
                                             s32 shouldShow)
{
    u32 state;

    if (shouldShow != 0 && (self->stateFlags & 1u) != 0) {
        state = (self->stateFlags >> 1) & 0xfu;
        if (state == 0)
            self->stateFlags = (self->stateFlags & ~0x1eu) | 2u;
        return;
    }
    state = (self->stateFlags >> 1) & 0xfu;
    if (state == 3)
        self->stateFlags = (self->stateFlags & ~0x1eu) | 8u;
}

/* Report whether the icon is appearing, shown, or disappearing. */
s32 ActorInteractionIcon_IsActive(const ActorInteractionIcon *self)
{
    return ((self->stateFlags >> 1) & 0xfu) != 0;
}

/* Map the low two direction bits to quarter-turn Nitro angle units. */
void ActorInteractionIcon_SetDirection(ActorInteractionIcon *self,
                                       s32 direction)
{
    self->directionAngle = ((u32)direction << 30) >> 16;
}

/*
 * Build the icon's directional hit rectangle, then translate it by the
 * supplied actor collision center and the icon's own FX32 X/Y offset. The
 * result order is left/top/right/bottom in signed projected pixel units. The
 * four directions use the retail 16-by-20 extents.
 */
void ActorInteractionIcon_BuildHitBounds(
    s16 hitBounds[4], const ActorInteractionIcon *self,
    const VecFx32Object *actorCollisionCenter)
{
    s32 direction = (s32)self->directionAngle / 0x4000;
    s32 offsetX =
        (actorCollisionCenter->value.x + self->offsetFx32.value.x) >> 12;
    s32 offsetY =
        (actorCollisionCenter->value.y + self->offsetFx32.value.y) >> 12;

    hitBounds[0] = -8;
    hitBounds[1] = -20;
    hitBounds[2] = 8;
    hitBounds[3] = 0;
    switch (direction) {
    case 0:
        break;
    case 1:
        hitBounds[0] = -20;
        hitBounds[1] = -8;
        hitBounds[2] = 0;
        hitBounds[3] = 8;
        break;
    case 2:
        hitBounds[0] = -8;
        hitBounds[1] = 0;
        hitBounds[2] = 8;
        hitBounds[3] = 20;
        break;
    case 3:
        hitBounds[0] = 0;
        hitBounds[1] = -8;
        hitBounds[2] = 20;
        hitBounds[3] = 8;
        break;
    default:
        break;
    }
    hitBounds[0] = (s16)(hitBounds[0] + offsetX);
    hitBounds[1] = (s16)(hitBounds[1] + offsetY);
    hitBounds[2] = (s16)(hitBounds[2] + offsetX);
    hitBounds[3] = (s16)(hitBounds[3] + offsetY);
}

/*
 * Lazily allocate the 0x2c-byte icon with tag "ICON", construct it from the
 * actor collection's borrowed sprite group, and store the owned pointer at
 * actor +0x1e0. Whether new or existing, reset its FX32 X offset to zero and Y
 * offset to the actor's signed top bound at +0x6a. Retail proceeds to these
 * writes after allocation failure, so successful allocation/construction is a
 * precondition. Returns no value; heap and graphics helpers own their effects.
 */
void Actor_EnsureInteractionIcon(void *self)
{
    u8 *actor = (u8 *)self;
    ActorInteractionIcon *icon =
        *(ActorInteractionIcon **)(actor + 0x1e0);

    if (icon == 0) {
        icon = (ActorInteractionIcon *)Heap_Alloc(
            sizeof(ActorInteractionIcon), gActorInteractionIconAllocationTag,
            4, &gHeapContext);
        if (icon != 0) {
            icon = ActorInteractionIcon_Init(
                icon,
                ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor)));
        }
        *(ActorInteractionIcon **)(actor + 0x1e0) = icon;
    }
    icon->offsetFx32.value.x = 0;
    icon->offsetFx32.value.y =
        (s32)((u32)(s32)*(s16 *)(actor + 0x6a) << 12);
}

/*
 * If actor +0x1e0 is non-null, destroy and free the owned icon, then clear the
 * actor field. Returns no value; heap and graphics ownership is released. The
 * actor's separate 0x08000000 flag is deliberately unchanged.
 */
void Actor_DestroyInteractionIcon(void *self)
{
    u8 *actor = (u8 *)self;
    ActorInteractionIcon *icon =
        *(ActorInteractionIcon **)(actor + 0x1e0);

    if (icon != 0) {
        ActorInteractionIcon_Destroy(icon);
        Heap_Free(icon);
    }
    *(ActorInteractionIcon **)(actor + 0x1e0) = 0;
}

/* Return the borrowed nullable interaction icon stored at actor +0x1e0. */
ActorInteractionIcon *Actor_GetInteractionIcon(void *self)
{
    return *(ActorInteractionIcon **)((u8 *)self + 0x1e0);
}

/*
 * If the icon exists, convert signed projected-pixel offsets to FX32 Q20.12
 * and store its X/Y offset. Negative inputs retain ARM two's-complement shift
 * behavior. Returns no value and leaves the zero Z offset unchanged.
 */
void Actor_SetInteractionIconOffset(void *self, s32 offsetX, s32 offsetY)
{
    ActorInteractionIcon *icon =
        *(ActorInteractionIcon **)((u8 *)self + 0x1e0);

    if (icon != 0) {
        icon->offsetFx32.value.x = (s32)((u32)offsetX << 12);
        icon->offsetFx32.value.y = (s32)((u32)offsetY << 12);
    }
}

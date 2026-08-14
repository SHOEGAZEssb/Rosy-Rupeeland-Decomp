#include "tingle/heap.h"
#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Own and position the actor's optional auxiliary collision resource. */
extern u8 data_020df208[];

typedef struct AnimationResourceState {
    void *character;
    void *palette;
    void *screen;
} AnimationResourceState;

typedef struct ActorAuxiliaryCollisionResource {
    void *group;
    void *sprite;
    AnimationResourceState resources;
    VecFx32Object position;
    u32 flags;
    u32 field28;
} ActorAuxiliaryCollisionResource;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Actor_GetCollection(void *actor);
extern void *ActorCollection_GetSpriteOwner(void *collection);
extern void *data_020f4e18;
extern void *func_02071ea4(void *state);
extern void func_02071ee0(void *state, void *archive, u32 characterId,
                          u32 paletteId, u32 screenId);
extern void *func_02071eb8(void *state);
extern void func_02071f38(void *state);
extern void *func_02073ffc(void *group, const void *source, s32 attach);
extern void GraphicsSpriteState_SetAnimationIndex(void *state, s32 index);
extern void GraphicsSpriteGroup_ReleaseState(void *group, void *state);
extern void VecFx32_Subtract(VecFx32Object *result,
                             const VecFx32Object *left,
                             const VecFx32Object *right);
extern void func_02056f00(void *destination, const void *source);
#ifdef __cplusplus
}
#endif

/*
 * Construct the optional actor sprite from retail resources 0x32ae, 0x3299,
 * and 0x32af. The resource borrows its group and archive entries, owns the
 * created sprite state, starts at a zero fixed-point position, and returns its
 * caller-owned storage.
 */
ActorAuxiliaryCollisionResource *func_020570c4(
    ActorAuxiliaryCollisionResource *self, void *group)
{
    self->group = group;
    func_02071ea4(&self->resources);
    VecFx32Object_Init(&self->position);
    self->flags = (self->flags & ~0x1fu) | 1u;
    self->field28 = 0;
    func_02071ee0(&self->resources, data_020f4e18, 0x32ae, 0x3299,
                  0x32af);
    self->sprite = func_02073ffc(self->group, &self->resources, 2);
    GraphicsSpriteState_SetAnimationIndex(self->sprite, 0);
    *(u16 *)((u8 *)self->sprite + 0x24) |= 2;
    *(u16 *)((u8 *)self->sprite + 0x2c) = 0x80;
    *(u16 *)((u8 *)self->sprite + 0x2e) = 0x60;
    *(u16 *)((u8 *)self->sprite + 0x24) |= 4;
    return self;
}

/* Release the owned sprite and borrowed animation triplet, then return self. */
ActorAuxiliaryCollisionResource *func_02057184(
    ActorAuxiliaryCollisionResource *self)
{
    GraphicsSpriteGroup_ReleaseState(self->group, self->sprite);
    func_02071f38(&self->resources);
    VecFx32Object_Destroy(&self->position);
    func_02071eb8(&self->resources);
    return self;
}

/*
 * Advance the auxiliary sprite's six-state show/hide animation and synchronize
 * its screen position with the supplied actor transform and collision center.
 */
void func_020571b4(ActorAuxiliaryCollisionResource *self,
                   const VecFx32Object *transform,
                   const VecFx32Object *center)
{
    VecFx32Object displacement;
    VecFx32Object position;
    u16 *spriteFlags = (u16 *)((u8 *)self->sprite + 0x24);
    u32 state = (self->flags >> 1) & 0xfu;

    switch (state) {
    case 1:
        *spriteFlags &= 0xfffbu;
        *spriteFlags &= 0xfffdu;
        GraphicsSpriteState_SetAnimationIndex(self->sprite, 2);
        self->flags = (self->flags & ~0x1eu) | 4u;
        /* fall through */
    case 2:
        if ((*spriteFlags & 1u) != 0) {
            GraphicsSpriteState_SetAnimationIndex(self->sprite, 0);
            *spriteFlags |= 2u;
            self->flags = (self->flags & ~0x1eu) | 6u;
        }
        break;
    case 4:
        *spriteFlags &= 0xfffbu;
        *spriteFlags &= 0xfffdu;
        GraphicsSpriteState_SetAnimationIndex(self->sprite, 1);
        self->flags = (self->flags & ~0x1eu) | 10u;
        /* fall through */
    case 5:
        if ((*spriteFlags & 1u) != 0) {
            *spriteFlags |= 4u;
            self->flags &= ~0x1eu;
        }
        break;
    default:
        break;
    }

    *(u16 *)((u8 *)self->sprite + 0x30) = (u16)self->field28;
    VecFx32_Subtract(&displacement, center, transform);
    func_02056f00(&position, &displacement);
    VecFx32Object_Destroy(&displacement);
    position.value.x += self->position.value.x;
    position.value.y += self->position.value.y;
    *(u16 *)((u8 *)self->sprite + 0x2c) =
        (u16)(position.value.x >> 12);
    *(u16 *)((u8 *)self->sprite + 0x2e) =
        (u16)(position.value.y >> 12);
    *(u8 *)((u8 *)self->sprite + 0x3a) = 0;
    *(u16 *)((u8 *)self->sprite + 0x28) = 0x100;
    VecFx32Object_Destroy(&position);
}

/* Advance the resource's low-nibble presentation state for visibility changes. */
void func_02057394(ActorAuxiliaryCollisionResource *self, s32 enabled)
{
    u32 state;

    if (enabled != 0 && (self->flags & 1u) != 0) {
        state = (self->flags >> 1) & 0xfu;
        if (state == 0)
            self->flags = (self->flags & ~0x1eu) | 2u;
        return;
    }
    state = (self->flags >> 1) & 0xfu;
    if (state == 3)
        self->flags = (self->flags & ~0x1eu) | 8u;
}

/* Report whether the resource's four-bit presentation state is nonzero. */
s32 func_020573e4(const ActorAuxiliaryCollisionResource *self)
{
    return ((self->flags >> 1) & 0xfu) != 0;
}

/* Store the low two caller bits in field28 bits 14 and 15. */
void func_020573fc(ActorAuxiliaryCollisionResource *self, s32 value)
{
    self->field28 = ((u32)value << 30) >> 16;
}

/*
 * Build the auxiliary resource's interaction rectangle for the direction in
 * field28 bits 14..15, then translate it by the supplied position and the
 * resource's own X/Y offset. The four directions use the retail 16-by-20
 * extents and the result is returned as four signed pixel coordinates.
 */
void func_0205740c(s16 *output, const ActorAuxiliaryCollisionResource *self,
                   const VecFx32Object *position)
{
    s32 direction = (s32)self->field28 / 0x4000;
    s32 x = (position->value.x + self->position.value.x) >> 12;
    s32 y = (position->value.y + self->position.value.y) >> 12;

    output[0] = -8;
    output[1] = -20;
    output[2] = 8;
    output[3] = 0;
    switch (direction) {
    case 0:
        break;
    case 1:
        output[0] = -20;
        output[1] = -8;
        output[2] = 0;
        output[3] = 8;
        break;
    case 2:
        output[0] = -8;
        output[1] = 0;
        output[2] = 8;
        output[3] = 20;
        break;
    case 3:
        output[0] = 0;
        output[1] = -8;
        output[2] = 20;
        output[3] = 8;
        break;
    default:
        break;
    }
    output[0] = (s16)(output[0] + x);
    output[1] = (s16)(output[1] + y);
    output[2] = (s16)(output[2] + x);
    output[3] = (s16)(output[3] + y);
}

/*
 * Lazily allocate 0x2c bytes tagged by data_020df208, construct the resource
 * with data obtained from the actor's collection, and store it at actor+0x1e0.
 * Then set resource X +0x18 to zero and Y +0x1c to actor s16 +0x6a in 20.12
 * fixed point. The retail path proceeds to these writes even if allocation
 * failed, so successful allocation is an ownership precondition. Returns no
 * value; heap and constructor helpers manage SDK/resource state.
 */
void Actor_EnsureAuxiliaryCollisionResource(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *resource = *(u8 **)(actor + 0x1e0);

    if (resource == 0) {
        resource = (u8 *)Heap_Alloc(0x2c, (const char *)data_020df208, 4,
                                    &gHeapContext);
        if (resource != 0) {
            resource = (u8 *)func_020570c4(
                (ActorAuxiliaryCollisionResource *)resource,
                ActorCollection_GetSpriteOwner(Actor_GetCollection(actor)));
        }
        *(u8 **)(actor + 0x1e0) = resource;
    }
    *(s32 *)(resource + 0x18) = 0;
    *(s32 *)(resource + 0x1c) = *(s16 *)(actor + 0x6a) << 12;
}

/*
 * If actor+0x1e0 is non-null, run its destructor and free the allocation, then
 * clear the actor field. Returns no value; heap/resource ownership is released.
 */
void Actor_DestroyAuxiliaryCollisionResource(void *self)
{
    u8 *actor = (u8 *)self;
    void *resource = *(void **)(actor + 0x1e0);

    if (resource != 0) {
        func_02057184((ActorAuxiliaryCollisionResource *)resource);
        Heap_Free(resource);
    }
    *(void **)(actor + 0x1e0) = 0;
}

/* Return the auxiliary resource pointer stored at actor+0x1e0. */
void *Actor_GetAuxiliaryCollisionResource(void *self)
{
    return *(void **)((u8 *)self + 0x1e0);
}

/*
 * If the auxiliary resource exists, store integer X/Y at +0x18/+0x1c after
 * converting both to 20.12 fixed point. Returns no value.
 */
void Actor_SetAuxiliaryCollisionPosition(void *self, s32 x, s32 y)
{
    u8 *resource = *(u8 **)((u8 *)self + 0x1e0);

    if (resource != 0) {
        *(s32 *)(resource + 0x18) = x << 12;
        *(s32 *)(resource + 0x1c) = y << 12;
    }
}

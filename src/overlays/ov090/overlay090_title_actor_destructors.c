#include "tingle/animation_resource.h"
#include "tingle/graphics_sprite_group.h"
#include "tingle/graphics_sprite_renderer.h"
#include "tingle/heap.h"
#include "tingle/vec_fx32.h"

/*
 * Overlay-90 boss-stage-controller teardown. These retail destructor variants
 * release the sprite presentation, its resources, and embedded actor state.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern u8 data_ov090_0221cb10[];
extern u8 data_020f4e14[];
extern void *gDebugFont;
extern void *Actor_GetOwningCollection(void *actor);
extern GraphicsSpriteGroup *ActorCollection_GetSpriteGroup(void *collection);
extern void *RuntimeActorScriptVariantSubclass_DestroyAlternateEntry(void *self);
#ifdef __cplusplus
}
#endif

/*
 * Release boss-stage sprite states and animation resources, restore debug text-grid
 * state, destroy embedded vectors, invoke the actor base destructor, and return
 * `self`. This non-deleting destructor does not free the actor allocation.
 */
extern "C" void *func_ov090_02217b70(void *self)
{
    AnimationResource *resource;

    FIELD(void *, self, 0) = data_ov090_0221cb10;
    GraphicsSpriteGroup_ReleaseIndexedEntries(
        ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(self)));
    if (FIELD(GraphicsSpriteState *, self, 0x200) != 0)
        GraphicsSpriteState_ReleaseFromGroup(FIELD(GraphicsSpriteState *, self, 0x200));
    if (FIELD(GraphicsSpriteState *, self, 0x23c) != 0)
        GraphicsSpriteState_ReleaseFromGroup(FIELD(GraphicsSpriteState *, self, 0x23c));
    if (FIELD(GraphicsSpriteState *, self, 0x248) != 0)
        GraphicsSpriteState_ReleaseFromGroup(FIELD(GraphicsSpriteState *, self, 0x248));
    resource = FIELD(AnimationResource *, self, 0x240);
    if (resource != 0)
        resource->vtable->destroyAndFree(resource);
    resource = FIELD(AnimationResource *, self, 0x204);
    if (resource != 0)
        resource->vtable->destroyAndFree(resource);
    resource = FIELD(AnimationResource *, self, 0x208);
    if (resource != 0)
        resource->vtable->destroyAndFree(resource);
    resource = FIELD(AnimationResource *, self, 0x24c);
    if (resource != 0)
        resource->vtable->destroyAndFree(resource);
    FIELD(s32, gDebugFont, 0x38) = 1;
    GraphicsSpriteRenderer_SetTextGridPosition(
        FIELD(GraphicsSpriteRenderer *, data_020f4e14, 0), 0, 0);
    VecFx32Object_Destroy((VecFx32Object *)((u8 *)self + 0x224));
    VecFx32Object_Destroy((VecFx32Object *)((u8 *)self + 0x20c));
    RuntimeActorScriptVariantSubclass_DestroyAlternateEntry(self);
    return self;
}

/*
 * Perform the complete boss-stage teardown, free the actor allocation through the
 * game heap, and return its former address for the deleting-destructor ABI.
 */
extern "C" void *func_ov090_02217c6c(void *self)
{
    AnimationResource *resource;

    FIELD(void *, self, 0) = data_ov090_0221cb10;
    GraphicsSpriteGroup_ReleaseIndexedEntries(
        ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(self)));
    if (FIELD(GraphicsSpriteState *, self, 0x200) != 0)
        GraphicsSpriteState_ReleaseFromGroup(FIELD(GraphicsSpriteState *, self, 0x200));
    if (FIELD(GraphicsSpriteState *, self, 0x23c) != 0)
        GraphicsSpriteState_ReleaseFromGroup(FIELD(GraphicsSpriteState *, self, 0x23c));
    if (FIELD(GraphicsSpriteState *, self, 0x248) != 0)
        GraphicsSpriteState_ReleaseFromGroup(FIELD(GraphicsSpriteState *, self, 0x248));
    resource = FIELD(AnimationResource *, self, 0x240);
    if (resource != 0)
        resource->vtable->destroyAndFree(resource);
    resource = FIELD(AnimationResource *, self, 0x204);
    if (resource != 0)
        resource->vtable->destroyAndFree(resource);
    resource = FIELD(AnimationResource *, self, 0x208);
    if (resource != 0)
        resource->vtable->destroyAndFree(resource);
    resource = FIELD(AnimationResource *, self, 0x24c);
    if (resource != 0)
        resource->vtable->destroyAndFree(resource);
    FIELD(s32, gDebugFont, 0x38) = 1;
    GraphicsSpriteRenderer_SetTextGridPosition(
        FIELD(GraphicsSpriteRenderer *, data_020f4e14, 0), 0, 0);
    VecFx32Object_Destroy((VecFx32Object *)((u8 *)self + 0x224));
    VecFx32Object_Destroy((VecFx32Object *)((u8 *)self + 0x20c));
    RuntimeActorScriptVariantSubclass_DestroyAlternateEntry(self);
    Heap_Free(self);
    return self;
}

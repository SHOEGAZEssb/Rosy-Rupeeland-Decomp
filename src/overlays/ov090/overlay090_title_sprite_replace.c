#include "tingle/animation_resource.h"
#include "tingle/graphics_sprite_group.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/* Sprite-resource replacement used by overlay-90 boss-stage state transitions. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const char data_ov090_0221cc00[];
extern void *Actor_GetOwningCollection(void *actor);
extern GraphicsSpriteGroup *ActorCollection_GetSpriteGroup(void *collection);

/*
 * Release the current sprite and destroy its animation-resource owner. When
 * `resource0` is not -1, allocate and initialize a new three-entry resource,
 * then attach a mode-2 sprite to the actor collection. A -1 handle clears both
 * controller pointers. Allocation and sprite-group effects remain NDS-side.
 */
void func_ov090_0221ad64(void *self, s32 resource0, void *resource1,
                         void *resource2)
{
    AnimationResource *resources;

    if (FIELD(GraphicsSpriteState *, self, 0x200) != 0)
        GraphicsSpriteState_ReleaseFromGroup(
            FIELD(GraphicsSpriteState *, self, 0x200));
    if (FIELD(AnimationResource *, self, 0x204) != 0) {
        resources = FIELD(AnimationResource *, self, 0x204);
        resources->vtable->destroyAndFree(resources);
    }

    if (resource0 != -1) {
        resources = (AnimationResource *)Heap_Alloc(
            sizeof(AnimationResource), data_ov090_0221cc00, 4, &gHeapContext);
        if (resources != 0)
            resources = AnimationResource_Init(resources, (void *)resource0,
                                               resource1, resource2);
        FIELD(AnimationResource *, self, 0x204) = resources;
        FIELD(GraphicsSpriteState *, self, 0x200) =
            GraphicsSpriteGroup_CreateState(
                ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(self)),
                resources->entries[0], resources->entries[1],
                resources->entries[2], 2);
    } else {
        FIELD(GraphicsSpriteState *, self, 0x200) = 0;
        FIELD(AnimationResource *, self, 0x204) = 0;
    }
}

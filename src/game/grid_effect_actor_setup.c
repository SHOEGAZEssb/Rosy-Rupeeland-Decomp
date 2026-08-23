#include "tingle/types.h"
#include "tingle/heap.h"

/*
 * Recovered resource setup for the grid/effect actor. It allocates a small
 * three-resource bundle, creates the actor's presentation from that bundle,
 * and binds both objects into inherited actor state.
 */

extern const u8 gGridEffectActorAnimationResourceAllocationTag[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *AnimationResource_Init(void *storage, u32 resource0, u32 resource1,
                           u32 resource2);
extern void *ActorCollection_GetSpriteOwner(void *collection);
extern void Actor_CreateSecondaryRenderAttachment(
    void *actor, void *unusedAnimationResources, u32 attachPolicy);
extern void *Actor_GetCollection(void *actor);
extern void GraphicsSpriteState_SetAnimationIndex(void *presentation, u32 selection);
extern void *GraphicsSpriteGroup_CreateState(void *context, void *resource0, void *resource1,
                           void *resource2, u32 mode);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are an actor and a descriptor containing three resource values at
 * 0x04..0x0C and mode bytes at 0x10/0x11. Allocate a 16-byte bundle tagged by
 * gGridEffectActorAnimationResourceAllocationTag, initialize it with AnimationResource_Init, store it at actor+0x1EC,
 * prepare the actor, create a presentation at 0x54 from bundle words 1..3,
 * create secondary +0x58 from primary +0x54 (the bundle argument is ignored),
 * select the initial entry, and set
 * presentation flags 1 and 2. Returns nothing; heap/resource/presentation state
 * changes, and hardware is not accessed directly. Retail assumes allocation succeeds.
 */
void GridEffectActor_SetupPresentationResources(void *actor, const void *descriptor)
{
    void *bundle = Heap_Alloc(
        0x10, (const char *)gGridEffectActorAnimationResourceAllocationTag,
        4, &gHeapContext);
    void *collection;
    void *owner;

    if (bundle != 0) {
        bundle = AnimationResource_Init(bundle,
                              FIELD(u32, descriptor, 4),
                              FIELD(u32, descriptor, 8),
                              FIELD(u32, descriptor, 12));
    }
    FIELD(void *, actor, 0x1ec) = bundle;
    collection = Actor_GetCollection(actor);
    owner = ActorCollection_GetSpriteOwner(collection);
    void *presentation = GraphicsSpriteGroup_CreateState(
        owner, FIELD(void *, bundle, 4), FIELD(void *, bundle, 8),
        FIELD(void *, bundle, 12), FIELD(u8, descriptor, 0x10));
    FIELD(void *, actor, 0x54) = presentation;
    Actor_CreateSecondaryRenderAttachment(actor, bundle, FIELD(u8, descriptor, 0x10));
    GraphicsSpriteState_SetAnimationIndex(presentation, FIELD(u8, descriptor, 0x11));
    FIELD(u16, presentation, 0x24) |= 6;
}

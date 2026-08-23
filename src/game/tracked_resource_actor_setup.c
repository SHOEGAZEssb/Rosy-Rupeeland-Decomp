#include "tingle/types.h"

/*
 * Recovered resource and presentation setup for the tracked-resource actor.
 * It creates a small owned bundle, binds the presentation, and finishes through
 * the actor's virtual initialization callback.
 */

extern const u8 gTrackedResourceActorAnimationResourceAllocationTag[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32 size, const void *tag, u32 align, void *heap);
extern void *AnimationResource_Init(void *storage, u32 resource0, u32 resource1,
                           u32 resource2);
extern void *ActorCollection_GetSpriteOwner(void);
extern void Actor_CreateSecondaryRenderAttachment(
    void *actor, void *unusedAnimationResources, u32 attachPolicy);
extern void Actor_GetCollection(void *actor);
extern void GraphicsSpriteState_SetAnimationIndex(void *presentation, u32 selection);
extern void *GraphicsSpriteGroup_CreateState(void *context, void *resource0, void *resource1,
                           void *resource2, u32 mode);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef void (*ActorCallback)(void *actor);

/*
 * Inputs are an actor and descriptor with resource values at 0x04..0x0C and
 * mode bytes at 0x10/0x11. Allocate and initialize a 16-byte bundle tagged by
 * gTrackedResourceActorAnimationResourceAllocationTag, store it at 0x1EC, prepare the actor, create presentation 0x54,
 * select its initial entry, set flags 1 and 2, and create secondary +0x58 from
 * primary +0x54 (the bundle argument is ignored), then invoke virtual slot
 * 0x14. Returns nothing; heap, resource,
 * and presentation state change. Retail assumes allocation succeeds; no direct
 * hardware effects occur.
 */
void TrackedResourceActor_SetupPresentationResources(void *actor, const void *descriptor)
{
    void *bundle = Heap_Alloc(0x10, gTrackedResourceActorAnimationResourceAllocationTag, 4, gHeapContext);
    if (bundle != 0) {
        bundle = AnimationResource_Init(bundle,
                              FIELD(u32, descriptor, 4),
                              FIELD(u32, descriptor, 8),
                              FIELD(u32, descriptor, 12));
    }
    FIELD(void *, actor, 0x1ec) = bundle;
    Actor_GetCollection(actor);
    void *presentation = GraphicsSpriteGroup_CreateState(
        ActorCollection_GetSpriteOwner(), FIELD(void *, bundle, 4), FIELD(void *, bundle, 8),
        FIELD(void *, bundle, 12), FIELD(u8, descriptor, 0x10));
    FIELD(void *, actor, 0x54) = presentation;
    GraphicsSpriteState_SetAnimationIndex(presentation, FIELD(u8, descriptor, 0x11));
    FIELD(u16, presentation, 0x24) |= 6;
    Actor_CreateSecondaryRenderAttachment(actor, bundle, FIELD(u8, descriptor, 0x10));
    ActorCallback callback =
        *(ActorCallback *)((u8 *)FIELD(void *, actor, 0) + 0x14);
    callback(actor);
}

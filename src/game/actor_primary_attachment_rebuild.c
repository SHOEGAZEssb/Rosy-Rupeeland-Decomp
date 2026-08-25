#include "tingle/types.h"

/* Replace an actor's primary animation resource and presentation attachment. */
extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_ReleaseState(void *owned, void *attachment);
extern void AnimationResourceState_ReleaseResources(void *resource);
extern void AnimationResourceState_ReplaceResources(void *resource, void *manager, s32 first,
                          s32 second, s32 third);
extern void *Actor_GetOwningCollection(void *actor);
extern void *ActorCollection_GetSpriteGroup(void *collection);
extern void *GraphicsSpriteGroup_CreateState(void *collectionData, s32 first, s32 second,
                           s32 third, s32 mode);
extern void Actor_CreateSecondaryRenderAttachment(
    void *actor, void *unusedAnimationResources, u32 attachPolicy);
#ifdef __cplusplus
}
#endif

/*
 * For nonnull primary +0x54 and secondary +0x58 attachments, pass their word
 * +0x00 and the attachment itself to GraphicsSpriteGroup_ReleaseState. Clear +0x58, destroy the
 * resource state at +0x1f0, then rebuild it from first/second/third and create
 * a new primary attachment using the resource's resulting three words and the
 * low byte of the attach policy. Store and return the new attachment. When
 * actor flag mask 0x1 is set, also create a secondary attachment with the same
 * policy; the embedded-resource argument +0x1ec is ignored by that helper.
 * Resource destruction/creation and attachment replacement mutate
 * owned SDK and presentation state; the retail path assumes created resources
 * satisfy the downstream helpers' preconditions.
 */
void *Actor_RebuildPrimaryAttachment(void *self, u16 first, u16 second,
                                     u16 third, u16 attachPolicy)
{
    u8 *actor = (u8 *)self;
    void *attachment = *(void **)(actor + 0x54);
    if (attachment != 0)
        GraphicsSpriteGroup_ReleaseState(*(void **)attachment, attachment);
    attachment = *(void **)(actor + 0x58);
    if (attachment != 0)
        GraphicsSpriteGroup_ReleaseState(*(void **)attachment, attachment);
    *(void **)(actor + 0x58) = 0;
    AnimationResourceState_ReleaseResources(actor + 0x1f0);
    AnimationResourceState_ReplaceResources(actor + 0x1f0, data_020f4e18, first, second, third);
    attachment = GraphicsSpriteGroup_CreateState(
        ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor)),
        *(s32 *)(actor + 0x1f0), *(s32 *)(actor + 0x1f4),
        *(s32 *)(actor + 0x1f8), attachPolicy & 0xff);
    *(void **)(actor + 0x54) = attachment;
    if ((*(u32 *)(actor + 0x14) & 1) != 0)
        Actor_CreateSecondaryRenderAttachment(actor, actor + 0x1ec,
                                              attachPolicy & 0xff);
    return attachment;
}

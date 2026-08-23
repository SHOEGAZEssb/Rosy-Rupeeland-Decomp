#include "tingle/types.h"

/* Create and release the two render attachments stored at actor offsets 0x54/0x58. */
typedef struct ActorRenderAttachmentOwner {
    u8 field_00[0x14];
    u32 flags_14;
    u8 field_18[0x3c];
    void *primaryAttachment_54;
    void *secondaryAttachment_58;
} ActorRenderAttachmentOwner;

extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Actor_GetOwningCollection(ActorRenderAttachmentOwner *);
extern void *GamePhaseRuntime_GetActorCollection(void *, s32);
extern void *ActorCollection_GetSpriteGroup(void *);
extern void *GraphicsSpriteGroup_CreateState(void *, u32, u32, u32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteState_ReleaseFromGroup(void *);
#ifdef __cplusplus
}
#endif

/*
 * When actor flag mask 0x1 is set and its collection field +0x2e84 equals one,
 * create secondary attachment +0x58 in the sprite group owned by global actor
 * collection two. Copy the primary attachment's resource words +0x14/+0x18/
 * +0x1c, animation byte +0x38, signed positions +0x2c/+0x2e, flag mask 0x2,
 * and byte +0x3a. The animation-resource input is unused. Retail assumes the
 * primary attachment, target group, and allocation are valid and overwrites
 * any existing secondary attachment. Returns no value; renderer/group-owned
 * attachment state changes, with no direct hardware access.
 */
void Actor_CreateSecondaryRenderAttachment(ActorRenderAttachmentOwner *actor,
                                           void *unusedAnimationResources,
                                           s32 attachPolicy)
{
    u8 *primaryAttachment;
    u8 *secondaryAttachment;
    void *actorCollection;

    (void)unusedAnimationResources;
    if (!(actor->flags_14 & 1))
        return;
    actorCollection = Actor_GetOwningCollection(actor);
    if (*(s32 *)((u8 *)actorCollection + 0x2e84) != 1)
        return;
    primaryAttachment = (u8 *)actor->primaryAttachment_54;
    actor->secondaryAttachment_58 = GraphicsSpriteGroup_CreateState(
        ActorCollection_GetSpriteGroup(GamePhaseRuntime_GetActorCollection(data_021052fc, 2)),
        *(u32 *)(primaryAttachment + 0x14), *(u32 *)(primaryAttachment + 0x18),
        *(u32 *)(primaryAttachment + 0x1c), attachPolicy);
    secondaryAttachment = (u8 *)actor->secondaryAttachment_58;
    GraphicsSpriteState_SetAnimationIndex(secondaryAttachment,
                                          primaryAttachment[0x38]);
    *(s16 *)(secondaryAttachment + 0x2c) =
        *(s16 *)(primaryAttachment + 0x2c);
    *(s16 *)(secondaryAttachment + 0x2e) =
        *(s16 *)(primaryAttachment + 0x2e);
    *(u16 *)(secondaryAttachment + 0x24) |= 2;
    secondaryAttachment[0x3a] = primaryAttachment[0x3a];
}

/*
 * If primary attachment +0x54 is nonnull, return it to its renderer group and
 * clear the field. A null field is a no-op. Returns no value; the released
 * attachment becomes invalid and renderer/group allocator state changes.
 */
void Actor_ReleasePrimaryRenderAttachment(ActorRenderAttachmentOwner *actor)
{
    if (actor->primaryAttachment_54) {
        GraphicsSpriteState_ReleaseFromGroup(actor->primaryAttachment_54);
        actor->primaryAttachment_54 = 0;
    }
}

/*
 * If secondary attachment +0x58 is nonnull, return it to its renderer group,
 * clear the field, and clear actor flag mask 0x1. A null field leaves the flag
 * unchanged. Returns no value; the released attachment becomes invalid and
 * renderer/group allocator state changes.
 */
void Actor_ReleaseSecondaryRenderAttachment(ActorRenderAttachmentOwner *actor)
{
    if (actor->secondaryAttachment_58) {
        GraphicsSpriteState_ReleaseFromGroup(actor->secondaryAttachment_58);
        actor->secondaryAttachment_58 = 0;
        actor->flags_14 &= ~1;
    }
}

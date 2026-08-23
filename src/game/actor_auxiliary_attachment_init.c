#include "tingle/types.h"

/* Create the actor's globally resourced auxiliary attachment at offset 0xa8. */
typedef struct ActorAuxiliaryAttachmentOwner {
    u8 field_00[0x14];
    u32 flags_14;
    u8 field_18[0x90];
    void *auxiliaryRenderAttachment_a8;
} ActorAuxiliaryAttachmentOwner;

extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern u32 func_02071e60(void *, u32);
extern u32 GraphicsArchive_FindPaletteResource(void *, u32);
extern u32 func_02071e80(void *, u32);
extern void *Actor_GetCollection(ActorAuxiliaryAttachmentOwner *);
extern void *ActorCollection_GetSpriteOwner(void *);
extern void *GraphicsSpriteGroup_CreateState(void *, u32, u32, u32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * If actor flag mask 0x02000000 is clear, store null at auxiliary render
 * attachment +0xa8 without releasing any prior state. Otherwise resolve global
 * character/palette/cell resource handles 0x1386/0x1001/0x1387, create mode-two
 * sprite state through the actor collection's sprite owner, store it at +0xa8,
 * select animation zero, and set sprite flag masks 0x2|0x8. Retail assumes the
 * resource handles, sprite group, and allocation are valid and overwrites any
 * existing +0xa8. Returns no value; renderer/group ownership state changes,
 * with no direct hardware access.
 */
void Actor_CreateAuxiliaryRenderAttachment(ActorAuxiliaryAttachmentOwner *actor)
{
    u32 characterResource;
    u32 paletteResource;
    u32 cellResource;
    u16 *attachmentFlags;

    if (!(actor->flags_14 & 0x02000000)) {
        actor->auxiliaryRenderAttachment_a8 = 0;
        return;
    }
    characterResource = func_02071e60(data_020f4e18, 0x1386);
    paletteResource = GraphicsArchive_FindPaletteResource(data_020f4e18, 0x1001);
    cellResource = func_02071e80(data_020f4e18, 0x1387);
    actor->auxiliaryRenderAttachment_a8 = GraphicsSpriteGroup_CreateState(
        ActorCollection_GetSpriteOwner(Actor_GetCollection(actor)),
        characterResource, paletteResource, cellResource, 2);
    GraphicsSpriteState_SetAnimationIndex(
        actor->auxiliaryRenderAttachment_a8, 0);
    attachmentFlags =
        (u16 *)((u8 *)actor->auxiliaryRenderAttachment_a8 + 0x24);
    *attachmentFlags |= 0x0a;
}

#include "tingle/types.h"

/* Create and release the two render attachments stored at actor offsets 0x54/0x58. */
typedef struct ActorRenderAttachmentOwner {
    u8 field_00[0x14];
    u32 flags_14;
    u8 field_18[0x3c];
    void *attachmentConfig_54;
    void *attachment_58;
} ActorRenderAttachmentOwner;

extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Actor_GetCollection(ActorRenderAttachmentOwner *);
extern void *GamePhaseRuntime_GetActorCollection(void *, s32);
extern void *ActorCollection_GetSpriteOwner(void *);
extern void *GraphicsSpriteGroup_CreateState(void *, u32, u32, u32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteState_ReleaseFromGroup(void *);
#ifdef __cplusplus
}
#endif

/*
 * When actor flag one is set and its collection mode at 0x2e84 equals one,
 * create attachment 0x58 through the context-two manager. Source parameters
 * come from config 0x54 offsets 0x14/0x18/0x1c and finalArg; copy config byte
 * 0x38, halfwords 0x2c/0x2e, and byte 0x3a to the result, and set result flag
 * two at 0x24. The second input is unused. Returns no value; helpers affect
 * render attachment state.
 */
void func_020313b4(ActorRenderAttachmentOwner *self, void *unused,
                   s32 finalArg)
{
    u8 *config;
    u8 *attachment;
    void *collection;

    (void)unused;
    if (!(self->flags_14 & 1))
        return;
    collection = Actor_GetCollection(self);
    if (*(s32 *)((u8 *)collection + 0x2e84) != 1)
        return;
    config = (u8 *)self->attachmentConfig_54;
    self->attachment_58 = GraphicsSpriteGroup_CreateState(
        ActorCollection_GetSpriteOwner(GamePhaseRuntime_GetActorCollection(data_021052fc, 2)),
        *(u32 *)(config + 0x14), *(u32 *)(config + 0x18),
        *(u32 *)(config + 0x1c), finalArg);
    attachment = (u8 *)self->attachment_58;
    GraphicsSpriteState_SetAnimationIndex(attachment, config[0x38]);
    *(s16 *)(attachment + 0x2c) = *(s16 *)(config + 0x2c);
    *(s16 *)(attachment + 0x2e) = *(s16 *)(config + 0x2e);
    *(u16 *)(attachment + 0x24) |= 2;
    attachment[0x3a] = config[0x3a];
}

/*
 * If attachment/config field 0x54 is nonnull, release it through GraphicsSpriteState_ReleaseFromGroup
 * and clear the field. Returns no value; the helper owns render-state effects.
 */
void func_02031464(ActorRenderAttachmentOwner *self)
{
    if (self->attachmentConfig_54) {
        GraphicsSpriteState_ReleaseFromGroup(self->attachmentConfig_54);
        self->attachmentConfig_54 = 0;
    }
}

/*
 * If attachment field 0x58 is nonnull, release it, clear the field, and clear
 * actor flag one. A null field leaves both state locations unchanged. Returns
 * no value; GraphicsSpriteState_ReleaseFromGroup owns render-state effects.
 */
void func_02031488(ActorRenderAttachmentOwner *self)
{
    if (self->attachment_58) {
        GraphicsSpriteState_ReleaseFromGroup(self->attachment_58);
        self->attachment_58 = 0;
        self->flags_14 &= ~1;
    }
}

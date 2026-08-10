#include "tingle/types.h"

/* Create the actor's globally resourced auxiliary attachment at offset 0xa8. */
typedef struct ActorAuxiliaryAttachmentOwner {
    u8 field_00[0x14];
    u32 flags_14;
    u8 field_18[0x90];
    void *attachment_a8;
} ActorAuxiliaryAttachmentOwner;

extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern u32 func_02071e60(void *, u32);
extern u32 func_02071e70(void *, u32);
extern u32 func_02071e80(void *, u32);
extern void *Actor_GetCollection(ActorAuxiliaryAttachmentOwner *);
extern void *ActorCollection_GetSpriteOwner(void *);
extern void *GraphicsSpriteGroup_CreateState(void *, u32, u32, u32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * If actor flag 0x02000000 is clear, set attachment 0xa8 to null. Otherwise
 * resolve global resource IDs 0x1386, 0x1001, and 0x1387, create an attachment
 * through the actor collection's offset-0x0e00 manager with final argument
 * two, configure it with zero, and set attachment flags 0x0a at offset 0x24.
 * Returns no value; resource and render helpers may mutate shared state.
 */
void func_020314b8(ActorAuxiliaryAttachmentOwner *self)
{
    u32 first;
    u32 second;
    u32 third;
    u16 *flags;

    if (!(self->flags_14 & 0x02000000)) {
        self->attachment_a8 = 0;
        return;
    }
    first = func_02071e60(data_020f4e18, 0x1386);
    second = func_02071e70(data_020f4e18, 0x1001);
    third = func_02071e80(data_020f4e18, 0x1387);
    self->attachment_a8 = GraphicsSpriteGroup_CreateState(
        ActorCollection_GetSpriteOwner(Actor_GetCollection(self)), first, second, third, 2);
    GraphicsSpriteState_SetAnimationIndex(self->attachment_a8, 0);
    flags = (u16 *)((u8 *)self->attachment_a8 + 0x24);
    *flags |= 0x0a;
}

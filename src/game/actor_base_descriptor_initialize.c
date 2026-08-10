#include "tingle/types.h"

/* Initialize base actor descriptor state and lazily create its primary animation attachment. */
extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02071ee0(void *resource, void *manager, s32 first,
                          s32 second, s32 third);
extern void *Actor_GetCollection(void *actor);
extern void *ActorCollection_GetSpriteOwner(void *collection);
extern void *func_02073fc4(void *collectionData, s32 first, s32 second,
                           s32 third, s32 mode);
extern void GraphicsSpriteState_SetAnimationIndex(void *attachment, u32 animation);
extern void func_020313b4(void *actor, void *resource, u32 layer);
extern void func_02034260(void *actor, const void *descriptor);
#ifdef __cplusplus
}
#endif

/*
 * Invoke actor virtual +0x14 with the descriptor. Unless descriptor words
 * +0x04/+0x08/+0x0c are all -1, lazily initialize resource +0x1f0 and create
 * attachment +0x54 from those IDs and descriptor byte +0x10. When actor flag
 * +0x14 bit 0x10000000 is set, invoke virtual +0x54 with zero. Select animation
 * byte +0x11, copy signed descriptor halfwords +0x22/+0x24 to attachment
 * +0x2c/+0x2e, set attachment flag two and display byte +0x3a to two. Actor
 * flag 0x01000000 overrides that byte to zero; flag 0x80 overrides it with the
 * low byte of descriptor halfword +0x3c. Bind resource +0x1ec using descriptor
 * layer +0x10. Finally dispatch optional descriptor payload +0x2c through
 * func_02034260. Returns no value; virtual, resource, attachment, animation,
 * and callback calls mutate actor and presentation state.
 */
void Actor_InitializeFromDescriptor(void *self, const void *descriptor)
{
    u8 *actor = (u8 *)self;
    const u8 *record = (const u8 *)descriptor;
    (*(void (**)(void *, const void *))(*(u8 **)actor + 0x14))(
        actor, descriptor);

    if (!(*(s32 *)(record + 4) == -1 && *(s32 *)(record + 0x0c) == -1 &&
          *(s32 *)(record + 8) == -1) && *(void **)(actor + 0x54) == 0) {
        u8 *attachment;
        func_02071ee0(actor + 0x1f0, data_020f4e18,
                      *(s32 *)(record + 4), *(s32 *)(record + 8),
                      *(s32 *)(record + 0x0c));
        attachment = (u8 *)func_02073fc4(
            ActorCollection_GetSpriteOwner(Actor_GetCollection(actor)),
            *(s32 *)(actor + 0x1f0), *(s32 *)(actor + 0x1f4),
            *(s32 *)(actor + 0x1f8), record[0x10]);
        *(u8 **)(actor + 0x54) = attachment;
        if ((*(u32 *)(actor + 0x14) & 0x10000000) != 0)
            (*(void (**)(void *, s32))(*(u8 **)actor + 0x54))(actor, 0);
        GraphicsSpriteState_SetAnimationIndex(attachment, record[0x11]);
        *(s16 *)(attachment + 0x2c) = *(s16 *)(record + 0x22);
        *(s16 *)(attachment + 0x2e) = *(s16 *)(record + 0x24);
        *(u16 *)(attachment + 0x24) |= 2;
        attachment[0x3a] = 2;
        if ((*(u32 *)(actor + 0x14) & 0x01000000) != 0)
            attachment[0x3a] = 0;
        if ((*(u32 *)(actor + 0x14) & 0x80) != 0)
            attachment[0x3a] = (u8)*(s16 *)(record + 0x3c);
        func_020313b4(actor, actor + 0x1ec, record[0x10]);
    }
    func_02034260(actor, descriptor);
}

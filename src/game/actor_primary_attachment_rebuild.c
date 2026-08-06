#include "tingle/types.h"

/* Replace an actor's primary animation resource and presentation attachment. */
extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02074038(void *owned, void *attachment);
extern void func_02071f38(void *resource);
extern void func_02071ee0(void *resource, void *manager, s32 first,
                          s32 second, s32 third);
extern void *func_020337d4(void *actor);
extern void *func_02030acc(void *collection);
extern void *func_02073fc4(void *collectionData, s32 first, s32 second,
                           s32 third, s32 mode);
extern void func_020313b4(void *actor, void *resource, u32 layer);
#ifdef __cplusplus
}
#endif

/*
 * For nonnull primary +0x54 and secondary +0x58 attachments, pass their word
 * +0x00 and the attachment itself to func_02074038. Clear +0x58, destroy the
 * resource state at +0x1f0, then rebuild it from first/second/third and create
 * a new primary attachment using the resource's resulting three words and the
 * low byte of layer. Store and return the new attachment. When actor flag
 * +0x14 bit one is set, also bind embedded resource +0x1ec with that layer.
 * Resource destruction/creation, attachment replacement, and binding mutate
 * owned SDK and presentation state; the retail path assumes created resources
 * satisfy the downstream helpers' preconditions.
 */
void *func_0203bae4(void *self, u16 first, u16 second, u16 third, u16 layer)
{
    u8 *actor = (u8 *)self;
    void *attachment = *(void **)(actor + 0x54);
    if (attachment != 0)
        func_02074038(*(void **)attachment, attachment);
    attachment = *(void **)(actor + 0x58);
    if (attachment != 0)
        func_02074038(*(void **)attachment, attachment);
    *(void **)(actor + 0x58) = 0;
    func_02071f38(actor + 0x1f0);
    func_02071ee0(actor + 0x1f0, data_020f4e18, first, second, third);
    attachment = func_02073fc4(
        func_02030acc(func_020337d4(actor)),
        *(s32 *)(actor + 0x1f0), *(s32 *)(actor + 0x1f4),
        *(s32 *)(actor + 0x1f8), layer & 0xff);
    *(void **)(actor + 0x54) = attachment;
    if ((*(u32 *)(actor + 0x14) & 1) != 0)
        func_020313b4(actor, actor + 0x1ec, layer & 0xff);
    return attachment;
}

#include "tingle/heap.h"
#include "tingle/types.h"

/* Query actor visibility state and replace an indexed attachment-slot resource. */
extern const char data_020df48c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02005580(void *allocation, u16 first, u16 second, u16 third);
extern void *Actor_GetCollection(void *actor);
extern void *func_02030acc(void *collection);
extern void func_020740c8(void *context, void *attachment, s32 first,
                          s32 second, s32 third);
#ifdef __cplusplus
}
#endif

/* Return actor +0xd0 bit 0x80 as either zero or the mask value 0x80. */
u32 func_02039714(void *self)
{
    return *(u32 *)((u8 *)self + 0xd0) & 0x80;
}

/*
 * Allocate a tagged 0x10-byte resource and initialize it from first, second,
 * and third; store it in actor pointer slot +0x208 + index*4. Before replacing
 * a nonnull old slot, compare old +0x04 against attachment +0x54/+0x14. On a
 * match, obtain the actor collection context through Actor_GetCollection followed by
 * func_02030acc and call func_020740c8 with attachment plus new resource words
 * +0x04/+0x08/+0x0c. Then destroy the old object through virtual +0x04.
 * Returns no value. The retail matching path assumes allocation succeeds when
 * that old-resource comparison matches; heap and virtual calls change owned
 * resource and presentation state.
 */
void Actor_ReplaceAttachmentSlotResource(void *self, s32 index, u16 first,
                                         u16 second, u16 third)
{
    u8 *actor = (u8 *)self;
    void **slot = (void **)(actor + 0x208 + index * 4);
    u8 *old = (u8 *)*slot;
    u8 *resource = (u8 *)Heap_Alloc(0x10, data_020df48c, 4, &gHeapContext);
    if (resource != 0)
        resource = (u8 *)func_02005580(resource, first, second, third);
    if (old != 0) {
        u8 *attachment = *(u8 **)(actor + 0x54);
        if (*(u32 *)(old + 4) == *(u32 *)(attachment + 0x14)) {
            void *context = func_02030acc(Actor_GetCollection(actor));
            func_020740c8(context, attachment, *(s32 *)(resource + 4),
                          *(s32 *)(resource + 8), *(s32 *)(resource + 0x0c));
        }
        (*(void (**)(void *))(*(u8 **)old + 4))(old);
    }
    *slot = resource;
}

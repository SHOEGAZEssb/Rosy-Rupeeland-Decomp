#include "tingle/heap.h"
#include "tingle/types.h"

/* Recovered guarded auxiliary-object spawn for the type-seven actor. */
extern const char data_020e1d04[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_DestroyAuxiliaryCollisionResource(void *actor);
extern void *func_0200cf00(void *allocation, s32 type, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Return without action when actor +0x268 bit 0x10 is set. Otherwise invoke
 * Actor_DestroyAuxiliaryCollisionResource(actor) when pointer +0x1e0 is
 * nonnull, allocate 0x9c bytes with
 * label data_020e1d04/alignment four from gHeapContext, and, on success,
 * construct it through func_0200cf00(allocation,10,0x7fff). The routine has no
 * meaningful return value; actor, heap ownership, and auxiliary state may change.
 */
void func_020471e4(void *self)
{
    u8 *actor = (u8 *)self;
    void *allocation;
    if ((*(u32 *)(actor + 0x268) & 0x10) != 0)
        return;
    if (*(void **)(actor + 0x1e0) != 0)
        Actor_DestroyAuxiliaryCollisionResource(actor);
    allocation = Heap_Alloc(0x9c, data_020e1d04, 4, &gHeapContext);
    if (allocation != 0)
        func_0200cf00(allocation, 10, 0x7fff);
}

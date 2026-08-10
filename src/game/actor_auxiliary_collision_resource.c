#include "tingle/heap.h"
#include "tingle/types.h"

/* Own and position the actor's optional auxiliary collision resource. */
extern u8 data_020df208[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020337d4(void *actor);
extern void *func_02030acc(void *collection);
extern void *func_020570c4(void *storage, void *collectionData);
extern void func_02057184(void *resource);
#ifdef __cplusplus
}
#endif

/*
 * Lazily allocate 0x2c bytes tagged by data_020df208, construct the resource
 * with data obtained from the actor's collection, and store it at actor+0x1e0.
 * Then set resource X +0x18 to zero and Y +0x1c to actor s16 +0x6a in 20.12
 * fixed point. The retail path proceeds to these writes even if allocation
 * failed, so successful allocation is an ownership precondition. Returns no
 * value; heap and constructor helpers manage SDK/resource state.
 */
void Actor_EnsureAuxiliaryCollisionResource(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *resource = *(u8 **)(actor + 0x1e0);

    if (resource == 0) {
        resource = (u8 *)Heap_Alloc(0x2c, (const char *)data_020df208, 4,
                                    &gHeapContext);
        if (resource != 0) {
            resource = (u8 *)func_020570c4(
                resource, func_02030acc(func_020337d4(actor)));
        }
        *(u8 **)(actor + 0x1e0) = resource;
    }
    *(s32 *)(resource + 0x18) = 0;
    *(s32 *)(resource + 0x1c) = *(s16 *)(actor + 0x6a) << 12;
}

/*
 * If actor+0x1e0 is non-null, run its destructor and free the allocation, then
 * clear the actor field. Returns no value; heap/resource ownership is released.
 */
void Actor_DestroyAuxiliaryCollisionResource(void *self)
{
    u8 *actor = (u8 *)self;
    void *resource = *(void **)(actor + 0x1e0);

    if (resource != 0) {
        func_02057184(resource);
        Heap_Free(resource);
    }
    *(void **)(actor + 0x1e0) = 0;
}

/* Return the auxiliary resource pointer stored at actor+0x1e0. */
void *Actor_GetAuxiliaryCollisionResource(void *self)
{
    return *(void **)((u8 *)self + 0x1e0);
}

/*
 * If the auxiliary resource exists, store integer X/Y at +0x18/+0x1c after
 * converting both to 20.12 fixed point. Returns no value.
 */
void Actor_SetAuxiliaryCollisionPosition(void *self, s32 x, s32 y)
{
    u8 *resource = *(u8 **)((u8 *)self + 0x1e0);

    if (resource != 0) {
        *(s32 *)(resource + 0x18) = x << 12;
        *(s32 *)(resource + 0x1c) = y << 12;
    }
}

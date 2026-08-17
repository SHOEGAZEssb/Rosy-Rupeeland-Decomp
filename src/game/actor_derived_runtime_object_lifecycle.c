#include "tingle/heap.h"
#include "tingle/types.h"

/* Construct and destroy a recovered derived actor object with an embedded +0x1ec helper. */
extern void *data_020df510[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorRuntimeBase_Init(void *self, const void *descriptor);
extern void *func_0203130c(void *self);
extern void func_02031488(void *self);
extern void *AnimationResource_InitEmpty(void *embedded);
extern void *AnimationResource_Destroy(void *embedded);
#ifdef __cplusplus
}
#endif

/* Shared portable construction equivalent for the two retail constructor entry points. */
static void *initializeDerivedRuntimeObject(void *self, const void *descriptor)
{
    u8 *object = (u8 *)ActorRuntimeBase_Init(self, descriptor);
    *(void **)object = data_020df510;
    AnimationResource_InitEmpty(object + 0x1ec);
    *(s32 *)(object + 0x1fc) = -1;
    *(s32 *)(object + 0x200) = -1;
    *(u16 *)(object + 0x204) = 0;
    return object;
}

/*
 * Initialize the base, install the recovered vtable, initialize +0x1ec and
 * fields +0x1fc..+0x204, then return self. The borrowed spawn descriptor is
 * forwarded to the base constructor and is not retained.
 */
void *ActorDerivedRuntime_Init(void *self, const void *descriptor)
{
    return initializeDerivedRuntimeObject(self, descriptor);
}

/* Alternate constructor entry with behavior identical to
 * ActorDerivedRuntime_Init; the descriptor is borrowed during construction. */
void *ActorDerivedRuntime_InitAlternate(void *self, const void *descriptor)
{
    return initializeDerivedRuntimeObject(self, descriptor);
}

/*
 * Install this vtable, invoke virtual +0xbc, release recovered base state and
 * +0x1ec, then return self.
 */
static void *destroyDerivedRuntimeObject(void *self)
{
    u8 *object = (u8 *)self;
    *(void **)object = data_020df510;
    (*(void (**)(void *))(*(u8 **)object + 0xbc))(object);
    func_02031488(object);
    AnimationResource_Destroy(object + 0x1ec);
    func_0203130c(object);
    return object;
}

/* Perform the shared non-freeing teardown and return self. */
void *ActorDerivedRuntime_Destroy(void *self)
{
    return destroyDerivedRuntimeObject(self);
}

/* Perform the shared teardown, free self, and return its former address. */
void *ActorDerivedRuntime_DestroyAndFree(void *self)
{
    void *result = destroyDerivedRuntimeObject(self);
    Heap_Free(self);
    return result;
}

/* Alternate non-freeing destructor entry identical to ActorDerivedRuntime_Destroy; return self. */
void *ActorDerivedRuntime_DestroyAlternate(void *self)
{
    return destroyDerivedRuntimeObject(self);
}

#include "tingle/heap.h"
#include "tingle/types.h"

/* Construct and destroy a recovered derived actor object with an embedded +0x1ec helper. */
extern void *data_020df510;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02030f98(void *self);
extern void *func_0203130c(void *self);
extern void func_02031488(void *self);
extern void *func_02010854(void *embedded);
extern void *func_020055d0(void *embedded);
#ifdef __cplusplus
}
#endif

/* Shared portable construction equivalent for the two retail constructor entry points. */
static void *initializeDerivedRuntimeObject(void *self)
{
    u8 *object = (u8 *)func_02030f98(self);
    *(void **)object = data_020df510;
    func_02010854(object + 0x1ec);
    *(s32 *)(object + 0x1fc) = -1;
    *(s32 *)(object + 0x200) = -1;
    *(u16 *)(object + 0x204) = 0;
    return object;
}

/* Initialize the base, install the recovered vtable, initialize +0x1ec and fields +0x1fc..+0x204, then return self. */
void *func_0203b514(void *self)
{
    return initializeDerivedRuntimeObject(self);
}

/* Alternate constructor entry with behavior identical to func_0203b514; return self. */
void *func_0203b554(void *self)
{
    return initializeDerivedRuntimeObject(self);
}

/* Shared teardown: install this vtable, invoke virtual +0xbc, release recovered base state and +0x1ec, then return self. */
static void *destroyDerivedRuntimeObject(void *self)
{
    u8 *object = (u8 *)self;
    *(void **)object = data_020df510;
    (*(void (**)(void *))(*(u8 **)object + 0xbc))(object);
    func_02031488(object);
    func_020055d0(object + 0x1ec);
    func_0203130c(object);
    return object;
}

/* Perform the shared non-freeing teardown and return self. */
void *func_0203b594(void *self)
{
    return destroyDerivedRuntimeObject(self);
}

/* Perform the shared teardown, free self, and return its former address. */
void *func_0203b5d4(void *self)
{
    void *result = destroyDerivedRuntimeObject(self);
    Heap_Free(self);
    return result;
}

/* Alternate non-freeing destructor entry identical to func_0203b594; return self. */
void *func_0203b61c(void *self)
{
    return destroyDerivedRuntimeObject(self);
}

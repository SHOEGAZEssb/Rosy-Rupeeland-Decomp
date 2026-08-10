#include "tingle/heap.h"
#include "tingle/types.h"

/* Tear down the type-1 derived actor extension and all recovered owned objects. */
extern u8 data_020df3c8[];
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0206c978(void *object);
extern void GameWork_ClearFlag(void *work, u32 flag);
extern void func_02031488(void *actor);
extern void func_0204cd7c(void *state);
extern void func_02005058(void *value);
extern void ActorDerivedRuntime_DestroyAlternate(void *actor);
#ifdef __cplusplus
}
#endif

/* Invoke virtual slot 4 on an owned object when it is non-null. */
static void destroyOwnedVirtual(void *object)
{
    if (object != 0) {
        void (*destroy)(void *) =
            *(void (**)(void *))(*(u8 **)object + 4);
        destroy(object);
    }
}

/* Perform the shared derived cleanup without freeing the actor allocation. */
static void cleanupDerivedType1(u8 *actor)
{
    void *object = *(void **)(actor + 0x26c);
    u32 i;
    void (*callback)(void *);

    *(void **)actor = data_020df3c8;
    if (object != 0) {
        func_0206c978(object);
        Heap_Free(object);
        GameWork_ClearFlag(gGameWork, 0x3ee);
    }
    destroyOwnedVirtual(*(void **)(actor + 0x270));
    callback = *(void (**)(void *))(*(u8 **)actor + 0xbc);
    callback(actor);
    func_02031488(actor);
    for (i = 0; i < 9; ++i)
        destroyOwnedVirtual(*(void **)(actor + 0x208 + i * 4));
    destroyOwnedVirtual(*(void **)(actor + 0x22c));
    destroyOwnedVirtual(*(void **)(actor + 0x274));
    func_0204cd7c(actor + 0x2a8);
    func_02005058(actor + 0x284);
    func_02005058(actor + 0x254);
    func_02005058(actor + 0x238);
    ActorDerivedRuntime_DestroyAlternate(actor);
}

/*
 * Install the type-1 vtable, destroy/free optional object +0x26c and clear
 * GameWork flag 0x3ee, destroy optional +0x270, run vtable slot 0xbc and
 * func_02031488, destroy nine owned objects +0x208..+0x228 plus optional
 * +0x22c/+0x274, destroy owner state +0x2a8 and vectors +0x284/+0x254/+0x238,
 * then run the base destructor. Return self without freeing its allocation.
 * Object, heap, GameWork, and value helpers have observable ownership effects.
 */
void *ActorDerivedType1_Destroy(void *self)
{
    cleanupDerivedType1((u8 *)self);
    return self;
}

/*
 * Perform exactly the cleanup documented for ActorDerivedType1_Destroy, then free the
 * actor allocation and return its former pointer value. The returned address
 * is no longer live storage and must not be dereferenced.
 */
void *ActorDerivedType1_DestroyAndFree(void *self)
{
    cleanupDerivedType1((u8 *)self);
    Heap_Free(self);
    return self;
}

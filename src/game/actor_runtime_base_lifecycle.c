#include "tingle/heap.h"
#include "tingle/types.h"

/* Release derived runtime actor attachments, resources, and value objects. */
typedef struct RuntimeActorLifecycle RuntimeActorLifecycle;
typedef struct RuntimeActorLifecycleVTable {
    u8 field_00[0xbc];
    void (*cleanup_bc)(RuntimeActorLifecycle *);
} RuntimeActorLifecycleVTable;

struct RuntimeActorLifecycle {
    RuntimeActorLifecycleVTable *vtable_00;
    u8 field_04[0xa4];
    void *field_a8;
    u8 field_ac[0x134];
    void *field_1e0;
};

extern u8 data_020df040[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02031488(RuntimeActorLifecycle *);
extern void *Actor_GetCollection(RuntimeActorLifecycle *);
extern void *ActorCollection_GetSpriteOwner(void *);
extern void func_02074038(void *, void *);
extern void func_02057184(void *);
extern void VecFx32Stepper_Destroy(void *);
extern void func_0201b1e0(void *);
extern void func_02005058(void *);
extern void *func_02030e08(void *);
#ifdef __cplusplus
}
#endif

static RuntimeActorLifecycle *destroyRuntimeActor(RuntimeActorLifecycle *self)
{
    void *object;

    self->vtable_00 = (RuntimeActorLifecycleVTable *)data_020df040;
    self->vtable_00->cleanup_bc(self);
    func_02031488(self);
    object = self->field_a8;
    if (object)
        func_02074038(ActorCollection_GetSpriteOwner(Actor_GetCollection(self)), object);
    object = self->field_1e0;
    if (object) {
        func_02057184(object);
        Heap_Free(object);
    }
    VecFx32Stepper_Destroy((u8 *)self + 0x198);
    func_0201b1e0((u8 *)self + 0xec);
    func_02005058((u8 *)self + 0xb0);
    func_02005058((u8 *)self + 0x98);
    func_02005058((u8 *)self + 0x88);
    func_02005058((u8 *)self + 0x78);
    func_02030e08(self);
    return self;
}

/*
 * Restore vtable data_020df040, invoke its offset-0xbc cleanup, release the
 * offset-0x58 attachment, unregister offset 0xa8, destroy/free optional object
 * 0x1e0, then destroy resources 0x198/0xec, vectors 0xb0/0x98/0x88/0x78, and
 * the common base. Return self without freeing it.
 */
RuntimeActorLifecycle *func_020311bc(RuntimeActorLifecycle *self)
{
    return destroyRuntimeActor(self);
}

/*
 * Perform the full derived/base teardown, free self through Heap_Free, and
 * return its former address. The returned pointer no longer owns live storage.
 */
RuntimeActorLifecycle *func_02031260(RuntimeActorLifecycle *self)
{
    destroyRuntimeActor(self);
    Heap_Free(self);
    return self;
}

/*
 * Perform the same non-freeing teardown as func_020311bc. This separate
 * address-derived entry point returns self and preserves retail dispatch use.
 */
RuntimeActorLifecycle *func_0203130c(RuntimeActorLifecycle *self)
{
    return destroyRuntimeActor(self);
}

/* Ignore the implied actor input, change no state, and return no value. */
void func_020313b0(void)
{
}

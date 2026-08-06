#include "tingle/heap.h"
#include "tingle/types.h"

/* Recovered lifecycle and reset helper for a subclass of the table-configured actor. */
extern u8 data_020e0b70[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02044518(void *actor, const void *configuration);
extern void *func_0203e494(void *actor);
extern void func_020447ec(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the table-configured parent through func_02044518, install vtable
 * data_020e0b70, clear halfwords +0x2a8/+0x2aa, and return self. Actor, parent,
 * and table-selection state change; no direct SDK or hardware access occurs.
 */
void *func_02044d84(void *self, const void *configuration)
{
    u8 *actor = (u8 *)self;
    func_02044518(actor, configuration);
    *(void **)actor = data_020e0b70;
    *(u16 *)(actor + 0x2a8) = 0;
    *(u16 *)(actor + 0x2aa) = 0;
    return actor;
}

/* Invoke base destructor func_0203e494 and return self; actor state is torn down. */
void *func_02044db4(void *self)
{
    func_0203e494(self);
    return self;
}

/*
 * Invoke base destructor func_0203e494, free self, and return the original
 * pointer value. Actor storage becomes invalid after the heap operation.
 */
void *func_02044dc8(void *self)
{
    func_0203e494(self);
    Heap_Free(self);
    return self;
}

/*
 * Reset the inherited counters through func_020447ec, then clear subclass
 * halfword +0x2a8 and set +0x2aa to 15. Returns no value; actor state changes.
 */
void func_02044de4(void *self)
{
    u8 *actor = (u8 *)self;
    func_020447ec(actor);
    *(u16 *)(actor + 0x2a8) = 0;
    *(u16 *)(actor + 0x2aa) = 15;
}

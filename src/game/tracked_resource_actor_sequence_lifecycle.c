#include "tingle/types.h"

/* Recovered lifecycle wrappers for an animation-sequenced impulse actor subclass. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02051cdc(void *actor);
extern void *func_0204fdc0(void *actor);
extern void Heap_Free(void *allocation);
extern u32 data_020e321c[];
#ifdef __cplusplus
}
#endif

/*
 * Input is subclass storage. Constructs the impulse-oriented parent through
 * func_02051cdc, installs vtable data_020e321c, and returns the same storage.
 * Engine-owned fields may be initialized; no direct hardware access occurs.
 */
void *func_02052120(void *actor)
{
    func_02051cdc(actor);
    *(u32 **)actor = data_020e321c;
    return actor;
}

/*
 * Input is a sequence-subclass instance. Runs tracked-resource base teardown
 * func_0204fdc0 and returns the instance without freeing it. The direct base
 * call rather than an address-derived parent destructor is confirmed.
 */
void *func_02052140(void *actor)
{
    func_0204fdc0(actor);
    return actor;
}

/*
 * Input is a heap-allocated sequence-subclass instance. Runs tracked-resource
 * base teardown, frees the allocation, and returns its former address, which
 * must not be dereferenced. No direct hardware access occurs.
 */
void *func_02052154(void *actor)
{
    func_0204fdc0(actor);
    Heap_Free(actor);
    return actor;
}

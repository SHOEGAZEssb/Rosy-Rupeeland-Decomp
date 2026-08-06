#include "tingle/types.h"

/* Recovered lifecycle wrappers for an impulse-oriented tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0204fcb8(void *actor);
extern void *func_0204fdc0(void *actor);
extern void Heap_Free(void *allocation);
extern u32 data_020e3308[];
#ifdef __cplusplus
}
#endif

/*
 * Input is variant storage. Constructs the tracked-resource base, installs
 * vtable data_020e3308, and returns the same storage. Engine-owned fields may
 * be initialized; no direct hardware access occurs.
 */
void *func_02051cdc(void *actor)
{
    func_0204fcb8(actor);
    *(u32 **)actor = data_020e3308;
    return actor;
}

/*
 * Input is a variant instance. Runs tracked-resource base teardown and returns
 * the instance without freeing it. Engine resources may be released.
 */
void *func_02051cfc(void *actor)
{
    func_0204fdc0(actor);
    return actor;
}

/*
 * Input is a heap-allocated variant instance. Runs base teardown, frees the
 * allocation, and returns its former address, which must not be dereferenced.
 */
void *func_02051d10(void *actor)
{
    func_0204fdc0(actor);
    Heap_Free(actor);
    return actor;
}

/*
 * Input is a variant instance. This second recovered non-freeing teardown runs
 * the same base cleanup as func_02051cfc and returns the instance; its distinct
 * call-site role is not confirmed. No direct hardware access occurs.
 */
void *func_02051d2c(void *actor)
{
    func_0204fdc0(actor);
    return actor;
}

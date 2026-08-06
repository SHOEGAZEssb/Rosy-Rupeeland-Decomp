#include "tingle/types.h"

/* Recovered lifecycle wrappers for a second tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0204fcb8(void *actor);
extern void *func_0204fdc0(void *actor);
extern void func_02051314(void *actor);
extern void Heap_Free(void *allocation);
extern u32 data_020e313c[];
#ifdef __cplusplus
}
#endif

/*
 * Input is variant storage. Constructs the tracked-resource base, installs
 * vtable data_020e313c, and returns the same storage. Engine fields may change;
 * no direct hardware access occurs.
 */
void *func_02050e74(void *actor)
{
    func_0204fcb8(actor);
    *(u32 **)actor = data_020e313c;
    return actor;
}

/*
 * Input is a variant instance. Reinstalls its vtable, runs variant cleanup
 * func_02051314 and tracked-resource base teardown, then returns the instance
 * without freeing it. Cleanup can release engine resources.
 */
void *func_02050e94(void *actor)
{
    *(u32 **)actor = data_020e313c;
    func_02051314(actor);
    func_0204fdc0(actor);
    return actor;
}

/*
 * Input is a heap-allocated variant instance. Performs the same variant and
 * base cleanup as func_02050e94, frees the allocation, and returns its former
 * address. The result must not be dereferenced; no hardware is accessed here.
 */
void *func_02050ebc(void *actor)
{
    *(u32 **)actor = data_020e313c;
    func_02051314(actor);
    func_0204fdc0(actor);
    Heap_Free(actor);
    return actor;
}

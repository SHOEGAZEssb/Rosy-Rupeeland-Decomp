#include "tingle/types.h"

/* Recovered lifecycle wrappers for an orientation-driven tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0204fcb8(void *actor);
extern void *func_0204fdc0(void *actor);
extern void Heap_Free(void *allocation);
extern u32 data_020e295c[];
#ifdef __cplusplus
}
#endif

/*
 * Input is variant storage. Constructs the tracked-resource base, installs
 * vtable data_020e295c, and returns the storage. Engine fields may be initialized.
 */
void *func_020522a8(void *actor)
{
    func_0204fcb8(actor);
    *(u32 **)actor = data_020e295c;
    return actor;
}

/*
 * Input is variant storage. This second construction entry performs the same
 * base construction and vtable installation as func_020522a8; its distinct
 * call-site role is unknown. Returns the supplied storage.
 */
void *func_020522c8(void *actor)
{
    func_0204fcb8(actor);
    *(u32 **)actor = data_020e295c;
    return actor;
}

/*
 * Input is a variant instance. Runs tracked-resource base teardown and returns
 * the instance without freeing it. Engine resources may be released.
 */
void *func_020522e8(void *actor)
{
    func_0204fdc0(actor);
    return actor;
}

/*
 * Input is a heap-allocated variant instance. Runs base teardown, frees the
 * allocation, and returns its former address, which must not be dereferenced.
 */
void *func_020522fc(void *actor)
{
    func_0204fdc0(actor);
    Heap_Free(actor);
    return actor;
}

/*
 * Input is a variant instance. This second non-freeing teardown runs the same
 * base cleanup as func_020522e8 and returns the instance; its separate role is
 * unconfirmed. These lifecycle wrappers do not directly access hardware.
 */
void *func_02052318(void *actor)
{
    func_0204fdc0(actor);
    return actor;
}

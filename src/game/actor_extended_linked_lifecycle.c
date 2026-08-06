#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered lifecycle and base-forwarding wrappers for actors participating in
 * the cross-type pairing list maintained by func_02043c24.
 */
extern u8 data_020e04d8[];
extern s16 data_0210572a;
extern void *data_0210572c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0203db80(void *actor, const void *configuration);
extern void *func_0203e494(void *actor);
extern void func_0203e7c8(void *actor);
extern s32 func_02043340(void *actor, void *other, s32 context);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the base actor from configuration, install vtable data_020e04d8,
 * clear partner pointer +0x298, and append self to data_0210572c when its signed
 * count is below eight. Return self. Base state and the global pairing list may
 * change; no direct SDK or hardware access occurs.
 */
void *func_02043cd0(void *self, const void *configuration)
{
    u8 *actor = (u8 *)self;
    func_0203db80(actor, configuration);
    *(void **)actor = data_020e04d8;
    *(void **)(actor + 0x298) = 0;
    if (data_0210572a < 8) {
        data_0210572c[data_0210572a] = actor;
        ++data_0210572a;
    }
    return actor;
}

/* Invoke base destructor func_0203e494 and return self; actor state is torn down. */
void *func_02043d1c(void *self)
{
    func_0203e494(self);
    return self;
}

/*
 * Invoke base destructor func_0203e494, free self, and return the original
 * pointer value. Actor storage becomes invalid after the heap operation.
 */
void *func_02043d30(void *self)
{
    func_0203e494(self);
    Heap_Free(self);
    return self;
}

/* Invoke base destructor func_0203e494 and return self; actor state is torn down. */
void *func_02043d4c(void *self)
{
    func_0203e494(self);
    return self;
}

/* Forward actor to base frame update func_0203e7c8; actor state may change. */
void func_02043d60(void *self)
{
    func_0203e7c8(self);
}

/*
 * Forward actor, other object, and context to func_02043340 and return its
 * result. Collision response and actor motion state may change.
 */
s32 func_02043d6c(void *self, void *other, s32 context)
{
    return func_02043340(self, other, context);
}

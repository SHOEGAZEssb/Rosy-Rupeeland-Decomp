#include "tingle/types.h"

/*
 * Recovered thin subclass of the runtime actor variant. It replaces the
 * vtable and supplies several constant or empty virtual callbacks.
 */

extern const u8 data_020e2238[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *allocation);
extern void *func_0204d244(void *actor, const void *descriptor);
extern void *func_0204d2f4(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are destination actor storage and a descriptor. Construct the parent
 * with func_0204d244, replace its vtable with data_020e2238, and return self.
 * Parent construction may change engine state; no hardware is accessed directly.
 */
void *func_0204d520(void *self, const void *descriptor)
{
    func_0204d244(self, descriptor);
    *(const void **)self = data_020e2238;
    return self;
}

/*
 * Input is a subclass actor. Invoke the parent's non-deleting teardown
 * func_0204d2f4 and return self. Parent-owned state may change; heap and
 * hardware state are untouched directly.
 */
void *func_0204d540(void *self)
{
    func_0204d2f4(self);
    return self;
}

/*
 * Input is a subclass actor. Invoke func_0204d2f4, free self, and return the
 * original address as in retail code. Parent and heap state change; there are
 * no direct hardware effects.
 */
void *func_0204d554(void *self)
{
    func_0204d2f4(self);
    Heap_Free(self);
    return self;
}

/*
 * Input is a subclass actor. Invoke the parent's non-deleting teardown and
 * return self. This separate callback address is retained for the recovered
 * vtable; no heap or hardware effect occurs directly.
 */
void *func_0204d570(void *self)
{
    func_0204d2f4(self);
    return self;
}

/* Ignore all register inputs and return zero without changing any state. */
s32 func_0204d584(void)
{
    return 0;
}

/* Ignore all register inputs and return zero without changing any state. */
s32 func_0204d58c(void)
{
    return 0;
}

/* Ignore all register inputs and return zero without changing any state. */
s32 func_0204d594(void)
{
    return 0;
}

/* Empty recovered callback with no state, SDK, or hardware effects. */
void func_0204d59c(void)
{
}

/* Empty recovered callback with no state, SDK, or hardware effects. */
void func_0204d5a0(void)
{
}

/* Ignore all register inputs and return one without changing any state. */
s32 func_0204d5a4(void)
{
    return 1;
}

#include "tingle/types.h"

/*
 * Recovered lifecycle wrappers for a runtime actor variant. Two construction
 * entry points share one vtable and optional descriptor-driven initialization.
 */

extern const u8 data_020e2028[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *allocation);
extern void *func_02030f98(void *actor, const void *descriptor);
extern void func_0203130c(void *actor);
#ifdef __cplusplus
}
#endif

/* Invoke virtual slot 0x74 with one recovered pointer argument. */
static void callDescriptorHook(void *self, void *value)
{
    void (**vtable)(void *, void *) = *(void (***)(void *, void *))self;
    vtable[0x74 / 4](self, value);
}

/*
 * Inputs are destination actor storage and a descriptor. Construct the base
 * through func_02030f98, install vtable data_020e2028, and, when descriptor
 * word +0x2c is non-null, invoke virtual slot 0x74 with that word. Return self.
 * Base construction and the optional virtual hook may change engine state;
 * there are no direct hardware effects.
 */
void *func_0204d244(void *self, const void *descriptor)
{
    func_02030f98(self, descriptor);
    *(const void **)self = data_020e2028;
    if (*(void **)((u8 *)descriptor + 0x2c) != 0)
        callDescriptorHook(self, *(void **)((u8 *)descriptor + 0x2c));
    return self;
}

/*
 * Inputs and behavior match func_0204d244: construct the same base, install
 * data_020e2028, optionally dispatch descriptor +0x2c through slot 0x74, and
 * return self. This distinct address is retained because callers select the
 * entry point independently. Engine state may change; no direct hardware effect.
 */
void *func_0204d284(void *self, const void *descriptor)
{
    func_02030f98(self, descriptor);
    *(const void **)self = data_020e2028;
    if (*(void **)((u8 *)descriptor + 0x2c) != 0)
        callDescriptorHook(self, *(void **)((u8 *)descriptor + 0x2c));
    return self;
}

/*
 * Input is a runtime actor variant. Invoke non-deleting base destructor
 * func_0203130c and return self. Base-owned state may change; the heap and
 * hardware are untouched directly.
 */
void *func_0204d2c4(void *self)
{
    func_0203130c(self);
    return self;
}

/*
 * Input is a runtime actor variant. Invoke func_0203130c, release self through
 * Heap_Free, and return the original address as in retail code. Base and heap
 * state change; there are no direct hardware effects.
 */
void *func_0204d2d8(void *self)
{
    func_0203130c(self);
    Heap_Free(self);
    return self;
}

/*
 * Input is a runtime actor variant. Invoke the same non-deleting base teardown
 * as func_0204d2c4 and return self. This separate callback address is preserved;
 * base state may change and there are no direct hardware effects.
 */
void *func_0204d2f4(void *self)
{
    func_0203130c(self);
    return self;
}

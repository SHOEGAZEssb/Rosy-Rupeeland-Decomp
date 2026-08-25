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
extern void *ActorRuntimeBase_Init(void *actor, const void *descriptor);
extern void RuntimeActor_DestroyAlternateEntry(void *actor);
#ifdef __cplusplus
}
#endif

/* Assign one borrowed script through virtual slot +0x74. */
static void assignPrimaryScript(void *self, const s8 *script)
{
    void (**vtable)(void *, const s8 *) =
        *(void (***)(void *, const s8 *))self;
    vtable[0x74 / 4](self, script);
}

/*
 * Inputs are destination actor storage and a descriptor. Construct the base
 * through ActorRuntimeBase_Init, install vtable data_020e2028, and, when the
 * descriptor script at +0x2c is non-null, assign it through virtual slot +0x74.
 * Return self. Base construction and optional script assignment change engine state;
 * there are no direct hardware effects.
 */
void *func_0204d244(void *self, const void *descriptor)
{
    ActorRuntimeBase_Init(self, descriptor);
    *(const void **)self = data_020e2028;
    if (*(void **)((u8 *)descriptor + 0x2c) != 0)
        assignPrimaryScript(
            self, *(const s8 **)((u8 *)descriptor + 0x2c));
    return self;
}

/*
 * Inputs and behavior match func_0204d244: construct the same base, install
 * data_020e2028, optionally assign descriptor script +0x2c through slot +0x74,
 * and return self. This distinct address is retained because callers select the
 * entry point independently. Engine state may change; no direct hardware effect.
 */
void *func_0204d284(void *self, const void *descriptor)
{
    ActorRuntimeBase_Init(self, descriptor);
    *(const void **)self = data_020e2028;
    if (*(void **)((u8 *)descriptor + 0x2c) != 0)
        assignPrimaryScript(
            self, *(const s8 **)((u8 *)descriptor + 0x2c));
    return self;
}

/*
 * Input is a runtime actor variant. Invoke non-deleting base destructor
 * RuntimeActor_DestroyAlternateEntry and return self. Base-owned state may change; the heap and
 * hardware are untouched directly.
 */
void *func_0204d2c4(void *self)
{
    RuntimeActor_DestroyAlternateEntry(self);
    return self;
}

/*
 * Input is a runtime actor variant. Invoke RuntimeActor_DestroyAlternateEntry, release self through
 * Heap_Free, and return the original address as in retail code. Base and heap
 * state change; there are no direct hardware effects.
 */
void *func_0204d2d8(void *self)
{
    RuntimeActor_DestroyAlternateEntry(self);
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
    RuntimeActor_DestroyAlternateEntry(self);
    return self;
}

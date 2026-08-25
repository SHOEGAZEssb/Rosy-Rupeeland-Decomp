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
extern void *RuntimeActorScriptVariant_Init(void *actor, const void *descriptor);
extern void *RuntimeActorScriptVariant_DestroyAlternateEntry(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are destination actor storage and a descriptor. Construct the parent
 * with RuntimeActorScriptVariant_Init, replace its vtable with data_020e2238, and return self.
 * Parent construction may change engine state; no hardware is accessed directly.
 */
void *RuntimeActorScriptVariantSubclass_Init(void *self, const void *descriptor)
{
    RuntimeActorScriptVariant_Init(self, descriptor);
    *(const void **)self = data_020e2238;
    return self;
}

/*
 * Input is a subclass actor. Invoke the parent's non-deleting teardown
 * RuntimeActorScriptVariant_DestroyAlternateEntry and return self. Parent-owned state may change; heap and
 * hardware state are untouched directly.
 */
void *RuntimeActorScriptVariantSubclass_Destroy(void *self)
{
    RuntimeActorScriptVariant_DestroyAlternateEntry(self);
    return self;
}

/*
 * Input is a subclass actor. Invoke RuntimeActorScriptVariant_DestroyAlternateEntry, free self, and return the
 * original address as in retail code. Parent and heap state change; there are
 * no direct hardware effects.
 */
void *RuntimeActorScriptVariantSubclass_DestroyAndFree(void *self)
{
    RuntimeActorScriptVariant_DestroyAlternateEntry(self);
    Heap_Free(self);
    return self;
}

/*
 * Input is a subclass actor. Invoke the parent's non-deleting teardown and
 * return self. This separate callback address is retained for the recovered
 * vtable; no heap or hardware effect occurs directly.
 */
void *RuntimeActorScriptVariantSubclass_DestroyAlternateEntry(void *self)
{
    RuntimeActorScriptVariant_DestroyAlternateEntry(self);
    return self;
}

/* Ignore all register inputs and return zero without changing any state. */
s32 RuntimeActorScriptVariantSubclass_ReturnZeroHook0(void)
{
    return 0;
}

/* Ignore all register inputs and return zero without changing any state. */
s32 RuntimeActorScriptVariantSubclass_ReturnZeroHook1(void)
{
    return 0;
}

/* Ignore all register inputs and return zero without changing any state. */
s32 RuntimeActorScriptVariantSubclass_ReturnZeroHook2(void)
{
    return 0;
}

/* Empty recovered callback with no state, SDK, or hardware effects. */
void RuntimeActorScriptVariantSubclass_NoOpHook0(void)
{
}

/* Empty recovered callback with no state, SDK, or hardware effects. */
void RuntimeActorScriptVariantSubclass_NoOpHook1(void)
{
}

/* Ignore all register inputs and return one without changing any state. */
s32 RuntimeActorScriptVariantSubclass_ReturnOneHook(void)
{
    return 1;
}

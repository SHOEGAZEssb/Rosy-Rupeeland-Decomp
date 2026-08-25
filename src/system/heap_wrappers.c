#include "tingle/heap.h"

/*
 * Public heap forwarding layer. These paired entry points expose the tagged
 * allocator and release routines under both semantic and address-derived
 * names without adding policy or changing arguments.
 */

/*
 * Forward size, four-byte tag, signed alignment, and heap context to the core
 * allocator. It returns the allocated user pointer and inherits all heap/tag
 * state changes and failure behavior from Heap_AllocCore.
 */
void *Heap_Alloc(u32 size, const char *tag, s32 alignment,
                 HeapContext *context)
{
    return Heap_AllocCore(size, tag, alignment, context);
}

/* Address-derived alias of Heap_Alloc with the same inputs, effects, and result. */
void *Heap_AllocAlternateEntry(u32 size, const char *tag, s32 alignment,
                    HeapContext *context)
{
    return Heap_AllocCore(size, tag, alignment, context);
}

/* Release a tagged allocation through the core heap facade; returns nothing. */
void Heap_Free(void *allocation)
{
    Heap_FreeCore(allocation);
}

/* Address-derived alias of Heap_Free with the same input and heap side effect. */
void Heap_FreeAlternateEntry(void *allocation)
{
    Heap_FreeCore(allocation);
}

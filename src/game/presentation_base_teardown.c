#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Provide two recovered teardown entry points for an otherwise opaque
 * presentation derived from the common base.  One frees the allocation and one
 * leaves storage ownership with the caller.
 */

#ifdef __cplusplus
extern "C" { extern void *func_0201e28c(void *); }
#endif

/* Tear down the common base, free self, and return its old address. */
void *func_0202290c(void *self)
{ func_0201e28c(self); Heap_Free(self); return self; }

/* Tear down the common base without freeing storage and return self. */
void *func_02022928(void *self)
{ func_0201e28c(self); return self; }

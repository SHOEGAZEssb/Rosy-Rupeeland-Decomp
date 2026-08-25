#include "tingle/field_effect.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Provide two recovered teardown entry points for an otherwise opaque
 * presentation derived from FieldEffect.  One frees the allocation and one
 * leaves storage ownership with the caller.
 */

/* Tear down the FieldEffect base, free self, and return its old address. */
void *DisplayFadePresentation_DestroyAndFree(void *self)
{ FieldEffect_DestroyBase(self); Heap_Free(self); return self; }

/* Tear down the FieldEffect base without freeing storage and return self. */
void *DisplayFadePresentation_Destroy(void *self)
{ FieldEffect_DestroyBase(self); return self; }

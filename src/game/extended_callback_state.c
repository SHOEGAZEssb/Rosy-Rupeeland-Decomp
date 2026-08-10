#include "tingle/types.h"

/*
 * Provide two small helpers used by the following array-backed presentation:
 * a no-op element destructor and a callback-state initializer with two cleared
 * state words.
 */

typedef struct ExtendedCallbackState {
    u8 field00[8];
    void *first08;
    void *second0c;
    u32 field10;
    u32 field14;
} ExtendedCallbackState;

/* No-op array-element destructor; it has no observable state or SDK effects. */
void BlendElement_DestroyNoOp(void *element)
{
    (void)element;
}

/* Store two callback inputs, clear words 0x10/0x14, and preserve bytes 0x00..0x07. */
void ExtendedCallbackState_SetReferencesAndReset(
    ExtendedCallbackState *self, void *first, void *second)
{
    self->first08 = first;
    self->second0c = second;
    self->field10 = 0;
    self->field14 = 0;
}

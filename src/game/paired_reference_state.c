#include "tingle/types.h"

/*
 * Initialize a recovered state fragment that retains two caller references at
 * offsets 0x08 and 0x0c and clears its word at offset 0x10.
 */

typedef struct PairedReferenceState {
    u8 field00[8];
    void *first08;
    void *second0c;
    u32 field10;
} PairedReferenceState;

/* Store both inputs, clear field10, and leave the first eight bytes unchanged. */
void func_02020e60(PairedReferenceState *self, void *first, void *second)
{
    self->first08 = first;
    self->second0c = second;
    self->field10 = 0;
}

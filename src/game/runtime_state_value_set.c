#include "tingle/types.h"

/*
 * Runtime-state value setter recovered from ARM9 0x020983C0.
 *
 * The borrowed object is the retail selection-history state. The function
 * stores a signed word immediately after its count at offset 0x464; no reader
 * has yet established a narrower gameplay meaning for that trailing value.
 */

/* Store one script-controlled word in the resident runtime state. */
void RetailSelectionHistory_SetTrailingValue(void *state, s32 trailingValue)
{
    *(s32 *)((u8 *)state + 0x464) = trailingValue;
}

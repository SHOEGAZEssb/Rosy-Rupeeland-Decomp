/* Signed integer absolute-value primitive used by game geometry code. */
#include "tingle/types.h"

/* Return the magnitude of value. This address-distinct retail entry point has
 * the same implementation and two's-complement INT_MIN behavior as
 * func_020be334. */
s32 func_020be328(s32 value)
{
    return value < 0 ? (s32)(0u - (u32)value) : value;
}

/* Return the magnitude of value. Retail uses two's-complement negation for
 * negative input and therefore preserves 0x80000000 unchanged. */
s32 func_020be334(s32 value)
{
    return value < 0 ? (s32)(0u - (u32)value) : value;
}

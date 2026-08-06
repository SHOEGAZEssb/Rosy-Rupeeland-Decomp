#include "tingle/types.h"

/* Recover the second retail entry point for the extended type-two constructor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0203db80(void *self, const void *configuration);
#ifdef __cplusplus
}
#endif

/*
 * Construct the same extended type-two actor as func_0203db80 from self and
 * the offset-based configuration record, returning self after the same base,
 * heap, helper, descriptor, and virtual-callback effects. The retail function
 * repeats that constructor body byte-for-byte; the portable implementation
 * delegates to its documented equivalent, while the matching fallback retains
 * the duplicated retail code.
 */
void *func_0203df4c(void *self, const void *configuration)
{
    return func_0203db80(self, configuration);
}

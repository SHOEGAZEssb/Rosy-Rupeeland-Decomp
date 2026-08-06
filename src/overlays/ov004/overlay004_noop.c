#include "tingle/types.h"

/* Overlay 4 no-op callback. This recovered entry point intentionally performs
 * no work and serves as a default hook in the overlay's presentation class. */

/* Ignore the untyped callback context, return no value, and produce no state,
 * SDK, or hardware effects. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov004_021fb6e0(void *context)
{
    (void)context;
}

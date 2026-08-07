#include "tingle/types.h"

/*
 * Overlay 4 transition completion callback. This recovered terminal callback
 * unconditionally reports completion to the shared presentation framework.
 */

/*
 * Accept the framework-supplied state pointer, make no state or hardware
 * changes, and return one to signal completion. The argument is intentionally
 * unused and its concrete type remains unknown.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov004_021fccf8(void *state)
{
    (void)state;
    return 1;
}

#include "tingle/types.h"

/*
 * Overlay 5 render no-op callback. This recovered framework hook intentionally
 * performs no work.
 */

/*
 * Accept the framework-supplied pointer, make no state changes, return no
 * value, and perform no SDK or hardware effects. Its concrete input type is
 * still unknown.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov005_021fc864(void *object)
{
    (void)object;
}

#include "tingle/types.h"

/*
 * Overlay 5 no-op callback. This recovered framework hook intentionally does
 * nothing and exists to satisfy a callback/vtable interface.
 */

/*
 * Accept the framework-supplied object pointer, make no state changes, return
 * no value, and perform no SDK or hardware effects. The concrete input type is
 * still unknown.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov005_021fb6e0(void *object)
{
    (void)object;
}

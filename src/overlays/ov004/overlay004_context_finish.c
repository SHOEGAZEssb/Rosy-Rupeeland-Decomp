#include "tingle/types.h"

/*
 * Overlay 4 presentation completion callback. This recovered helper performs
 * one final context update and reports that the callback has completed.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void Overlay004_UpdateContext(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Update both renderer contexts reachable through state via
 * Overlay004_UpdateContext and return one. The context and any observable renderer
 * changes are owned by that callee; this callback performs no direct hardware
 * access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov004_021fc8ec(void *state)
{
    Overlay004_UpdateContext(state);
    return 1;
}

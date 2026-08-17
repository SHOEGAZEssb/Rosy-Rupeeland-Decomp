#include "tingle/types.h"

/*
 * Overlay 5 render-effect destruction. This recovered non-deleting destructor
 * tears down the embedded resource while retaining the object allocation.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void AnimationResourceState_Destroy(void *resource);
extern void func_ov005_021fb6e0(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Destroy the embedded resource at +0x9C, invoke the no-op base hook
 * func_ov005_021fb6e0, and return state without freeing it. Resource effects
 * are delegated and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov005_021fc890(void *state)
{
    AnimationResourceState_Destroy((u8 *)state + 0x9c);
    func_ov005_021fb6e0(state);
    return state;
}

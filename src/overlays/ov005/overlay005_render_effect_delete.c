#include "tingle/types.h"

/*
 * Overlay 5 render-effect deletion. This recovered deleting destructor tears
 * down the embedded resource and frees the render-effect object.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02071eb8(void *resource);
extern void func_ov005_021fb6e0(void *object);
extern void Heap_Free(void *memory);
#ifdef __cplusplus
}
#endif

/*
 * Destroy the embedded resource at +0x9C, invoke the no-op base hook
 * func_ov005_021fb6e0, pass state to Heap_Free, and return the original
 * pointer. Resource and allocation effects are delegated; no hardware access
 * occurs directly.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov005_021fc868(void *state)
{
    func_02071eb8((u8 *)state + 0x9c);
    func_ov005_021fb6e0(state);
    Heap_Free(state);
    return state;
}

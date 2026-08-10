#include "tingle/types.h"

/*
 * Overlay 7 controller destruction. This recovered non-deleting destructor
 * tears down the derived member and then delegates base-object teardown.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_Destroy(void *member);
extern void func_02099fb0(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Destroy the embedded member at +0x80 through VecFx32Object_Destroy, call
 * func_02099fb0(state) for base teardown, and return state without freeing it.
 * Ownership effects are delegated and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov007_021fb768(void *state)
{
    VecFx32Object_Destroy((u8 *)state + 0x80);
    func_02099fb0(state);
    return state;
}

#include "tingle/types.h"

/*
 * Overlay 7 controller destruction. This recovered non-deleting destructor
 * tears down the derived member and then delegates base-object teardown.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02005058(void *member);
extern void func_02099fb0(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Destroy the embedded member at +0x80 through func_02005058, call
 * func_02099fb0(state) for base teardown, and return state without freeing it.
 * Ownership effects are delegated and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov007_021fb768(void *state)
{
    func_02005058((u8 *)state + 0x80);
    func_02099fb0(state);
    return state;
}

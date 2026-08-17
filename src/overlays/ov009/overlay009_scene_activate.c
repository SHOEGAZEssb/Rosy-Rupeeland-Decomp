#include "tingle/types.h"

/*
 * Overlay 9 scene activation. This recovered wrapper forwards the embedded
 * scene member at +0x24 to its SDK-facing transition routine.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void SceneInputBase_Update(void *member, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Pass state +0x24 and value 1 to SceneInputBase_Update via a tail call. Return no
 * independent value. The callee owns observable scene-transition effects and
 * no direct hardware access occurs here.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov009_021fd280(void *state)
{
    SceneInputBase_Update((u8 *)state + 0x24, 1);
}

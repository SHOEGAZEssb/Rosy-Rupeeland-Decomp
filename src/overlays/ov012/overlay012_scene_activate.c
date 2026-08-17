#include "tingle/types.h"

/* Overlay 12 object-viewer scene activation wrapper. */

#ifdef __cplusplus
extern "C" {
#endif
extern void SceneInputBase_Update(void *, s32);
#ifdef __cplusplus
}
#endif

/* Pass the embedded scene member at +0x24 and value one to SceneInputBase_Update; returns void and delegates all transition effects. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fd598(void *state)
{
    SceneInputBase_Update((u8 *)state + 0x24, 1);
}

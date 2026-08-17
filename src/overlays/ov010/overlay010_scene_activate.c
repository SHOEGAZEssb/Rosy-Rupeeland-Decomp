#include "tingle/types.h"

/* Overlay 10 scene activation wrapper for embedded member +0x24. */
#ifdef __cplusplus
extern "C" {
#endif
extern void SceneInputBase_Update(void *, s32);
#ifdef __cplusplus
}
#endif
/* Pass state +0x24 and value one to SceneInputBase_Update by tail call; return void and delegate all transition effects. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov010_021fd388(void *state) { SceneInputBase_Update((u8 *)state + 0x24, 1); }

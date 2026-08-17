#include "tingle/types.h"
/* Overlay 11 embedded +0x24 scene activation wrapper. */
#ifdef __cplusplus
extern "C" {
#endif
extern void SceneInputBase_Update(void *,s32);
#ifdef __cplusplus
}
#endif
/* Tail-call SceneInputBase_Update with state +0x24 and one; return void and delegate transition effects. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov011_021fd174(void *s){SceneInputBase_Update((u8 *)s+0x24,1);}

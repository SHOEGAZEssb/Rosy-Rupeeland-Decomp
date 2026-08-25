#include "tingle/types.h"
/* Overlay 10 +0x24 subobject non-freeing destruction thunk. */
#ifdef __cplusplus
extern "C" {
#endif
extern void *Overlay010_Scene_Destroy(void *);
#ifdef __cplusplus
}
#endif
/* Convert member to containing state by subtracting 0x24, tail-call non-freeing teardown, and return state. */
#ifdef __cplusplus
extern "C"
#endif
void *Overlay010_EmbeddedDestroyThunk(void *m){return Overlay010_Scene_Destroy((u8 *)m-0x24);}

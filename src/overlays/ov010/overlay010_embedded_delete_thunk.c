#include "tingle/types.h"
/* Overlay 10 +0x24 subobject deleting thunk. */
#ifdef __cplusplus
extern "C" {
#endif
extern void *Overlay010_Scene_Delete(void *);
#ifdef __cplusplus
}
#endif
/* Convert member to containing state by subtracting 0x24, tail-call deleting teardown, and return its invalid ABI pointer. */
#ifdef __cplusplus
extern "C"
#endif
void *Overlay010_EmbeddedDeleteThunk(void *m){return Overlay010_Scene_Delete((u8 *)m-0x24);}

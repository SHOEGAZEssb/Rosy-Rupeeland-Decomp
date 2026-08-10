#include "tingle/types.h"

/* Overlay 10 active model/resource release. */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DResourceBinding_Destroy(void *); extern void Heap_Free(void *);
extern void GraphicsAnimationInstanceManager_DestroyInstance(void *, void *); extern void func_02072140(void *);
#ifdef __cplusplus
}
#endif
/* If +0x12C exists, destroy/free it, clear +0x12C, and return. Otherwise detach +0x8C from +0x88, clear +0x8C, and reset resource set +0x7C. Return void; all resource effects are delegated. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov010_021fd408(void *state)
{
    void *p=FIELD(void *,state,0x12c);
    if(p){Graphics3DResourceBinding_Destroy(p);Heap_Free(p);FIELD(void *,state,0x12c)=0;return;}
    GraphicsAnimationInstanceManager_DestroyInstance(FIELD(void *,state,0x88),FIELD(void *,state,0x8c));
    FIELD(void *,state,0x8c)=0; func_02072140((u8 *)state+0x7c);
}

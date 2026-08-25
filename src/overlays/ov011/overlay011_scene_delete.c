#include "tingle/graphics_resources.h"
#include "tingle/types.h"
/* Overlay 11 deleting scene teardown. */
#define F(t,b,o)(*(t *)((u8 *)(b)+(o)))
#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_ov011_021fe578[];extern const void *data_ov011_021fe5ac[];extern void func_ov011_021fce00(u32);extern void func_02092418(void *);extern void Heap_FreeCore(void *);extern void DebugText_BeginFrame(void);extern void GraphicsBankStateSnapshot_Destroy(void *);extern void Scene_Destroy(void *);extern void Heap_Free(void *);
#ifdef __cplusplus
}
#endif
/* Perform the non-freeing teardown, free state, and return the original invalid pointer for recovered ABI compatibility; callers must not dereference it. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov011_021fd0fc(void *s){s32 i;F(const void *,s,0)=data_ov011_021fe578;F(const void *,s,0x24)=data_ov011_021fe5ac;func_ov011_021fce00(0);func_02092418((u8 *)s+0x98);for(i=0;i<5;i++)Heap_FreeCore(F(void *,s,0x84+i*4));DebugText_BeginFrame();GraphicsBankStateSnapshot_Destroy((u8 *)s+0x98);GraphicsResourceSet_Destroy((GraphicsResourceSet *)((u8 *)s+0x78));Scene_Destroy(s);Heap_Free(s);return s;}

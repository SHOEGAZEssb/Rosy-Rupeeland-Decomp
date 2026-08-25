#include "tingle/types.h"

/* Overlay 10 non-freeing scene teardown for the 3D debug viewer. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_ov010_021fec34[];
extern const void *data_ov010_021fec68[];
extern void *data_020f4e14;
extern void Graphics3DResourceBinding_Destroy(void *); extern void Heap_Free(void *);
extern void Heap_FreeCore(void *); extern void Graphics3DResourceOwner_Destroy(void *);
extern void GraphicsSpriteRenderer_Resume(void *); extern void GraphicsBankStateSnapshot_Restore(void *);
extern void DebugText_BeginFrame(void); extern void GraphicsBankStateSnapshot_Destroy(void *);
extern void GraphicsResourceSetVariant_Destroy(void *); extern void Scene_Destroy(void *);
#ifdef __cplusplus
}
#endif

/* Restore descriptors; destroy/free optional +0x12C/+0x130, free two buffers at +0x90, destroy/free +0x78, release manager state, destroy debug/member/scene bases, and return state without freeing it. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov010_021fd1e8(void *state)
{
    s32 i; void *p;
    FIELD(const void *, state, 0) = data_ov010_021fec34;
    FIELD(const void *, state, 0x24) = data_ov010_021fec68;
    p = FIELD(void *, state, 0x12c); if (p) { Graphics3DResourceBinding_Destroy(p); Heap_Free(p); }
    p = FIELD(void *, state, 0x130); if (p) { Graphics3DResourceBinding_Destroy(p); Heap_Free(p); }
    for (i = 0; i < 2; i++) Heap_FreeCore(FIELD(void *, state, 0x90 + i * 4));
    p = FIELD(void *, state, 0x78); if (p) { Graphics3DResourceOwner_Destroy(p); Heap_Free(p); }
    GraphicsSpriteRenderer_Resume(data_020f4e14);
    GraphicsBankStateSnapshot_Restore((u8 *)state + 0x180); DebugText_BeginFrame();
    GraphicsBankStateSnapshot_Destroy((u8 *)state + 0x180); GraphicsResourceSetVariant_Destroy((u8 *)state + 0x7c);
    Scene_Destroy(state); return state;
}

#include "tingle/types.h"

/* Overlay 10 deleting scene teardown; releases the 3D debug viewer and its allocation. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_ov010_021fec34[]; extern const void *data_ov010_021fec68[];
extern void *data_020f4e14; extern void Graphics3DResourceBinding_Destroy(void *); extern void Heap_Free(void *);
extern void func_02002728(void *); extern void Graphics3DResourceOwner_Destroy(void *); extern void func_02075020(void *);
extern void func_02092418(void *); extern void DebugText_BeginFrame(void); extern void func_020923a0(void *);
extern void GraphicsResourceSetVariant_Destroy(void *); extern void Scene_Destroy(void *);
#ifdef __cplusplus
}
#endif

/* Perform func_ov010_021fd1e8's ordered teardown, then free state and return the original invalid pointer for ABI compatibility; callers must not dereference it. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov010_021fd2b4(void *state)
{
    s32 i; void *p;
    FIELD(const void *, state, 0) = data_ov010_021fec34;
    FIELD(const void *, state, 0x24) = data_ov010_021fec68;
    p = FIELD(void *, state, 0x12c); if (p) { Graphics3DResourceBinding_Destroy(p); Heap_Free(p); }
    p = FIELD(void *, state, 0x130); if (p) { Graphics3DResourceBinding_Destroy(p); Heap_Free(p); }
    for (i = 0; i < 2; i++) func_02002728(FIELD(void *, state, 0x90 + i * 4));
    p = FIELD(void *, state, 0x78); if (p) { Graphics3DResourceOwner_Destroy(p); Heap_Free(p); }
    func_02075020(data_020f4e14);
    func_02092418((u8 *)state + 0x180); DebugText_BeginFrame();
    func_020923a0((u8 *)state + 0x180); GraphicsResourceSetVariant_Destroy((u8 *)state + 0x7c);
    Scene_Destroy(state); Heap_Free(state); return state;
}

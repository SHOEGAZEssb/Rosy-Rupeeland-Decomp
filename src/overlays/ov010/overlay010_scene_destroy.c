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
extern void func_02002728(void *); extern void Graphics3DResourceOwner_Destroy(void *);
extern void func_02075020(void *); extern void func_02092418(void *);
extern void DebugText_BeginFrame(void); extern void func_020923a0(void *);
extern void func_020720d4(void *); extern void Scene_Destroy(void *);
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
    for (i = 0; i < 2; i++) func_02002728(FIELD(void *, state, 0x90 + i * 4));
    p = FIELD(void *, state, 0x78); if (p) { Graphics3DResourceOwner_Destroy(p); Heap_Free(p); }
    func_02075020(data_020f4e14);
    func_02092418((u8 *)state + 0x180); DebugText_BeginFrame();
    func_020923a0((u8 *)state + 0x180); func_020720d4((u8 *)state + 0x7c);
    Scene_Destroy(state); return state;
}

#include "tingle/types.h"

/* Overlay 12 deleting teardown for the LWO object-viewer scene. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const void *data_ov012_021fe670[];
extern const void *data_ov012_021fe6a4[];
#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DResourceBinding_Destroy(void *);
extern void Heap_Free(void *);
extern void func_02002728(void *);
extern void Graphics3DResourceOwner_Destroy(void *);
extern void func_02092418(void *);
extern void DebugText_BeginFrame(void);
extern void func_020923a0(void *);
extern void func_ov012_021fce3c(void *);
extern void Graphics3DLightSet_Destroy(void *);
extern void Scene_Destroy(void *);
#ifdef __cplusplus
}
#endif

/* Repeat the ordered non-freeing teardown inline, free state, and return its invalid post-free ABI pointer. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov012_021fd4fc(void *state)
{
    void *resource;

    FIELD(const void *, state, 0x00) = data_ov012_021fe670;
    FIELD(const void *, state, 0x24) = data_ov012_021fe6a4;
    resource = FIELD(void *, state, 0x154);
    if (resource != 0) {
        Graphics3DResourceBinding_Destroy(resource);
        Heap_Free(resource);
    }
    func_02002728(FIELD(void *, state, 0x7c));
    resource = FIELD(void *, state, 0x78);
    if (resource != 0) {
        Graphics3DResourceOwner_Destroy(resource);
        Heap_Free(resource);
    }
    func_02092418((u8 *)state + 0x1c4);
    DebugText_BeginFrame();
    func_020923a0((u8 *)state + 0x1c4);
    func_ov012_021fce3c((u8 *)state + 0x158);
    Graphics3DLightSet_Destroy((u8 *)state + 0x114);
    Scene_Destroy(state);
    Heap_Free(state);
    return state;
}

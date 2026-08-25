#include "tingle/types.h"

/* Overlay 12 non-freeing teardown for the LWO object-viewer scene. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const void *data_ov012_021fe670[];
extern const void *data_ov012_021fe6a4[];
#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DResourceBinding_Destroy(void *);
extern void Heap_Free(void *);
extern void Heap_FreeCore(void *);
extern void Graphics3DResourceOwner_Destroy(void *);
extern void GraphicsBankStateSnapshot_Restore(void *);
extern void DebugText_BeginFrame(void);
extern void GraphicsBankStateSnapshot_Destroy(void *);
extern void func_ov012_021fce3c(void *);
extern void Graphics3DLightSet_Destroy(void *);
extern void Scene_Destroy(void *);
#ifdef __cplusplus
}
#endif

/* Restore vtables; destroy/free optional +0x154 and +0x78 resources, free +0x7C, destroy debug/transform/draw/scene bases, and return state. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov012_021fd468(void *state)
{
    void *resource;

    FIELD(const void *, state, 0x00) = data_ov012_021fe670;
    FIELD(const void *, state, 0x24) = data_ov012_021fe6a4;
    resource = FIELD(void *, state, 0x154);
    if (resource != 0) {
        Graphics3DResourceBinding_Destroy(resource);
        Heap_Free(resource);
    }
    Heap_FreeCore(FIELD(void *, state, 0x7c));
    resource = FIELD(void *, state, 0x78);
    if (resource != 0) {
        Graphics3DResourceOwner_Destroy(resource);
        Heap_Free(resource);
    }
    GraphicsBankStateSnapshot_Restore((u8 *)state + 0x1c4);
    DebugText_BeginFrame();
    GraphicsBankStateSnapshot_Destroy((u8 *)state + 0x1c4);
    func_ov012_021fce3c((u8 *)state + 0x158);
    Graphics3DLightSet_Destroy((u8 *)state + 0x114);
    Scene_Destroy(state);
    return state;
}

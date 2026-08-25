#include "tingle/types.h"

/*
 * Overlay 9 deleting scene destructor. This recovered variant performs the
 * complete scene teardown and then releases the scene allocation itself.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_ov009_021fee8c[];
extern const void *data_ov009_021feec0[];
extern void Heap_FreeCore(void *allocation);
extern void GraphicsSpriteGroup_Destroy(void *resource);
extern void GraphicsBankStateSnapshot_Restore(void *member);
extern void DebugText_BeginFrame(void);
extern void GraphicsBankStateSnapshot_Destroy(void *member);
extern void AnimationResourceState_Destroy(void *member);
extern void Scene_Destroy(void *state);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * Perform the same ordered resource teardown as func_ov009_021fd198, then pass
 * state to Heap_Free and return the original (now invalid) pointer as required
 * by the recovered ABI. Allocation, debug, and subsystem effects are delegated;
 * callers must not dereference the returned value. No direct hardware access
 * occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov009_021fd208(void *state)
{
    s32 index;

    FIELD(const void *, state, 0x00) = data_ov009_021fee8c;
    FIELD(const void *, state, 0x24) = data_ov009_021feec0;
    for (index = 0; index < 6; index++) {
        Heap_FreeCore(FIELD(void *, state, 0x8c + index * 4));
    }
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0x84));
    GraphicsBankStateSnapshot_Restore((u8 *)state + 0x13c);
    DebugText_BeginFrame();
    GraphicsBankStateSnapshot_Destroy((u8 *)state + 0x13c);
    AnimationResourceState_Destroy((u8 *)state + 0x78);
    Scene_Destroy(state);
    Heap_Free(state);
    return state;
}

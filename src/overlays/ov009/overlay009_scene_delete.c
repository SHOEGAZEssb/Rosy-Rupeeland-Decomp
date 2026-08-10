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
extern void func_02002728(void *allocation);
extern void GraphicsSpriteGroup_Destroy(void *resource);
extern void func_02092418(void *member);
extern void DebugText_BeginFrame(void);
extern void func_020923a0(void *member);
extern void func_02071eb8(void *member);
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
        func_02002728(FIELD(void *, state, 0x8c + index * 4));
    }
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0x84));
    func_02092418((u8 *)state + 0x13c);
    DebugText_BeginFrame();
    func_020923a0((u8 *)state + 0x13c);
    func_02071eb8((u8 *)state + 0x78);
    Scene_Destroy(state);
    Heap_Free(state);
    return state;
}

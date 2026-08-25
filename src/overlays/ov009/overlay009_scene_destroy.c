#include "tingle/types.h"

/*
 * Overlay 9 scene destruction. This recovered destructor releases six loaded
 * buffers and tears down retained and embedded scene resources without freeing
 * the scene allocation itself.
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
#ifdef __cplusplus
}
#endif

/*
 * Restore the scene and +0x24 descriptors, free allocations +0x8C..+0xA0 in
 * ascending order, release +0x84, destroy member +0x13C, begin a debug-text
 * frame, finalize +0x13C, destroy +0x78, and destroy the scene base. Return the
 * unchanged state pointer. Allocation, debug, and subsystem effects are
 * delegated; no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void *Overlay009_Scene_Destroy(void *state)
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
    return state;
}

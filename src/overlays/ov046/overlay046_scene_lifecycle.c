#include "tingle/types.h"

/*
 * Overlay 46 scene-object lifecycle. These recovered routines release the
 * selection panel and auxiliary allocation, optionally free scene storage,
 * gate direct OAM updates on the base object's enable flag, and synchronize
 * the panel and shared font-state translations.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u8 data_ov046_0220cf28[];
extern "C" void func_020280d8(void *object);
extern "C" void Heap_Free(void *allocation);
extern "C" void *func_ov046_0220ba80(void *panel);
extern "C" void GraphicsSpriteGroup_Destroy(void *fontState);
extern "C" void AnimationResourceState_Destroy(void *owner);

/*
 * Tear down a scene without freeing its own storage and return the unchanged
 * pointer. Install the terminal vtable, clear flag 0x400 at +0x20, destroy and
 * free optional objects +0x74/+0x70, release font state +0x60, and tear down
 * owner +0x54. Callees release SDK graphics resources; no direct MMIO occurs.
 */
extern "C" void *func_ov046_0220ca40(void *scene)
{
    FIELD(void *, scene, 0) = data_ov046_0220cf28;
    FIELD(u32, scene, 0x20) &= ~0x400;
    void *allocation = FIELD(void *, scene, 0x74);
    if (allocation != 0) {
        func_020280d8(allocation);
        Heap_Free(allocation);
    }
    void *panel = FIELD(void *, scene, 0x70);
    if (panel != 0) {
        func_ov046_0220ba80(panel);
        Heap_Free(panel);
    }
    GraphicsSpriteGroup_Destroy(FIELD(void *, scene, 0x60));
    AnimationResourceState_Destroy((u8 *)scene + 0x54);
    return scene;
}

/*
 * Perform the same teardown as func_ov046_0220ca40, then free the scene
 * storage and return its former address identity. The result must not be
 * dereferenced; SDK graphics/resource state is released by the callees.
 */
extern "C" void *func_ov046_0220cab0(void *scene)
{
    FIELD(void *, scene, 0) = data_ov046_0220cf28;
    FIELD(u32, scene, 0x20) &= ~0x400;
    void *allocation = FIELD(void *, scene, 0x74);
    if (allocation != 0) {
        func_020280d8(allocation);
        Heap_Free(allocation);
    }
    void *panel = FIELD(void *, scene, 0x70);
    if (panel != 0) {
        func_ov046_0220ba80(panel);
        Heap_Free(panel);
    }
    GraphicsSpriteGroup_Destroy(FIELD(void *, scene, 0x60));
    AnimationResourceState_Destroy((u8 *)scene + 0x54);
    Heap_Free(scene);
    return scene;
}

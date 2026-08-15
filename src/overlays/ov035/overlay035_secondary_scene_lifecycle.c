#include "tingle/types.h"

/* Overlay 35 secondary-scene cleanup and per-frame collection update. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern const u8 data_ov035_02203d04[];
extern const u8 data_ov035_02203af8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void PresentationList_DeleteAll(void *collection);
extern void Graphics3DResourceOwner_RemoveManager(void *resource);
extern void func_02071e04(void *resourceContext, void *resource);
extern void GraphicsResourceSetVariant_Destroy(void *state);
extern void Heap_Free(void *allocation);
extern void PresentationList_UpdateAndDeleteCompleted(void *collection);
extern void GraphicsAnimationInstanceManager_Update(void *resourceSet);
#ifdef __cplusplus
}
#endif

/* Performs shared secondary-scene owned-state cleanup. */
static void release_secondary_scene(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov035_02203d04;
    PresentationList_DeleteAll((u8 *)scene + 0x10c);
    PresentationList_DeleteAll((u8 *)scene + 0x11c);
    PresentationList_DeleteAll((u8 *)scene + 0x12c);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, scene, 0xf8), 0));
    func_02071e04(data_020f4e18[0], FIELD(void *, scene, 0xf4));
    FIELD(const void *, scene, 0x12c) = data_ov035_02203af8;
    PresentationList_DeleteAll((u8 *)scene + 0x12c);
    FIELD(const void *, scene, 0x11c) = data_ov035_02203af8;
    PresentationList_DeleteAll((u8 *)scene + 0x11c);
    FIELD(const void *, scene, 0x10c) = data_ov035_02203af8;
    PresentationList_DeleteAll((u8 *)scene + 0x10c);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xe8);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xdc);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xcc);
}

/*
 * Non-deleting destructor: cleans the three collections, resource set +0xF8,
 * resource handle +0xF4, and states +0xCC/+0xDC/+0xE8, then returns the scene
 * without freeing it. Heap-independent engine/resource ownership changes.
 */
extern "C" void *func_ov035_021ff01c(void *scene)
{
    release_secondary_scene(scene);
    return scene;
}

/*
 * Deleting destructor: performs the same owned-state cleanup, frees the scene,
 * and returns its original invalid address. Heap/resource ownership changes.
 */
extern "C" void *func_ov035_021ff0bc(void *scene)
{
    release_secondary_scene(scene);
    Heap_Free(scene);
    return scene;
}

/*
 * Updates collections +0x10C/+0x11C/+0x12C and resource set +0xF8 once per
 * frame. Returns no value; renderer/animation state changes without direct MMIO.
 */
extern "C" void func_ov035_021ff164(void *scene)
{
    PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x10c);
    PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x11c);
    PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x12c);
    GraphicsAnimationInstanceManager_Update(FIELD(void *, scene, 0xf8));
}

#include "tingle/types.h"

/* Overlay 35 senary scene teardown and owned resource release. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern const u8 data_ov035_02203bd0[];
extern const u8 data_ov035_02203af8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void PresentationList_DeleteAll(void *collection);
extern void GraphicsArchive_ReleaseOwlvResource(void *resourceContext, void *resource);
extern void Graphics3DResourceOwner_RemoveManager(void *resourceSetRoot);
extern void GraphicsResourceSetVariant_Destroy(void *state);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * Performs the common senary teardown. It clears sprite/model collections
 * +0x10C/+0x11C, releases assets +0xFC/+0x100 and resource set +0xF4, resets
 * both collection vtables to data_ov035_02203af8, then destroys resource
 * states +0xE8/+0xDC/+0xCC. Returns scene without freeing it; renderer and
 * resource registries change.
 */
static void *teardown_scene(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov035_02203bd0;
    PresentationList_DeleteAll((u8 *)scene + 0x10c);
    PresentationList_DeleteAll((u8 *)scene + 0x11c);
    GraphicsArchive_ReleaseOwlvResource(data_020f4e18[0], FIELD(void *, scene, 0xfc));
    GraphicsArchive_ReleaseOwlvResource(data_020f4e18[0], FIELD(void *, scene, 0x100));
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, scene, 0xf4), 0));
    FIELD(const void *, scene, 0x11c) = data_ov035_02203af8;
    PresentationList_DeleteAll((u8 *)scene + 0x11c);
    FIELD(const void *, scene, 0x10c) = data_ov035_02203af8;
    PresentationList_DeleteAll((u8 *)scene + 0x10c);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xe8);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xdc);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xcc);
    return scene;
}

/*
 * Tears down a senary scene and returns its still-allocated address. Inputs and
 * effects are described by teardown_scene; scene storage remains caller-owned.
 */
extern "C" void *func_ov035_02201bd8(void *scene)
{
    return teardown_scene(scene);
}

/*
 * Tears down a senary scene, frees its allocation, and returns the original
 * now-invalid address to preserve the binary ABI. Heap, renderer, and resource
 * state change.
 */
extern "C" void *func_ov035_02201c70(void *scene)
{
    teardown_scene(scene);
    Heap_Free(scene);
    return scene;
}

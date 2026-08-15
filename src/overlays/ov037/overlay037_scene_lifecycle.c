#include "tingle/types.h"

/* Overlay 37 main-scene resource release and deleting/non-deleting teardown. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov037_021fedd0[];
extern const u8 data_ov037_021fedac[];
extern void *data_020f4e18[];

#ifdef __cplusplus
extern "C" {
#endif
extern void PresentationList_DeleteAll(void *container);
extern void Graphics3DResourceOwner_RemoveManager(void *ownerResource);
extern void func_02071e04(void *archive, void *resource);
extern void Graphics3DLightSet_Destroy(void *table);
extern void GraphicsResourceSetVariant_Destroy(void *slot);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

static void releaseSceneContents(void *scene)
{
    PresentationList_DeleteAll((u8 *)scene + 0x12c);
    PresentationList_DeleteAll((u8 *)scene + 0x13c);
    void *resourceOwner = FIELD(void *, scene, 0x114);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, resourceOwner, 0));
    func_02071e04(data_020f4e18[0], FIELD(void *, scene, 0x110));
    Graphics3DLightSet_Destroy((u8 *)scene + 0x14c);

    FIELD(const void *, scene, 0x13c) = data_ov037_021fedac;
    PresentationList_DeleteAll((u8 *)scene + 0x13c);
    FIELD(const void *, scene, 0x12c) = data_ov037_021fedac;
    PresentationList_DeleteAll((u8 *)scene + 0x12c);

    /* Slots are released in reverse construction order. */
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0x104);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xf8);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xec);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xe0);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xd4);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xc8);
}

/*
 * Reinstalls the main-scene vtable and releases both child containers, the
 * retained owner/archive resources, the record table, and six resource slots.
 * Returns scene without freeing it; heap-owned children are released through
 * their container teardown and archive/resource state changes.
 */
extern "C" void *func_ov037_021fdbb0(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov037_021fedd0;
    releaseSceneContents(scene);
    return scene;
}

/*
 * Deleting variant of the main-scene teardown. It performs the same ordered
 * resource release, frees scene itself, and returns the former scene address
 * for ABI compatibility.
 */
extern "C" void *func_ov037_021fdc58(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov037_021fedd0;
    releaseSceneContents(scene);
    Heap_Free(scene);
    return scene;
}

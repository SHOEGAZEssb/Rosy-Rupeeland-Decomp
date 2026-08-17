#include "tingle/types.h"

/* Overlay 36 four-record controller teardown and deletion. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205fb8[];
extern const u8 data_ov036_02205eac[];
extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern void PresentationList_DeleteAll(void *list);
extern void GraphicsArchive_ReleaseOwlvResource(void *archive, void *resource);
extern void Graphics3DResourceOwner_RemoveManager(void *manager);
extern void Graphics3DLightSet_Destroy(void *records);
extern void GraphicsResourceSetVariant_Destroy(void *resourceSet);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * Destroys a four-record controller without freeing it. Lists +0xFC/+0x10C
 * receive two-phase common teardown, archive-owned +0xF4 is released through
 * data_020f4e18, manager +0xF8/+0 is destroyed, records +0x11C are torn down,
 * and resource sets +0xE8/+0xDC/+0xCC are destroyed in that order. Returns
 * controller; archive, manager, list, record, and resource ownership change.
 */
extern "C" void *func_ov036_02202500(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov036_02205fb8;
    PresentationList_DeleteAll((u8 *)controller + 0xfc);
    PresentationList_DeleteAll((u8 *)controller + 0x10c);
    GraphicsArchive_ReleaseOwlvResource(data_020f4e18, FIELD(void *, controller, 0xf4));
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, controller, 0xf8), 0));
    Graphics3DLightSet_Destroy((u8 *)controller + 0x11c);
    FIELD(const void *, controller, 0x10c) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0x10c);
    FIELD(const void *, controller, 0xfc) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0xfc);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xe8);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xdc);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xcc);
    return controller;
}

/*
 * Fully deletes the controller by performing the same archive, manager, list,
 * record, and resource teardown as func_ov036_02202500, then freeing it.
 * Returns the now-invalid original pointer, matching the recovered ABI.
 */
extern "C" void *func_ov036_02202590(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov036_02205fb8;
    PresentationList_DeleteAll((u8 *)controller + 0xfc);
    PresentationList_DeleteAll((u8 *)controller + 0x10c);
    GraphicsArchive_ReleaseOwlvResource(data_020f4e18, FIELD(void *, controller, 0xf4));
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, controller, 0xf8), 0));
    Graphics3DLightSet_Destroy((u8 *)controller + 0x11c);
    FIELD(const void *, controller, 0x10c) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0x10c);
    FIELD(const void *, controller, 0xfc) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0xfc);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xe8);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xdc);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xcc);
    Heap_Free(controller);
    return controller;
}

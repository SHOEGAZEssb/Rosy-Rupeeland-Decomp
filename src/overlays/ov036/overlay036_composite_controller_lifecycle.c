#include "tingle/types.h"

/* Overlay 36 composite controller teardown and deletion. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205f9c[];
extern const u8 data_ov036_02205eac[];
extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov036_021fdc1c(void *auxiliary);
extern void Heap_Free(void *allocation);
extern void PresentationList_DeleteAll(void *list);
extern void Graphics3DResourceOwner_RemoveManager(void *manager);
extern void GraphicsArchive_ReleaseOwlvResource(void *archive, void *resource);
extern void Graphics3DLightSet_Destroy(void *records);
extern void GraphicsResourceSetVariant_Destroy(void *resourceSet);
#ifdef __cplusplus
}
#endif

/*
 * Destroys a composite controller without freeing it. Optional auxiliary
 * +0x1A0 receives its own destructor and is freed. Lists +0x100/+0x110 receive
 * two-phase teardown, manager +0xF4/+0 is destroyed, archive item +0x15C is
 * released through data_020f4e18, records +0x160 are torn down, and resource
 * sets +0xE8/+0xDC/+0xCC are destroyed. Returns controller; auxiliary, list,
 * manager, archive, record, and resource ownership change.
 */
extern "C" void *func_ov036_02202e58(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov036_02205f9c;
    void *auxiliary = FIELD(void *, controller, 0x1a0);
    if (auxiliary != 0) {
        func_ov036_021fdc1c(auxiliary);
        Heap_Free(auxiliary);
    }
    PresentationList_DeleteAll((u8 *)controller + 0x100);
    PresentationList_DeleteAll((u8 *)controller + 0x110);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, controller, 0xf4), 0));
    GraphicsArchive_ReleaseOwlvResource(data_020f4e18, FIELD(void *, controller, 0x15c));
    Graphics3DLightSet_Destroy((u8 *)controller + 0x160);
    FIELD(const void *, controller, 0x110) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0x110);
    FIELD(const void *, controller, 0x100) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0x100);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xe8);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xdc);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xcc);
    return controller;
}

/*
 * Fully deletes the controller by performing the same auxiliary, list,
 * manager, archive, record, and resource teardown as func_ov036_02202e58,
 * then freeing it. Returns the now-invalid original pointer.
 */
extern "C" void *func_ov036_02202f04(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov036_02205f9c;
    void *auxiliary = FIELD(void *, controller, 0x1a0);
    if (auxiliary != 0) {
        func_ov036_021fdc1c(auxiliary);
        Heap_Free(auxiliary);
    }
    PresentationList_DeleteAll((u8 *)controller + 0x100);
    PresentationList_DeleteAll((u8 *)controller + 0x110);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, controller, 0xf4), 0));
    GraphicsArchive_ReleaseOwlvResource(data_020f4e18, FIELD(void *, controller, 0x15c));
    Graphics3DLightSet_Destroy((u8 *)controller + 0x160);
    FIELD(const void *, controller, 0x110) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0x110);
    FIELD(const void *, controller, 0x100) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0x100);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xe8);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xdc);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xcc);
    Heap_Free(controller);
    return controller;
}

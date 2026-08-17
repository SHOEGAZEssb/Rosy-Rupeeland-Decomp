#include "tingle/types.h"

/* Overlay 36 final-controller teardown and a common freeing helper. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*DeleteCallback)(void *object);

extern const u8 data_ov036_02205f48[];
extern const u8 data_ov036_02205eac[];
extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern void PresentationList_DeleteAll(void *list);
extern void Graphics3DResourceOwner_RemoveManager(void *manager);
extern void GraphicsArchive_ReleaseOwlvResource(void *archive, void *resource);
extern void GraphicsResourceSetVariant_Destroy(void *resourceSet);
extern void func_ov036_021fcf30(void *object);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

static void delete_if_present(void *object)
{
    if (object != 0)
        (*(DeleteCallback *)((u8 *)FIELD(void *, object, 0) + 4))(object);
}

/*
 * Destroys the final controller without freeing it. Objects +0xF0/+0xF4 are
 * deleted through vtable slot +4 when present. Lists +0xFC/+0x10C receive
 * two-phase teardown, manager +0xE8/+0 is destroyed, archive item +0xEC is
 * released through data_020f4e18, and resource sets +0xDC/+0xCC are destroyed.
 * Returns controller; child, list, manager, archive, and resource ownership
 * change.
 */
extern "C" void *func_ov036_02204118(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov036_02205f48;
    delete_if_present(FIELD(void *, controller, 0xf0));
    delete_if_present(FIELD(void *, controller, 0xf4));
    PresentationList_DeleteAll((u8 *)controller + 0xfc);
    PresentationList_DeleteAll((u8 *)controller + 0x10c);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, controller, 0xe8), 0));
    GraphicsArchive_ReleaseOwlvResource(data_020f4e18, FIELD(void *, controller, 0xec));
    FIELD(const void *, controller, 0x10c) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0x10c);
    FIELD(const void *, controller, 0xfc) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0xfc);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xdc);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xcc);
    return controller;
}

/*
 * Runs common object teardown and frees object. Returns the now-invalid
 * original pointer; base ownership and heap state change.
 */
extern "C" void *func_ov036_022041c8(void *object)
{
    func_ov036_021fcf30(object);
    Heap_Free(object);
    return object;
}

/*
 * Fully deletes the final controller by performing the same child, list,
 * manager, archive, and resource teardown as func_ov036_02204118, then freeing
 * it. Returns the now-invalid original pointer.
 */
extern "C" void *func_ov036_022041e4(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov036_02205f48;
    delete_if_present(FIELD(void *, controller, 0xf0));
    delete_if_present(FIELD(void *, controller, 0xf4));
    PresentationList_DeleteAll((u8 *)controller + 0xfc);
    PresentationList_DeleteAll((u8 *)controller + 0x10c);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, controller, 0xe8), 0));
    GraphicsArchive_ReleaseOwlvResource(data_020f4e18, FIELD(void *, controller, 0xec));
    FIELD(const void *, controller, 0x10c) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0x10c);
    FIELD(const void *, controller, 0xfc) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0xfc);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xdc);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xcc);
    Heap_Free(controller);
    return controller;
}

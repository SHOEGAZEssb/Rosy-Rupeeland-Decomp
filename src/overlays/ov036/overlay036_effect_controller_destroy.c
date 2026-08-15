#include "tingle/types.h"

/* Overlay 36 effect-controller resource and embedded-list destruction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205f2c[];
extern const u8 data_ov036_02205eac[];

#ifdef __cplusplus
extern "C" {
#endif
extern void PresentationList_DeleteAll(void *object);
extern void Graphics3DResourceOwner_RemoveManager(void *manager);
extern void GraphicsResourceSetVariant_Destroy(void *resourceSet);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * Destroys an effect controller without freeing it. Embedded list-like objects
 * +0xF8/+0x108 receive the common destructor both before and after their
 * vtable-like words are reset, preserving the recovered two-phase teardown.
 * The object reached through manager +0xDC/+0 is released, followed by resource
 * sets +0xEC, +0xE0, and inherited +0xCC. Returns controller; manager, list,
 * and resource ownership state change.
 */
extern "C" void *func_ov036_021fee7c(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov036_02205f2c;
    PresentationList_DeleteAll((u8 *)controller + 0xf8);
    PresentationList_DeleteAll((u8 *)controller + 0x108);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, controller, 0xdc), 0));
    FIELD(const void *, controller, 0x108) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0x108);
    FIELD(const void *, controller, 0xf8) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0xf8);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xec);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xe0);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xcc);
    return controller;
}

/*
 * Fully deletes the effect controller by performing the same two-phase list,
 * manager, and resource-set teardown as func_ov036_021fee7c, then freeing the
 * controller. Returns the now-invalid original pointer, matching the ABI.
 */
extern "C" void *func_ov036_021feef0(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov036_02205f2c;
    PresentationList_DeleteAll((u8 *)controller + 0xf8);
    PresentationList_DeleteAll((u8 *)controller + 0x108);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, controller, 0xdc), 0));
    FIELD(const void *, controller, 0x108) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0x108);
    FIELD(const void *, controller, 0xf8) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)controller + 0xf8);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xec);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xe0);
    GraphicsResourceSetVariant_Destroy((u8 *)controller + 0xcc);
    Heap_Free(controller);
    return controller;
}

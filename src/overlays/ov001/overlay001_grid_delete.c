#include "tingle/heap.h"

/*
 * Overlay 1 deleting grid destructor. This recovered helper performs the full
 * grid teardown and then releases the grid-state allocation itself.
 */

typedef struct Overlay001GridDeleteState {
    void *vtable_000;
    void *owner_004;
    void *spriteGroup_008;
    void *spriteGroup_00c;
    u8 resource_010[0x18];
    u8 element_028[0xac];
    u8 element_0d4[0xac];
    u8 rendererState_180[0x3c];
    void *controller_1bc;
    u8 field_1c0[0x4c];
    void *cells_20c;
} Overlay001GridDeleteState;

typedef struct Overlay001DeleteControllerVTable {
    void *field_00;
    void (*destroy_04)(void *controller);
} Overlay001DeleteControllerVTable;

typedef struct Overlay001DeleteController {
    Overlay001DeleteControllerVTable *vtable;
} Overlay001DeleteController;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_ov001_021fcc80;
extern void InventoryCell_Destroy(void *cell);
extern void AnimationResourceState_Destroy(void *resource);
extern void GraphicsSpriteGroup_Destroy(void *group);
extern void GraphicsSpriteRenderer_ClearFontResource(void *owner);
extern void func_020927b8(void *state);
extern void CxxArray_DestroyAndFree(void *array, s32 elementSize, s32 alignment,
                           void (*destructor)(void *));
extern void func_ov001_021fbab8(void *element);
#ifdef __cplusplus
}
#endif

/*
 * Perform the same teardown as func_ov001_021fbe6c: restore the vtable, destroy
 * cells/controller, release owner state, sprite groups, renderer, element hooks,
 * and resource +0x10. Then free state with Heap_Free and return its original
 * address, matching the retail deleting-destructor convention.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay001GridDeleteState *func_ov001_021fbef0(
    Overlay001GridDeleteState *state)
{
    Overlay001DeleteController *controller;

    state->vtable_000 = &data_ov001_021fcc80;
    CxxArray_DestroyAndFree(state->cells_20c, 0x20, 8, InventoryCell_Destroy);
    controller = (Overlay001DeleteController *)state->controller_1bc;
    if (controller != 0) {
        controller->vtable->destroy_04(controller);
    }
    GraphicsSpriteRenderer_ClearFontResource(state->owner_004);
    GraphicsSpriteGroup_Destroy(state->spriteGroup_00c);
    GraphicsSpriteGroup_Destroy(state->spriteGroup_008);
    func_020927b8(state->rendererState_180);
    func_ov001_021fbab8(state->element_0d4);
    func_ov001_021fbab8(state->element_028);
    AnimationResourceState_Destroy(state->resource_010);
    Heap_Free(state);
    return state;
}

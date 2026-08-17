#include "tingle/heap.h"

/*
 * Overlay 0 grid-presentation deleting destructor. It mirrors the non-freeing
 * teardown and then releases the state allocation through the game heap.
 */

typedef struct Overlay000GridState {
    void *vtable_000;
    u8 field_004[4];
    void *spriteGroup_008;
    void *spriteGroup_00c;
    u8 resource_010[0x0c];
    u8 field_01c[8];
    u8 element_024[0xac];
    u8 element_0d0[0xac];
    u8 element_17c[0xac];
    u8 rendererState_228[0x28];
    void *cells_250;
    u8 field_254[0x18];
    void *controller_26c;
} Overlay000GridState;

typedef struct Overlay000ControllerVTable {
    void *field_00;
    void (*destroy_04)(void *controller);
} Overlay000ControllerVTable;

typedef struct Overlay000Controller {
    Overlay000ControllerVTable *vtable;
} Overlay000Controller;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_ov000_021fcd30;
extern void InventoryCell_Destroy(void *cell);
extern void AnimationResourceState_Destroy(void *resource);
extern void GraphicsSpriteGroup_Destroy(void *group);
extern void func_020927b8(void *state);
extern void func_020c0c24(void *array, s32 elementSize, s32 alignment,
                           void (*destructor)(void *));
extern void func_ov000_021fbcc0(void *element);
#ifdef __cplusplus
}
#endif

/*
 * Restore the vtable, destroy the dynamic cells, optional controller, sprite
 * groups, renderer, three embedded elements, and resource triplet, then free
 * state and return its former address as required by the deleting-destructor
 * ABI. Heap and graphics ownership change; no hardware is accessed directly.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay000GridState *func_ov000_021fc0d8(Overlay000GridState *state)
{
    Overlay000Controller *controller;

    state->vtable_000 = &data_ov000_021fcd30;
    func_020c0c24(state->cells_250, 0x20, 8, InventoryCell_Destroy);
    controller = (Overlay000Controller *)state->controller_26c;
    if (controller != 0) {
        controller->vtable->destroy_04(controller);
    }
    GraphicsSpriteGroup_Destroy(state->spriteGroup_00c);
    GraphicsSpriteGroup_Destroy(state->spriteGroup_008);
    func_020927b8(state->rendererState_228);
    func_ov000_021fbcc0(state->element_17c);
    func_ov000_021fbcc0(state->element_0d0);
    func_ov000_021fbcc0(state->element_024);
    AnimationResourceState_Destroy(state->resource_010);
    Heap_Free(state);
    return state;
}

#include "tingle/types.h"

/*
 * Overlay 1 grid-state teardown. This recovered destructor reverses ownership
 * of the dynamic cells, controller, renderer, sprite groups, and resource.
 */

typedef struct Overlay001GridDestroyState {
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
} Overlay001GridDestroyState;

typedef struct Overlay001ControllerVTable {
    void *field_00;
    void (*destroy_04)(void *controller);
} Overlay001ControllerVTable;

typedef struct Overlay001Controller {
    Overlay001ControllerVTable *vtable;
} Overlay001Controller;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_ov001_021fcc80;
extern void func_020683f4(void *cell);
extern void func_02071eb8(void *resource);
extern void func_0207419c(void *group);
extern void func_020755b0(void *owner);
extern void func_020927b8(void *state);
extern void func_020c0c24(void *array, s32 elementSize, s32 alignment,
                           void (*destructor)(void *));
extern void func_ov001_021fbab8(void *element);
#ifdef __cplusplus
}
#endif

/*
 * Restore the retail vtable, destroy cells_20c with 0x20-byte stride/alignment
 * 8 and func_020683f4, and conditionally destroy controller_1BC through virtual
 * slot +4. Then release owner_004 state, sprite groups +0x0C/+8, renderer +0x180,
 * invoke the interface no-op for elements +0xD4/+0x28, and destroy resource
 * +0x10. Return state for destructor chaining; callees own heap/graphics effects.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay001GridDestroyState *func_ov001_021fbe6c(
    Overlay001GridDestroyState *state)
{
    Overlay001Controller *controller;

    state->vtable_000 = &data_ov001_021fcc80;
    func_020c0c24(state->cells_20c, 0x20, 8, func_020683f4);
    controller = (Overlay001Controller *)state->controller_1bc;
    if (controller != 0) {
        controller->vtable->destroy_04(controller);
    }
    func_020755b0(state->owner_004);
    func_0207419c(state->spriteGroup_00c);
    func_0207419c(state->spriteGroup_008);
    func_020927b8(state->rendererState_180);
    func_ov001_021fbab8(state->element_0d4);
    func_ov001_021fbab8(state->element_028);
    func_02071eb8(state->resource_010);
    return state;
}

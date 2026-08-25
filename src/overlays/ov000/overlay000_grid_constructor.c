#include "tingle/heap.h"

/*
 * Overlay 0 grid-presentation construction. This recovered constructor owns
 * two sprite groups, three embedded UI elements, a dynamically sized array of
 * 0x20-byte cell records, and an optional 0x80-byte controller object.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000GridState {
    void *vtable_000;
    void *owner_004;
    void *spriteGroup_008;
    void *spriteGroup_00c;
    u8 resource_010[0x0c];
    u32 field_01c;
    void *sprite_020;
    u8 element_024[0xac];
    u8 element_0d0[0xac];
    u8 element_17c[0xac];
    u8 rendererState_228[0x24];
    void *recordTable_24c;
    u8 *cells_250;
    s32 cellCount_254;
    s32 rowCount_258;
    s32 field_25c;
    u8 field_260[4];
    s32 scrollOffset_264;
    s32 originY_268;
    void *controller_26c;
    u8 controllerState_270[0x38];
    s32 field_2a8;
    s32 field_2ac;
} Overlay000GridState;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern void *data_021e9ac0;
extern void *data_ov000_021fcd30;
extern char data_ov000_021fcd54[];
extern char data_ov000_021fcd5c[];
extern void InventoryCell_Init(void *);
extern void InventoryCell_Destroy(void *);
extern void AnimationResourceState_InitEmbedded(void *resource);
extern void AnimationResourceState_ReplaceResources(void *resource, void *manager, s32 first,
                          s32 second, s32 third);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *owner, void *resource, s32 mode);
extern void GraphicsSpriteState_ApplyRenderConfig(void *sprite, s32 animation, s32 x, s32 y,
                          s32 enabled, s32 field28, s32 flags);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
extern void TitleCharacterResourceCollection_Init(void *state);
extern void func_02092814(void *state, s32 resourceId);
extern void IndexedSelectionController_Init(void *state);
extern void IndexedSelectionController_ConfigureRange(void *state, s32 first, s32 second, s32 third);
extern void *func_02094154(void *object, void *owner, s32 rowCount,
                           s32 columns, s32 width, s32 y, s32 mode);
extern void func_020957bc(void *element);
extern void func_020957f0(void *element, void *sprite, s32 animation,
                           s32 mode, s32 flags);
extern void func_02095820(void *element, s32 x, s32 y);
extern void func_02095940(void *element);
extern s32 ActorDescriptor_IsInvalid(void *record);
extern void *func_020c09cc(void *array, s32 count, s32 elementSize,
                            s32 alignment, void (*constructor)(void *),
                            void (*destructor)(void *));
extern void func_ov000_021fc658(void *state, s32 index, s32 initialize);
#ifdef __cplusplus
}
#endif

/*
 * Construct state for owner and return state. Initialize embedded resources,
 * create two sprite groups and four sprites, determine the last unavailable
 * 0x24-byte record in data_021e9ac0 (with a minimum grid size of 15), round
 * the cell count up to a multiple of five, allocate and initialize its cell
 * array, assign each cell a five-column coordinate, and create the optional
 * controller. Heap, resource, sprite, and presentation ownership changes.
 * The quotient/remainder helper used by retail is expressed portably with
 * division and modulo; no hardware is accessed directly by this wrapper.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay000GridState *func_ov000_021fbcc4(Overlay000GridState *state,
                                         void *owner)
{
    s32 index;
    s32 rawCount;
    s32 roundedCount;
    void *sprite;
    void *controller;

    state->vtable_000 = &data_ov000_021fcd30;
    AnimationResourceState_InitEmbedded(state->resource_010);
    func_020957bc(state->element_024);
    func_020957bc(state->element_0d0);
    func_020957bc(state->element_17c);
    TitleCharacterResourceCollection_Init(state->rendererState_228);
    IndexedSelectionController_Init(state->controllerState_270);
    state->owner_004 = owner;
    state->field_25c = 0;
    state->scrollOffset_264 = 0;
    state->field_01c = 0;
    state->field_2a8 = 0;
    state->field_2ac = 0x1e;

    AnimationResourceState_ReplaceResources(state->resource_010, data_020f4e18, 0, 1, 2);
    state->spriteGroup_008 = GraphicsSpriteGroupOwner_CreateGroup(owner);
    state->spriteGroup_00c = GraphicsSpriteGroupOwner_CreateGroup(owner);
    FIELD(s32, state->spriteGroup_00c, 0x18) = 0;
    FIELD(s32, state->spriteGroup_00c, 0x1c) = -state->scrollOffset_264;

    state->sprite_020 =
        GraphicsSpriteGroup_CreateStateFromSource(state->spriteGroup_00c, state->resource_010, 1);
    GraphicsSpriteState_ApplyRenderConfig(state->sprite_020, 2, 0x38, 0x38, 2, 0, 2);

    sprite = GraphicsSpriteGroup_CreateStateFromSource(state->spriteGroup_00c, state->resource_010, 1);
    func_020957f0(state->element_024, sprite, 0x3a, 2, 0);
    func_02095820(state->element_024, 0xec, 0xaa);
    func_02095940(state->element_024);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(state->spriteGroup_00c, state->resource_010, 1);
    func_020957f0(state->element_0d0, sprite, 4, 2, 0);
    func_02095820(state->element_0d0, 0x40, 0x10);
    func_02095940(state->element_0d0);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(state->spriteGroup_00c, state->resource_010, 1);
    func_020957f0(state->element_17c, sprite, 0x43, 2, 0);
    func_02095820(state->element_17c, 0xdc, 0x10);
    func_02095940(state->element_17c);
    func_02092814(state->rendererState_228, 0x7004);

    state->originY_268 = 0x34 - state->scrollOffset_264;
    state->recordTable_24c = data_021e9ac0;
    rawCount = 0;
    for (index = 0; index < FIELD(s32, state->recordTable_24c, 0x10);
         index++) {
        if (ActorDescriptor_IsInvalid((u8 *)FIELD(void *, state->recordTable_24c, 8) +
                          index * 0x24) == 0) {
            rawCount = index + 1;
        }
    }
    if (rawCount < 0x0f) {
        rawCount = 0x0f;
    }
    state->rowCount_258 = (rawCount + 4) / 5;
    roundedCount = state->rowCount_258 * 5;
    state->cellCount_254 = roundedCount;
    state->cells_250 = (u8 *)Heap_AllocAlternateEntry(
        roundedCount * 0x20 + 8, data_ov000_021fcd54, 4, &gHeapContext);
    if (state->cells_250 != 0) {
        state->cells_250 = (u8 *)func_020c09cc(
            state->cells_250, roundedCount, 0x20, 8,
            InventoryCell_Init, InventoryCell_Destroy);
    }

    for (index = 0; index < state->cellCount_254; index++) {
        u8 *cell = state->cells_250 + index * 0x20;
        func_ov000_021fc658(state, index, 1);
        FIELD(s32, cell, 0x14) = (index % 5) * 0x24;
        FIELD(s32, cell, 0x18) = (index / 5) * 0x24;
    }

    FIELD(s32, state->spriteGroup_008, 0x18) = 0x38;
    FIELD(s32, state->spriteGroup_008, 0x1c) = state->originY_268;
    controller = Heap_Alloc(0x80, data_ov000_021fcd5c, 4, &gHeapContext);
    if (controller != 0) {
        controller = func_02094154(controller, state->owner_004,
                                   state->rowCount_258, 3, 0xea,
                                   0x2a - state->scrollOffset_264, 0);
    }
    state->controller_26c = controller;
    IndexedSelectionController_ConfigureRange(state->controllerState_270, 0, 4, 0);
    return state;
}

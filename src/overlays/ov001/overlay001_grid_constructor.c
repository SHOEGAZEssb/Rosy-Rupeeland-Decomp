#include "tingle/heap.h"

/*
 * Overlay 1 grid-state construction. This recovered constructor owns two sprite
 * groups, two embedded UI elements, a dynamic metadata array, and a controller.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001GridState {
    void *vtable_000;
    void *owner_004;
    void *spriteGroup_008;
    void *spriteGroup_00c;
    u8 resource_010[0x0c];
    u32 field_01c;
    void *sprite_020;
    void *sprite_024;
    u8 element_028[0xac];
    u8 element_0d4[0xac];
    u8 rendererState_180[0x24];
    s32 cellCount_1a4;
    s32 rowCount_1a8;
    s32 field_1ac;
    s32 field_1b0;
    s32 scrollOffset_1b4;
    s32 originY_1b8;
    void *controller_1bc;
    u8 controllerState_1c0[0x38];
    s32 field_1f8;
    s32 field_1fc;
    s32 field_200;
    void *recordTable_204;
    void *secondaryTable_208;
    u8 *cells_20c;
} Overlay001GridState;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern void *data_021e9ac0;
extern void *data_ov001_021fcc80;
extern char data_ov001_021fcc90[];
extern char data_ov001_021fcc98[];
extern void InventoryCell_Init(void *value);
extern void InventoryCell_Destroy(void *value);
extern s32 ActorDescriptor_IsInvalid(void *record);
extern void AnimationResourceState_InitEmbedded(void *resource);
extern void func_02071ee0(void *resource, void *manager, s32 first,
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
extern void func_02095820(void *element, s32 width, s32 height);
extern void func_02095940(void *element);
extern void *func_020c09cc(void *array, s32 count, s32 elementSize,
                            s32 alignment, void (*constructor)(void *),
                            void (*destructor)(void *));
extern void func_ov001_021fc404(void *state, s32 index, s32 initialize);
#ifdef __cplusplus
}
#endif

/*
 * Construct state for owner and return state. Initialize resource +0x10, UI
 * elements +0x28/+0xD4, renderer +0x180, and controller state +0x1C0. Create
 * two sprite groups, configure the elements, derive record tables from
 * data_021e9ac0+0x34/+0x1C, and scan 0x24-byte records for the last eligible
 * entry with a minimum count of 15. Round to five columns, allocate/initialize
 * 0x20-byte metadata records and their coordinates, create two cursor sprites,
 * then allocate a 0x80-byte controller. Heap and graphics ownership changes are
 * delegated to engine services; no hardware is accessed directly here.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay001GridState *func_ov001_021fbabc(Overlay001GridState *state,
                                         void *owner)
{
    s32 index;
    s32 rawCount;
    s32 roundedCount;
    void *sprite;
    void *controller;

    state->vtable_000 = &data_ov001_021fcc80;
    AnimationResourceState_InitEmbedded(state->resource_010);
    func_020957bc(state->element_028);
    func_020957bc(state->element_0d4);
    TitleCharacterResourceCollection_Init(state->rendererState_180);
    IndexedSelectionController_Init(state->controllerState_1c0);
    state->owner_004 = owner;
    state->field_1ac = 0;
    state->field_1b0 = -1;
    state->scrollOffset_1b4 = 0;
    state->field_01c = 0;
    state->field_1f8 = 0;
    state->field_1fc = 0x1e;
    state->field_200 = 0x200;
    state->controller_1bc = 0;
    state->sprite_024 = 0;
    state->sprite_020 = 0;

    state->spriteGroup_008 = GraphicsSpriteGroupOwner_CreateGroup(owner);
    func_02071ee0(state->resource_010, data_020f4e18, 0, 1, 2);
    state->spriteGroup_00c = GraphicsSpriteGroupOwner_CreateGroup(owner);
    FIELD(s32, state->spriteGroup_00c, 0x18) = 0;
    FIELD(s32, state->spriteGroup_00c, 0x1c) = -state->scrollOffset_1b4;

    sprite = GraphicsSpriteGroup_CreateStateFromSource(state->spriteGroup_00c, state->resource_010, 1);
    func_020957f0(state->element_028, sprite, 0x3a, 2, 0);
    func_02095820(state->element_028, 0xec, 0xaa);
    func_02095940(state->element_028);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(state->spriteGroup_00c, state->resource_010, 1);
    func_020957f0(state->element_0d4, sprite, 0x42, 2, 0);
    func_02095820(state->element_0d4, 0xdc, 0x10);
    func_02095940(state->element_0d4);
    func_02092814(state->rendererState_180, 0x7004);

    state->originY_1b8 = 0x34 - state->scrollOffset_1b4;
    state->recordTable_204 = (u8 *)data_021e9ac0 + 0x34;
    state->secondaryTable_208 = (u8 *)data_021e9ac0 + 0x1c;
    rawCount = 0;
    for (index = 0; index < FIELD(s32, state->recordTable_204, 0x0c);
         index++) {
        if (ActorDescriptor_IsInvalid((u8 *)FIELD(void *, state->recordTable_204, 0x04) +
                          index * 0x24) == 0) {
            rawCount = index + 1;
        }
    }
    if (rawCount < 0x0f) {
        rawCount = 0x0f;
    }
    state->rowCount_1a8 = (rawCount + 4) / 5;
    roundedCount = state->rowCount_1a8 * 5;
    state->cellCount_1a4 = roundedCount;
    state->cells_20c = (u8 *)func_02003e20(
        roundedCount * 0x20 + 8, data_ov001_021fcc90, 4, &gHeapContext);
    if (state->cells_20c != 0) {
        state->cells_20c = (u8 *)func_020c09cc(
            state->cells_20c, roundedCount, 0x20, 8,
            InventoryCell_Init, InventoryCell_Destroy);
    }
    for (index = 0; index < state->cellCount_1a4; index++) {
        u8 *cell = state->cells_20c + index * 0x20;
        func_ov001_021fc404(state, index, 1);
        FIELD(s32, cell, 0x14) = (index % 5) * 0x24;
        FIELD(s32, cell, 0x18) = (index / 5) * 0x24;
    }

    state->sprite_020 =
        GraphicsSpriteGroup_CreateStateFromSource(state->spriteGroup_00c, state->resource_010, 1);
    GraphicsSpriteState_ApplyRenderConfig(state->sprite_020, 2, 0x38, 0x34, 2, 0, 2);
    state->sprite_024 =
        GraphicsSpriteGroup_CreateStateFromSource(state->spriteGroup_00c, state->resource_010, 1);
    GraphicsSpriteState_ApplyRenderConfig(state->sprite_024, 3, 0x38, 0x34, 2, 0x3800, 6);
    FIELD(s32, state->spriteGroup_008, 0x18) = 0x38;
    FIELD(s32, state->spriteGroup_008, 0x1c) = state->originY_1b8;

    controller = Heap_Alloc(0x80, data_ov001_021fcc98, 4, &gHeapContext);
    if (controller != 0) {
        controller = func_02094154(controller, state->owner_004,
                                   state->rowCount_1a8, 3, 0xea,
                                   0x2a - state->scrollOffset_1b4, 0);
    }
    state->controller_1bc = controller;
    IndexedSelectionController_ConfigureRange(state->controllerState_1c0, 0, 4, 0);
    return state;
}

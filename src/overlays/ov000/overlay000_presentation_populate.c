#include "tingle/types.h"

/*
 * Overlay 0 presentation population. This recovered routine binds a selected
 * gameplay record to the presentation object, draws several localized text
 * rows, creates two configured sprites, and loads a record-specific resource
 * triplet. Several record accessors remain address-named pending type evidence.
 */

typedef struct Overlay000PresentationState {
    void *renderer_00;
    void *spriteOwner_04;
    u8 resource_08[0x0c];
    u8 resource_14[0x0c];
    void *textSource_20;
    void *textSource_24;
    void *textSource_28;
    u8 rendererState_2c[0x18];
    void *presentation_44;
    u16 label_48[0x10];
} Overlay000PresentationState;

#ifdef __cplusplus
extern "C" {
#endif
extern u8 gSystemState[];
extern void *data_020f4e18;
extern u8 data_021f3ecc[];
extern const u8 data_020d780c[];
extern const u16 *ActorDescriptor_GetPrimaryLabel(void *record);
extern void *ActorDescriptor_GetComponent(void *record, s32 index);
extern void *ActorDescriptor_LoadDetailResource(void *record);
extern s32 ActorDescriptor_GetKind0Animation(void *record);
extern u8 *InventoryRecord_GetMetadata(void *record);
extern u32 ActorDescriptorComponent_GetCharacterResourceId(void *component);
extern u32 ActorDescriptorComponent_GetPaletteResourceId(void *component);
extern u32 ActorDescriptorComponent_GetCellResourceId(void *component);
extern u32 ActorDescriptorComponent_GetAnimation(void *component);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *owner, void *resource, s32 mode);
extern void GraphicsSpriteState_ApplyRenderConfig(void *sprite, s32 animation, s32 x, s32 y,
                          s32 enabled, s32 field28, s32 flags);
extern void GraphicsSpriteRenderer_SetFontResource(void *renderer, const void *source);
extern s32 GraphicsSpriteRenderer_DrawText(void *renderer, const u16 *text, s32 x, s32 y,
                         s32 mode, s32 advance, s32 spacing);
extern void GraphicsSpriteCanvas_FillRect(void *renderer, s32 x, s32 y, s32 width,
                          s32 height, s32 mode);
extern u8 *RetailTextTable_FindRecordById(void *table, u16 resourceId);
extern void TitleDialog_SetText(void *presentation, void *record, s32 mode);
extern void TitleDialog_UpdateTextPage(void *presentation, s32 value);
extern void TitleDialog_ClearTextRect(void *presentation);
extern void func_02071ee0(void *resource, void *manager, u32 first,
                          u32 second, u32 third);
extern void func_ov000_021fb890(void *state, s32 startAnimation);
#ifdef __cplusplus
}
#endif

/*
 * Populate state from record, or close it with animation when record is null.
 * A non-null record is attached to presentation_44, then localized headings,
 * the cached label, and record text are drawn into renderer_00. The special
 * record class identified by byte 2 equal to 3 uses resource 0x1B8 and a
 * shorter label path; other records use 0x1B7 plus a table-selected row.
 * Finally four record resources configure resource_14 and a second sprite.
 * Returns nothing. Heap ownership is unchanged, while renderer, sprite, and
 * resource state are mutated through engine helpers with no direct hardware
 * access in this wrapper.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay000_PopulatePresentation(Overlay000PresentationState *state, void *record)
{
    const u16 *text;
    void *sprite;
    void *component;
    u32 resource0;
    u32 resource1;
    u32 resource2;
    u32 resource3;
    s32 firstHeight;
    s32 textOffset;

    if (record == 0) {
        func_ov000_021fb890(state, 1);
        return;
    }

    func_ov000_021fb890(state, 0);
    TitleDialog_SetText(state->presentation_44, ActorDescriptor_LoadDetailResource(record), 1);
    TitleDialog_ClearTextRect(state->presentation_44);
    TitleDialog_UpdateTextPage(state->presentation_44, 0);

    firstHeight = 0x54;
    textOffset = 0;
    if (gSystemState[0x5f] != 0) {
        firstHeight -= 2;
        textOffset = 4;
    }

    if (InventoryRecord_GetMetadata(record)[2] == 3) {
        GraphicsSpriteRenderer_SetFontResource(state->renderer_00, state->textSource_24);
        GraphicsSpriteCanvas_FillRect(state->renderer_00, 0x70, 0x48, 0xc0,
                      firstHeight, 0);
        text = (const u16 *)(RetailTextTable_FindRecordById(data_021f3ecc, 0x1b8) + 2);
        GraphicsSpriteRenderer_DrawText(state->renderer_00, text, 0x70, 0x48, 0xe, 4, 0);

        GraphicsSpriteRenderer_SetFontResource(state->renderer_00, state->textSource_20);
        GraphicsSpriteCanvas_FillRect(state->renderer_00, 0x38, 0x8a, 0xd8, 0x9a, 0);
        GraphicsSpriteRenderer_DrawText(state->renderer_00, state->label_48,
                      0x38, 0x8a, 5, 4, 0);
    } else {
        GraphicsSpriteRenderer_SetFontResource(state->renderer_00, state->textSource_24);
        GraphicsSpriteCanvas_FillRect(state->renderer_00, 0x70, 0x48, 0xc0,
                      firstHeight, 0);
        text = (const u16 *)(RetailTextTable_FindRecordById(data_021f3ecc, 0x1b7) + 2);
        GraphicsSpriteRenderer_DrawText(state->renderer_00, text, 0x70, 0x48, 0xe, 4, 0);

        GraphicsSpriteRenderer_SetFontResource(state->renderer_00, state->textSource_20);
        GraphicsSpriteCanvas_FillRect(state->renderer_00, 0x38, 0x8a, 0xd8, 0x9a, 0);
        textOffset += GraphicsSpriteRenderer_DrawText(state->renderer_00, state->label_48,
                                   0x38, 0x8a, 0xe, 4, 0);
        text = (const u16 *)(RetailTextTable_FindRecordById(
            data_021f3ecc,
            *(const u16 *)(data_020d780c + ActorDescriptor_GetKind0Animation(record) * 0x34)) +
            2);
        GraphicsSpriteRenderer_DrawText(state->renderer_00, text, textOffset + 0x38,
                      0x8a, 0xe, 4, 0);
    }

    sprite = GraphicsSpriteGroup_CreateStateFromSource(state->spriteOwner_04, state->resource_08, 1);
    GraphicsSpriteState_ApplyRenderConfig(sprite, 1, 0x5c, 0x44, 1, 0, 0);

    GraphicsSpriteRenderer_SetFontResource(state->renderer_00, state->textSource_28);
    GraphicsSpriteCanvas_FillRect(state->renderer_00, 0x5c, 0x34, 0xe8, 0x44, 0);
    GraphicsSpriteRenderer_DrawText(state->renderer_00, ActorDescriptor_GetPrimaryLabel(record),
                  0x5c, 0x34, 0xe, 6, 0);

    component = ActorDescriptor_GetComponent(record, 0);
    resource0 = ActorDescriptorComponent_GetCharacterResourceId(component);
    component = ActorDescriptor_GetComponent(record, 0);
    resource1 = ActorDescriptorComponent_GetPaletteResourceId(component);
    component = ActorDescriptor_GetComponent(record, 0);
    resource2 = ActorDescriptorComponent_GetCellResourceId(component);
    func_02071ee0(state->resource_14, data_020f4e18,
                  resource0, resource1, resource2);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(state->spriteOwner_04, state->resource_14, 2);
    component = ActorDescriptor_GetComponent(record, 0);
    resource3 = ActorDescriptorComponent_GetAnimation(component);
    GraphicsSpriteState_ApplyRenderConfig(sprite, resource3, 0x48, 0x44, 1, 0, 0);
}

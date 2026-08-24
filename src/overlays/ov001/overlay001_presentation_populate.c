#include "tingle/types.h"

/*
 * Overlay 1 presentation population. This recovered helper binds a gameplay
 * record, draws its two text rows, and creates one or two configured resources.
 */

typedef struct Overlay001PresentationPopulateState {
    void *renderer_00;
    void *spriteOwner_04;
    u8 resource_08[0x0c];
    u8 resource_14[0x0c];
    void *textSource_20;
    void *textSource_24;
    void *textSource_28;
    u8 field_2c[0x18];
    void *presentation_44;
} Overlay001PresentationPopulateState;

#ifdef __cplusplus
extern "C" {
#endif
extern u8 gSystemState[];
extern void *data_020f4e18;
extern const u16 *ActorDescriptor_GetPrimaryLabel(void *record);
extern void *ActorDescriptor_GetComponent(void *record, s32 index);
extern void *ActorDescriptor_LoadDetailResource(void *record);
extern const u16 *ActorDescriptor_GetSecondaryLabel(void *record);
extern s32 ActorDescriptor_GetPresentationAnimation(void *record);
extern u32 ActorDescriptorComponent_GetCharacterResourceId(void *component);
extern u32 ActorDescriptorComponent_GetPaletteResourceId(void *component);
extern u32 ActorDescriptorComponent_GetCellResourceId(void *component);
extern u32 ActorDescriptorComponent_GetAnimation(void *component);
extern void func_02071ee0(void *resource, void *manager, u32 first,
                          u32 second, u32 third);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *owner, void *resource, s32 mode);
extern void GraphicsSpriteState_ApplyRenderConfig(void *resource, s32 value, s32 x, s32 y,
                          s32 enabled, s32 field28, s32 flags);
extern void GraphicsSpriteRenderer_SetFontResource(void *renderer, const void *source);
extern void GraphicsSpriteRenderer_DrawText(void *renderer, const u16 *text, s32 x, s32 y,
                          s32 mode, s32 advance, s32 spacing);
extern void GraphicsSpriteCanvas_FillRect(void *renderer, s32 left, s32 top, s32 right,
                          s32 bottom, s32 value);
extern void TitleDialog_SetText(void *presentation, void *record, s32 mode);
extern void TitleDialog_UpdateTextPage(void *presentation, s32 value);
extern void TitleDialog_ClearTextRect(void *presentation);
extern void func_ov001_021fb81c(void *state, s32 startAnimation);
#ifdef __cplusplus
}
#endif

/*
 * Close with animation when record is null. Otherwise reset without animation,
 * bind ActorDescriptor_LoadDetailResource(record) to presentation_44, activate it, and draw two
 * record-derived text rows. The first row spans (0x70,0x4C)-(0xE0,0x58 or
 * 0x56); the second spans (0x5C,0x38)-(0xCC,0x48). Create a kind-1 resource at
 * (0x5C,0x48). When createDetail is nonzero, derive a property triplet from
 * record component zero, initialize resource_14, and create a kind-2 resource
 * at (0x48,0x48). Rendering/resource effects occur through engine callees.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fb87c(Overlay001PresentationPopulateState *state,
                         void *record, s32 createDetail)
{
    void *resource;
    void *component;
    u32 first;
    u32 second;
    u32 third;
    s32 bottom;

    if (record == 0) {
        func_ov001_021fb81c(state, 1);
        return;
    }

    func_ov001_021fb81c(state, 0);
    TitleDialog_SetText(state->presentation_44, ActorDescriptor_LoadDetailResource(record), 1);
    TitleDialog_ClearTextRect(state->presentation_44);
    TitleDialog_UpdateTextPage(state->presentation_44, 0);

    bottom = 0x58;
    if (gSystemState[0x5f] != 0) {
        bottom -= 2;
    }
    GraphicsSpriteRenderer_SetFontResource(state->renderer_00, state->textSource_24);
    GraphicsSpriteCanvas_FillRect(state->renderer_00, 0x70, 0x4c, 0xe0, bottom, 0);
    GraphicsSpriteRenderer_DrawText(state->renderer_00, ActorDescriptor_GetSecondaryLabel(record),
                  0x70, 0x4c, 0xe, 6, 0);

    resource = GraphicsSpriteGroup_CreateStateFromSource(state->spriteOwner_04, state->resource_08, 1);
    GraphicsSpriteState_ApplyRenderConfig(resource, ActorDescriptor_GetPresentationAnimation(record), 0x5c, 0x48, 1, 0, 0);

    GraphicsSpriteRenderer_SetFontResource(state->renderer_00, state->textSource_28);
    GraphicsSpriteCanvas_FillRect(state->renderer_00, 0x5c, 0x38, 0xcc, 0x48, 0);
    GraphicsSpriteRenderer_DrawText(state->renderer_00, ActorDescriptor_GetPrimaryLabel(record),
                  0x5c, 0x38, 0xe, 6, 0);

    if (createDetail != 0) {
        component = ActorDescriptor_GetComponent(record, 0);
        first = ActorDescriptorComponent_GetCharacterResourceId(component);
        component = ActorDescriptor_GetComponent(record, 0);
        second = ActorDescriptorComponent_GetPaletteResourceId(component);
        component = ActorDescriptor_GetComponent(record, 0);
        third = ActorDescriptorComponent_GetCellResourceId(component);
        func_02071ee0(state->resource_14, data_020f4e18,
                      first, second, third);
        resource = GraphicsSpriteGroup_CreateStateFromSource(state->spriteOwner_04, state->resource_14, 2);
        component = ActorDescriptor_GetComponent(record, 0);
        GraphicsSpriteState_ApplyRenderConfig(resource, ActorDescriptorComponent_GetAnimation(component),
                      0x48, 0x48, 1, 0, 0);
    }
}

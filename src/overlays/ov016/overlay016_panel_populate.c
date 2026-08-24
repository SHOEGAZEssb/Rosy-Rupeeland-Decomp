#include "tingle/types.h"

/* Overlay 16 six-slot panel population and text rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18;
extern u8 gSystemState[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorDescriptor_GetPrimaryLabel(void *);
extern void *ActorDescriptor_GetComponent(void *, s32);
extern s32 ActorDescriptor_GetPanelImage(void *);
extern s32 ActorDescriptor_GetSecondaryLabel(void *);
extern s32 ActorDescriptor_GetKind0Animation(void *);
extern s32 ActorDescriptorComponent_GetCharacterResourceId(void *);
extern s32 ActorDescriptorComponent_GetPaletteResourceId(void *);
extern s32 ActorDescriptorComponent_GetCellResourceId(void *);
extern s32 ActorDescriptorComponent_GetAnimation(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_DrawText(void *, s32, s32, s32, s32, s32, s32);
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
extern void func_02091b98(void *, s32);
extern void func_ov016_021fd9dc(void *, s32);
#ifdef __cplusplus
}
#endif

/* Clear hidden bit 2 in a sprite's control halfword +0x24. */
static void overlay016_show_sprite(void *sprite)
{
    FIELD(u16, sprite, 0x24) &= (u16)~4;
}

/* Load one resource triple obtained from three confirmed accessors. */
static void overlay016_load_row_resource(void *resource, void *row)
{
    void *value;
    s32 first;
    s32 second;

    value = ActorDescriptor_GetComponent(row, 0);
    first = ActorDescriptorComponent_GetCharacterResourceId(value);
    value = ActorDescriptor_GetComponent(row, 0);
    second = ActorDescriptorComponent_GetPaletteResourceId(value);
    value = ActorDescriptor_GetComponent(row, 0);
    func_02071ee0(resource, data_020f4e18, first, second, ActorDescriptorComponent_GetCellResourceId(value));
}

/*
 * Populate the six-slot panel from the wrapper at argument two. A null wrapped
 * pointer resets/hides the panel, sets fixed sprite +0x84 to the caller's low
 * image byte, and shows it. Otherwise reset the panel without clearing text,
 * configure the two fixed sprites from the requested image and linked header,
 * load header and per-row resources, create row sprites in a two-column grid,
 * update and show the three fixed sprite arrays for each populated row, and draw
 * the linked title, subtitle, and up to six row labels. Payload bytes +0x0E select
 * alternate color 5 and sprite flag +0x2A. System byte +0x5F applies the known
 * first-column and baseline adjustments. Return void; extensive SDK graphics
 * and font state changes occur, with no direct MMIO.
 */
extern "C" void func_ov016_021fdaa0(void *state, void *selection, s32 image)
{
    void *wrapper = FIELD(void *, selection, 0);
    s32 i;

    if (wrapper == 0) {
        func_ov016_021fd9dc(state, 1);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, state, 0x84), image & 0xff);
        overlay016_show_sprite(FIELD(void *, state, 0x84));
        return;
    }

    func_02091b98((u8 *)state + 0xf8, 0x78);
    func_ov016_021fd9dc(state, 0);
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, state, 0x84), (image + 0x32) & 0xff);
    overlay016_show_sprite(FIELD(void *, state, 0x84));

    {
        void *table = FIELD(void *, wrapper, 0);
        void *header = (u8 *)table + 4;
        s32 count = FIELD(s32, table, 0x100);
        void *sprite;
        s32 x = gSystemState[0x5f] != 0 ? -0x10 : 0;
        s32 y = 0;

        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, state, 0x88), (ActorDescriptor_GetPanelImage(header) + 6) & 0xff);
        overlay016_show_sprite(FIELD(void *, state, 0x88));
        overlay016_load_row_resource((u8 *)state + 0x18, header);
        sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 4), (u8 *)state + 0x18, 2);
        GraphicsSpriteState_ApplyRenderConfig(sprite, ActorDescriptorComponent_GetAnimation(ActorDescriptor_GetComponent(header, 0)),
                      0x44, 0x36, 1, 0, 0);

        for (i = 0; i < 6; i++) {
            if (i < count) {
                void *row = (u8 *)table + 0x28 + i * 0x24;
                void *rowResource = (u8 *)state + 0x24 + i * 0xc;

                overlay016_load_row_resource(rowResource, row);
                sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 4), rowResource, 2);
                GraphicsSpriteState_ApplyRenderConfig(sprite, ActorDescriptorComponent_GetAnimation(ActorDescriptor_GetComponent(row, 0)),
                              x + 0x26, y + 0x60, 1, 0, 0);
                if (FIELD(u8, selection, 0xe + i) == 2) {
                    FIELD(u16, sprite, 0x2a) = 1;
                }
                GraphicsSpriteState_SetAnimationIndex(FIELD(void *, state, 0xa4 + i * 4),
                              (FIELD(u16, row, 4) - 1) & 0xff);
                overlay016_show_sprite(FIELD(void *, state, 0xa4 + i * 4));
                overlay016_show_sprite(FIELD(void *, state, 0x8c + i * 4));
                GraphicsSpriteState_SetAnimationIndex(FIELD(void *, state, 0xbc + i * 4),
                              (ActorDescriptor_GetKind0Animation(row) + 0x12) & 0xff);
            }
            y += 0x22;
            if (i == 2) {
                x += 0x6c;
                if (gSystemState[0x5f] != 0) {
                    x += 0x10;
                }
                y = 0;
            }
        }

        GraphicsSpriteCanvas_FillRect(FIELD(void *, state, 0), 0x59, 0x27, 0xd9, 0x47, 0);
        GraphicsSpriteRenderer_SetFontResource(FIELD(void *, state, 0),
                                               FIELD(void *, state, 0xdc));
        GraphicsSpriteRenderer_DrawText(FIELD(void *, state, 0), ActorDescriptor_GetPrimaryLabel(header),
                      0x59, 0x27, 0xe, 6, 0);
        GraphicsSpriteRenderer_SetFontResource(FIELD(void *, state, 0),
                                               FIELD(void *, state, 0xd8));
        GraphicsSpriteRenderer_DrawText(FIELD(void *, state, 0), ActorDescriptor_GetSecondaryLabel(header), 0x6b,
                      gSystemState[0x5f] != 0 ? 0x39 : 0x3b, 0xe, 4, 0);

        x = gSystemState[0x5f] != 0 ? -0x10 : 0;
        y = 0;
        for (i = 0; i < 6; i++) {
            s32 width = gSystemState[0x5f] != 0 ? 0x50 : 0x40;

            GraphicsSpriteCanvas_FillRect(FIELD(void *, state, 0), x + 0x3a, y + 0x53,
                          x + 0x3a + width, y + 0x63, 0);
            if (i < count) {
                void *row = (u8 *)table + 0x28 + i * 0x24;
                s32 color = FIELD(u8, selection, 0xe + i) == 2 ? 5 : 0xe;

                GraphicsSpriteRenderer_SetFontResource(
                    FIELD(void *, state, 0), FIELD(void *, state, 0xd4));
                GraphicsSpriteRenderer_DrawText(FIELD(void *, state, 0), ActorDescriptor_GetPrimaryLabel(row),
                              x + 0x3a, y + 0x53, color, 4, 0);
            }
            y += 0x22;
            if (i == 2) {
                x += 0x6c;
                if (gSystemState[0x5f] != 0) {
                    x += 0x10;
                }
                y = 0;
            }
        }
    }
}

#include "tingle/game_work.h"
#include "tingle/types.h"

/*
 * Present an indexed area-information panel through an existing UI context.
 * The object owns one resource triplet and one sprite-group owner; it selects
 * localized table entries and conditionally adds flag- and save-dependent
 * detail rows. Table record meanings that are not yet confirmed retain their
 * address/stride descriptions below.
 */
typedef struct AreaInfoPanelPresentation {
    u8 base_00[0x24];
    u8 resources_24[0x0c];
    void *uiContext_30;
    u8 *spriteOwner_34;
    u8 *primarySprite_38;
} AreaInfoPanelPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_020c3a1c[];
extern const u16 data_020c3a28[];
extern const s32 data_020c37e4;
extern const u8 data_020d780c[];
extern const u16 data_020d7828[];
extern const u16 data_020d782c[];
extern const s16 data_020d7a48[];
extern u8 data_021f3ecc[];
extern u8 gSystemState[];
extern void *data_020f4e18;
extern void TitleCharacterResourceCollection_Init(void *);
extern void TitleCharacterResourceCollection_Destroy(void *);
extern void TitleCharacterResourceCollection_Append(void *, s32);
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_Destroy(void *);
extern void AnimationResourceState_ReplaceResources(void *, void *, s32, s32, s32);
extern u8 *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern u8 *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GraphicsSpriteRenderer_SetFontResource(void *, const void *);
extern const u16 *RetailTextTable_FindRecordById(void *, u16);
extern void GraphicsSpriteRenderer_DrawText(void *, const u16 *, s32, s32, s32, s32, s32);
extern void GraphicsSpriteRenderer_DrawGlyph(void *, s32, s32, s32, s32);
extern s32 GraphicsSpriteRenderer_DrawDecimal(void *, s32, s32, s32, s32, s32, s32, s32, s32);
extern s32 func_020befec(s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Construct the 0x24-byte panel base for IDs 0x7005 and 0x7007, load resource
 * IDs 0x3326..0x3328, create/configure two sprites, retain the primary sprite,
 * and leave the owner hidden. The supplied UI context is not owned.
 */
AreaInfoPanelPresentation *AreaInfoPanelPresentation_Init(AreaInfoPanelPresentation *self,
                                         void *uiContext)
{
    u8 *secondary;
    TitleCharacterResourceCollection_Init(self);
    AnimationResourceState_InitEmbedded(self->resources_24);
    self->uiContext_30 = uiContext;
    self->spriteOwner_34 = GraphicsSpriteGroupOwner_CreateGroup(uiContext);
    TitleCharacterResourceCollection_Append(self, 0x7005);
    TitleCharacterResourceCollection_Append(self, 0x7007);
    AnimationResourceState_ReplaceResources(self->resources_24, data_020f4e18,
                  0x3326, 0x3327, 0x3328);
    self->primarySprite_38 =
        GraphicsSpriteGroup_CreateStateFromSource(self->spriteOwner_34, self->resources_24, 1);
    GraphicsSpriteState_ApplyRenderConfig(self->primarySprite_38, 0, 0x1e, 0xa2, 1, 0, 0);
    secondary = GraphicsSpriteGroup_CreateStateFromSource(self->spriteOwner_34, self->resources_24, 1);
    GraphicsSpriteState_ApplyRenderConfig(secondary, 1, 5, 0xbd, 1, 0, 0);
    GraphicsSpriteGroup_ReleaseIndexedEntries(self->spriteOwner_34);
    return self;
}

/* Destroy the sprite owner, resource triplet, and panel base; return self. */
AreaInfoPanelPresentation *AreaInfoPanelPresentation_Destroy(AreaInfoPanelPresentation *self)
{
    GraphicsSpriteGroup_Destroy(self->spriteOwner_34);
    AnimationResourceState_Destroy(self->resources_24);
    TitleCharacterResourceCollection_Destroy(self);
    return self;
}

/*
 * Show and populate the panel for an index. This selects its sprite frame and
 * inherited text slots, draws two localized table strings, then optionally
 * draws either a fixed flag-dependent notice or the percentage of matching
 * records in the fixed data_020c37e4-entry, 0x24-byte table whose GameWork
 * byte at 0x5e94 is set.
 */
void AreaInfoPanelPresentation_ShowIndex(AreaInfoPanelPresentation *self, s32 index)
{
    const u16 *text;
    s32 stride34 = index * 0x34;
    s32 matching = 0;
    s32 available = 0;
    s32 i;

    *(u32 *)(self->spriteOwner_34 + 0x20) = 1;
    GraphicsSpriteRenderer_ClearTextBuffer(self->uiContext_30);
    *(u16 *)(self->primarySprite_38 + 0x24) &= (u16)~4;
    GraphicsSpriteState_SetAnimationIndex(self->primarySprite_38, data_020c3a1c[index]);

    GraphicsSpriteRenderer_SetFontResource(self->uiContext_30, *(void **)(self->base_00 + 0));
    text = RetailTextTable_FindRecordById(data_021f3ecc, data_020c3a28[index]);
    GraphicsSpriteRenderer_DrawText(self->uiContext_30, text + 1, 6,
                  gSystemState[0x5f] ? 0x9b : 0x9d, 13, 4, 0);

    GraphicsSpriteRenderer_SetFontResource(self->uiContext_30, *(void **)(self->base_00 + 4));
    text = RetailTextTable_FindRecordById(data_021f3ecc,
                        *(const u16 *)(data_020d780c + stride34));
    GraphicsSpriteRenderer_DrawText(self->uiContext_30, text + 1, 5, 0xa7, 13, 6, -1);

    if (!GameWork_TestFlag(gGameWork, 0x765) ||
        GameWork_TestFlag(gGameWork, data_020d782c[stride34 / 2]))
        return;
    if (GameWork_TestFlag(gGameWork, data_020d7828[stride34 / 2])) {
        GraphicsSpriteRenderer_DrawGlyph(self->uiContext_30, 0xd3, 0xee, 0xac, 13);
        return;
    }

    for (i = 0; i < data_020c37e4; i++) {
        if (index == *(const s16 *)((const u8 *)data_020d7a48 + i * 0x24)) {
            matching++;
            if (i == 0 || *((u8 *)gGameWork + 0x5e94 + i))
                available++;
        }
    }
    if (matching != 0) {
        s32 percent = func_020befec(available * 100, matching);
        if (percent > 0) {
            s32 width = GraphicsSpriteRenderer_DrawDecimal(self->uiContext_30, percent, 100,
                                     0xca, 0xac, 13, 12, 0, 0);
            GraphicsSpriteRenderer_DrawGlyph(self->uiContext_30, 5, width + 0xca, 0xac, 13);
        }
    }
}

/* Clear the UI context and hide the panel's sprite owner. */
void AreaInfoPanelPresentation_Hide(AreaInfoPanelPresentation *self)
{
    GraphicsSpriteRenderer_ClearTextBuffer(self->uiContext_30);
    GraphicsSpriteGroup_ReleaseIndexedEntries(self->spriteOwner_34);
}

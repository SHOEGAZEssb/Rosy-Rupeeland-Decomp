#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement the standard dual-screen UI presentation subclass.  It extends
 * the shared base with an 8-byte helper drawn at (104,171), tracks whether that
 * helper is active, derives one base flag from its source object, and toggles
 * two sub-engine display-plane bits under caller-provided masks.
 */
typedef struct DualScreenUiStandardPresentation {
    void **vtable00;
    u8 embedded04[0xa4];
    u8 *spriteOwnera8;
    void *sourceac;
    u8 *primarySpriteb0;
    u8 *secondarySpriteb4;
    u8 resourceb8[0x0c];
    u32 flagsc4;
    u8 helperc8[0x08];
    s32 drawEnabledd0;
} DualScreenUiStandardPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6b04;
extern void *gDebugFont;
extern void *DualScreenUiPresentationBase_Init(void *, void *);
extern void *DualScreenUiPresentationBase_DestroyAlternateEntry(void *);
extern void DualScreenUiPresentationBase_ApplyVisibilityMask(void *, s32, u32);
extern void DualScreenUiPresentationBase_LoadSubBg1Resources(void *);
extern void DualScreenUiPresentationBase_LoadSubBg2Resources(void *);
extern void DualScreenUiPresentationBase_CreatePrimarySprite(void *);
extern void DualScreenUiPresentationBase_CreateSecondarySprite(void *);
extern void DualScreenUiGridState_Update(void *embedded);
extern void DebugSpriteText_Init(void *helper);
extern void DebugSpriteText_Destroy(void *helper);
extern void DebugSpriteText_SetTextResource(void *helper, u16 value);
extern void DebugSpriteText_DrawCentered(void *helper, s32 x, s32 y);
extern s32 GamePhaseMetadata_IsAreaBehaviorPermitted(void *source);
extern u16 GamePhaseMetadata_GetTextResourceId(void *source);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *font);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *spriteOwner);
#ifdef __cplusplus
}
#endif

void DualScreenUiStandardPresentation_SetEnabled(DualScreenUiStandardPresentation *self,
                   s32 enabled, u32 mask);
void DualScreenUiStandardPresentation_BindSource(DualScreenUiStandardPresentation *self, void *source);

/*
 * Construct the shared base, install this vtable, initialize helper c8, set
 * drawEnabledd0 and base flag bit 0, derive base flag bit 1 from
 * GamePhaseMetadata_IsAreaBehaviorPermitted(source), create both fixed sprites, configure both extended
 * palettes, bind source through DualScreenUiStandardPresentation_BindSource, enable mask 0x1f, and return self.
 */
DualScreenUiStandardPresentation *DualScreenUiStandardPresentation_Init(
    DualScreenUiStandardPresentation *self, void *source)
{
    DualScreenUiPresentationBase_Init(self, source);
    self->vtable00 = (void **)data_020d6b04;
    DebugSpriteText_Init(self->helperc8);
    self->drawEnabledd0 = 1;
    self->flagsc4 = (self->flagsc4 & ~3u) | 1u |
                    ((u32)(GamePhaseMetadata_IsAreaBehaviorPermitted(source) & 1) << 1);
    DualScreenUiPresentationBase_CreatePrimarySprite(self);
    DualScreenUiPresentationBase_CreateSecondarySprite(self);
    DualScreenUiPresentationBase_LoadSubBg1Resources(self);
    DualScreenUiPresentationBase_LoadSubBg2Resources(self);
    DualScreenUiStandardPresentation_BindSource(self, self->sourceac);
    DualScreenUiStandardPresentation_SetEnabled(self, 1, 0x1f);
    return self;
}

/* Destroy helper and shared base without freeing storage, then return self. */
DualScreenUiStandardPresentation *DualScreenUiStandardPresentation_Destroy(
    DualScreenUiStandardPresentation *self)
{
    DebugSpriteText_Destroy(self->helperc8);
    DualScreenUiPresentationBase_DestroyAlternateEntry(self);
    return self;
}

/* Perform DualScreenUiStandardPresentation_Destroy teardown, free self, and return its old address. */
DualScreenUiStandardPresentation *DualScreenUiStandardPresentation_DestroyAndFree(
    DualScreenUiStandardPresentation *self)
{
    DualScreenUiStandardPresentation_Destroy(self);
    Heap_Free(self);
    return self;
}

/*
 * Flush the debug-font owner, rebuild both palette configurations, and rebind
 * the currently retained source.  This method has no returned status.
 */
void DualScreenUiStandardPresentation_RefreshResources(DualScreenUiStandardPresentation *self)
{
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    DualScreenUiPresentationBase_LoadSubBg1Resources(self);
    DualScreenUiPresentationBase_LoadSubBg2Resources(self);
    DualScreenUiStandardPresentation_BindSource(self, self->sourceac);
}

/*
 * Apply shared sprite/embedded visibility first.  Store enabled in
 * drawEnabledd0.  Under mask bit 3, set/clear sub-engine display-plane bit 9;
 * under mask bit 4, set/clear plane bit 10 in register 0x04001000.  Disabling
 * finishes by flushing the debug-font owner; enabling does not.
 */
void DualScreenUiStandardPresentation_SetEnabled(DualScreenUiStandardPresentation *self,
                   s32 enabled, u32 mask)
{
    volatile u32 *displayControl = (volatile u32 *)0x04001000;
    DualScreenUiPresentationBase_ApplyVisibilityMask(self, enabled, mask);
    self->drawEnabledd0 = enabled ? 1 : 0;
    if (mask & 8) {
        if (enabled) *displayControl |= 0x200;
        else *displayControl &= ~0x200u;
    }
    if (mask & 0x10) {
        if (enabled) *displayControl |= 0x400;
        else *displayControl &= ~0x400u;
    }
    if (!enabled) GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
}

/*
 * Draw helper c8 at (104,171) while drawEnabledd0 is nonzero, then update the
 * embedded state and sprite owner every call.
 */
void DualScreenUiStandardPresentation_Update(DualScreenUiStandardPresentation *self)
{
    if (self->drawEnabledd0)
        DebugSpriteText_DrawCentered(self->helperc8, 104, 171);
    DualScreenUiGridState_Update(self->embedded04);
    GraphicsSpriteGroup_AdvanceAnimations(self->spriteOwnera8);
}

/*
 * Retain source, replace base flag bit 1 with GamePhaseMetadata_IsAreaBehaviorPermitted(source), obtain the
 * source's recovered 16-bit value through GamePhaseMetadata_GetTextResourceId, and publish it to the
 * helper at offset 0xc8.
 */
void DualScreenUiStandardPresentation_BindSource(DualScreenUiStandardPresentation *self, void *source)
{
    self->sourceac = source;
    self->flagsc4 = (self->flagsc4 & ~2u) |
                    ((u32)(GamePhaseMetadata_IsAreaBehaviorPermitted(source) & 1) << 1);
    DebugSpriteText_SetTextResource(self->helperc8, GamePhaseMetadata_GetTextResourceId(source));
}

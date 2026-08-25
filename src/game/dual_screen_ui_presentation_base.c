#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Provide the shared base for a dual-screen UI presentation.  It owns a debug-
 * font sprite-group reference, a 0x0c-byte resource helper, two fixed-position
 * sprites, and an embedded presentation state.  Helpers configure two extended
 * palettes and coordinate sprite/embedded-state visibility.
 */

typedef struct GraphicsResourceSet {
    void *first00;
    void *second04;
    void *third08;
} GraphicsResourceSet;

typedef struct DualScreenUiPresentationBase {
    void **vtable00;
    u8 embedded04[0xa4];
    u8 *spriteOwnera8;
    void *sourceac;
    u8 *primarySpriteb0;
    u8 *secondarySpriteb4;
    u8 resourceb8[0x0c];
    u32 flagsc4;
} DualScreenUiPresentationBase;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6b3c;
extern void *gDebugFont;
extern void *data_020f4e18;
extern u8 gSubBgExtendedPaletteBuffer[];
extern void func_020264c4(void *embedded);
extern void func_02026514(void *embedded);
extern void func_020269f8(void *embedded);
extern void AnimationResourceState_InitEmbedded(void *resource);
extern void AnimationResourceState_Destroy(void *resource);
extern void func_02071ee0(void *resource, void *owner, s32, s32, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
extern void GraphicsSpriteGroupOwner_DestroyGroup(void *owner, void *spriteOwner);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *spriteOwner);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *spriteOwner);
extern u8 *GraphicsSpriteGroup_CreateStateFromSource(void *owner, void *resource, s32 mode);
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, s32 frame);
extern void GraphicsResourceSet_Init(GraphicsResourceSet *);
extern void GraphicsResourceSet_Load(GraphicsResourceSet *, void *, s32, s32,
                                     s32);
extern void GraphicsResourceSet_Destroy(GraphicsResourceSet *);
extern void func_020706c4(void *, s32, s32);
extern void GraphicsBgMapResource_UploadToSubBg(void *, s32, s32);
extern void *GraphicsBgResourceData_GetDecoded(void *);
extern void ExtendedPaletteBuffer_Write(void *, const void *, s32, s32);
#ifdef __cplusplus
}
#endif

void DualScreenUiPresentationBase_SetEmbeddedEnabled(void *embedded, s32 enabled);

static DualScreenUiPresentationBase *initialize_base(
    DualScreenUiPresentationBase *self, void *source)
{
    self->vtable00 = (void **)data_020d6b3c;
    func_020264c4(self->embedded04);
    self->sourceac = source;
    AnimationResourceState_InitEmbedded(self->resourceb8);
    self->flagsc4 &= ~3u;
    self->spriteOwnera8 = (u8 *)GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    *(u32 *)(self->spriteOwnera8 + 0x20) = 1;
    func_02071ee0(self->resourceb8, data_020f4e18,
                  0x32b7, 0x32b8, 0x32b9);
    return self;
}

/*
 * First constructor entry: initialize embedded state, retain source, acquire
 * the debug-font sprite owner, enable its offset-0x20 mode, load resources
 * 0x32b7..0x32b9, clear flag bits 0/1, and return self.
 */
DualScreenUiPresentationBase *DualScreenUiPresentationBase_Init(
    DualScreenUiPresentationBase *self, void *source)
{
    return initialize_base(self, source);
}

/*
 * Second address-distinct constructor entry.  Its observable initialization is
 * identical to DualScreenUiPresentationBase_Init, as expected for recovered C1/C2-style entries.
 */
DualScreenUiPresentationBase *DualScreenUiPresentationBase_InitAlternateEntry(
    DualScreenUiPresentationBase *self, void *source)
{
    return initialize_base(self, source);
}

static DualScreenUiPresentationBase *teardown_base(
    DualScreenUiPresentationBase *self)
{
    self->vtable00 = (void **)data_020d6b3c;
    GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont, self->spriteOwnera8);
    AnimationResourceState_Destroy(self->resourceb8);
    func_02026514(self->embedded04);
    return self;
}

/* Release sprite-owner/resource/embedded state and return self. */
DualScreenUiPresentationBase *DualScreenUiPresentationBase_Destroy(DualScreenUiPresentationBase *self)
{
    return teardown_base(self);
}

/* Perform base teardown, free self, and return its old address. */
DualScreenUiPresentationBase *DualScreenUiPresentationBase_DestroyAndFree(DualScreenUiPresentationBase *self)
{
    teardown_base(self);
    Heap_Free(self);
    return self;
}

/* Third non-freeing destructor entry; behavior matches DualScreenUiPresentationBase_Destroy. */
DualScreenUiPresentationBase *DualScreenUiPresentationBase_DestroyAlternateEntry(DualScreenUiPresentationBase *self)
{
    return teardown_base(self);
}

/* Recovered virtual hook with no observable effect. */
void DualScreenUiPresentationBase_NoOpHook0(DualScreenUiPresentationBase *self)
{
    (void)self;
}

/*
 * When base flag bit 0 is enabled, update sprite visibility bit 2.  The primary
 * is hidden only for value zero with mask 0x1f; otherwise it is shown.  When
 * mask bit 1 is set, the secondary is shown only for nonzero value while base
 * flag bit 1 is clear, and hidden otherwise.  Update the sprite owner.  If mask
 * bit 0 is set, forward value to DualScreenUiPresentationBase_SetEmbeddedEnabled and update embedded state.
 */
void DualScreenUiPresentationBase_ApplyVisibilityMask(DualScreenUiPresentationBase *self, s32 value, u32 mask)
{
    if ((self->flagsc4 & 1) == 0) return;
    if (value == 0 && mask == 0x1f)
        *(u16 *)(self->primarySpriteb0 + 0x24) |= 4;
    else
        *(u16 *)(self->primarySpriteb0 + 0x24) &= (u16)~4;
    if (mask & 2) {
        if (value != 0 && (self->flagsc4 & 2) == 0)
            *(u16 *)(self->secondarySpriteb4 + 0x24) &= (u16)~4;
        else
            *(u16 *)(self->secondarySpriteb4 + 0x24) |= 4;
    }
    GraphicsSpriteGroup_AdvanceAnimations(self->spriteOwnera8);
    if (mask & 1) {
        DualScreenUiPresentationBase_SetEmbeddedEnabled(self->embedded04, value);
        func_020269f8(self->embedded04);
    }
}

/*
 * Store embedded byte-0x8c bit 0 as the inverse of enabled.  Disabling an
 * embedded state with a nonnull owner at offset zero also calls GraphicsSpriteGroup_ReleaseIndexedEntries
 * followed by GraphicsSpriteGroup_AdvanceAnimations; enabling requires no owner operation.
 */
void DualScreenUiPresentationBase_SetEmbeddedEnabled(void *embedded, s32 enabled)
{
    u8 *state = (u8 *)embedded;
    if (enabled) {
        state[0x8c] &= (u8)~1;
        return;
    }
    state[0x8c] |= 1;
    if (*(void **)state != 0) {
        GraphicsSpriteGroup_ReleaseIndexedEntries(*(void **)state);
        GraphicsSpriteGroup_AdvanceAnimations(*(void **)state);
    }
}

/* Recovered virtual hook with no observable effect. */
void DualScreenUiPresentationBase_NoOpHook1(DualScreenUiPresentationBase *self)
{
    (void)self;
}

/* Return the address of the embedded state beginning at offset four. */
void *DualScreenUiPresentationBase_GetEmbeddedState(DualScreenUiPresentationBase *self)
{
    return self->embedded04;
}

/*
 * Load graphics resources 0x8026..0x8028 into a temporary set, configure the
 * confirmed sub-engine background-control halfword at 0x0400100a, select the
 * first/second resource modes, copy 0x200 bytes into extended-palette buffer
 * offset 0x2000, clear register 0x04001014, and destroy the temporary set.
 */
void DualScreenUiPresentationBase_LoadSubBg1Resources(DualScreenUiPresentationBase *self)
{
    GraphicsResourceSet set;
    volatile u16 *control = (volatile u16 *)0x0400100a;
    (void)self;
    GraphicsResourceSet_Init(&set);
    GraphicsResourceSet_Load(&set, data_020f4e18, 0x8026, 0x8027, 0x8028);
    *control = (u16)((*control & 0x43) | 0x1880);
    *control &= (u16)~3;
    func_020706c4(set.first00, 1, 0);
    GraphicsBgMapResource_UploadToSubBg(set.third08, 1, 0);
    ExtendedPaletteBuffer_Write(gSubBgExtendedPaletteBuffer,
                                GraphicsBgResourceData_GetDecoded(set.second04), 0x2000, 0x200);
    *(volatile u32 *)0x04001014 = 0;
    GraphicsResourceSet_Destroy(&set);
}

/*
 * Load resources 0x8026,0x8027,0x802a, configure sub-engine control halfword
 * 0x0400100c for the confirmed 0x1c80/mode-3 value, select resource mode two,
 * copy 0x200 bytes to extended-palette offset 0x4000, clear 0x04001018, and
 * destroy the temporary resource set.
 */
void DualScreenUiPresentationBase_LoadSubBg2Resources(DualScreenUiPresentationBase *self)
{
    GraphicsResourceSet set;
    volatile u16 *control = (volatile u16 *)0x0400100c;
    (void)self;
    GraphicsResourceSet_Init(&set);
    GraphicsResourceSet_Load(&set, data_020f4e18, 0x8026, 0x8027, 0x802a);
    *control = (u16)((*control & 0x43) | 0x1c80);
    *control = (u16)((*control & ~3) | 3);
    GraphicsBgMapResource_UploadToSubBg(set.third08, 2, 0);
    ExtendedPaletteBuffer_Write(gSubBgExtendedPaletteBuffer,
                                GraphicsBgResourceData_GetDecoded(set.second04), 0x4000, 0x200);
    *(volatile u32 *)0x04001018 = 0;
    GraphicsResourceSet_Destroy(&set);
}

/*
 * Create the primary mode-2 sprite at (104,178), set halfword 0x28 to 1000,
 * clear visibility bit 2, and retain it at offset 0xb0.
 */
void DualScreenUiPresentationBase_CreatePrimarySprite(DualScreenUiPresentationBase *self)
{
    self->primarySpriteb0 =
        GraphicsSpriteGroup_CreateStateFromSource(self->spriteOwnera8, self->resourceb8, 2);
    *(u16 *)(self->primarySpriteb0 + 0x2c) = 104;
    *(u16 *)(self->primarySpriteb0 + 0x2e) = 178;
    *(u16 *)(self->primarySpriteb0 + 0x28) = 1000;
    *(u16 *)(self->primarySpriteb0 + 0x24) &= (u16)~4;
}

/*
 * Create the secondary mode-2 sprite at (104,107), select frame one, set
 * visibility bit 2, and retain it at offset 0xb4.
 */
void DualScreenUiPresentationBase_CreateSecondarySprite(DualScreenUiPresentationBase *self)
{
    self->secondarySpriteb4 =
        GraphicsSpriteGroup_CreateStateFromSource(self->spriteOwnera8, self->resourceb8, 2);
    *(u16 *)(self->secondarySpriteb4 + 0x2c) = 104;
    *(u16 *)(self->secondarySpriteb4 + 0x2e) = 107;
    GraphicsSpriteState_SetAnimationIndex(self->secondarySpriteb4, 1);
    *(u16 *)(self->secondarySpriteb4 + 0x24) |= 4;
}

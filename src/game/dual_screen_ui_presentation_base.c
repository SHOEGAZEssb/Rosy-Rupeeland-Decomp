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
extern u8 data_020fd268[];
extern void func_020264c4(void *embedded);
extern void func_02026514(void *embedded);
extern void func_020269f8(void *embedded);
extern void func_02071ea4(void *resource);
extern void func_02071eb8(void *resource);
extern void func_02071ee0(void *resource, void *owner, s32, s32, s32);
extern void *func_020742cc(void *owner);
extern void func_02074330(void *owner, void *spriteOwner);
extern void func_020740a4(void *spriteOwner);
extern void func_02074110(void *spriteOwner);
extern u8 *func_02073ffc(void *owner, void *resource, s32 mode);
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, s32 frame);
extern void GraphicsResourceSet_Init(GraphicsResourceSet *);
extern void GraphicsResourceSet_Load(GraphicsResourceSet *, void *, s32, s32,
                                     s32);
extern void GraphicsResourceSet_Destroy(GraphicsResourceSet *);
extern void func_020706c4(void *, s32, s32);
extern void func_02070eac(void *, s32, s32);
extern void *func_02070874(void *);
extern void ExtendedPaletteBuffer_Write(void *, const void *, s32, s32);
#ifdef __cplusplus
}
#endif

void func_02025cd0(void *embedded, s32 enabled);

static DualScreenUiPresentationBase *initialize_base(
    DualScreenUiPresentationBase *self, void *source)
{
    self->vtable00 = (void **)data_020d6b3c;
    func_020264c4(self->embedded04);
    self->sourceac = source;
    func_02071ea4(self->resourceb8);
    self->flagsc4 &= ~3u;
    self->spriteOwnera8 = (u8 *)func_020742cc(gDebugFont);
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
DualScreenUiPresentationBase *func_02025a44(
    DualScreenUiPresentationBase *self, void *source)
{
    return initialize_base(self, source);
}

/*
 * Second address-distinct constructor entry.  Its observable initialization is
 * identical to func_02025a44, as expected for recovered C1/C2-style entries.
 */
DualScreenUiPresentationBase *func_02025acc(
    DualScreenUiPresentationBase *self, void *source)
{
    return initialize_base(self, source);
}

static DualScreenUiPresentationBase *teardown_base(
    DualScreenUiPresentationBase *self)
{
    self->vtable00 = (void **)data_020d6b3c;
    func_02074330(gDebugFont, self->spriteOwnera8);
    func_02071eb8(self->resourceb8);
    func_02026514(self->embedded04);
    return self;
}

/* Release sprite-owner/resource/embedded state and return self. */
DualScreenUiPresentationBase *func_02025b54(DualScreenUiPresentationBase *self)
{
    return teardown_base(self);
}

/* Perform base teardown, free self, and return its old address. */
DualScreenUiPresentationBase *func_02025b94(DualScreenUiPresentationBase *self)
{
    teardown_base(self);
    Heap_Free(self);
    return self;
}

/* Third non-freeing destructor entry; behavior matches func_02025b54. */
DualScreenUiPresentationBase *func_02025bdc(DualScreenUiPresentationBase *self)
{
    return teardown_base(self);
}

/* Recovered virtual hook with no observable effect. */
void func_02025c1c(DualScreenUiPresentationBase *self)
{
    (void)self;
}

/*
 * When base flag bit 0 is enabled, update sprite visibility bit 2.  The primary
 * is hidden only for value zero with mask 0x1f; otherwise it is shown.  When
 * mask bit 1 is set, the secondary is shown only for nonzero value while base
 * flag bit 1 is clear, and hidden otherwise.  Update the sprite owner.  If mask
 * bit 0 is set, forward value to func_02025cd0 and update embedded state.
 */
void func_02025c20(DualScreenUiPresentationBase *self, s32 value, u32 mask)
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
    func_020740a4(self->spriteOwnera8);
    if (mask & 1) {
        func_02025cd0(self->embedded04, value);
        func_020269f8(self->embedded04);
    }
}

/*
 * Store embedded byte-0x8c bit 0 as the inverse of enabled.  Disabling an
 * embedded state with a nonnull owner at offset zero also calls func_02074110
 * followed by func_020740a4; enabling requires no owner operation.
 */
void func_02025cd0(void *embedded, s32 enabled)
{
    u8 *state = (u8 *)embedded;
    if (enabled) {
        state[0x8c] &= (u8)~1;
        return;
    }
    state[0x8c] |= 1;
    if (*(void **)state != 0) {
        func_02074110(*(void **)state);
        func_020740a4(*(void **)state);
    }
}

/* Recovered virtual hook with no observable effect. */
void func_02025d10(DualScreenUiPresentationBase *self)
{
    (void)self;
}

/* Return the address of the embedded state beginning at offset four. */
void *func_02025d14(DualScreenUiPresentationBase *self)
{
    return self->embedded04;
}

/*
 * Load graphics resources 0x8026..0x8028 into a temporary set, configure the
 * confirmed sub-engine background-control halfword at 0x0400100a, select the
 * first/second resource modes, copy 0x200 bytes into extended-palette buffer
 * offset 0x2000, clear register 0x04001014, and destroy the temporary set.
 */
void func_02025d1c(DualScreenUiPresentationBase *self)
{
    GraphicsResourceSet set;
    volatile u16 *control = (volatile u16 *)0x0400100a;
    (void)self;
    GraphicsResourceSet_Init(&set);
    GraphicsResourceSet_Load(&set, data_020f4e18, 0x8026, 0x8027, 0x8028);
    *control = (u16)((*control & 0x43) | 0x1880);
    *control &= (u16)~3;
    func_020706c4(set.first00, 1, 0);
    func_02070eac(set.third08, 1, 0);
    ExtendedPaletteBuffer_Write(data_020fd268,
                                func_02070874(set.second04), 0x2000, 0x200);
    *(volatile u32 *)0x04001014 = 0;
    GraphicsResourceSet_Destroy(&set);
}

/*
 * Load resources 0x8026,0x8027,0x802a, configure sub-engine control halfword
 * 0x0400100c for the confirmed 0x1c80/mode-3 value, select resource mode two,
 * copy 0x200 bytes to extended-palette offset 0x4000, clear 0x04001018, and
 * destroy the temporary resource set.
 */
void func_02025dd8(DualScreenUiPresentationBase *self)
{
    GraphicsResourceSet set;
    volatile u16 *control = (volatile u16 *)0x0400100c;
    (void)self;
    GraphicsResourceSet_Init(&set);
    GraphicsResourceSet_Load(&set, data_020f4e18, 0x8026, 0x8027, 0x802a);
    *control = (u16)((*control & 0x43) | 0x1c80);
    *control = (u16)((*control & ~3) | 3);
    func_02070eac(set.third08, 2, 0);
    ExtendedPaletteBuffer_Write(data_020fd268,
                                func_02070874(set.second04), 0x4000, 0x200);
    *(volatile u32 *)0x04001018 = 0;
    GraphicsResourceSet_Destroy(&set);
}

/*
 * Create the primary mode-2 sprite at (104,178), set halfword 0x28 to 1000,
 * clear visibility bit 2, and retain it at offset 0xb0.
 */
void func_02025e88(DualScreenUiPresentationBase *self)
{
    self->primarySpriteb0 =
        func_02073ffc(self->spriteOwnera8, self->resourceb8, 2);
    *(u16 *)(self->primarySpriteb0 + 0x2c) = 104;
    *(u16 *)(self->primarySpriteb0 + 0x2e) = 178;
    *(u16 *)(self->primarySpriteb0 + 0x28) = 1000;
    *(u16 *)(self->primarySpriteb0 + 0x24) &= (u16)~4;
}

/*
 * Create the secondary mode-2 sprite at (104,107), select frame one, set
 * visibility bit 2, and retain it at offset 0xb4.
 */
void func_02025ed4(DualScreenUiPresentationBase *self)
{
    self->secondarySpriteb4 =
        func_02073ffc(self->spriteOwnera8, self->resourceb8, 2);
    *(u16 *)(self->secondarySpriteb4 + 0x2c) = 104;
    *(u16 *)(self->secondarySpriteb4 + 0x2e) = 107;
    GraphicsSpriteState_SetAnimationIndex(self->secondarySpriteb4, 1);
    *(u16 *)(self->secondarySpriteb4 + 0x24) |= 4;
}

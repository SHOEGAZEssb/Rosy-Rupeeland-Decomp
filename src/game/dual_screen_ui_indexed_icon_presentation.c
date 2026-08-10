#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement the indexed-icon dual-screen UI subclass.  In addition to the
 * shared base and 8-byte helper, it owns a 0x14-byte wrapper whose sprite
 * resources are selected from 30-byte records by signed source byte 0x4c.
 * Visibility synchronizes the wrapper sprite, shared base, and display plane.
 */

typedef struct IndexedIconWrapper {
    u8 *sprite00;
    u8 bytes04[0x10];
} IndexedIconWrapper;

typedef struct DualScreenUiIndexedIconPresentation {
    void **vtable00;
    u8 embedded04[0xa4];
    void *spriteOwnera8;
    void *sourceac;
    u8 *primarySpriteb0;
    u8 *secondarySpriteb4;
    u8 resourceb8[0x0c];
    u32 flagsc4;
    u8 helperc8[0x08];
    IndexedIconWrapper *iconWrapperd0;
    s32 drawEnabledd4;
} DualScreenUiIndexedIconPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6b20;
extern const char data_020d6b50[];
extern const u8 data_020d4742[];
extern const u8 data_020d4744[];
extern const u8 data_020d4746[];
extern void *gDebugFont;
extern void *func_02025a44(void *, void *);
extern void *func_02025bdc(void *);
extern void func_02025c20(void *, s32, u32);
extern void func_02025d1c(void *);
extern void func_02025e88(void *);
extern void func_02025ed4(void *);
extern void func_020269f8(void *embedded);
extern void func_02005c90(void *helper);
extern void func_02005cc8(void *helper);
extern void func_02005cec(void *helper, u16 value);
extern void func_02005d0c(void *helper, s32 x, s32 y);
extern u16 func_02028404(void *source);
extern void func_020755bc(void *font);
extern void func_020740a4(void *spriteOwner);
extern void *AnimationBinding_Init(void *, void *, s32, s32, s32, s32);
extern void AnimationBinding_Destroy(void *wrapper);
#ifdef __cplusplus
}
#endif

void func_0202640c(DualScreenUiIndexedIconPresentation *self, s32 enabled);

/*
 * Construct the shared base, install this vtable, initialize helper c8, clear
 * iconWrapperd0, set drawEnabledd4 and base flag bits 0/1, create the two base
 * sprites, configure the first extended palette, flush the debug-font owner,
 * and publish func_02028404(source) to helper c8.  Allocate a 0x14-byte wrapper
 * and construct it with three halfword IDs selected at byte offset
 * (s8)source[0x4c]*30 in data_020d4742/44/46 and trailing mode 2.  Configure its
 * sprite at (48,16), byte 0x3a=0, halfword 0x28=1000, enable the subclass, and
 * return self.
 */
DualScreenUiIndexedIconPresentation *func_020261bc(
    DualScreenUiIndexedIconPresentation *self, u8 *source)
{
    s32 offset;
    s32 first;
    s32 second;
    s32 third;

    func_02025a44(self, source);
    self->vtable00 = (void **)data_020d6b20;
    func_02005c90(self->helperc8);
    self->iconWrapperd0 = 0;
    self->drawEnabledd4 = 1;
    self->flagsc4 = (self->flagsc4 & ~3u) | 3;
    func_02025e88(self);
    func_02025ed4(self);
    func_02025d1c(self);
    func_020755bc(gDebugFont);
    func_02005cec(self->helperc8, func_02028404(source));

    offset = (s8)source[0x4c] * 30;
    first = *(const u16 *)(data_020d4742 + offset);
    second = *(const u16 *)(data_020d4744 + offset);
    third = *(const u16 *)(data_020d4746 + offset);
    self->iconWrapperd0 = (IndexedIconWrapper *)Heap_Alloc(
        0x14, data_020d6b50, 4, &gHeapContext);
    if (self->iconWrapperd0) {
        self->iconWrapperd0 = (IndexedIconWrapper *)AnimationBinding_Init(
            self->iconWrapperd0, self->spriteOwnera8,
            first, second, third, 2);
    }
    *(u16 *)(self->iconWrapperd0->sprite00 + 0x2c) = 48;
    *(u16 *)(self->iconWrapperd0->sprite00 + 0x2e) = 16;
    self->iconWrapperd0->sprite00[0x3a] = 0;
    *(u16 *)(self->iconWrapperd0->sprite00 + 0x28) = 1000;
    func_0202640c(self, 1);
    return self;
}

/* Destroy/free the icon wrapper, helper, and shared base; return self. */
DualScreenUiIndexedIconPresentation *func_02026308(
    DualScreenUiIndexedIconPresentation *self)
{
    self->vtable00 = (void **)data_020d6b20;
    if (self->iconWrapperd0) {
        AnimationBinding_Destroy(self->iconWrapperd0);
        Heap_Free(self->iconWrapperd0);
    }
    func_02005cc8(self->helperc8);
    func_02025bdc(self);
    return self;
}

/* Perform func_02026308 teardown, free self, and return its old address. */
DualScreenUiIndexedIconPresentation *func_02026350(
    DualScreenUiIndexedIconPresentation *self)
{
    func_02026308(self);
    Heap_Free(self);
    return self;
}

/*
 * Flush the debug-font owner, configure the first extended palette, and draw
 * helper c8 immediately at (104,171).
 */
void func_020263a0(DualScreenUiIndexedIconPresentation *self)
{
    func_020755bc(gDebugFont);
    func_02025d1c(self);
    func_02005d0c(self->helperc8, 104, 171);
}

/*
 * Draw helper c8 at (104,171) while drawEnabledd4 is nonzero, then update the
 * embedded state and shared sprite owner on every call.
 */
void func_020263d4(DualScreenUiIndexedIconPresentation *self)
{
    if (self->drawEnabledd4)
        func_02005d0c(self->helperc8, 104, 171);
    func_020269f8(self->embedded04);
    func_020740a4(self->spriteOwnera8);
}

/*
 * Enable/disable this subclass with shared-base mask 0x1f, set/clear sub-engine
 * display-plane bit 9 at 0x04001000, and respectively clear/set sprite
 * visibility bit 2 in the indexed wrapper.  Store the state in drawEnabledd4.
 */
void func_0202640c(DualScreenUiIndexedIconPresentation *self, s32 enabled)
{
    volatile u32 *displayControl = (volatile u32 *)0x04001000;
    self->drawEnabledd4 = enabled ? 1 : 0;
    func_02025c20(self, enabled ? 1 : 0, 0x1f);
    if (enabled) {
        *displayControl |= 0x200;
        *(u16 *)(self->iconWrapperd0->sprite00 + 0x24) &= (u16)~4;
    } else {
        *displayControl &= ~0x200u;
        *(u16 *)(self->iconWrapperd0->sprite00 + 0x24) |= 4;
    }
}

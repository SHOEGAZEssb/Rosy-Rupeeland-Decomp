#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Present a fixed-resource sprite through an owned 0xa0-byte overlay controller.
 * Resource IDs are 0x3a..0x3c and a signed constructor value maps to a reversed
 * frame number, with a one-frame discontinuity around zero.  Completion and
 * sprite-owner visibility are forwarded like the indexed sibling wrapper.
 */
typedef struct ReversedFrameSpriteOverlayPresentation {
    void **vtable00;
    u32 field04;
    u8 resource08[0x0c];
    u8 *spriteOwner14;
    void *controller18;
} ReversedFrameSpriteOverlayPresentation;

typedef void *(*ControllerDestructor)(void *);
typedef s32 (*ControllerComplete)(void *);

#ifdef __cplusplus
extern "C" {
#endif
extern void *gReversedFrameSpriteOverlayPresentationVtable;
extern const char gSpriteOverlayControllerAllocationTag[];
extern const u8 data_020c378c[];
extern void *data_020f4e18;
extern void *data_020f4e14;
extern void func_0201e250(void *);
extern void func_0201e28c(void *);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern u8 *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void *func_020953f4(void *, void *sprite);
extern void func_02094cf0(void *, const void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Initialize base/resource state with IDs 0x3a,0x3b,0x3c; acquire the owner
 * from data_020f4e14; create a mode-2 sprite; and select frame
 * value>=0 ? 10-value : 9-value. Allocate/construct a 0xa0-byte controller
 * around that sprite, configure it from data_020c378c in mode one, retain it,
 * and return self.
 */
ReversedFrameSpriteOverlayPresentation *ReversedFrameSpriteOverlayPresentation_Init(
    ReversedFrameSpriteOverlayPresentation *self, s32 value)
{
    u8 *sprite;
    s32 frame;
    func_0201e250(self);
    self->vtable00 = (void **)gReversedFrameSpriteOverlayPresentationVtable;
    func_02071ea4(self->resource08);
    func_02071ee0(self->resource08, data_020f4e18, 0x3a, 0x3b, 0x3c);
    self->spriteOwner14 = (u8 *)GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(self->spriteOwner14, self->resource08, 2);
    frame = value >= 0 ? 10 - value : 9 - value;
    GraphicsSpriteState_SetAnimationIndex(sprite, (u8)frame);
    self->controller18 = Heap_Alloc(0xa0, gSpriteOverlayControllerAllocationTag, 4, &gHeapContext);
    if (self->controller18)
        self->controller18 = func_020953f4(self->controller18, sprite);
    func_02094cf0(self->controller18, data_020c378c, 1);
    return self;
}

/* Destroy controller, owner, resource/base state, and return self. */
ReversedFrameSpriteOverlayPresentation *ReversedFrameSpriteOverlayPresentation_Destroy(
    ReversedFrameSpriteOverlayPresentation *self)
{
    self->vtable00 = (void **)gReversedFrameSpriteOverlayPresentationVtable;
    if (self->controller18)
        ((ControllerDestructor)(*(void ***)self->controller18)[1])(
            self->controller18);
    GraphicsSpriteGroup_Destroy(self->spriteOwner14);
    func_02071eb8(self->resource08);
    func_0201e28c(self);
    return self;
}

/* Destroy the owned controller and sprite resources, free self, and return its old address. */
ReversedFrameSpriteOverlayPresentation *ReversedFrameSpriteOverlayPresentation_DestroyAndFree(
    ReversedFrameSpriteOverlayPresentation *self)
{
    ReversedFrameSpriteOverlayPresentation_Destroy(self);
    Heap_Free(self);
    return self;
}

/* Call controller vtable slot two and normalize its result to zero or one. */
s32 ReversedFrameSpriteOverlayPresentation_IsComplete(
    ReversedFrameSpriteOverlayPresentation *self)
{
    return ((ControllerComplete)(*(void ***)self->controller18)[2])(
               self->controller18) != 0;
}

/* Enable owner offset 0x20, or disable the owner through GraphicsSpriteGroup_ReleaseIndexedEntries. */
void ReversedFrameSpriteOverlayPresentation_SetVisible(
    ReversedFrameSpriteOverlayPresentation *self, s32 enabled)
{
    if (enabled)
        *(u32 *)(self->spriteOwner14 + 0x20) = 1;
    else
        GraphicsSpriteGroup_ReleaseIndexedEntries(self->spriteOwner14);
}

#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Present one indexed sprite through an owned 0xa0-byte overlay controller.
 * The constructor selects a resource triple from an 8-byte table record, uses
 * the same index as the sprite frame, and configures the controller from a
 * second constant table.  The wrapper forwards completion and owner visibility.
 */
typedef struct IndexedResourceRecord {
    u16 resource00;
    u16 palette02;
    u16 animation04;
    u16 field06;
} IndexedResourceRecord;

typedef struct IndexedSpriteOverlayPresentation {
    void **vtable00;
    u32 field04;
    u8 resource08[0x0c];
    u8 *spriteOwner14;
    void *controller18;
} IndexedSpriteOverlayPresentation;

typedef void *(*ControllerDestructor)(void *);
typedef s32 (*ControllerComplete)(void *);

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6c20;
extern const char data_020d6c40[];
extern const IndexedResourceRecord data_020c370c[];
extern const u8 data_020c3734[];
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
 * Initialize base/resource state; load the three IDs at table record index;
 * acquire a sprite owner from data_020f4e14; create a mode-2 sprite and select
 * frame index. Allocate a 0xa0-byte controller, construct it around the sprite,
 * configure it from data_020c3734 with mode one, retain it, and return self.
 */
IndexedSpriteOverlayPresentation *func_02027150(
    IndexedSpriteOverlayPresentation *self, s32 index)
{
    const IndexedResourceRecord *record = &data_020c370c[index];
    u8 *sprite;
    func_0201e250(self);
    self->vtable00 = (void **)data_020d6c20;
    func_02071ea4(self->resource08);
    func_02071ee0(self->resource08, data_020f4e18,
                  record->resource00, record->palette02,
                  record->animation04);
    self->spriteOwner14 = (u8 *)GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(self->spriteOwner14, self->resource08, 2);
    GraphicsSpriteState_SetAnimationIndex(sprite, (u8)index);
    self->controller18 = Heap_Alloc(0xa0, data_020d6c40, 4, &gHeapContext);
    if (self->controller18)
        self->controller18 = func_020953f4(self->controller18, sprite);
    func_02094cf0(self->controller18, data_020c3734, 1);
    return self;
}

/*
 * Destroy the owned controller through vtable slot one, release the sprite
 * owner through GraphicsSpriteGroup_Destroy, destroy resource state and base, and return self.
 */
IndexedSpriteOverlayPresentation *func_0202721c(
    IndexedSpriteOverlayPresentation *self)
{
    self->vtable00 = (void **)data_020d6c20;
    if (self->controller18)
        ((ControllerDestructor)(*(void ***)self->controller18)[1])(
            self->controller18);
    GraphicsSpriteGroup_Destroy(self->spriteOwner14);
    func_02071eb8(self->resource08);
    func_0201e28c(self);
    return self;
}

/* Perform func_0202721c teardown, free self, and return its old address. */
IndexedSpriteOverlayPresentation *func_02027268(
    IndexedSpriteOverlayPresentation *self)
{
    func_0202721c(self);
    Heap_Free(self);
    return self;
}

/* Call controller vtable slot two and normalize its result to zero or one. */
s32 func_020272bc(IndexedSpriteOverlayPresentation *self)
{
    return ((ControllerComplete)(*(void ***)self->controller18)[2])(
               self->controller18) != 0;
}

/*
 * Enable the retained sprite owner by setting its offset-0x20 word to one, or
 * disable it through GraphicsSpriteGroup_ReleaseIndexedEntries when enabled is zero.
 */
void func_020272e0(IndexedSpriteOverlayPresentation *self, s32 enabled)
{
    if (enabled)
        *(u32 *)(self->spriteOwner14 + 0x20) = 1;
    else
        GraphicsSpriteGroup_ReleaseIndexedEntries(self->spriteOwner14);
}

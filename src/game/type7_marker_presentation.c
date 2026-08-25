#include "tingle/types.h"

/*
 * Recovered resource-backed marker presentation for the type-seven subsystem.
 * It creates a small owner-following visual and exposes reset/destructor hooks.
 */

extern const u8 data_020e1ed8[];
extern void *data_020f4e18;

typedef struct Type7MarkerPresentation {
    const void *vtable;
    u8 *presentation;
    void *owner;
    s16 field0c;
    s16 field0e;
} Type7MarkerPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *allocation);
extern void Actor_GetOwningCollection(void *owner);
extern void *ActorCollection_GetSpriteGroup(void);
extern void *GraphicsArchive_FindCharacterResource(void *resources, u32 id);
extern void *GraphicsArchive_FindPaletteResource(void *resources, u32 id);
extern void *GraphicsArchive_FindCellResource(void *resources, u32 id);
extern void GraphicsSpriteState_SetAnimationIndex(void *presentation, u32 index);
extern void GraphicsSpriteState_ReleaseFromGroup(void *presentation);
extern void *GraphicsSpriteGroup_CreateState(void *context, void *first, void *second,
                           void *third, u32 mode);
extern void Type7MarkerPresentation_Reset(Type7MarkerPresentation *self);
extern void Type7MarkerPresentation_ReloadResources(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are destination storage and an owner. Install vtable data_020e1ed8,
 * fetch resource IDs 0x138a/0x1078/0x138b through the three specialized
 * accessors on data_020f4e18, notify the owner, and create presentation mode
 * two. Select animation zero, set presentation byte +0x3a to one, clear
 * halfwords +0x2c/+0x2e, set flag two, clear local +0x0e, and reset through
 * Type7MarkerPresentation_Reset. Return self. Resource, owner, and presentation state may
 * change through SDK-facing helpers; hardware is not accessed directly.
 */
Type7MarkerPresentation *Type7MarkerPresentation_Init(Type7MarkerPresentation *self,
                                        void *owner)
{
    void *first;
    void *second;
    void *third;
    self->vtable = data_020e1ed8;
    self->owner = owner;
    first = GraphicsArchive_FindCharacterResource(data_020f4e18, 0x138a);
    second = GraphicsArchive_FindPaletteResource(data_020f4e18, 0x1078);
    third = GraphicsArchive_FindCellResource(data_020f4e18, 0x138b);
    Actor_GetOwningCollection(owner);
    self->presentation = (u8 *)GraphicsSpriteGroup_CreateState(
        ActorCollection_GetSpriteGroup(), first, second, third, 2);
    GraphicsSpriteState_SetAnimationIndex(self->presentation, 0);
    self->presentation[0x3a] = 1;
    *(u16 *)(self->presentation + 0x2c) = 0;
    *(u16 *)(self->presentation + 0x2e) = 0;
    *(u16 *)(self->presentation + 0x24) |= 2;
    self->field0e = 0;
    Type7MarkerPresentation_Reset(self);
    return self;
}

/*
 * Input is a marker presentation. Restore vtable data_020e1ed8 and destroy
 * presentation +0x04, returning self without freeing its storage. Presentation
 * state changes through its SDK-facing destructor; no direct hardware effects.
 */
Type7MarkerPresentation *Type7MarkerPresentation_Destroy(Type7MarkerPresentation *self)
{
    self->vtable = data_020e1ed8;
    GraphicsSpriteState_ReleaseFromGroup(self->presentation);
    return self;
}

/*
 * Input is a marker presentation. Restore the vtable, destroy presentation
 * +0x04, free self, and return its original address as in retail code. Heap
 * and presentation state change; there are no direct hardware effects.
 */
Type7MarkerPresentation *Type7MarkerPresentation_DestroyAndFree(Type7MarkerPresentation *self)
{
    self->vtable = data_020e1ed8;
    GraphicsSpriteState_ReleaseFromGroup(self->presentation);
    Heap_Free(self);
    return self;
}

/*
 * Input is a marker presentation. Clear halfword +0x0c; when signed halfword
 * +0x0e is nonzero, reset related state through Type7MarkerPresentation_ReloadResources using self.
 * Always set presentation +0x24 bits 0x04/0x08. No value is returned. Object
 * and presentation state may change, with no direct hardware effects.
 */
void Type7MarkerPresentation_Reset(Type7MarkerPresentation *self)
{
    self->field0c = 0;
    if (self->field0e != 0)
        Type7MarkerPresentation_ReloadResources(self);
    *(u16 *)(self->presentation + 0x24) |= 0x0c;
}

/*
 * Empty recovered marker callback. Any register arguments are ignored; it
 * changes no state, returns no value, and has no SDK or hardware effects.
 */
void Type7MarkerPresentation_NoopCallback(void)
{
}

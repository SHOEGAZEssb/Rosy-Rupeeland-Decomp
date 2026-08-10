#include "tingle/types.h"

/*
 * Recovered auxiliary presentation object used by the type-seven subsystem.
 * It owns a small resource wrapper and a presentation instance plus motion state.
 */

extern const u8 data_020e1ea4[];
extern const char data_020e1eb4[];
extern void *gHeapContext;

typedef struct Type7AuxiliaryPresentation {
    const void *vtable;
    void *presentation;
    void *owner;
    void *resource;
    u8 field10;
    u8 field11;
    u8 field12;
    u8 field13;
    s32 field14;
    s32 field18;
    s32 field1c;
    s32 field20;
    u16 field24;
    u16 field26;
    s32 field28;
} Type7AuxiliaryPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32 size, const char *source, u32 line,
                        void *heapContext);
extern void Heap_Free(void *allocation);
extern void *AnimationResource_Init(void *storage, u32 first, u32 second, u32 third);
extern void Actor_GetCollection(void *owner);
extern void *ActorCollection_GetSpriteOwner(void);
extern void *func_02073fc4(void *context, u32 first, u32 second, u32 third,
                           u32 mode);
extern void func_02072b68(void *presentation, u32 index);
extern void func_02073ef8(void *presentation);
extern void Type7AuxiliaryPresentation_Reset(Type7AuxiliaryPresentation *self);
extern void Type7AuxiliaryPresentation_Activate(Type7AuxiliaryPresentation *self);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are destination storage and an owner object. Install vtable
 * data_020e1ea4, allocate and initialize a 16-byte resource using IDs
 * 0x1157..0x1159, notify the owner, create presentation mode two from the
 * resource's three payload words, select presentation index zero, clear
 * halfwords +0x2c/+0x2e and presentation flag two, then reset local state via
 * Type7AuxiliaryPresentation_Reset. Return the destination. Heap, resource, owner, and presentation
 * state may change; SDK-facing helpers are called but hardware is not accessed
 * directly. Retail code assumes resource allocation succeeds.
 */
Type7AuxiliaryPresentation *Type7AuxiliaryPresentation_Init(
    Type7AuxiliaryPresentation *self, void *owner)
{
    u32 *resource;
    self->vtable = data_020e1ea4;
    self->owner = owner;
    resource = (u32 *)Heap_Alloc(0x10, data_020e1eb4, 4, gHeapContext);
    if (resource != 0)
        resource = (u32 *)AnimationResource_Init(resource, 0x1157, 0x1158, 0x1159);
    self->resource = resource;
    Actor_GetCollection(owner);
    self->presentation = func_02073fc4(
        ActorCollection_GetSpriteOwner(), resource[1], resource[2], resource[3], 2);
    func_02072b68(self->presentation, 0);
    *(u16 *)((u8 *)self->presentation + 0x2c) = 0;
    *(u16 *)((u8 *)self->presentation + 0x2e) = 0;
    *(u16 *)((u8 *)self->presentation + 0x24) &= (u16)~2;
    Type7AuxiliaryPresentation_Reset(self);
    return self;
}

/*
 * Input is an auxiliary presentation object. Restore vtable data_020e1ea4,
 * destroy presentation +0x04, and invoke virtual slot one of non-null resource
 * +0x0c. Return self without freeing its storage. Owned presentation/resource
 * state changes; no direct hardware effects occur.
 */
Type7AuxiliaryPresentation *Type7AuxiliaryPresentation_Destroy(Type7AuxiliaryPresentation *self)
{
    self->vtable = data_020e1ea4;
    func_02073ef8(self->presentation);
    if (self->resource != 0) {
        void (**vtable)(void *) = *(void (***)(void *))self->resource;
        vtable[1](self->resource);
    }
    return self;
}

/*
 * Input is an auxiliary presentation object. Perform the same owned-object
 * teardown as Type7AuxiliaryPresentation_Destroy, then release self through Heap_Free. Return the
 * original address as in retail code. Heap and owned object state change;
 * there are no direct hardware effects.
 */
Type7AuxiliaryPresentation *Type7AuxiliaryPresentation_DestroyAndFree(Type7AuxiliaryPresentation *self)
{
    self->vtable = data_020e1ea4;
    func_02073ef8(self->presentation);
    if (self->resource != 0) {
        void (**vtable)(void *) = *(void (***)(void *))self->resource;
        vtable[1](self->resource);
    }
    Heap_Free(self);
    return self;
}

/*
 * Input is an auxiliary presentation object. Clear words +0x14/+0x18,
 * +0x1c/+0x20/+0x28, halfwords +0x24/+0x26, and bytes +0x10/+0x12/+0x13;
 * set byte +0x11 to 0xff and set presentation +0x24 bit eight. No value is
 * returned. Only object/presentation state changes, without SDK/hardware calls.
 */
void Type7AuxiliaryPresentation_Reset(Type7AuxiliaryPresentation *self)
{
    self->field18 = 0;
    self->field14 = 0;
    self->field28 = 0;
    self->field26 = 0;
    self->field24 = 0;
    self->field20 = 0;
    self->field1c = 0;
    self->field10 = 0;
    self->field13 = 0;
    self->field12 = 0;
    *(u16 *)((u8 *)self->presentation + 0x24) |= 8;
    self->field11 = 0xff;
}

/*
 * Input is an auxiliary presentation object. Let Type7AuxiliaryPresentation_Activate refresh its
 * base value, set +0x14/+0x18 to +0x28 plus 0x1e000, set bytes +0x12/+0x13 to
 * three, select presentation index 0x10, clear presentation +0x24 bit eight,
 * and set +0x11 to 0xff. No value is returned. Object/presentation state and
 * the helper called at entry may change; there are no direct hardware effects.
 */
void Type7AuxiliaryPresentation_EnterRaisedState(Type7AuxiliaryPresentation *self)
{
    Type7AuxiliaryPresentation_Activate(self);
    self->field18 = self->field28 + 0x1e000;
    self->field14 = self->field18;
    self->field13 = 3;
    self->field12 = 3;
    func_02072b68(self->presentation, 0x10);
    *(u16 *)((u8 *)self->presentation + 0x24) &= (u16)~8;
    self->field11 = 0xff;
}

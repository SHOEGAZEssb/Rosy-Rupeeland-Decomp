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
extern void func_020337d4(void *owner);
extern void *func_02030acc(void);
extern void *func_02071e60(void *resources, u32 id);
extern void *func_02071e70(void *resources, u32 id);
extern void *func_02071e80(void *resources, u32 id);
extern void func_02072b68(void *presentation, u32 index);
extern void func_02073ef8(void *presentation);
extern void *func_02073fc4(void *context, void *first, void *second,
                           void *third, u32 mode);
extern void func_0204cdcc(Type7MarkerPresentation *self);
extern void func_0204cf28(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are destination storage and an owner. Install vtable data_020e1ed8,
 * fetch resource IDs 0x138a/0x1078/0x138b through the three specialized
 * accessors on data_020f4e18, notify the owner, and create presentation mode
 * two. Select animation zero, set presentation byte +0x3a to one, clear
 * halfwords +0x2c/+0x2e, set flag two, clear local +0x0e, and reset through
 * func_0204cdcc. Return self. Resource, owner, and presentation state may
 * change through SDK-facing helpers; hardware is not accessed directly.
 */
Type7MarkerPresentation *func_0204cca8(Type7MarkerPresentation *self,
                                        void *owner)
{
    void *first;
    void *second;
    void *third;
    self->vtable = data_020e1ed8;
    self->owner = owner;
    first = func_02071e60(data_020f4e18, 0x138a);
    second = func_02071e70(data_020f4e18, 0x1078);
    third = func_02071e80(data_020f4e18, 0x138b);
    func_020337d4(owner);
    self->presentation = (u8 *)func_02073fc4(
        func_02030acc(), first, second, third, 2);
    func_02072b68(self->presentation, 0);
    self->presentation[0x3a] = 1;
    *(u16 *)(self->presentation + 0x2c) = 0;
    *(u16 *)(self->presentation + 0x2e) = 0;
    *(u16 *)(self->presentation + 0x24) |= 2;
    self->field0e = 0;
    func_0204cdcc(self);
    return self;
}

/*
 * Input is a marker presentation. Restore vtable data_020e1ed8 and destroy
 * presentation +0x04, returning self without freeing its storage. Presentation
 * state changes through its SDK-facing destructor; no direct hardware effects.
 */
Type7MarkerPresentation *func_0204cd7c(Type7MarkerPresentation *self)
{
    self->vtable = data_020e1ed8;
    func_02073ef8(self->presentation);
    return self;
}

/*
 * Input is a marker presentation. Restore the vtable, destroy presentation
 * +0x04, free self, and return its original address as in retail code. Heap
 * and presentation state change; there are no direct hardware effects.
 */
Type7MarkerPresentation *func_0204cda0(Type7MarkerPresentation *self)
{
    self->vtable = data_020e1ed8;
    func_02073ef8(self->presentation);
    Heap_Free(self);
    return self;
}

/*
 * Input is a marker presentation. Clear halfword +0x0c; when signed halfword
 * +0x0e is nonzero, reset related state through func_0204cf28 using self.
 * Always set presentation +0x24 bits 0x04/0x08. No value is returned. Object
 * and presentation state may change, with no direct hardware effects.
 */
void func_0204cdcc(Type7MarkerPresentation *self)
{
    self->field0c = 0;
    if (self->field0e != 0)
        func_0204cf28(self);
    *(u16 *)(self->presentation + 0x24) |= 0x0c;
}

/*
 * Empty recovered marker callback. Any register arguments are ignored; it
 * changes no state, returns no value, and has no SDK or hardware effects.
 */
void func_0204ce00(void)
{
}

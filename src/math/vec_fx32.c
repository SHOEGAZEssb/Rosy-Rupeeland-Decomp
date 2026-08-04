#include "tingle/vec_fx32.h"
#include "tingle/heap.h"

/*
 * Polymorphic wrapper around NitroSDK's three-component 20.12 fixed-point
 * vector. The class owns no external resource; it supplies construction,
 * destruction, assignment, magnitude/normalization, and in-place binary
 * vector operations while retaining the retail vtable identity.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern fx32 func_020ade74(const VecFx32Value *value);
extern void func_020add34(const VecFx32Value *source,
                         VecFx32Value *destination);
extern void func_020adff0(const VecFx32Value *left,
                         const VecFx32Value *right,
                         VecFx32Value *destination);
extern void func_020adfbc(const VecFx32Value *left,
                         const VecFx32Value *right,
                         VecFx32Value *destination);

#ifdef __cplusplus
}
#endif

/*
 * Construct a zero vector and install the VecFx32 vtable. The object address
 * is returned; only its four words change and no SDK routine is called.
 */
VecFx32Object *func_02004fe0(VecFx32Object *self)
{
    VecFx32Value *value = (VecFx32Value *)self;

    self->vtable = &data_020d405c;
    if (self != 0) {
        value = &self->value;
    }
    value->x = 0;
    value->y = 0;
    value->z = 0;
    return self;
}

/* Construct a vector from three fixed-point components and return the object. */
VecFx32Object *func_0200500c(VecFx32Object *self, fx32 x, fx32 y, fx32 z)
{
    VecFx32Value *value = (VecFx32Value *)self;

    self->vtable = &data_020d405c;
    if (self != 0) {
        value = &self->value;
    }
    value->x = x;
    value->y = y;
    value->z = z;
    return self;
}

/* Copy another object's vector payload, install this vtable, and return self. */
VecFx32Object *func_02005030(VecFx32Object *self,
                             const VecFx32Object *source)
{
    self->vtable = &data_020d405c;
    self->value.x = source->value.x;
    self->value.y = source->value.y;
    self->value.z = source->value.z;
    return self;
}

/* Non-deleting destructor: the vector owns no resource and simply returns self. */
VecFx32Object *func_02005058(VecFx32Object *self)
{
    return self;
}

/* Deleting destructor: release the object through the game heap and return its address. */
VecFx32Object *func_0200505c(VecFx32Object *self)
{
    Heap_Free(self);
    return self;
}

/* Return the SDK-computed fixed-point magnitude without changing the vector. */
fx32 func_02005070(const VecFx32Object *self)
{
    const VecFx32Value *value = self != 0
                                    ? &self->value
                                    : (const VecFx32Value *)self;
    return func_020ade74(value);
}

/* Normalize the wrapped vector in place through the NitroSDK vector helper. */
void func_02005084(VecFx32Object *self)
{
    VecFx32Value *destination = (VecFx32Value *)self;
    const VecFx32Value *source;

    if (self != 0) {
        destination = &self->value;
    }
    source = self != 0 ? &self->value : (const VecFx32Value *)self;
    func_020add34(source, destination);
}

/* Assign another payload unless it is the same object; return the destination. */
VecFx32Object *func_020050a4(VecFx32Object *self,
                             const VecFx32Object *source)
{
    if (self != source) {
        self->value.x = source->value.x;
        self->value.y = source->value.y;
        self->value.z = source->value.z;
    }
    return self;
}

/* Apply the SDK operation at 0x020adff0 to self and other, storing into self. */
void func_020050c8(VecFx32Object *self, const VecFx32Object *other)
{
    VecFx32Value *destination = (VecFx32Value *)self;
    const VecFx32Value *right;
    const VecFx32Value *left;

    if (self != 0) {
        destination = &self->value;
    }
    right = other != 0 ? &other->value : (const VecFx32Value *)other;
    left = self != 0 ? &self->value : (const VecFx32Value *)self;
    func_020adff0(left, right, destination);
}

/* Apply the SDK operation at 0x020adfbc to self and other, storing into self. */
void func_020050f0(VecFx32Object *self, const VecFx32Object *other)
{
    VecFx32Value *destination = (VecFx32Value *)self;
    const VecFx32Value *right;
    const VecFx32Value *left;

    if (self != 0) {
        destination = &self->value;
    }
    right = other != 0 ? &other->value : (const VecFx32Value *)other;
    left = self != 0 ? &self->value : (const VecFx32Value *)self;
    func_020adfbc(left, right, destination);
}

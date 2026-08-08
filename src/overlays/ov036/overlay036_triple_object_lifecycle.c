#include "tingle/types.h"

/* Overlay 36 three-child render object construction and teardown. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205f64[];
extern const u8 data_ov036_02205eac[];
extern const u8 data_ov036_02206168[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020949ec(void *object);
extern void func_ov036_021fe218(void *list);
extern void func_02094ad4(void *field);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov036_021fcf34(void *object, void *resource,
                                 s32 mode, s32 type);
extern void func_020948d4(void *field, s32 value);
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void func_02095274(void *list, void *object);
extern void func_02095308(void *list);
extern void func_ov036_0220384c(void *field);
extern void func_ov036_021fcf30(void *object);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a common render object containing list +0x9C and field +0xB4.
 * Three 0xC4 children backed by resource are created with modes 0, 1, and 2,
 * common type 0xA, scale 0x400, and stored at +0x150/+0x154/+0x158. The latter
 * two are positioned at X=+0x400 and X=-0x400 respectively; all three enter
 * list +0x9C. Field +0xAC starts at one and +0xB0 at zero. Returns object;
 * heap, transform, list, and child state change.
 */
extern "C" void *func_ov036_02203850(void *object, void *resource)
{
    func_020949ec(object);
    FIELD(const void *, object, 0) = data_ov036_02205f64;
    func_ov036_021fe218((u8 *)object + 0x9c);
    func_02094ad4((u8 *)object + 0xb4);

    void *child = Heap_Alloc(0xc4, data_ov036_02206168, 4, gHeapContext);
    if (child != 0)
        child = func_ov036_021fcf34(child, resource, 0, 0xa);
    FIELD(void *, object, 0x150) = child;
    func_020948d4((u8 *)child + 0x6c, 0x400);
    func_02095274((u8 *)object + 0x9c, child);

    child = Heap_Alloc(0xc4, data_ov036_02206168, 4, gHeapContext);
    if (child != 0)
        child = func_ov036_021fcf34(child, resource, 1, 0xa);
    FIELD(void *, object, 0x154) = child;
    func_02094bbc(child, 0x400, 0, 0);
    func_020948d4((u8 *)child + 0x6c, 0x400);
    func_02095274((u8 *)object + 0x9c, child);

    child = Heap_Alloc(0xc4, data_ov036_02206168, 4, gHeapContext);
    if (child != 0)
        child = func_ov036_021fcf34(child, resource, 2, 0xa);
    FIELD(void *, object, 0x158) = child;
    func_02094bbc(child, -0x400, 0, 0);
    func_020948d4((u8 *)child + 0x6c, 0x400);
    func_02095274((u8 *)object + 0x9c, child);
    FIELD(s32, object, 0xac) = 1;
    FIELD(s32, object, 0xb0) = 0;
    return object;
}

/*
 * Destroys a three-child object without freeing it. List +0x9C receives
 * two-phase teardown around the recovered no-op +0xB4 callback, then common
 * object teardown runs. Returns object; list and base ownership state change.
 */
extern "C" void *func_ov036_022039a0(void *object)
{
    FIELD(const void *, object, 0) = data_ov036_02205f64;
    func_02095308((u8 *)object + 0x9c);
    func_ov036_0220384c((u8 *)object + 0xb4);
    FIELD(const void *, object, 0x9c) = data_ov036_02205eac;
    func_02095308((u8 *)object + 0x9c);
    func_ov036_021fcf30(object);
    return object;
}

/*
 * Fully deletes the object by performing the same list and common teardown as
 * func_ov036_022039a0, then freeing it. Returns the now-invalid pointer.
 */
extern "C" void *func_ov036_022039e8(void *object)
{
    FIELD(const void *, object, 0) = data_ov036_02205f64;
    func_02095308((u8 *)object + 0x9c);
    func_ov036_0220384c((u8 *)object + 0xb4);
    FIELD(const void *, object, 0x9c) = data_ov036_02205eac;
    func_02095308((u8 *)object + 0x9c);
    func_ov036_021fcf30(object);
    Heap_Free(object);
    return object;
}

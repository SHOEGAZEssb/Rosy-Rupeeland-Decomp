#include "tingle/types.h"

/* Overlay 27 trailing virtual hooks and destructor wrappers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov027_021fee60[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void func_02095308(void *);
extern void func_02095670(void *);
extern void func_ov027_021fce00(void *);
#ifdef __cplusplus
}
#endif

/* No-op virtual hook; accepts an object, changes no state, and returns void. */
extern "C" void func_ov027_021fe7f0(void *object) { (void)object; }

/* Runs overlay base teardown, frees `object`, and returns its old address. */
extern "C" void *func_ov027_021fe7f4(void *object)
{
    func_ov027_021fce00(object);
    Heap_Free(object);
    return object;
}

/* Runs overlay base teardown without freeing and returns `object`. */
extern "C" void *func_ov027_021fe810(void *object)
{
    func_ov027_021fce00(object);
    return object;
}

/* Runs common sprite teardown, frees `object`, and returns its old address. */
extern "C" void *func_ov027_021fe824(void *object)
{
    func_02095670(object);
    Heap_Free(object);
    return object;
}

/* Runs common sprite teardown without freeing and returns `object`. */
extern "C" void *func_ov027_021fe840(void *object)
{
    func_02095670(object);
    return object;
}

/* Runs common sprite teardown, frees `object`, and returns its old address. */
extern "C" void *func_ov027_021fe854(void *object)
{
    func_02095670(object);
    Heap_Free(object);
    return object;
}

/* Runs common sprite teardown without freeing and returns `object`. */
extern "C" void *func_ov027_021fe870(void *object)
{
    func_02095670(object);
    return object;
}

/*
 * Restores vtable 0x021FEE60, runs common teardown, frees the allocation, and
 * returns its old address.
 */
extern "C" void *func_ov027_021fe884(void *object)
{
    FIELD(const void *, object, 0) = data_ov027_021fee60;
    func_02095308(object);
    Heap_Free(object);
    return object;
}

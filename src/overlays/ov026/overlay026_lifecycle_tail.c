#include "tingle/types.h"

/* Overlay 26 trailing virtual hooks and destructor wrappers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov026_022048b8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void PresentationList_DeleteAll(void *);
extern void func_ov026_021fce50(void *);
#ifdef __cplusplus
}
#endif

/* No-op virtual hook; accepts an object, changes no state, and returns void. */
extern "C" void func_ov026_02203ff8(void *object)
{
    (void)object;
}

/* Runs the common base teardown, frees `object`, and returns its old address. */
extern "C" void *func_ov026_02203ffc(void *object)
{
    func_ov026_021fce50(object);
    Heap_Free(object);
    return object;
}

/* Runs the common base teardown without freeing and returns `object`. */
extern "C" void *func_ov026_02204018(void *object)
{
    func_ov026_021fce50(object);
    return object;
}

/* Runs the common base teardown, frees `object`, and returns its old address. */
extern "C" void *func_ov026_0220402c(void *object)
{
    func_ov026_021fce50(object);
    Heap_Free(object);
    return object;
}

/* Runs the common base teardown without freeing and returns `object`. */
extern "C" void *func_ov026_02204048(void *object)
{
    func_ov026_021fce50(object);
    return object;
}

/* Runs the common base teardown without freeing and returns `object`. */
extern "C" void *func_ov026_0220405c(void *object)
{
    func_ov026_021fce50(object);
    return object;
}

/*
 * Restores vtable 0x022048B8, resets the embedded controller at object base,
 * frees the allocation, and returns its old address.
 */
extern "C" void *func_ov026_02204070(void *object)
{
    FIELD(const void *, object, 0) = data_ov026_022048b8;
    PresentationList_DeleteAll(object);
    Heap_Free(object);
    return object;
}

#include "tingle/types.h"

/* Overlay 36 terminal no-op and ownership-specific teardown thunks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205eac[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov036_021fcf30(void *object);
extern void GraphicsResourceSetVariant_Destroy(void *resourceSet);
extern void PresentationList_DeleteAll(void *list);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/* Recovered no-op callback: ignores input, changes nothing, and returns nothing. */
extern "C" void func_ov036_02204c84(void *unused)
{
    (void)unused;
}

/* Runs common object teardown, frees object, and returns the invalid pointer. */
extern "C" void *func_ov036_02204c88(void *object)
{
    func_ov036_021fcf30(object);
    Heap_Free(object);
    return object;
}

/* Runs common object teardown without freeing and returns object. */
extern "C" void *func_ov036_02204ca4(void *object)
{
    func_ov036_021fcf30(object);
    return object;
}

/* Runs common object teardown, frees object, and returns the invalid pointer. */
extern "C" void *func_ov036_02204cb8(void *object)
{
    func_ov036_021fcf30(object);
    Heap_Free(object);
    return object;
}

/* Runs common object teardown without freeing and returns object. */
extern "C" void *func_ov036_02204cd4(void *object)
{
    func_ov036_021fcf30(object);
    return object;
}

/* Runs common object teardown, frees object, and returns the invalid pointer. */
extern "C" void *func_ov036_02204ce8(void *object)
{
    func_ov036_021fcf30(object);
    Heap_Free(object);
    return object;
}

/* Runs common object teardown without freeing and returns object. */
extern "C" void *func_ov036_02204d04(void *object)
{
    func_ov036_021fcf30(object);
    return object;
}

/* Runs common object teardown without freeing and returns object. */
extern "C" void *func_ov036_02204d18(void *object)
{
    func_ov036_021fcf30(object);
    return object;
}

/*
 * Destroys inherited resource set +0xCC without freeing object. Returns object;
 * resource ownership changes.
 */
extern "C" void *func_ov036_02204d2c(void *object)
{
    GraphicsResourceSetVariant_Destroy((u8 *)object + 0xcc);
    return object;
}

/*
 * Restores the common list vtable, tears down the list through PresentationList_DeleteAll,
 * frees it, and returns the now-invalid pointer.
 */
extern "C" void *func_ov036_02204d44(void *list)
{
    FIELD(const void *, list, 0) = data_ov036_02205eac;
    PresentationList_DeleteAll(list);
    Heap_Free(list);
    return list;
}

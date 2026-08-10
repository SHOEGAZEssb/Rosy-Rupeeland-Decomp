#include "tingle/types.h"

/* Overlay 25 controller deleting and non-deleting destructor thunks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov025_02203318[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void func_02095308(void *);
extern void func_0209548c(void *);
#ifdef __cplusplus
}
#endif

/* Runs the derived controller destructor, frees it, and returns its address. */
extern "C" void *func_ov025_02202c20(void *object)
{
    func_0209548c(object);
    Heap_Free(object);
    return object;
}

/* Runs the derived controller destructor without freeing and returns `object`. */
extern "C" void *func_ov025_02202c3c(void *object)
{
    func_0209548c(object);
    return object;
}

/*
 * Restores vtable data_ov025_02203318, runs the base destructor, frees the
 * allocation, and returns its original address as required by the ABI thunk.
 */
extern "C" void *func_ov025_02202c50(void *object)
{
    FIELD(const void *, object, 0) = data_ov025_02203318;
    func_02095308(object);
    Heap_Free(object);
    return object;
}

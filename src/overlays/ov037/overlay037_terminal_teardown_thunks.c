#include "tingle/types.h"

/* Overlay 37 terminal deleting/non-deleting destructor thunks and no-op hooks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov037_021fedac[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsResourceSetVariant_Destroy(void *state);
extern void func_02095670(void *object);
extern void func_ov037_021fcf1c(void *object);
extern void func_02095308(void *container);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/* Releases +0xA0, runs common teardown, frees object, and returns its old address. */
extern "C" void *func_ov037_021fe99c(void *object)
{
    GraphicsResourceSetVariant_Destroy((u8 *)object + 0xa0);
    func_02095670(object);
    Heap_Free(object);
    return object;
}

/* Releases +0xA0 and runs common teardown without freeing; returns object. */
extern "C" void *func_ov037_021fe9c4(void *object)
{
    GraphicsResourceSetVariant_Destroy((u8 *)object + 0xa0);
    func_02095670(object);
    return object;
}

/* Invokes the recovered no-op base hook, frees object, and returns its old address. */
extern "C" void *func_ov037_021fe9e4(void *object)
{
    func_ov037_021fcf1c(object);
    Heap_Free(object);
    return object;
}

/* Invokes the recovered no-op base hook without freeing and returns object. */
extern "C" void *func_ov037_021fea00(void *object)
{
    func_ov037_021fcf1c(object);
    return object;
}

/* No-op hook: ignores arguments, changes no state, and returns immediately. */
extern "C" void func_ov037_021fea14(void)
{
}

/* Second deleting no-op-base thunk; frees object and returns its old address. */
extern "C" void *func_ov037_021fea18(void *object)
{
    func_ov037_021fcf1c(object);
    Heap_Free(object);
    return object;
}

/* Second non-deleting no-op-base thunk; returns object. */
extern "C" void *func_ov037_021fea34(void *object)
{
    func_ov037_021fcf1c(object);
    return object;
}

/* Third deleting no-op-base thunk; frees object and returns its old address. */
extern "C" void *func_ov037_021fea48(void *object)
{
    func_ov037_021fcf1c(object);
    Heap_Free(object);
    return object;
}

/* Third non-deleting no-op-base thunk; returns object. */
extern "C" void *func_ov037_021fea64(void *object)
{
    func_ov037_021fcf1c(object);
    return object;
}

/* Terminal no-op hook: changes no state and returns immediately. */
extern "C" void func_ov037_021fea78(void)
{
}

/* Reinstalls the container vtable, tears it down, frees it, and returns its old address. */
extern "C" void *func_ov037_021fea7c(void *container)
{
    FIELD(const void *, container, 0) = data_ov037_021fedac;
    func_02095308(container);
    Heap_Free(container);
    return container;
}

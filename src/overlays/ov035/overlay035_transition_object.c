#include "tingle/types.h"

/* Overlay 35 transition synchronization and a small owned resource wrapper. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern const u8 data_ov035_02203ce8[];
extern const u8 data_ov035_02203d30[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DSceneState_Apply(void *state);
extern void GraphicsAnimationInstanceManager_Render(void *resourceSet, void *transform);
extern void func_020949ec(void *object);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *Graphics3DResourceBinding_Init(void *allocation, void *resourceContext,
                          s32 argument, s32 firstId, s32 secondId);
extern void Graphics3DResourceBinding_Destroy(void *resource);
extern void Heap_Free(void *allocation);
extern void func_ov035_021fcf30(void);
#ifdef __cplusplus
}
#endif

/*
 * Advances embedded transition state +0x0C, then synchronizes transform +0x64
 * into resource set +0x100. Returns no value; transition/resource renderer
 * state changes, with no direct hardware access.
 */
extern "C" void func_ov035_021fe5cc(void *scene)
{
    Graphics3DSceneState_Apply((u8 *)scene + 0x0c);
    GraphicsAnimationInstanceManager_Render(FIELD(void *, scene, 0x100), (u8 *)scene + 0x64);
}

/*
 * Constructs a resource wrapper after common base initialization. It allocates
 * an 0x18-byte payload and, on success, initializes it from the global resource
 * context using caller argument and IDs 0x612E/0x612F. The payload is stored at
 * +0x9C. Returns the wrapper; heap/resource state changes, without direct MMIO.
 */
extern "C" void *func_ov035_021fe5ec(void *object, s32 argument)
{
    func_020949ec(object);
    FIELD(const void *, object, 0) = data_ov035_02203ce8;
    void *resource =
        Heap_Alloc(0x18, data_ov035_02203d30, 4, gHeapContext);
    if (resource != 0)
        resource = Graphics3DResourceBinding_Init(resource, data_020f4e18[0], argument,
                                 0x612e, 0x612f);
    FIELD(void *, object, 0x9c) = resource;
    return object;
}

/*
 * Non-deleting destructor: destroys and frees owned payload +0x9C when present,
 * invokes the empty recovered base hook, and returns the wrapper. Heap/resource
 * state changes; the wrapper itself remains allocated and no MMIO occurs.
 */
extern "C" void *func_ov035_021fe65c(void *object)
{
    FIELD(const void *, object, 0) = data_ov035_02203ce8;
    void *resource = FIELD(void *, object, 0x9c);
    if (resource != 0) {
        Graphics3DResourceBinding_Destroy(resource);
        Heap_Free(resource);
    }
    func_ov035_021fcf30();
    return object;
}

/*
 * Deleting destructor: performs the same payload/base cleanup as the
 * non-deleting form, frees the wrapper, and returns its original invalid
 * address. Heap/resource ownership changes and no direct MMIO occurs.
 */
extern "C" void *func_ov035_021fe69c(void *object)
{
    FIELD(const void *, object, 0) = data_ov035_02203ce8;
    void *resource = FIELD(void *, object, 0x9c);
    if (resource != 0) {
        Graphics3DResourceBinding_Destroy(resource);
        Heap_Free(resource);
    }
    func_ov035_021fcf30();
    Heap_Free(object);
    return object;
}

#include "tingle/types.h"

/* Overlay 37 ownership wrapper for one heap-allocated 3D resource binding. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov037_021fee5c[];
extern const u8 data_ov037_021feea8[];
extern void *gHeapContext;
extern void *data_020f4e18[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Presentation_Init(void *object);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern void *Graphics3DResourceBinding_Init(void *binding, void *archive, void *owner,
                           s32 modelId, s32 textureId);
extern void Graphics3DResourceBinding_Destroy(void *binding);
extern void func_ov037_021fcf1c(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Initializes a common 3D object, installs the overlay vtable, allocates an
 * 0x18-byte resource binding, and initializes it from the shared archive with
 * owner and resource IDs 0x612A/0x612B. The binding (or null on allocation
 * failure) is retained at +0x9C. Returns object; heap/archive state may change.
 */
extern "C" void *func_ov037_021fd22c(void *object, void *owner)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov037_021fee5c;
    void *binding = Heap_Alloc(0x18, data_ov037_021feea8, 4, gHeapContext);
    if (binding != 0)
        binding = Graphics3DResourceBinding_Init(binding, data_020f4e18[0], owner,
                                0x612a, 0x612b);
    FIELD(void *, object, 0x9c) = binding;
    return object;
}

/*
 * Releases the binding at +0x9C when present, calls the recovered no-op base
 * teardown hook, and returns object without freeing it. Heap/resource state
 * changes; the retained pointer is not cleared because the object is ending.
 */
extern "C" void *func_ov037_021fd29c(void *object)
{
    FIELD(const void *, object, 0) = data_ov037_021fee5c;
    void *binding = FIELD(void *, object, 0x9c);
    if (binding != 0) {
        Graphics3DResourceBinding_Destroy(binding);
        Heap_Free(binding);
    }
    func_ov037_021fcf1c(object);
    return object;
}

/*
 * Deleting variant of the resource-owner teardown: releases the binding,
 * invokes the no-op base hook, frees object itself, and returns its former
 * address for ABI compatibility. Heap/resource state changes.
 */
extern "C" void *func_ov037_021fd2dc(void *object)
{
    FIELD(const void *, object, 0) = data_ov037_021fee5c;
    void *binding = FIELD(void *, object, 0x9c);
    if (binding != 0) {
        Graphics3DResourceBinding_Destroy(binding);
        Heap_Free(binding);
    }
    func_ov037_021fcf1c(object);
    Heap_Free(object);
    return object;
}

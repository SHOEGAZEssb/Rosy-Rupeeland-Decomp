#include "tingle/types.h"

/* Overlay 36 render-object ownership of a small external graphics resource. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205ff0[];
extern const u8 data_ov036_02206140[];
extern void *data_020f4e18;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Presentation_Init(void *object);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern void *Graphics3DResourceBinding_Init(void *resource, void *context, s32 selector,
                           s32 firstId, s32 secondId);
extern void Graphics3DResourceBinding_Destroy(void *resource);
extern void *func_ov036_021fcf30(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a common render object and installs vtable-like data
 * data_ov036_02205FF0. It allocates a 0x18-byte resource at +0x9C and, when
 * successful, initializes it with selector, global context data_020F4E18,
 * and IDs 0x6132/0x6133. Returns object; object, heap, and resource state can
 * change. A failed allocation leaves +0x9C null.
 */
extern "C" void *func_ov036_021fdf30(void *object, s32 selector)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov036_02205ff0;
    void *resource = Heap_Alloc(0x18, data_ov036_02206140, 4, gHeapContext);
    if (resource != 0)
        resource = Graphics3DResourceBinding_Init(resource, data_020f4e18, selector,
                                 0x6132, 0x6133);
    FIELD(void *, object, 0x9c) = resource;
    return object;
}

/*
 * Destroys the owned resource at +0x9C when present, then runs the common
 * render-object destructor without freeing object itself. The vtable-like
 * word is reset first. Returns object; resource and base-object state change.
 */
extern "C" void *func_ov036_021fdfa0(void *object)
{
    FIELD(const void *, object, 0) = data_ov036_02205ff0;
    void *resource = FIELD(void *, object, 0x9c);
    if (resource != 0) {
        Graphics3DResourceBinding_Destroy(resource);
        Heap_Free(resource);
    }
    func_ov036_021fcf30(object);
    return object;
}

/*
 * Fully deletes the object: it performs the same owned-resource and common
 * base destruction as func_ov036_021fdfa0, then frees object itself. Returns
 * the now-invalid original pointer, matching the address-derived ABI.
 */
extern "C" void *func_ov036_021fdfe0(void *object)
{
    FIELD(const void *, object, 0) = data_ov036_02205ff0;
    void *resource = FIELD(void *, object, 0x9c);
    if (resource != 0) {
        Graphics3DResourceBinding_Destroy(resource);
        Heap_Free(resource);
    }
    func_ov036_021fcf30(object);
    Heap_Free(object);
    return object;
}

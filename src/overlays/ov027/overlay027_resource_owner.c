#include "tingle/types.h"

/* Overlay 27 model-resource owner construction and destruction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov027_021feed0[];
extern const u8 data_ov027_021fef1c[];
extern void *data_020f4e18;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern void Presentation_Init(void *);
extern void *Graphics3DResourceBinding_Init(void *, void *, s32, s32, s32);
extern void Graphics3DResourceBinding_Destroy(void *);
#ifdef __cplusplus
}
#endif

/* No-op base teardown hook; accepts an object and returns void. */
extern "C" void func_ov027_021fce00(void *object)
{
    (void)object;
}

/*
 * Initializes `object`, installs vtable 0x021FEED0, allocates its 0x18-byte
 * resource owner at +0x9C from heap 4, and constructs it from `resource_id`
 * with fixed resources 0x6124/0x6125. Returns `object`; allocation failure
 * leaves +0x9C null.
 */
extern "C" void *func_ov027_021fce04(void *object, s32 resource_id)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov027_021feed0;
    void *resource = Heap_Alloc(0x18, data_ov027_021fef1c, 4, gHeapContext);
    if (resource)
        resource = Graphics3DResourceBinding_Init(resource, data_020f4e18, resource_id,
                                  0x6124, 0x6125);
    FIELD(void *, object, 0x9c) = resource;
    return object;
}

/*
 * Restores vtable 0x021FEED0, destroys and frees resource +0x9C when present,
 * invokes the no-op base hook, and returns `object` without freeing it.
 */
extern "C" void *func_ov027_021fce74(void *object)
{
    FIELD(const void *, object, 0) = data_ov027_021feed0;
    void *resource = FIELD(void *, object, 0x9c);
    if (resource) {
        Graphics3DResourceBinding_Destroy(resource);
        Heap_Free(resource);
    }
    func_ov027_021fce00(object);
    return object;
}

/* Performs the +0x9C resource teardown, frees `object`, and returns its address. */
extern "C" void *func_ov027_021fceb4(void *object)
{
    func_ov027_021fce74(object);
    Heap_Free(object);
    return object;
}

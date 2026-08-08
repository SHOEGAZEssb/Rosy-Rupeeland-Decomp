#include "tingle/types.h"

/* Overlay 36 second externally backed render-object resource specialization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_022060d0[];
extern const u8 data_ov036_02206140[];
extern void *data_020f4e18;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020949ec(void *object);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern void *func_02077ca0(void *resource, void *archive, void *owner,
                           s32 firstId, s32 secondId);
extern void func_02077d08(void *resource);
extern void *func_ov036_021fcf30(void *object);
extern void func_ov036_021fe028(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a common render object with vtable-like data
 * data_ov036_022060D0. It allocates a 0x18-byte resource at +0x9C and initializes
 * it from archive data_020F4E18, owner, and IDs 0x612C/0x612D. Returns object;
 * object, heap, and resource state change. Allocation failure leaves +0x9C null.
 */
extern "C" void *func_ov036_021fffa4(void *object, void *owner)
{
    func_020949ec(object);
    FIELD(const void *, object, 0) = data_ov036_022060d0;
    void *resource = Heap_Alloc(0x18, data_ov036_02206140, 4, gHeapContext);
    if (resource != 0)
        resource = func_02077ca0(resource, data_020f4e18, owner,
                                 0x612c, 0x612d);
    FIELD(void *, object, 0x9c) = resource;
    return object;
}

/*
 * Destroys and frees owned resource +0x9C, then invokes the common render base
 * destructor without freeing object. Returns object; resource and base state change.
 */
extern "C" void *func_ov036_02200014(void *object)
{
    FIELD(const void *, object, 0) = data_ov036_022060d0;
    void *resource = FIELD(void *, object, 0x9c);
    if (resource != 0) {
        func_02077d08(resource);
        Heap_Free(resource);
    }
    func_ov036_021fcf30(object);
    return object;
}

/*
 * Fully deletes the object by performing the same resource/base teardown as
 * func_ov036_02200014, then freeing object. Returns the invalid original pointer.
 */
extern "C" void *func_ov036_02200054(void *object)
{
    FIELD(const void *, object, 0) = data_ov036_022060d0;
    void *resource = FIELD(void *, object, 0x9c);
    if (resource != 0) {
        func_02077d08(resource);
        Heap_Free(resource);
    }
    func_ov036_021fcf30(object);
    Heap_Free(object);
    return object;
}

/*
 * Draws this resource specialization with the same confirmed GX matrix,
 * polygon, texture, and quad-submission path as func_ov036_021fe028. It returns
 * nothing and directly changes Nintendo DS GX state; resource +0x9C is read.
 */
extern "C" void func_ov036_0220009c(void *object)
{
    func_ov036_021fe028(object);
}

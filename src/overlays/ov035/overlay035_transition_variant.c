#include "tingle/types.h"

/* Overlay 35 second transition-resource wrapper using resource IDs 0x6130/31. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

extern void *data_020f4e18[];
extern const u8 data_ov035_02203ccc[];
extern const u8 data_ov035_02203d30[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020949ec(void *object);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *Graphics3DResourceBinding_Init(void *allocation, void *resourceContext,
                          s32 argument, s32 firstId, s32 secondId);
extern void Graphics3DResourceBinding_Destroy(void *resource);
extern void Heap_Free(void *allocation);
extern void func_ov035_021fcf30(void);
extern s32 Graphics3DResourceBinding_GetTextureFormat(void *resource);
extern s32 Graphics3DResourceBinding_GetTextureWidthClass(void *resource);
extern s32 Graphics3DResourceBinding_GetTextureHeightClass(void *resource);
extern s32 func_02070454(void *record);
extern s32 func_02070464(void *record);
extern void func_ov035_021fd7b0(s32 format, s32 transform, s32 sizeS,
                               s32 sizeT, s32 repeatS, s32 repeatT,
                               s32 flip, u32 address);
extern void func_ov035_021fd128(s32 lightMask, s32 polygonMode, s32 cullMode,
                               s32 polygonId, s32 alpha, s32 miscBits);
extern void func_ov035_021fe88c(u32 paletteBase, s32 format);
extern void func_ov035_021fe8b0(s32 s, s32 t);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the second transition wrapper. After common base initialization,
 * it allocates an 0x18-byte payload and initializes it from the global resource
 * context, caller argument, and IDs 0x6130/0x6131. The result is stored at
 * +0x9C. Returns the wrapper; heap/resource state changes, without MMIO.
 */
extern "C" void *func_ov035_021fe8e4(void *object, s32 argument)
{
    func_020949ec(object);
    FIELD(const void *, object, 0) = data_ov035_02203ccc;
    void *resource =
        Heap_Alloc(0x18, data_ov035_02203d30, 4, gHeapContext);
    if (resource != 0)
        resource = Graphics3DResourceBinding_Init(resource, data_020f4e18[0], argument,
                                 0x6130, 0x6131);
    FIELD(void *, object, 0x9c) = resource;
    return object;
}

/*
 * Non-deleting destructor: destroys/frees payload +0x9C, invokes the empty base
 * hook, and returns the wrapper without freeing it. Heap/resource state changes.
 */
extern "C" void *func_ov035_021fe954(void *object)
{
    FIELD(const void *, object, 0) = data_ov035_02203ccc;
    void *resource = FIELD(void *, object, 0x9c);
    if (resource != 0) {
        Graphics3DResourceBinding_Destroy(resource);
        Heap_Free(resource);
    }
    func_ov035_021fcf30();
    return object;
}

/*
 * Deleting destructor: performs the same payload/base cleanup, frees the
 * wrapper, and returns its original invalid address. No direct MMIO occurs.
 */
extern "C" void *func_ov035_021fe994(void *object)
{
    FIELD(const void *, object, 0) = data_ov035_02203ccc;
    void *resource = FIELD(void *, object, 0x9c);
    if (resource != 0) {
        Graphics3DResourceBinding_Destroy(resource);
        Heap_Free(resource);
    }
    func_ov035_021fcf30();
    Heap_Free(object);
    return object;
}

/*
 * Draws the second transition resource as a textured GX quad. It loads object
 * translation, applies fixed scale 0x18000/0x10000/0x1000, programs texture
 * attributes with transform mode 3, repeat/flip values 3/0/1, and uses resource
 * dimensions for texture coordinates. Polygon ID 0x14 and alpha 31 are used;
 * recovered vertices span packed +/-0x80 values. Returns no value and directly
 * changes Nintendo DS GX MMIO plus resource-query state.
 */
extern "C" void func_ov035_021fe9dc(void *object)
{
    REG32(0x04000444) = 0;
    REG32(0x04000470) = FIELD(u32, object, 0x10);
    REG32(0x04000470) = FIELD(u32, object, 0x20);
    REG32(0x04000470) = FIELD(u32, object, 0x30);
    REG32(0x0400046c) = 0x18000;
    REG32(0x0400046c) = 0x10000;
    REG32(0x0400046c) = 0x1000;

    void *resource = FIELD(void *, object, 0x9c);
    s32 textureBase = Graphics3DResourceBinding_GetTextureFormat(resource);
    s32 format = Graphics3DResourceBinding_GetTextureWidthClass(resource);
    s32 sizeT = Graphics3DResourceBinding_GetTextureHeightClass(resource);
    u32 address = FIELD(u32, FIELD(void *, resource, 0x10), 0x0c);
    func_ov035_021fd7b0(textureBase, 3, format, sizeT, 3, 0, 1, address);
    u32 paletteBase = FIELD(u32, FIELD(void *, resource, 0x14), 0x0c);
    func_ov035_021fe88c(paletteBase, Graphics3DResourceBinding_GetTextureFormat(resource));

    void *record = FIELD(void *, resource, 4);
    s32 width = func_02070454(record) << 12;
    s32 height = func_02070464(record) << 12;
    func_ov035_021fd128(0, 0, 3, 0x14, 0x1f, 0);
    REG32(0x04000500) = 1;
    REG32(0x04000480) = 0x7fff;
    func_ov035_021fe8b0(0, height);
    REG32(0x0400048c) = 0xff80ff80;
    REG32(0x0400048c) = 0;
    func_ov035_021fe8b0(width, height);
    REG32(0x04000494) = 0xff800080;
    func_ov035_021fe8b0(width, 0);
    REG32(0x04000494) = 0x00800080;
    REG32(0x04000488) = 0;
    REG32(0x04000494) = 0x0080ff80;
    REG32(0x04000504) = 0;
    REG32(0x04000448) = 1;
}

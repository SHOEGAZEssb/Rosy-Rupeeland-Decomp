#include "tingle/types.h"

/* Overlay 26 generated ring renderer and lightweight model-resource owner. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 gFx32CosSinTable[];
extern void *data_020f4e18;
extern const u8 data_ov026_02204998[];
extern const u8 data_ov026_022049ec[];
extern const u8 data_ov026_02204a40[];
extern const u8 data_ov026_02204a48[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern void *Heap_AllocCore(u32, const void *, u32, void *);
extern void Heap_FreeCore(void *);
extern void *Graphics3DResourceBinding_Init(void *, void *, s32, s32, s32);
extern void Graphics3DResourceBinding_Destroy(void *);
extern void Presentation_Init(void *);
extern void func_020afddc(void *);
extern void func_020afe00(void *, s32);
extern void func_020afe64(void *, ...);
extern void func_020afebc(void *, ...);
extern void func_020aff38(void *, s32, s32, s32);
extern void func_020b0000(void *, s32);
extern void func_020b241c(void *);
extern void func_020b24cc(void *, void *, u32);
extern void func_020b4554(void *, s32);
extern void func_01ff88c4(s32, const void *, s32);
extern void func_ov026_021fce50(void *);
extern s32 func_ov026_021fd018(const u32 *);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a 0xB8-byte renderer, allocates a 0x200-byte list buffer at +0xB0,
 * initializes builder +0x9C, emits a 17-segment ring using the fixed-point
 * sine/cosine table and texture coordinates 0/0x7E08, then finalizes the list.
 * Scale +0xB4 starts at 0x1000. Returns `object`; allocation uses heap 4.
 */
extern "C" void *func_ov026_021fd370(void *object)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov026_022049ec;
    FIELD(s32, object, 0xb4) = 0x1000;
    void *buffer = Heap_AllocCore(0x200, data_ov026_02204a48, 4, gHeapContext);
    FIELD(void *, object, 0xb0) = buffer;
    func_020b24cc((u8 *)object + 0x9c, buffer, 0x200);
    func_020afebc((u8 *)object + 0x9c, 1, 0, 1, 0, 0x1f, 0);
    func_020afe64((u8 *)object + 0x9c, 0, 0, 0, 0, 0, 0, 0, 0);
    func_020afe00((u8 *)object + 0x9c, 2);
    for (s32 i = 0; i <= 16; ++i) {
        s32 angle = (i * 0x1000) >> 4;
        s32 sine = gFx32CosSinTable[angle * 2];
        s32 cosine = gFx32CosSinTable[angle * 2 + 1];
        func_020b0000((u8 *)object + 0x9c, 0);
        func_020aff38((u8 *)object + 0x9c, sine, 0x1000, cosine);
        func_020b0000((u8 *)object + 0x9c, 0x7e08);
        func_020aff38((u8 *)object + 0x9c, sine, 0, cosine);
    }
    func_020afddc((u8 *)object + 0x9c);
    func_020b241c((u8 *)object + 0x9c);
    func_020b4554(FIELD(void *, object, 0xa4),
                  func_ov026_021fd018((const u32 *)((u8 *)object + 0x9c)));
    return object;
}

/* Releases ring list buffer +0xB0, calls the base hook, and returns `object`. */
extern "C" void *func_ov026_021fd4e0(void *object)
{
    FIELD(const void *, object, 0) = data_ov026_022049ec;
    Heap_FreeCore(FIELD(void *, object, 0xb0));
    func_ov026_021fce50(object);
    return object;
}

/* Performs the ring destructor, frees storage, and returns the original pointer. */
extern "C" void *func_ov026_021fd50c(void *object)
{
    func_ov026_021fd4e0(object);
    Heap_Free(object);
    return object;
}

/*
 * Submits the ring list after streaming translation and +0x70/+0xB4 scale to
 * the geometry command ports. Returns void; directly drives DS geometry HW.
 */
extern "C" void func_ov026_021fd540(void *object)
{
    volatile u32 *const matrix_port = (volatile u32 *)0x04000444;
    volatile u32 *const scale_port = (volatile u32 *)0x0400046c;
    volatile u32 *const swap_buffers = (volatile u32 *)0x04000448;
    *matrix_port = 0;
    *matrix_port = FIELD(u32, object, 0x10);
    *matrix_port = FIELD(u32, object, 0x20);
    *matrix_port = FIELD(u32, object, 0x30);
    *scale_port = FIELD(u32, object, 0x70);
    *scale_port = FIELD(u32, object, 0xb4);
    *scale_port = FIELD(u32, object, 0x70);
    func_01ff88c4(3, FIELD(void *, object, 0xa4),
                  func_ov026_021fd018((const u32 *)((u8 *)object + 0x9c)));
    *swap_buffers = 1;
}

/*
 * Constructs a 0xA4-byte resource owner from `resource_id`. It allocates and
 * constructs an 0x18-byte model resource at +0x9C using fixed IDs 0x612A/612B,
 * clears field +0xA0, and returns `object`.
 */
extern "C" void *func_ov026_021fd5b0(void *object, s32 resource_id)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov026_02204998;
    void *resource = Heap_Alloc(0x18, data_ov026_02204a40, 4, gHeapContext);
    if (resource)
        resource = Graphics3DResourceBinding_Init(resource, data_020f4e18, resource_id,
                                 0x612a, 0x612b);
    FIELD(void *, object, 0x9c) = resource;
    FIELD(s32, object, 0xa0) = 0;
    return object;
}

/* Destroys/frees owned resource +0x9C, calls the base hook, and returns object. */
extern "C" void *func_ov026_021fd628(void *object)
{
    FIELD(const void *, object, 0) = data_ov026_02204998;
    void *resource = FIELD(void *, object, 0x9c);
    if (resource) {
        Graphics3DResourceBinding_Destroy(resource);
        Heap_Free(resource);
    }
    func_ov026_021fce50(object);
    return object;
}

/* Performs the resource-owner destructor, frees storage, and returns object. */
extern "C" void *func_ov026_021fd668(void *object)
{
    func_ov026_021fd628(object);
    Heap_Free(object);
    return object;
}

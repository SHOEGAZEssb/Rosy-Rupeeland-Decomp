#include "tingle/types.h"

/* Overlay 26 randomized particle geometry submission and its model-resource owner. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern void *data_020f4e18;
extern const u8 data_ov026_022049b4[];
extern const u8 data_ov026_02204a40[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern void *Graphics3DResourceBinding_Init(void *, void *, s32, s32, s32);
extern void Graphics3DResourceBinding_Destroy(void *);
extern s32 func_0209189c(void *, s32, ...);
extern s32 func_020918f4(void *, s32);
extern void Presentation_Init(void *);
extern void func_ov026_021fce50(void *);
extern void func_ov026_021fd900(u32, u32, u32, u32, u32, u32, u32, u32);
extern void func_ov026_021fd964(u32, u32, u32, u32, u32, u32);
#ifdef __cplusplus
}
#endif

/*
 * Draws +0xB8 randomized particles using the PRNG state at +0xC0, refreshed
 * from +0xC4 each frame. Translation +0x10..+0x30 is streamed to the geometry
 * matrix port; +0xBC supplies the packed color. Radius and angle ranges come
 * from +0x9C/+0xA0, while vertical offsets use +0xA4/+0xA8/+0xAC. Each particle
 * emits two packed vertices through ports 0x48C/0x494. Returns void and directly
 * drives Nintendo DS geometry registers.
 */
extern "C" void func_ov026_021fe72c(void *object)
{
    FIELD(u32, object, 0xc0) = FIELD(u32, object, 0xc4);
    volatile u32 *const matrix = (volatile u32 *)0x04000444;
    matrix[0] = 0;
    matrix[0xb] = FIELD(u32, object, 0x10);
    matrix[0xb] = FIELD(u32, object, 0x20);
    matrix[0xb] = FIELD(u32, object, 0x30);
    func_ov026_021fd964(0, 0, 3, 0x17, 0x1f, 0);
    func_ov026_021fd900(0, 0, 0, 0, 0, 0, 0, 0);
    *(volatile u32 *)0x04000480 = FIELD(u16, object, 0xbc);
    *(volatile u32 *)0x04000500 = 0;

    for (s32 i = 0; i < FIELD(s32, object, 0xb8); ++i) {
        s32 radius = func_0209189c((u8 *)object + 0xc0,
                                   FIELD(s32, object, 0x9c),
                                   FIELD(s32, object, 0xa0));
        s32 angle = func_020918f4((u8 *)object + 0xc0, 0x1000);
        s32 table_index = (angle << 4) >> 4;
        s32 y0 = FIELD(s32, object, 0xac) +
                 func_0209189c((u8 *)object + 0xc0,
                                -FIELD(s32, object, 0xa8));
        s32 y1 = FIELD(s32, object, 0xac) - FIELD(s32, object, 0xa4) +
                 func_0209189c((u8 *)object + 0xc0,
                                -FIELD(s32, object, 0xa8));
        s32 x = (data_020c9670[table_index * 2] * radius + 0x800) >> 12;
        s32 z = (data_020c9670[table_index * 2 + 1] * radius + 0x800) >> 12;
        *(volatile u32 *)0x0400048c = (u16)y0 | ((u32)(u16)x << 16);
        *(volatile u32 *)0x0400048c = (u16)y1 | ((u32)(u16)x << 16);
        *(volatile u32 *)0x04000494 = (u16)z | ((u32)(u16)y0 << 16);
        *(volatile u32 *)0x04000494 = (u16)x | ((u32)(u16)y1 << 16);
    }
    *(volatile u32 *)0x04000504 = 0;
    *(volatile u32 *)0x04000448 = 1;
}

/*
 * Stores particle color/count and six range parameters. Arguments after
 * `range_min` arrive on the stack in the original ABI; no validation occurs.
 */
extern "C" void func_ov026_021fe8fc(void *object, u16 color, s32 count,
                                     s32 range_min, s32 range_max,
                                     s32 vertical_span, s32 jitter,
                                     s32 step)
{
    FIELD(u16, object, 0xbc) = color;
    FIELD(s32, object, 0xb8) = count;
    FIELD(s32, object, 0x9c) = range_min;
    FIELD(s32, object, 0xa0) = range_max;
    FIELD(s32, object, 0xa4) = vertical_span;
    FIELD(s32, object, 0xa8) = jitter;
    FIELD(s32, object, 0xb0) = step;
}

/*
 * Constructs a 0xAC-byte model-resource owner from `resource_id`, using fixed
 * resource IDs 0x6120/0x6121. Defaults are +0xA0=4, +0xA4=0x666,
 * +0xA8=0x7FFF, and +0xAA=0x1F. Returns object; allocation uses heap 4.
 */
extern "C" void *func_ov026_021fe92c(void *object, s32 resource_id)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov026_022049b4;
    void *resource = Heap_Alloc(0x18, data_ov026_02204a40, 4, gHeapContext);
    if (resource)
        resource = Graphics3DResourceBinding_Init(resource, data_020f4e18, resource_id,
                                 0x6120, 0x6121);
    FIELD(void *, object, 0x9c) = resource;
    FIELD(s32, object, 0xa0) = 4;
    FIELD(s32, object, 0xa4) = 0x666;
    FIELD(u16, object, 0xa8) = 0x7fff;
    FIELD(u16, object, 0xaa) = 0x1f;
    return object;
}

/* Destroys/frees resource +0x9C, calls the base hook, and returns `object`. */
extern "C" void *func_ov026_021fe9c4(void *object)
{
    FIELD(const void *, object, 0) = data_ov026_022049b4;
    void *resource = FIELD(void *, object, 0x9c);
    if (resource) {
        Graphics3DResourceBinding_Destroy(resource);
        Heap_Free(resource);
    }
    func_ov026_021fce50(object);
    return object;
}

/* Performs the resource-owner destructor, frees storage, and returns object. */
extern "C" void *func_ov026_021fea04(void *object)
{
    func_ov026_021fe9c4(object);
    Heap_Free(object);
    return object;
}

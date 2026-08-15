#include "tingle/types.h"

/* Overlay 26 generated strip-mesh renderer construction, submission, and destruction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern void *data_020f4e18;
extern const u16 data_ov026_022042fc[];
extern const u16 data_ov026_022042fe[];
extern const u8 data_ov026_02204928[];
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
extern s32 Graphics3DResourceBinding_GetTextureFormat(void *);
extern s32 Graphics3DResourceBinding_GetTextureWidthClass(void *);
extern s32 Graphics3DResourceBinding_GetTextureHeightClass(void *);
extern void Presentation_Init(void *);
extern void func_020afddc(void *);
extern void func_020afe00(void *, s32);
extern void func_020afe28(void *, s32, s32);
extern void func_020afe64(void *, ...);
extern void func_020afebc(void *, ...);
extern void func_020aff38(void *, s32, s32, s32);
extern void func_020aff78(void *, s32, s32);
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
 * Constructs a 0xBC-byte renderer from resource selector `resource_id` and
 * table variant `variant`. It allocates/constructs an 0x18-byte resource, owns
 * a 0x200-byte display-list buffer at +0xB4, configures builder +0xA0 from that
 * resource, emits a 17-segment sine/cosine strip, finalizes the list, and stores
 * its byte span with the list object. Returns `object`; allocations use heap 4.
 */
extern "C" void *func_ov026_021fd030(void *object, s32 resource_id, s32 variant)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov026_02204928;
    FIELD(s32, object, 0xb8) = 0x1000;

    void *resource = Heap_Alloc(0x18, data_ov026_02204a40, 4, gHeapContext);
    if (resource) {
        s32 table_offset = variant * 4;
        resource = Graphics3DResourceBinding_Init(resource, data_020f4e18, resource_id,
                                 data_ov026_022042fc[table_offset],
                                 data_ov026_022042fe[table_offset]);
    }
    FIELD(void *, object, 0x9c) = resource;

    void *buffer = Heap_AllocCore(0x200, data_ov026_02204a48, 4, gHeapContext);
    FIELD(void *, object, 0xb4) = buffer;
    func_020b24cc((u8 *)object + 0xa0, buffer, 0x200);
    func_020afebc((u8 *)object + 0xa0, 1, 0, 1, 0, 0x1f, 0);

    s32 a = Graphics3DResourceBinding_GetTextureFormat(resource);
    s32 b = Graphics3DResourceBinding_GetTextureWidthClass(resource);
    s32 c = Graphics3DResourceBinding_GetTextureHeightClass(resource);
    s32 resource_word = FIELD(s32, FIELD(void *, resource, 0x10), 0xc);
    func_020afe64((u8 *)object + 0xa0, a, 1, b, c, 1, 1, 0,
                  resource_word);
    s32 auxiliary = FIELD(s32, FIELD(void *, resource, 0x14), 0xc);
    func_020afe28((u8 *)object + 0xa0, auxiliary,
                  Graphics3DResourceBinding_GetTextureFormat(resource));
    func_020afe00((u8 *)object + 0xa0, 2);

    for (s32 i = 0; i <= 16; ++i) {
        /* The original fixed-point arithmetic maps 17 samples around a half arc. */
        s32 angle = (i * 0x1000) >> 4;
        s32 sine = data_020c9670[angle * 2];
        s32 cosine = data_020c9670[angle * 2 + 1];
        s32 u = i * 0x2000;
        func_020aff78((u8 *)object + 0xa0, u, -0x80000);
        func_020aff38((u8 *)object + 0xa0, sine, 0x1000, cosine);
        func_020aff78((u8 *)object + 0xa0, u, 0x100000);
        func_020aff38((u8 *)object + 0xa0, sine, 0, cosine);
    }
    func_020afddc((u8 *)object + 0xa0);
    func_020b241c((u8 *)object + 0xa0);
    func_020b4554(FIELD(void *, object, 0xa8),
                  func_ov026_021fd018((const u32 *)((u8 *)object + 0xa0)));
    return object;
}

/*
 * Non-freeing renderer destructor. It restores vtable data_ov026_02204928,
 * releases the +0xB4 list buffer, destroys/frees resource +0x9C when present,
 * invokes the base hook, and returns the original object pointer.
 */
extern "C" void *func_ov026_021fd268(void *object)
{
    FIELD(const void *, object, 0) = data_ov026_02204928;
    Heap_FreeCore(FIELD(void *, object, 0xb4));
    void *resource = FIELD(void *, object, 0x9c);
    if (resource) {
        Graphics3DResourceBinding_Destroy(resource);
        Heap_Free(resource);
    }
    func_ov026_021fce50(object);
    return object;
}

/* Same destructor as 0x021FD268, then frees object storage and returns it. */
extern "C" void *func_ov026_021fd2b0(void *object)
{
    func_ov026_021fd268(object);
    Heap_Free(object);
    return object;
}

/*
 * Submits the generated display list. Translation +0x10..+0x30 and scale
 * +0x70/+0xB8 are streamed to geometry command ports, then list +0xA8 and the
 * computed builder span are passed to the low-level executor. Returns void and
 * writes directly to Nintendo DS geometry FIFO registers.
 */
extern "C" void func_ov026_021fd300(void *object)
{
    volatile u32 *const matrix_port = (volatile u32 *)0x04000444;
    volatile u32 *const scale_port = (volatile u32 *)0x0400046c;
    volatile u32 *const swap_buffers = (volatile u32 *)0x04000448;
    *matrix_port = 0;
    *matrix_port = FIELD(u32, object, 0x10);
    *matrix_port = FIELD(u32, object, 0x20);
    *matrix_port = FIELD(u32, object, 0x30);
    *scale_port = FIELD(u32, object, 0x70);
    *scale_port = FIELD(u32, object, 0xb8);
    *scale_port = FIELD(u32, object, 0x70);
    func_01ff88c4(3, FIELD(void *, object, 0xa8),
                  func_ov026_021fd018((const u32 *)((u8 *)object + 0xa0)));
    *swap_buffers = 1;
}

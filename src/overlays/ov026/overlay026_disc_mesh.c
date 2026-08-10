#include "tingle/types.h"

/* Overlay 26 textured disc/fan display-list generator. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern void *data_020f4e18;
extern const u8 data_ov026_022048c8[];
extern const u8 data_ov026_02204a40[];
extern const u8 data_ov026_02204a48[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern void *func_02002700(u32, const void *, u32, void *);
extern void func_02002728(void *);
extern void Graphics3DResourceBinding_Destroy(void *);
extern void *Graphics3DResourceBinding_Init(void *, void *, s32, s32, s32);
extern s32 func_02070454(void *);
extern s32 func_02070464(void *);
extern s32 Graphics3DResourceBinding_GetTextureFormat(void *);
extern s32 Graphics3DResourceBinding_GetTextureWidthClass(void *);
extern s32 Graphics3DResourceBinding_GetTextureHeightClass(void *);
extern void func_020afddc(void *);
extern void func_020afe00(void *, s32);
extern void func_020afe28(void *, s32, s32);
extern void func_020afe64(void *, ...);
extern void func_020afebc(void *, ...);
extern void func_020aff00(void *, s32, s32);
extern void func_020aff38(void *, s32, s32, s32);
extern void func_020aff78(void *, s32, s32);
extern void func_020affc0(void *, s32, s32, s32);
extern void func_020b241c(void *);
extern void func_020b24cc(void *, void *, u32);
extern void func_020b4554(void *, s32);
extern void func_01ff88c4(s32, const void *, s32);
extern s32 func_ov026_021fd018(const u32 *);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a 0x20-byte textured disc mesh from resource ID `resource_id`.
 * It owns an 0x18-byte resource at +4 and a 0x280-byte display-list buffer at
 * +0x1C, configures builder +8, derives half texture dimensions, then emits a
 * center vertex and 16 edge pairs. Edge positions use sine/cosine and fixed
 * radius 0xCCD; normals use 0xCCD/4. The list is finalized and sized, and the
 * object is returned. Both allocations use heap 4.
 */
extern "C" void *func_ov026_021fdd84(void *object, s32 resource_id)
{
    FIELD(const void *, object, 0) = data_ov026_022048c8;
    void *resource = Heap_Alloc(0x18, data_ov026_02204a40, 4, gHeapContext);
    if (resource)
        resource = Graphics3DResourceBinding_Init(resource, data_020f4e18, resource_id,
                                 0x611c, 0x611d);
    FIELD(void *, object, 4) = resource;

    void *buffer = func_02002700(0x280, data_ov026_02204a48, 4, gHeapContext);
    FIELD(void *, object, 0x1c) = buffer;
    func_020b24cc((u8 *)object + 8, buffer, 0x280);
    func_020afebc((u8 *)object + 8, 1, 0, 2, 1, 0x1f, 0x8000);
    s32 a = Graphics3DResourceBinding_GetTextureFormat(resource);
    s32 b = Graphics3DResourceBinding_GetTextureWidthClass(resource);
    s32 c = Graphics3DResourceBinding_GetTextureHeightClass(resource);
    func_020afe64((u8 *)object + 8, a, 1, b, c, c, 3, 0, 0,
                  FIELD(s32, FIELD(void *, resource, 0x10), 0xc));
    func_020afe28((u8 *)object + 8,
                  FIELD(s32, FIELD(void *, resource, 0x14), 0xc),
                  Graphics3DResourceBinding_GetTextureFormat(resource));

    void *shape = FIELD(void *, resource, 4);
    s32 half_width = func_02070454(shape) / 2;
    s32 half_height = func_02070464(shape) / 2;
    s32 center_u = half_width << 12;
    s32 center_v = half_height << 12;
    func_020afe00((u8 *)object + 8, 0);
    func_020affc0((u8 *)object + 8, 0, 0xfff, 0);

    for (s32 i = 0; i < 16; ++i) {
        s32 angle0 = (i * 0x1000) >> 4;
        s32 angle1 = ((i + 1) * 0x1000) >> 4;
        s32 sin0 = data_020c9670[angle0 * 2];
        s32 cos0 = data_020c9670[angle0 * 2 + 1];
        s32 sin1 = data_020c9670[angle1 * 2];
        s32 cos1 = data_020c9670[angle1 * 2 + 1];

        func_020aff78((u8 *)object + 8, center_u, center_v);
        func_020aff38((u8 *)object + 8, 0, 0, 0);

        s32 x0 = (sin0 * 0xccd + 0x800) >> 12;
        s32 z0 = (cos0 * 0xccd + 0x800) >> 12;
        func_020aff78((u8 *)object + 8,
                      center_u + half_width * sin0,
                      center_v + half_height * cos0);
        func_020aff00((u8 *)object + 8, (s16)(sin0 * (0xccd / 4) >> 12),
                      (s16)(cos0 * (0xccd / 4) >> 12));
        func_020aff38((u8 *)object + 8, x0, 0, z0);

        func_020aff78((u8 *)object + 8,
                      center_u + half_width * sin1,
                      center_v + half_height * cos1);
        func_020aff00((u8 *)object + 8, (s16)(sin1 * (0xccd / 4) >> 12),
                      (s16)(cos1 * (0xccd / 4) >> 12));
    }
    func_020afddc((u8 *)object + 8);
    func_020b241c((u8 *)object + 8);
    func_020b4554(FIELD(void *, object, 0x10),
                  func_ov026_021fd018((const u32 *)((u8 *)object + 8)));
    return object;
}

/*
 * Non-freeing disc destructor: releases list buffer +0x1C and destroys/frees
 * resource +4 when present. Restores the vtable and returns `object`.
 */
extern "C" void *func_ov026_021fe1fc(void *object)
{
    FIELD(const void *, object, 0) = data_ov026_022048c8;
    func_02002728(FIELD(void *, object, 0x1c));
    void *resource = FIELD(void *, object, 4);
    if (resource) {
        Graphics3DResourceBinding_Destroy(resource);
        Heap_Free(resource);
    }
    return object;
}

/* Performs the disc destructor, frees object storage, and returns the pointer. */
extern "C" void *func_ov026_021fe23c(void *object)
{
    func_ov026_021fe1fc(object);
    Heap_Free(object);
    return object;
}

/*
 * Executes the generated list at +0x10 with the span derived from builder +8.
 * It resets the matrix command port and triggers the geometry swap register;
 * returns void and directly affects DS geometry hardware.
 */
extern "C" void func_ov026_021fe284(void *object)
{
    *(volatile u32 *)0x04000444 = 0;
    func_01ff88c4(3, FIELD(void *, object, 0x10),
                  func_ov026_021fd018((const u32 *)((u8 *)object + 8)));
    *(volatile u32 *)0x04000448 = 1;
}

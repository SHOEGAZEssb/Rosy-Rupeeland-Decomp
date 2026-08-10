#include "tingle/types.h"

/* Overlay 26 generated tube/arc display-list object and hardware submission. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern const u8 data_ov026_022048e8[];
extern const u8 data_ov026_02204a48[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void *func_02002700(u32, const void *, u32, void *);
extern void func_02002728(void *);
extern s32 Graphics3DResourceBinding_GetTextureFormat(void *);
extern s32 Graphics3DResourceBinding_GetTextureWidthClass(void *);
extern s32 Graphics3DResourceBinding_GetTextureHeightClass(void *);
extern void func_020afddc(void *);
extern void func_020afe00(void *, s32);
extern void func_020afe28(void *, s32, s32);
extern void func_020afe64(void *, ...);
extern void func_020afebc(void *, ...);
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
 * Constructs a 0x2C-byte generated mesh around `resource`. A 0x300-byte list
 * buffer at +0x28 backs builder +0x14. `radius` controls one texture coordinate;
 * `position` initializes +0xC. The 17-segment loop derives inner/outer normals
 * from sine/cosine scaled by confirmed fixed-point factors 0x333 and 0xFD7,
 * emits two vertices per segment, finalizes the list, and returns `object`.
 */
extern "C" void *func_ov026_021fd9c4(void *object, void *resource,
                                      s32 radius, s32 position)
{
    FIELD(const void *, object, 0) = data_ov026_022048e8;
    FIELD(void *, object, 4) = resource;
    void *buffer = func_02002700(0x300, data_ov026_02204a48, 4, gHeapContext);
    FIELD(void *, object, 0x28) = buffer;
    func_020b24cc((u8 *)object + 0x14, buffer, 0x300);
    func_020afebc((u8 *)object + 0x14, 1, 0, 2, 1, 0x1f, 0x8000);
    s32 a = Graphics3DResourceBinding_GetTextureFormat(resource);
    s32 b = Graphics3DResourceBinding_GetTextureWidthClass(resource);
    s32 c = Graphics3DResourceBinding_GetTextureHeightClass(resource);
    func_020afe64((u8 *)object + 0x14, a, 1, b, c,
                  Graphics3DResourceBinding_GetTextureHeightClass(resource), 3, 0, 0,
                  FIELD(s32, FIELD(void *, resource, 0x10), 0xc));
    func_020afe28((u8 *)object + 0x14,
                  FIELD(s32, FIELD(void *, resource, 0x14), 0xc),
                  Graphics3DResourceBinding_GetTextureFormat(resource));
    func_020afe00((u8 *)object + 0x14, 2);

    s32 outer_u = radius << 18;
    s32 inner_y = (s16)(-(radius << 10) - 0x10);
    for (s32 i = 0; i <= 16; ++i) {
        s32 angle = (i * 0x1000) >> 4;
        s32 sine = data_020c9670[angle * 2];
        s32 cosine = data_020c9670[angle * 2 + 1];
        s32 inner_x = (sine * 0x333 + 0x800) >> 12;
        s32 inner_z = (cosine * 0x333 + 0x800) >> 12;
        s32 normal_x = (sine * 0xfd7 + 0x800) >> 12;
        s32 normal_z = (cosine * 0xfd7 + 0x800) >> 12;
        s32 u = i * 0x2000;
        func_020aff78((u8 *)object + 0x14, u, 0);
        func_020affc0((u8 *)object + 0x14, normal_x, 0, normal_z);
        func_020aff38((u8 *)object + 0x14, inner_x, 0, inner_z);
        func_020aff78((u8 *)object + 0x14, u, outer_u);
        func_020affc0((u8 *)object + 0x14, normal_x, 0, normal_z);
        func_020aff38((u8 *)object + 0x14, inner_x, inner_y, inner_z);
    }
    func_020afddc((u8 *)object + 0x14);
    func_020b241c((u8 *)object + 0x14);
    func_020b4554(FIELD(void *, object, 0x1c),
                  func_ov026_021fd018((const u32 *)((u8 *)object + 0x14)));
    FIELD(s32, object, 8) = 0;
    FIELD(s32, object, 0xc) = position;
    FIELD(s32, object, 0x10) = 0;
    return object;
}

/* Releases list buffer +0x28 without freeing object storage and returns object. */
extern "C" void *func_ov026_021fdcd8(void *object)
{
    FIELD(const void *, object, 0) = data_ov026_022048e8;
    func_02002728(FIELD(void *, object, 0x28));
    return object;
}

/* Releases the tube list and object storage, then returns the original pointer. */
extern "C" void *func_ov026_021fdcfc(void *object)
{
    func_ov026_021fdcd8(object);
    Heap_Free(object);
    return object;
}

/*
 * Streams translation +8/+C/+10 to the matrix command port and executes the
 * generated list at +0x1C with its computed span. Returns void and writes the
 * geometry FIFO/swap register directly.
 */
extern "C" void func_ov026_021fdd28(void *object)
{
    volatile u32 *const matrix_port = (volatile u32 *)0x04000444;
    *matrix_port = 0;
    *matrix_port = FIELD(u32, object, 8);
    *matrix_port = FIELD(u32, object, 0xc);
    *matrix_port = FIELD(u32, object, 0x10);
    func_01ff88c4(3, FIELD(void *, object, 0x1c),
                  func_ov026_021fd018((const u32 *)((u8 *)object + 0x14)));
    *(volatile u32 *)0x04000448 = 1;
}

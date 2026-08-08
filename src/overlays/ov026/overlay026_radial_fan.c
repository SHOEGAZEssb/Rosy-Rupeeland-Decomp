#include "tingle/types.h"

/* Overlay 26 generated 16-segment radial fan display-list object. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern const u8 data_ov026_022048f8[];
extern const u8 data_ov026_02204a48[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void *func_02002700(u32, const void *, u32, void *);
extern void func_02002728(void *);
extern void func_020afddc(void *);
extern void func_020afe00(void *, s32);
extern void func_020afe64(void *, ...);
extern void func_020afebc(void *, ...);
extern void func_020aff00(void *, s32, s32);
extern void func_020aff38(void *, s32, s32, s32);
extern void func_020b0000(void *, s32);
extern void func_020b241c(void *);
extern void func_020b24cc(void *, void *, u32);
extern void func_020b4554(void *, s32);
extern s32 func_ov026_021fd018(const u32 *);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a 0x20-byte radial fan using caller value `payload` at +0x1C.
 * A 0x200-byte list buffer at +0x18 backs builder +4. Sixteen triangles share
 * a zero center vertex and use consecutive sine/cosine samples scaled by 0x333
 * for edge normals; fixed texture coordinates 0x18/0 are emitted per triangle.
 * Finalizes and sizes the list, then returns `object`; allocation uses heap 4.
 */
extern "C" void *func_ov026_021fe2c8(void *object, void *payload)
{
    FIELD(const void *, object, 0) = data_ov026_022048f8;
    FIELD(void *, object, 0x1c) = payload;
    void *buffer = func_02002700(0x200, data_ov026_02204a48, 4, gHeapContext);
    FIELD(void *, object, 0x18) = buffer;
    func_020b24cc((u8 *)object + 4, buffer, 0x200);
    func_020afebc((u8 *)object + 4, 1, 0, 2, 1, 0x1f, 0x8000);
    func_020afe64((u8 *)object + 4, 0, 0, 0, 0, 0, 0, 0, 0);
    func_020afe00((u8 *)object + 4, 0);

    for (s32 i = 0; i < 16; ++i) {
        s32 angle0 = (i * 0x1000) >> 4;
        s32 angle1 = ((i + 1) * 0x1000) >> 4;
        func_020b0000((u8 *)object + 4, 0x18);
        func_020aff38((u8 *)object + 4, 0, 0, 0);
        func_020b0000((u8 *)object + 4, 0);
        s32 sin1 = data_020c9670[angle1 * 2];
        s32 cos1 = data_020c9670[angle1 * 2 + 1];
        func_020aff00((u8 *)object + 4,
                      (s16)((sin1 * 0x333 + 0x800) >> 12),
                      (s16)((cos1 * 0x333 + 0x800) >> 12));
        s32 sin0 = data_020c9670[angle0 * 2];
        s32 cos0 = data_020c9670[angle0 * 2 + 1];
        func_020aff00((u8 *)object + 4,
                      (s16)((sin0 * 0x333 + 0x800) >> 12),
                      (s16)((cos0 * 0x333 + 0x800) >> 12));
    }
    func_020afddc((u8 *)object + 4);
    func_020b241c((u8 *)object + 4);
    func_020b4554(FIELD(void *, object, 0xc),
                  func_ov026_021fd018((const u32 *)((u8 *)object + 4)));
    return object;
}

/* Releases generated list buffer +0x18 and returns object without freeing it. */
extern "C" void *func_ov026_021fe51c(void *object)
{
    FIELD(const void *, object, 0) = data_ov026_022048f8;
    func_02002728(FIELD(void *, object, 0x18));
    return object;
}

/* Releases the radial-fan list and object storage, returning the old pointer. */
extern "C" void *func_ov026_021fe540(void *object)
{
    func_ov026_021fe51c(object);
    Heap_Free(object);
    return object;
}

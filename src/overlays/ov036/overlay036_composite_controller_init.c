#include "tingle/types.h"

/* Overlay 36 composite controller resources, children, records, and timers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205f9c[];
extern const u8 data_ov036_02206160[];
extern const u8 data_ov036_02206168[];
extern const u8 data_ov036_02206190[];
extern void *data_020f4e18;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov036_021fce00(void *controller, s32 argument);
extern void func_020720c0(void *resourceSet);
extern void func_ov036_021fe218(void *list);
extern void func_02091b6c(void *timer);
extern void func_02091d08(void *timer);
extern void Graphics3DLightSet_Init(void *records);
extern void func_020720e8(void *resourceSet, void *archive,
                          s32 firstId, s32 secondId, s32 thirdId);
extern void func_020779ac(void *owner, void *resourceSet);
extern void *func_02071adc(void *archive, s32 id);
extern void *func_02077624(void *owner);
extern void func_ov036_021fe9fc(void *record, s32 x, s32 y, s32 z);
extern void func_ov036_021fea04(void *record, s32 x, s32 y, s32 z);
extern void func_ov036_0220213c(void *records, s32 index,
                                s32 value0, s32 value4, s32 value8,
                                s32 red, s32 green, s32 blue);
extern void *func_02077308(void *manager, void *resourceSet);
extern void func_ov036_021ff050(void *handle, s32 mode,
                                s32 x, s32 y, s32 z,
                                s32 byte5A, s32 flags);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_020955d8(void *object, void *handle);
extern void *func_ov036_021fcf34(void *object, void *resource,
                                 s32 mode, s32 type);
extern void *func_ov036_021fdbf4(void *object, s32 value);
extern void func_02095274(void *list, void *object);
extern void func_020948d4(void *field, s32 value);
extern void func_02091b98(void *timer, s32 duration);
extern void func_02091d24(void *timer, s32 first, s32 second,
                          s32 third, s32 fourth);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a composite controller. argument is stored by common setup;
 * owner registers +0xDC IDs 0x6003..05 and variant resource sets +0xE8/+0xCC.
 * argument 0x65/default, 0x68, or 0x6B selects +0xE8 triples
 * (0x6075,0x6076/78/79,0x6077) and +0xCC triples 0x60D2..D4,
 * 0x60D5..D7, or 0x60D8..DA. Archive item 0x5003 is retained at +0x15C and
 * owner's manager at +0xF4.
 *
 * Transform +0xC starts at Z=0x2800 and one white record at +0x160 stores
 * (0x800,-0x1000,-0x1000). Three handle-backed 0xA0 children enter list
 * +0x100: +0xF8 uses +0xDC with mode/byte 2, flags 0x46, scale 0x2000;
 * +0xFC uses +0xE8 with byte 0xB, flags 0x45; +0xD8 uses +0xCC and flags
 * 0x44. Two 0xC4 render objects at +0x154/+0x158 use archive item +0x15C,
 * modes zero/one and type 0xC, enter +0x100, set active flag +0x98 and +0xA4
 * to one; the first uses +0xBC/+0xC0 value 0x6318 and the second +0xBC 0x218.
 * A 0x18-byte auxiliary object at +0x1A0 is constructed with value 0x20.
 * Timer +0x120 starts at 30 and timer +0x13C is configured with (0,0,2,1).
 * Returns controller; resources, manager, heap, lists, transforms, records,
 * timers, and auxiliary ownership change.
 */
extern "C" void *func_ov036_022029d8(void *controller, void *owner,
                                      s32 argument)
{
    func_ov036_021fce00(controller, argument);
    FIELD(const void *, controller, 0) = data_ov036_02205f9c;
    func_020720c0((u8 *)controller + 0xdc);
    func_020720c0((u8 *)controller + 0xe8);
    func_ov036_021fe218((u8 *)controller + 0x100);
    func_ov036_021fe218((u8 *)controller + 0x110);
    func_02091b6c((u8 *)controller + 0x120);
    func_02091d08((u8 *)controller + 0x13c);
    Graphics3DLightSet_Init((u8 *)controller + 0x160);

    func_020720e8((u8 *)controller + 0xdc, data_020f4e18,
                  0x6003, 0x6004, 0x6005);
    func_020779ac(owner, (u8 *)controller + 0xdc);

    s32 middleId;
    s32 ccLastId;
    if (FIELD(s32, controller, 4) == 0x68) {
        middleId = 0x6078;
        ccLastId = 0x60d7;
    } else if (FIELD(s32, controller, 4) == 0x6b) {
        middleId = 0x6079;
        ccLastId = 0x60da;
    } else {
        middleId = 0x6076;
        ccLastId = 0x60d4;
    }
    func_020720e8((u8 *)controller + 0xe8, data_020f4e18,
                  0x6075, middleId, 0x6077);
    func_020720e8((u8 *)controller + 0xcc, data_020f4e18,
                  ccLastId - 2, ccLastId - 1, ccLastId);
    func_020779ac(owner, (u8 *)controller + 0xe8);
    func_020779ac(owner, (u8 *)controller + 0xcc);
    FIELD(void *, controller, 0x15c) = func_02071adc(data_020f4e18, 0x5003);
    FIELD(void *, controller, 0xf4) = func_02077624(owner);

    func_ov036_021fe9fc((u8 *)controller + 0xc, 0, 0, 0x2800);
    func_ov036_021fea04((u8 *)controller + 0xc, 0, 0, 0);
    func_ov036_0220213c((u8 *)controller + 0x160, 0,
                        0x800, -0x1000, -0x1000,
                        0x1f, 0x1f, 0x1f);

    void *handle = func_02077308(FIELD(void *, controller, 0xf4),
                                  (u8 *)controller + 0xdc);
    func_ov036_021ff050(handle, 2, 0, 0, 0, 2, 0x46);
    void *child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = func_020955d8(child, handle);
    FIELD(void *, controller, 0xf8) = child;
    func_02095274((u8 *)controller + 0x100, child);
    func_020948d4((u8 *)child + 0x6c, 0x2000);

    handle = func_02077308(FIELD(void *, controller, 0xf4),
                            (u8 *)controller + 0xe8);
    func_ov036_021ff050(handle, 0, 0, 0, 0, 0xb, 0x45);
    child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = func_020955d8(child, handle);
    FIELD(void *, controller, 0xfc) = child;
    func_02095274((u8 *)controller + 0x100, child);

    handle = func_02077308(FIELD(void *, controller, 0xf4),
                            (u8 *)controller + 0xcc);
    FIELD(u16, handle, 0x50) |= 0x44;
    child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = func_020955d8(child, handle);
    FIELD(void *, controller, 0xd8) = child;
    func_02095274((u8 *)controller + 0x100, child);

    void *renderObject =
        Heap_Alloc(0xc4, data_ov036_02206168, 4, gHeapContext);
    if (renderObject != 0)
        renderObject = func_ov036_021fcf34(
            renderObject, FIELD(void *, controller, 0x15c), 0, 0xc);
    FIELD(void *, controller, 0x154) = renderObject;
    func_02095274((u8 *)controller + 0x100, renderObject);
    FIELD(u16, renderObject, 0xbc) = 0x6318;
    FIELD(u16, renderObject, 0xc0) = 0x6318;
    FIELD(u16, renderObject, 0x98) |= 1;
    FIELD(s32, renderObject, 0xa4) = 1;

    renderObject = Heap_Alloc(0xc4, data_ov036_02206168, 4, gHeapContext);
    if (renderObject != 0)
        renderObject = func_ov036_021fcf34(
            renderObject, FIELD(void *, controller, 0x15c), 1, 0xc);
    FIELD(void *, controller, 0x158) = renderObject;
    func_02095274((u8 *)controller + 0x100, renderObject);
    FIELD(u16, renderObject, 0xbc) = 0x218;
    FIELD(u16, renderObject, 0x98) |= 1;
    FIELD(s32, renderObject, 0xa4) = 1;

    void *auxiliary = Heap_Alloc(0x18, data_ov036_02206190, 4, gHeapContext);
    if (auxiliary != 0)
        auxiliary = func_ov036_021fdbf4(auxiliary, 0x20);
    FIELD(void *, controller, 0x1a0) = auxiliary;
    func_02091b98((u8 *)controller + 0x120, 0x1e);
    func_02091d24((u8 *)controller + 0x13c, 0, 0, 2, 1);
    return controller;
}

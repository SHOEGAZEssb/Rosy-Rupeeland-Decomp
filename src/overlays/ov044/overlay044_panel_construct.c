#include "tingle/types.h"

/*
 * Overlay 44 panel construction. This recovered routine initializes a
 * resource-backed list/panel object, its optional record array, and UI child.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *data_020f4e18;
extern "C" u8 gHeapContext[];
extern "C" u8 data_ov044_0220d330[];
extern "C" u8 data_ov044_0220d338[];
extern "C" void func_02071ea4(void *owner);
extern "C" void func_02092798(void *presentation);
extern "C" void *GraphicsSpriteGroupOwner_CreateGroup(void *font);
extern "C" void func_02071ee0(void *owner, void *archive, s32 first,
                               s32 second, s32 third, s32 fourth);
extern "C" void *func_02003e20(s32 size, const void *tag,
                                 s32 alignment, void *heap);
extern "C" void func_020c09cc(void *records, s32 count, s32 stride,
                               s32 alignment, void (*construct)(void *),
                               void (*destroy)(void *));
extern "C" void *Heap_Alloc(s32 size, const void *tag, s32 alignment,
                              void *heap);
extern "C" void *func_02094154(void *storage, void *font, s32 count,
                                s32 mode, s32 x, s32 y, s32 spacing);
extern "C" void func_02094574(void *child);
extern "C" void func_ov044_0220ba18(void *object);
extern "C" void func_02092814(void *presentation, s32 resourceId);
extern "C" void func_020683c8(void *record);
extern "C" void func_020683f4(void *record);

/*
 * Construct a panel in caller-provided storage and return the same pointer.
 * Inputs are font/resource owner, row count, and object storage. Initialize
 * embedded owner +0x08 and presentation +0x14; create font state +0x04 with
 * bounds 48x32; load IDs 0x60..0x62; store row count +0x3C and cursor zero at
 * +0x40. For nonzero rows allocate count*32+8 bytes tagged by
 * data_ov044_0220d330, construct records with func_020683c8/020683f4, and store
 * them at +0x38. Always allocate the 0x80-byte UI child +0x44, selecting child
 * mode/count and spacing from whether rows exist, finalize it, apply initial
 * state, and load resources 0x7000/0x7005. Heap, resource, and UI state change.
 */
extern "C" void *func_ov044_0220b740(void *object, void *font, s32 rowCount)
{
    func_02071ea4((u8 *)object + 8);
    func_02092798((u8 *)object + 0x14);
    FIELD(void *, object, 0) = font;
    FIELD(void *, object, 4) = GraphicsSpriteGroupOwner_CreateGroup(font);
    FIELD(s32, FIELD(void *, object, 4), 0x18) = 0x30;
    FIELD(s32, FIELD(void *, object, 4), 0x1c) = 0x20;
    func_02071ee0((u8 *)object + 8, data_020f4e18,
                   0x60, 0x61, 0x62, 0x62);
    FIELD(s32, object, 0x3c) = rowCount;
    FIELD(s32, object, 0x40) = 0;

    if (rowCount != 0) {
        void *records = func_02003e20(rowCount * 0x20 + 8,
                                      data_ov044_0220d330, 4, gHeapContext);
        if (records)
            func_020c09cc(records, rowCount, 0x20, 8,
                           func_020683c8, func_020683f4);
        FIELD(void *, object, 0x38) = records;
        void *child = Heap_Alloc(0x80, data_ov044_0220d338, 4,
                                 gHeapContext);
        if (child)
            child = func_02094154(child, font, rowCount, 5,
                                  0xd6, 0x1c, 0xc);
        FIELD(void *, object, 0x44) = child;
    } else {
        FIELD(void *, object, 0x38) = 0;
        void *child = Heap_Alloc(0x80, data_ov044_0220d338, 4,
                                 gHeapContext);
        if (child)
            child = func_02094154(child, font, 1, 1,
                                  0xd6, 0x1c, 8);
        FIELD(void *, object, 0x44) = child;
    }
    func_02094574(FIELD(void *, object, 0x44));
    func_ov044_0220ba18(object);
    func_02092814((u8 *)object + 0x14, 0x7000);
    func_02092814((u8 *)object + 0x14, 0x7005);
    return object;
}

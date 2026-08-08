#include "tingle/types.h"

/* Overlay 36 ramp-controller persistent child-pool construction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02206160[];
extern const u8 data_ov036_022051f0[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02077308(void *manager, void *resourceSet);
extern void func_02076be8(void *handle, s32 selector);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_020955d8(void *object, void *handle);
extern void func_02095274(void *list, void *object);
extern void func_020948d4(void *field, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Builds ten persistent 0xA0-byte handle-backed children. Two children from
 * resource set +0x10C are stored at +0x120/+0x124, use handle byte 0x17 and
 * flags 0x44, enter list +0x148, and receive confirmed +0x6C value 0x19A; the
 * second also receives +0x5C value 0x8000. Eight more children from +0x100 are
 * stored at +0x128..+0x144. Each 0x14-byte data_ov036_022051f0 record selects
 * its handle resource with byte +0 and supplies its +0x5C value at +0x10.
 * Returns nothing; manager handles, heap allocations, child fields, and list
 * membership change. The original assumes all allocations succeed.
 */
extern "C" void func_ov036_02201710(void *controller)
{
    void *manager = FIELD(void *, controller, 0x118);
    void *handle = func_02077308(manager, (u8 *)controller + 0x10c);
    FIELD(u16, handle, 0x50) |= 0x44;
    FIELD(u8, handle, 0x5a) = 0x17;
    void *child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = func_020955d8(child, handle);
    FIELD(void *, controller, 0x120) = child;
    func_02095274((u8 *)controller + 0x148, child);
    func_020948d4((u8 *)child + 0x6c, 0x19a);

    handle = func_02077308(manager, (u8 *)controller + 0x10c);
    FIELD(u16, handle, 0x50) |= 0x44;
    FIELD(u8, handle, 0x5a) = 0x17;
    child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = func_020955d8(child, handle);
    FIELD(void *, controller, 0x124) = child;
    func_02095274((u8 *)controller + 0x148, child);
    func_020948d4((u8 *)child + 0x5c, 0x8000);
    func_020948d4((u8 *)child + 0x6c, 0x19a);

    for (s32 i = 0; i < 8; ++i) {
        const u8 *record = data_ov036_022051f0 + i * 0x14;
        handle = func_02077308(manager, (u8 *)controller + 0x100);
        func_02076be8(handle, record[0]);
        FIELD(u16, handle, 0x50) |= 0x44;
        child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
        if (child != 0)
            child = func_020955d8(child, handle);
        FIELD(void *, controller, 0x128 + i * 4) = child;
        func_02095274((u8 *)controller + 0x148, child);
        func_020948d4((u8 *)child + 0x5c,
                      *(const s32 *)(record + 0x10));
    }
}

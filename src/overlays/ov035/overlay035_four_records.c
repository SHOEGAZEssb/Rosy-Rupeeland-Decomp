#include "tingle/types.h"

/* Overlay 35 bounded four-record initialization and RGB555 color packing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020add34(void *first, void *second);
#ifdef __cplusplus
}
#endif

/*
 * Initializes one of four 0x10-byte records when index is in [0,4). It stores
 * three payload words at +0/+4/+8, sets active halfword +0xE to one, and calls
 * the shared setup helper with the record twice. It then packs caller RGB
 * components into RGB555 at +0xC and reasserts +0xE. Invalid indices produce
 * no effects. Returns no value; record and helper-owned state may change.
 */
extern "C" void func_ov035_021ffec4(void *records, s32 index, s32 value0,
                                     s32 value4, s32 value8,
                                     s32 red, s32 green, s32 blue)
{
    if (index < 0 || index >= 4)
        return;
    void *record = (u8 *)records + index * 0x10;
    FIELD(u16, record, 0x0e) = 1;
    FIELD(s32, record, 0) = value0;
    FIELD(s32, record, 4) = value4;
    FIELD(s32, record, 8) = value8;
    func_020add34(record, record);
    FIELD(u16, record, 0x0e) = 1;
    FIELD(u16, record, 0x0c) =
        (u16)(red | (green << 5) | (blue << 10));
}

#include "tingle/types.h"

/* Overlay 36 four-slot parameter-record initialization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020add34(void *record);
#ifdef __cplusplus
}
#endif

/*
 * Initializes one of four 0x10-byte records when index is in [0,4). Values
 * value0/value4/value8 fill words +0/+4/+8, SDK helper func_020add34 processes
 * that record, and 5-bit color components are packed as red|(green<<5)|
 * (blue<<10) into halfword +0xC. Halfword +0xE is set to one before both the
 * helper and color write, matching the recovered two-stage bounds checks.
 * Returns nothing; an invalid index leaves all state unchanged.
 */
extern "C" void func_ov036_0220213c(void *records, s32 index,
                                     s32 value0, s32 value4, s32 value8,
                                     s32 red, s32 green, s32 blue)
{
    if (index >= 0 && index < 4) {
        void *record = (u8 *)records + index * 0x10;
        FIELD(u16, record, 0xe) = 1;
        FIELD(s32, record, 0) = value0;
        FIELD(s32, record, 4) = value4;
        FIELD(s32, record, 8) = value8;
        func_020add34(record);
    }
    if (index >= 0 && index < 4) {
        void *record = (u8 *)records + index * 0x10;
        FIELD(u16, record, 0xe) = 1;
        FIELD(u16, record, 0xc) =
            (u16)(red | (green << 5) | (blue << 10));
    }
}

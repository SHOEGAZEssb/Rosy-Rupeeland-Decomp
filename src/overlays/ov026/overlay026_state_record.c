#include "tingle/types.h"

/* Overlay 26 small state-record construction, teardown, and parameter setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov026_022048b8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsAnimationInstance_SetAnimation(void *, u8);
extern void func_02095308(void *);
#ifdef __cplusplus
}
#endif

/*
 * Initializes the 16-byte state record with its address-derived vtable and
 * clears fields +4, +8, and +0xC. Returns void.
 */
extern "C" void func_ov026_021ff7f0(void *record)
{
    FIELD(const void *, record, 0) = data_ov026_022048b8;
    FIELD(s32, record, 8) = 0;
    FIELD(s32, record, 4) = 0;
    FIELD(s32, record, 0xc) = 0;
}

/* Restores the record vtable, tears down its shared base, and returns `record`. */
extern "C" void *func_ov026_021ff810(void *record)
{
    FIELD(const void *, record, 0) = data_ov026_022048b8;
    func_02095308(record);
    return record;
}

/*
 * Configures an extended record: the low byte of `kind` is passed to the SDK
 * initializer, values are stored at +0x20/+0x24/+0x28, `byte_value` at +0x5A,
 * and the low halfword of `flags` is ORed into +0x50. Returns void.
 */
extern "C" void func_ov026_021ff830(void *record, u32 kind, s32 value20,
                                      s32 value24, s32 value28,
                                      u8 byte_value, u32 flags)
{
    GraphicsAnimationInstance_SetAnimation(record, (u8)kind);
    FIELD(s32, record, 0x20) = value20;
    FIELD(s32, record, 0x24) = value24;
    FIELD(s32, record, 0x28) = value28;
    FIELD(u8, record, 0x5a) = byte_value;
    FIELD(u16, record, 0x50) |= (u16)flags;
}

/* Stores `value24`/+`value28` and clears record fields +4/+8; returns void. */
extern "C" void func_ov026_021ff878(void *record, s32 value24, s32 value28)
{
    FIELD(s32, record, 0x24) = value24;
    FIELD(s32, record, 0x28) = value28;
    FIELD(s32, record, 4) = 0;
    FIELD(s32, record, 8) = 0;
}

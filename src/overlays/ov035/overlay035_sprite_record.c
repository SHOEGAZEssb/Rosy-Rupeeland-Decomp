#include "tingle/types.h"

/* Overlay 35 sprite-record initialization, destruction, and field setters. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov035_02203af8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void PresentationList_DeleteAll(void *object);
extern void GraphicsAnimationInstance_SetAnimation(void *object, u8 identifier);
#ifdef __cplusplus
}
#endif

/*
 * Initializes a compact sprite-record base by installing vtable 0x02203AF8 and
 * clearing words +4/+8/+0xC. Returns no value and changes only record memory.
 */
extern "C" void func_ov035_021fdce8(void *record)
{
    FIELD(const void *, record, 0) = data_ov035_02203af8;
    FIELD(s32, record, 8) = 0;
    FIELD(s32, record, 4) = 0;
    FIELD(s32, record, 0x0c) = 0;
}

/*
 * Restores the sprite-record vtable and invokes shared base cleanup. Returns
 * the record without freeing it; engine-owned base state changes, without MMIO.
 */
extern "C" void *func_ov035_021fdd08(void *record)
{
    FIELD(const void *, record, 0) = data_ov035_02203af8;
    PresentationList_DeleteAll(record);
    return record;
}

/*
 * Configures a sprite record. The identifier is truncated to eight bits for
 * the shared initializer; three payload words go to +0x20..+0x28, a stack
 * byte goes to +0x5A, and the low 16 bits of the final argument are ORed into
 * flags +0x50. Returns no value; record/engine state changes, without MMIO.
 */
extern "C" void func_ov035_021fdd28(void *record, s32 identifier, s32 value20,
                                     s32 value24, s32 value28, u8 value5a,
                                     u16 flags)
{
    GraphicsAnimationInstance_SetAnimation(record, (u8)identifier);
    FIELD(s32, record, 0x20) = value20;
    FIELD(s32, record, 0x24) = value24;
    FIELD(s32, record, 0x28) = value28;
    FIELD(u8, record, 0x5a) = value5a;
    FIELD(u16, record, 0x50) |= flags;
}

/*
 * Stores a three-word vector at +4/+8/+0xC. Returns no value and changes only
 * the supplied record; there are no SDK or hardware effects.
 */
extern "C" void func_ov035_021fdd70(void *record, s32 x, s32 y, s32 z)
{
    FIELD(s32, record, 4) = x;
    FIELD(s32, record, 8) = y;
    FIELD(s32, record, 0x0c) = z;
}

/*
 * Stores a second three-word vector at +0x10/+0x14/+0x18. Returns no value and
 * changes only the supplied record; there are no SDK or hardware effects.
 */
extern "C" void func_ov035_021fdd78(void *record, s32 x, s32 y, s32 z)
{
    FIELD(s32, record, 0x10) = x;
    FIELD(s32, record, 0x14) = y;
    FIELD(s32, record, 0x18) = z;
}

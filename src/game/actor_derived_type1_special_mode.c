#include "tingle/types.h"

/* Query and control a descriptor-driven special mode on type-1 actors. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02072b68(void *attachment, u8 index);
#ifdef __cplusplus
}
#endif

/*
 * Return zero without an active descriptor. Otherwise return one when signed
 * descriptor ID +0x00 is 0x7b, 0x7c, 0x80, or 0x8c, or when type byte +0x08
 * is 0x73 or 0x74; return zero for all other values. No state changes.
 */
s32 ActorDerivedType1_IsSpecialRecordActive(void *self)
{
    u8 *descriptor = *(u8 **)((u8 *)self + 0x27c);
    s16 id;
    if (descriptor == 0)
        return 0;
    id = *(s16 *)descriptor;
    return id == 0x7b || id == 0x7c || id == 0x80 || id == 0x8c ||
           descriptor[8] == 0x73 || descriptor[8] == 0x74;
}

/*
 * With enable nonzero, set actor +0x230 bit 0x800000. If attachment byte
 * +0x38 and actor orientation byte +0xd4 are both at most seven, call
 * func_02072b68 on attachment +0x54 with orientation+8. With enable zero,
 * clear bit 0x800000 only when previously set and then set actor +0xd0 bit
 * 0x1000. Returns no value; attachment dispatch can change presentation.
 */
void ActorDerivedType1_SetSpecialModeEnabled(void *self, s32 enable)
{
    u8 *actor = (u8 *)self;
    if (enable != 0) {
        u8 *attachment;
        *(u32 *)(actor + 0x230) |= 0x800000;
        attachment = *(u8 **)(actor + 0x54);
        if (attachment[0x38] <= 7 && actor[0xd4] <= 7)
            func_02072b68(attachment, (u8)(actor[0xd4] + 8));
    } else if ((*(u32 *)(actor + 0x230) & 0x800000) != 0) {
        *(u32 *)(actor + 0x230) &= ~0x800000;
        *(u32 *)(actor + 0xd0) |= 0x1000;
    }
}

/*
 * Clear actor +0xd0 bit 0x4000, +0x230 bits 0x200000/0x400000, and signed
 * halfword +0x268. Returns no value and calls no helpers.
 */
void ActorDerivedType1_ResetSpecialModeFlags(void *self)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0xd0) &= ~0x4000;
    *(u32 *)(actor + 0x230) &= ~0x600000;
    *(u16 *)(actor + 0x268) = 0;
}

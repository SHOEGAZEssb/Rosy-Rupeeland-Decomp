#include "tingle/types.h"

/*
 * Overlay 42 record helpers. These recovered routines configure one external
 * child record and copy the two payload words of a 12-byte embedded element.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_02072b68(void *resource, u8 mode);
extern "C" u32 genrand_int32(void);
extern "C" s16 data_020c9670[];
extern "C" void func_0209a07c(void *child);

/*
 * Configure record using three caller values and the sixth argument's low
 * byte. The first argument is unused. Pass record+0xC to func_02072b68, set bit
 * 1 in that resource's halfword at +0x24, store the three values at +0x30..
 * +0x38, set both scale halfwords at +0x3C/+0x3E to 0x100, and clear +0x40.
 * No value is returned; the callee may change SDK-owned resource state.
 */
extern "C" void func_ov042_021fd8d0(void *unused, void *record,
                                    s32 value0, s32 value1,
                                    s32 value2, u8 mode)
{
    (void)unused;
    void *resource = FIELD(void *, record, 0xc);
    func_02072b68(resource, mode);
    FIELD(u16, resource, 0x24) |= 2;
    FIELD(s32, record, 0x30) = value0;
    FIELD(s32, record, 0x34) = value1;
    FIELD(s32, record, 0x38) = value2;
    FIELD(u16, record, 0x3c) = 0x100;
    FIELD(u16, record, 0x3e) = 0x100;
    FIELD(u16, record, 0x40) = 0;
}

/*
 * Copy source words +4 and +8 into destination unless both pointers identify
 * the same element. Destination changes; word zero is deliberately preserved
 * and no value is returned.
 */
extern "C" void func_ov042_021fda0c(void *destination, const void *source)
{
    if (destination != source) {
        FIELD(s32, destination, 4) = FIELD(s32, source, 4);
        FIELD(s32, destination, 8) = FIELD(s32, source, 8);
    }
}

/*
 * Activate the free record selected by the signed head at object+0xF24. A
 * negative head leaves all state unchanged. Otherwise store kind in the
 * 100-entry type array at +0xB3C, draw one low-16-bit angle from the PRNG,
 * store it at +0x9AC, copy source payload words into the corresponding element
 * at +0x4C, and derive its two motion words at +0x500/+0x504 from adjacent
 * entries in the confirmed global trigonometric table. Kind 1 uses scale 12;
 * other kinds use scale 8. Set the halfword timers at +0xA74 and +0xCCC to 30
 * and -1, respectively, then replace the free-list head with +0xD94[index].
 * The PRNG advances once and no value is returned.
 */
extern "C" void func_ov042_021fd924(void *object, s32 kind,
                                    const void *source)
{
    s32 index = FIELD(s32, object, 0xf24);
    if (index < 0)
        return;
    FIELD(s32, object, 0xb3c + index * 4) = kind;
    u16 angle = (u16)genrand_int32();
    FIELD(u16, object, 0x9ac + index * 2) = angle;
    s32 tableIndex = (angle >> 4) * 2;
    s16 first = data_020c9670[tableIndex];
    s16 second = data_020c9670[tableIndex + 1];
    func_ov042_021fda0c((u8 *)object + 0x4c + index * 12, source);
    s32 scale = kind == 1 ? 12 : 8;
    FIELD(s32, object, 0x500 + index * 12) = second * scale;
    FIELD(s32, object, 0x504 + index * 12) = first * scale;
    FIELD(u16, object, 0xa74 + index * 2) = 30;
    FIELD(s16, object, 0xccc + index * 2) = -1;
    FIELD(s32, object, 0xf24) = FIELD(s32, object, 0xd94 + index * 4);
}

/*
 * Return one active entry to the 100-record free list. If its signed type at
 * +0xB3C is already negative, do nothing. Otherwise mark the type -1, link its
 * +0xD94 next field to the old +0xF24 head, and make index the new head. No
 * value is returned.
 */
extern "C" void func_ov042_021fe9e4(void *object, s32 index)
{
    if (FIELD(s32, object, 0xb3c + index * 4) >= 0) {
        FIELD(s32, object, 0xb3c + index * 4) = -1;
        FIELD(s32, object, 0xd94 + index * 4) = FIELD(s32, object, 0xf24);
        FIELD(s32, object, 0xf24) = index;
    }
}

/*
 * Return one active child slot to the 48-entry free list. A negative active
 * marker at +0x14C8 leaves state unchanged. Otherwise set bit 2 in the child
 * resource halfword at +0x24 and child halfword +0x42, notify func_0209a07c,
 * mark the slot inactive, link +0x1588[index] to the old +0x1648 head, and
 * make index the new head. The child pointer itself is retained.
 */
extern "C" void func_ov042_021fea08(void *object, s32 index)
{
    if (FIELD(s32, object, 0x14c8 + index * 4) < 0)
        return;
    void *child = FIELD(void *, object, 0xf28 + index * 4);
    void *resource = FIELD(void *, child, 0xc);
    FIELD(u16, resource, 0x24) |= 4;
    FIELD(u16, child, 0x42) |= 4;
    func_0209a07c(child);
    FIELD(s32, object, 0x14c8 + index * 4) = -1;
    FIELD(s32, object, 0x1588 + index * 4) = FIELD(s32, object, 0x1648);
    FIELD(s32, object, 0x1648) = index;
}

/*
 * Reset both record pools by returning all 100 ordinary records and all 48
 * child slots to their respective free lists in descending index order. The
 * called release helpers ignore entries already inactive; no value is returned.
 */
extern "C" void func_ov042_021fea78(void *object)
{
    for (s32 i = 99; i >= 0; --i)
        func_ov042_021fe9e4(object, i);
    for (s32 i = 47; i >= 0; --i)
        func_ov042_021fea08(object, i);
}

/*
 * Add source payload words +4 and +8 into the corresponding destination
 * payload words. Word zero is deliberately untouched; destination changes and
 * no value is returned. This helper is used by the later bulk update path.
 */
extern "C" void func_ov042_021ff2f8(void *destination, const void *source)
{
    FIELD(s32, destination, 4) += FIELD(s32, source, 4);
    FIELD(s32, destination, 8) += FIELD(s32, source, 8);
}

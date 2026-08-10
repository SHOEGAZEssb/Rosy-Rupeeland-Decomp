#include "tingle/types.h"

/*
 * Overlay 42 late-renderer helpers. These recovered routines pack geometry
 * engine state, submit vertices and texture coordinates, and manage a 64-slot
 * signed-byte activity/free-list table used by the surrounding scene code.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_02099fb0(void *object);
extern "C" void func_0209a2ac(void *object, s32 selector, s32 enabled);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *resource, u8 mode);
extern "C" void func_020a1794(void *owner, void *state, s32 value);
extern "C" void func_ov042_021fcf80(void *element);

/*
 * Pack eight caller fields into the Nintendo DS polygon-attribute register at
 * 0x040004A8 using the confirmed shifts: 26, 30, 20, 23, 16, 18, 29, and a
 * right shift of three for the eighth field. Inputs are not range-checked;
 * overlapping high bits are combined exactly as supplied. Hardware state
 * changes and no value is returned.
 */
extern "C" void func_ov042_02204e74(u32 field0, u32 field1, u32 field2,
                                    u32 field3, u32 field4, u32 field5,
                                    u32 field6, u32 field7)
{
    *(volatile u32 *)0x040004a8 =
        (field0 << 26) | (field7 >> 3) | (field1 << 30) |
        (field2 << 20) | (field3 << 23) | (field4 << 16) |
        (field5 << 18) | (field6 << 29);
}

/*
 * Submit one signed 16-bit XYZ vertex to the geometry FIFO at 0x0400048C.
 * X/Y are packed in the first word and Z in the second; high bits are discarded,
 * hardware state changes, and no value is returned.
 */
extern "C" void func_ov042_02204eb4(s32 x, s32 y, s32 z)
{
    *(volatile u32 *)0x0400048c = ((u32)(u16)y << 16) | (u16)x;
    *(volatile u32 *)0x0400048c = (u16)z;
}

/*
 * Submit one texture coordinate pair to 0x04000488 after the recovered 8-bit
 * alignment conversion. High bits are discarded, hardware state changes, and
 * no value is returned.
 */
extern "C" void func_ov042_0220507c(s32 s, s32 t)
{
    u16 packedS = (u16)(s << 8 >> 16);
    u16 packedT = (u16)(t << 8 >> 16);
    *(volatile u32 *)0x04000488 = ((u32)packedT << 16) | packedS;
}

/*
 * Return one active slot to the 64-entry free list. A negative signed activity
 * byte at object+4+index leaves state unchanged. Otherwise set it to -1, store
 * the previous signed head from +0x844 into the slot's halfword link at
 * +0x7C4+index*2, and replace the head with index narrowed/sign-extended to 16
 * bits. No value is returned.
 */
extern "C" void func_ov042_02205148(void *object, s32 index)
{
    if (FIELD(s8, object, 4 + index) < 0)
        return;
    FIELD(s8, object, 4 + index) = -1;
    FIELD(u16, object, 0x7c4 + index * 2) =
        (u16)FIELD(s32, object, 0x844);
    FIELD(s32, object, 0x844) = (s16)index;
}

/*
 * Reset the 64-slot pool by returning every index in descending order through
 * func_ov042_02205148. Already inactive slots are ignored; no value is returned.
 */
extern "C" void func_ov042_02205180(void *object)
{
    for (s32 i = 63; i >= 0; --i)
        func_ov042_02205148(object, i);
}

/*
 * Store two caller values into the record's scale halfwords at +0x3C/+0x3E.
 * Both inputs are narrowed to 16 bits; record changes and no value is returned.
 */
extern "C" void func_ov042_02205d74(void *record, s32 scaleX, s32 scaleY)
{
    FIELD(u16, record, 0x3c) = (u16)scaleX;
    FIELD(u16, record, 0x3e) = (u16)scaleY;
}

/*
 * Initialize destination as an embedded element, then store the component-wise
 * sum of first and second in payload words +4/+8. Destination changes and no
 * value is returned.
 */
extern "C" void func_ov042_02206fc0(void *destination, const void *first,
                                    const void *second)
{
    func_ov042_021fcf80(destination);
    FIELD(s32, destination, 4) =
        FIELD(s32, first, 4) + FIELD(s32, second, 4);
    FIELD(s32, destination, 8) =
        FIELD(s32, first, 8) + FIELD(s32, second, 8);
}

/*
 * Delegate teardown of the first late-scene object variant to func_02099fb0 and
 * return the original object pointer. The outer allocation is not freed here.
 */
extern "C" void *func_ov042_02207ef0(void *object)
{
    func_02099fb0(object);
    return object;
}

/*
 * Enforce a minimum word value of 100 at object+0x74. Only when raising it,
 * also set byte +0x8B to 10. Values already at least 100 are unchanged; no
 * value is returned. The semantic names of these fields remain unconfirmed.
 */
extern "C" void func_ov042_022080d4(void *object)
{
    if (FIELD(s32, object, 0x74) < 100) {
        FIELD(s32, object, 0x74) = 100;
        FIELD(u8, object, 0x8b) = 10;
    }
}

/*
 * Enable selector zero on object and selector on the linked object at +0x4C,
 * passing enabled=1 to func_0209a2ac in both cases. SDK-owned child state may
 * change; no value is returned.
 */
extern "C" void func_ov042_02208774(void *object, s32 selector)
{
    func_0209a2ac(object, 0, 1);
    func_0209a2ac(FIELD(void *, object, 0x4c), selector, 1);
}

/*
 * Delegate teardown of the second late-scene object variant to func_02099fb0
 * and return the original pointer. The outer allocation is not freed here.
 */
extern "C" void *func_ov042_02208894(void *object)
{
    func_02099fb0(object);
    return object;
}

/*
 * Enforce the same minimum word/byte pair as func_ov042_022080d4 for the second
 * address-distinct object variant: raise +0x74 to 100 and set +0x8B to 10 only
 * when the old word was below 100. No value is returned.
 */
extern "C" void func_ov042_02208a90(void *object)
{
    if (FIELD(s32, object, 0x74) < 100) {
        FIELD(s32, object, 0x74) = 100;
        FIELD(u8, object, 0x8b) = 10;
    }
}

/*
 * Configure a record belonging to the first late object variant. The first
 * argument is unused; pass record+0xC and the sixth argument's low byte to
 * GraphicsSpriteState_SetAnimationIndex, set bit 1 in resource halfword +0x24, store three values at
 * record+0x30..+0x38, set scale halfwords +0x3C/+0x3E to 0x100, and clear
 * +0x40. SDK-owned resource state changes and no value is returned.
 */
extern "C" void func_ov042_02207f04(void *unused, void *record,
                                    s32 value0, s32 value1,
                                    s32 value2, u8 mode)
{
    (void)unused;
    void *resource = FIELD(void *, record, 0xc);
    GraphicsSpriteState_SetAnimationIndex(resource, mode);
    FIELD(u16, resource, 0x24) |= 2;
    FIELD(s32, record, 0x30) = value0;
    FIELD(s32, record, 0x34) = value1;
    FIELD(s32, record, 0x38) = value2;
    FIELD(u16, record, 0x3c) = 0x100;
    FIELD(u16, record, 0x3e) = 0x100;
    FIELD(u16, record, 0x40) = 0;
}

/*
 * Configure a record belonging to the second late object variant. Behavior is
 * intentionally identical to func_ov042_02207f04, but this address-derived
 * entry point is retained independently for matching and call-graph fidelity.
 */
extern "C" void func_ov042_022088a8(void *unused, void *record,
                                    s32 value0, s32 value1,
                                    s32 value2, u8 mode)
{
    (void)unused;
    void *resource = FIELD(void *, record, 0xc);
    GraphicsSpriteState_SetAnimationIndex(resource, mode);
    FIELD(u16, resource, 0x24) |= 2;
    FIELD(s32, record, 0x30) = value0;
    FIELD(s32, record, 0x34) = value1;
    FIELD(s32, record, 0x38) = value2;
    FIELD(u16, record, 0x3c) = 0x100;
    FIELD(u16, record, 0x3e) = 0x100;
    FIELD(u16, record, 0x40) = 0;
}

extern "C" u32 data_ov042_0220b6e4[];
extern "C" u32 data_ov042_0220b6e8[];

/* Enable selector zero on object and selector on its +0x4C child. */
extern "C" void func_ov042_02208fd0(void *object, s32 selector)
{
    func_0209a2ac(object, 0, 1);
    func_0209a2ac(FIELD(void *, object, 0x4c), selector, 1);
}

/* Delegate teardown of the third late object variant and return object. */
extern "C" void *func_ov042_02209128(void *object)
{
    func_02099fb0(object);
    return object;
}

/*
 * Configure a record for the third late object variant. This address-distinct
 * entry point has the same resource, position, scale, and flag effects as the
 * two preceding variant configurators; no value is returned.
 */
extern "C" void func_ov042_0220913c(void *unused, void *record,
                                    s32 value0, s32 value1,
                                    s32 value2, u8 mode)
{
    (void)unused;
    void *resource = FIELD(void *, record, 0xc);
    GraphicsSpriteState_SetAnimationIndex(resource, mode);
    FIELD(u16, resource, 0x24) |= 2;
    FIELD(s32, record, 0x30) = value0;
    FIELD(s32, record, 0x34) = value1;
    FIELD(s32, record, 0x38) = value2;
    FIELD(u16, record, 0x3c) = 0x100;
    FIELD(u16, record, 0x3e) = 0x100;
    FIELD(u16, record, 0x40) = 0;
}

/*
 * Reset the third variant's linked child. Disable its resource via mode zero,
 * clear object+0x78, use byte +0x8E to select the first word of eight-byte
 * entries from the two confirmed tables and store each value shifted left 12
 * at +0x54/+0x58, then clear bit 2 in child halfword +0x42. No value is returned.
 */
extern "C" void func_ov042_02209190(void *object)
{
    void *child = FIELD(void *, object, 0x4c);
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, child, 0xc), 0);
    FIELD(s32, object, 0x78) = 0;
    u8 index = FIELD(u8, object, 0x8e);
    FIELD(s32, object, 0x54) = data_ov042_0220b6e4[index * 2] << 12;
    FIELD(s32, object, 0x58) = data_ov042_0220b6e8[index * 2] << 12;
    FIELD(u16, child, 0x42) &= (u16)~4;
}

/* Raise +0x78 to 100 and set byte +0x8F to 10 only when below 100. */
extern "C" void func_ov042_02209344(void *object)
{
    if (FIELD(s32, object, 0x78) < 100) {
        FIELD(s32, object, 0x78) = 100;
        FIELD(u8, object, 0x8f) = 10;
    }
}

/* Subtract source payload words +4/+8 from destination in place. */
extern "C" void func_ov042_02209944(void *destination, const void *source)
{
    FIELD(s32, destination, 4) -= FIELD(s32, source, 4);
    FIELD(s32, destination, 8) -= FIELD(s32, source, 8);
}

/* Enable selector zero on object and selector on its +0x4C child. */
extern "C" void func_ov042_02209968(void *object, s32 selector)
{
    func_0209a2ac(object, 0, 1);
    func_0209a2ac(FIELD(void *, object, 0x4c), selector, 1);
}

/* Store two caller words into an eight-byte destination; return no value. */
extern "C" void func_ov042_02209994(void *destination, s32 value0, s32 value1)
{
    FIELD(s32, destination, 0) = value0;
    FIELD(s32, destination, 4) = value1;
}

/* Delegate teardown of the fourth late object variant and return object. */
extern "C" void *func_ov042_02209a8c(void *object)
{
    func_02099fb0(object);
    return object;
}

/* Configure a fourth-variant record using the established resource contract. */
extern "C" void func_ov042_02209aa0(void *unused, void *record,
                                    s32 value0, s32 value1,
                                    s32 value2, u8 mode)
{
    (void)unused;
    void *resource = FIELD(void *, record, 0xc);
    GraphicsSpriteState_SetAnimationIndex(resource, mode);
    FIELD(u16, resource, 0x24) |= 2;
    FIELD(s32, record, 0x30) = value0;
    FIELD(s32, record, 0x34) = value1;
    FIELD(s32, record, 0x38) = value2;
    FIELD(u16, record, 0x3c) = 0x100;
    FIELD(u16, record, 0x3e) = 0x100;
    FIELD(u16, record, 0x40) = 0;
}

/* Raise fourth-variant word +0x74 to 100 and set +0x8B to 10 if needed. */
extern "C" void func_ov042_02209cbc(void *object)
{
    if (FIELD(s32, object, 0x74) < 100) {
        FIELD(s32, object, 0x74) = 100;
        FIELD(u8, object, 0x8b) = 10;
    }
}

/* Delegate teardown of the eight-child object variant and return object. */
extern "C" void *func_ov042_0220a8ac(void *object)
{
    func_02099fb0(object);
    return object;
}

/* Configure an eight-child variant record using the established contract. */
extern "C" void func_ov042_0220a8c0(void *unused, void *record,
                                    s32 value0, s32 value1,
                                    s32 value2, u8 mode)
{
    (void)unused;
    void *resource = FIELD(void *, record, 0xc);
    GraphicsSpriteState_SetAnimationIndex(resource, mode);
    FIELD(u16, resource, 0x24) |= 2;
    FIELD(s32, record, 0x30) = value0;
    FIELD(s32, record, 0x34) = value1;
    FIELD(s32, record, 0x38) = value2;
    FIELD(u16, record, 0x3c) = 0x100;
    FIELD(u16, record, 0x3e) = 0x100;
    FIELD(u16, record, 0x40) = 0;
}

/*
 * Return one of eight children to the free list only if its hidden flag bit 2
 * is currently clear. Set that bit in child halfword +0x42, link the slot's
 * word at object+0x6C+index*4 to the old signed head at +0x8C, and make index
 * the new head. An already hidden child is unchanged; no value is returned.
 */
extern "C" void func_ov042_0220a914(void *object, s32 index)
{
    void *child = FIELD(void *, object, 0x4c + index * 4);
    if ((FIELD(u16, child, 0x42) & 4) == 0) {
        FIELD(u16, child, 0x42) |= 4;
        FIELD(s32, object, 0x6c + index * 4) = FIELD(s32, object, 0x8c);
        FIELD(s32, object, 0x8c) = index;
    }
}

/*
 * Pop and activate the child at the signed free-list head +0x8C. A negative
 * head returns immediately. Otherwise clear hidden bit 2, set both scale
 * halfwords to scale narrowed/sign-extended from 16 bits, set timer +0x40 to
 * eight, call func_020a1794(owner at +0x48, child state +0x2C, 0), and advance
 * the head through the slot link at +0x6C. No value is returned.
 */
extern "C" void func_ov042_0220a93c(void *object, s32 unused, s32 scale)
{
    (void)unused;
    s32 index = FIELD(s32, object, 0x8c);
    if (index < 0)
        return;
    void *child = FIELD(void *, object, 0x4c + index * 4);
    FIELD(u16, child, 0x42) &= (u16)~4;
    s16 narrowedScale = (s16)scale;
    FIELD(u16, child, 0x3c) = (u16)narrowedScale;
    FIELD(u16, child, 0x3e) = (u16)narrowedScale;
    FIELD(u16, child, 0x40) = 8;
    func_020a1794(FIELD(void *, object, 0x48), (u8 *)child + 0x2c, 0);
    FIELD(s32, object, 0x8c) = FIELD(s32, object, 0x6c + index * 4);
}

/*
 * Update all eight children in descending order. Visible children decrement
 * their +0x40 timer; positive results are narrowed to eight bits before being
 * stored. Once the timer reaches zero or below, return that slot through
 * func_ov042_0220a914. Hidden children are skipped; no value is returned.
 */
extern "C" void func_ov042_0220a9c4(void *object)
{
    for (s32 i = 7; i >= 0; --i) {
        void *child = FIELD(void *, object, 0x4c + i * 4);
        if (FIELD(u16, child, 0x42) & 4)
            continue;
        s32 timer = FIELD(u16, child, 0x40) - 1;
        if (timer > 0)
            FIELD(u16, child, 0x40) = (u8)timer;
        else
            func_ov042_0220a914(object, i);
    }
}

/*
 * Enable selector zero on object, then enable selector on each of its eight
 * child pointers at +0x4C in descending order. All calls pass enabled=1 and
 * may change SDK-owned presentation state; no value is returned.
 */
extern "C" void func_ov042_0220aa18(void *object, s32 selector)
{
    func_0209a2ac(object, 0, 1);
    for (s32 i = 7; i >= 0; --i)
        func_0209a2ac(FIELD(void *, object, 0x4c + i * 4), selector, 1);
}

/* Delegate teardown of the forty-child object variant and return object. */
extern "C" void *func_ov042_0220ab30(void *object)
{
    func_02099fb0(object);
    return object;
}

/*
 * Configure a forty-child record. Pass its resource and mode to
 * GraphicsSpriteState_SetAnimationIndex, clear resource halfword bit 1 (unlike the earlier variants),
 * store three values at +0x30..+0x38, set both scales to 0x100, and clear
 * +0x40. SDK-owned state changes and no value is returned.
 */
extern "C" void func_ov042_0220ab44(void *unused, void *record,
                                    s32 value0, s32 value1,
                                    s32 value2, u8 mode)
{
    (void)unused;
    void *resource = FIELD(void *, record, 0xc);
    GraphicsSpriteState_SetAnimationIndex(resource, mode);
    FIELD(u16, resource, 0x24) &= (u16)~2;
    FIELD(s32, record, 0x30) = value0;
    FIELD(s32, record, 0x34) = value1;
    FIELD(s32, record, 0x38) = value2;
    FIELD(u16, record, 0x3c) = 0x100;
    FIELD(u16, record, 0x3e) = 0x100;
    FIELD(u16, record, 0x40) = 0;
}

/*
 * Return one of forty children to the free list when its hidden bit is clear.
 * Set child halfword +0x42 bit 2, link object+0xEC+index*4 to old head +0x18C,
 * and make index the new head. Already hidden children are unchanged.
 */
extern "C" void func_ov042_0220ab98(void *object, s32 index)
{
    void *child = FIELD(void *, object, 0x4c + index * 4);
    if ((FIELD(u16, child, 0x42) & 4) == 0) {
        FIELD(u16, child, 0x42) |= 4;
        FIELD(s32, object, 0xec + index * 4) = FIELD(s32, object, 0x18c);
        FIELD(s32, object, 0x18c) = index;
    }
}

/*
 * Scan all forty children in descending order. For each visible child whose
 * linked resource halfword +0x24 has bit zero set, return the slot through
 * func_ov042_0220ab98. Hidden or incomplete children are retained; no value is
 * returned.
 */
extern "C" void func_ov042_0220abc0(void *object)
{
    for (s32 i = 39; i >= 0; --i) {
        void *child = FIELD(void *, object, 0x4c + i * 4);
        if (FIELD(u16, child, 0x42) & 4)
            continue;
        void *resource = FIELD(void *, child, 0xc);
        if (FIELD(u16, resource, 0x24) & 1)
            func_ov042_0220ab98(object, i);
    }
}

/*
 * Enable selector zero on the forty-child owner, then enable selector on all
 * forty child pointers at +0x4C in descending index order. Every call passes
 * enabled=1 and may change SDK-owned presentation state; no value is returned.
 */
extern "C" void func_ov042_0220ac14(void *object, s32 selector)
{
    func_0209a2ac(object, 0, 1);
    for (s32 i = 39; i >= 0; --i)
        func_0209a2ac(FIELD(void *, object, 0x4c + i * 4), selector, 1);
}

#include "tingle/types.h"

/*
 * Overlay 42 presentation-pool constructors. These recovered routines build
 * fixed-capacity arrays of embedded elements or SDK presentation records and
 * initialize their offset-derived free-list metadata.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_ov042_021fcf80(void *element);
extern "C" void func_ov042_021fcf9c(void *element);
extern "C" void *func_ov042_021fd66c(void *object);
extern "C" void *func_0209a208(void *owner, s32 resource0, s32 resource1,
                                s32 resource2, s32 heap, s32 enabled);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *resource, u8 mode);
extern "C" void __construct_array(void *array, s32 count, s32 size,
                                   void (*constructor)(void *),
                                   void (*destructor)(void *));
extern "C" u8 data_ov042_0220b6a0[];
extern "C" u8 data_ov042_0220b6ac[];
extern "C" u8 data_ov042_0220b5bc[];
extern "C" u8 data_ov042_0220b5f4[];
extern "C" u8 data_ov042_0220b62c[];
extern "C" u8 data_ov042_0220b664[];

typedef void (*RecordConfigure)(void *, void *, s32, s32, s32, s32);

/*
 * Construct two arrays of 64 twelve-byte embedded elements at +0x144 and
 * +0x544, install table, initialize each signed activity byte +4 to -1 and
 * each halfword link +0x7C4 to the following index, then set halfword +0x842
 * to -1 and the signed head +0x844 to zero. Returns object. The exact roles of
 * the two element arrays remain inferred from layout only.
 */
extern "C" void *func_ov042_022050b0(void *object, void *table)
{
    __construct_array((u8 *)object + 0x144, 64, 12,
                      func_ov042_021fcf80, func_ov042_021fcf9c);
    __construct_array((u8 *)object + 0x544, 64, 12,
                      func_ov042_021fcf80, func_ov042_021fcf9c);
    FIELD(void *, object, 0) = table;
    for (s32 i = 63; i >= 0; --i) {
        FIELD(s8, object, 4 + i) = -1;
        FIELD(u16, object, 0x7c4 + i * 2) = (u16)(i + 1);
    }
    FIELD(u16, object, 0x842) = (u16)-1;
    FIELD(s32, object, 0x844) = 0;
    return object;
}

/*
 * Construct an eight-child variant after the common scene base. Install the
 * confirmed table and owner, create eight resource records in descending slot
 * order from IDs 0x21E6..0x21E8, invoke virtual slot zero with zero arguments,
 * hide each child, set child +0x44 to -100, and chain +0x6C links to index+1.
 * Set +0x88 to -1 and free-list head +0x8C to zero, then return object.
 */
extern "C" void *func_ov042_0220a7d8(void *object, void *owner, s32 heap)
{
    func_ov042_021fd66c(object);
    FIELD(void *, object, 0) = data_ov042_0220b6a0;
    FIELD(void *, object, 0x48) = owner;
    for (s32 i = 7; i >= 0; --i) {
        void *child = func_0209a208(object, 0x21e6, 0x21e7, 0x21e8, heap, 1);
        FIELD(void *, object, 0x4c + i * 4) = child;
        RecordConfigure configure = *(RecordConfigure *)FIELD(void *, object, 0);
        configure(object, child, 0, 0, 0, 0);
        FIELD(u16, child, 0x42) |= 4;
        FIELD(s32, child, 0x44) = -100;
        FIELD(s32, object, 0x6c + i * 4) = i + 1;
    }
    FIELD(s32, object, 0x88) = -1;
    FIELD(s32, object, 0x8c) = 0;
    return object;
}

/*
 * Construct the forty-child variant using the same confirmed contract as the
 * eight-child constructor, but install its address-derived table, use resource
 * IDs 0x2221..0x2223, store links at +0xEC, and finish with +0x188=-1 and
 * head +0x18C=0. Returns object; SDK resource allocations remain owned by it.
 */
extern "C" void *func_ov042_0220aa5c(void *object, void *owner, s32 heap)
{
    func_ov042_021fd66c(object);
    FIELD(void *, object, 0) = data_ov042_0220b6ac;
    FIELD(void *, object, 0x48) = owner;
    for (s32 i = 39; i >= 0; --i) {
        void *child = func_0209a208(object, 0x2221, 0x2222, 0x2223, heap, 1);
        FIELD(void *, object, 0x4c + i * 4) = child;
        RecordConfigure configure = *(RecordConfigure *)FIELD(void *, object, 0);
        configure(object, child, 0, 0, 0, 0);
        FIELD(u16, child, 0x42) |= 4;
        FIELD(s32, child, 0x44) = -100;
        FIELD(s32, object, 0xec + i * 4) = i + 1;
    }
    FIELD(s32, object, 0x188) = -1;
    FIELD(s32, object, 0x18c) = 0;
    return object;
}

/*
 * Construct the first single-child late variant. Initialize three embedded
 * elements at +0x50/+0x5C/+0x68, install its confirmed table and owner, create
 * resource IDs 0x12DB..0x12DD with mode 2, and invoke virtual slot zero with
 * fixed-point coordinates 0x80000 and -0x50000. Hide and disable the child,
 * clear the offset-derived motion fields, initialize +0x74 to 101, and return
 * object. SDK presentation resources become owned by the object.
 */
extern "C" void *func_ov042_02207e04(void *object, void *owner, s32 heap)
{
    func_ov042_021fd66c(object);
    FIELD(void *, object, 0) = data_ov042_0220b5bc;
    func_ov042_021fcf80((u8 *)object + 0x50);
    func_ov042_021fcf80((u8 *)object + 0x5c);
    func_ov042_021fcf80((u8 *)object + 0x68);
    FIELD(void *, object, 0x48) = owner;
    void *child = func_0209a208(object, 0x12db, 0x12dc, 0x12dd, heap, 2);
    FIELD(void *, object, 0x4c) = child;
    RecordConfigure configure = *(RecordConfigure *)FIELD(void *, object, 0);
    configure(object, child, 0x80000, -0x50000, 0, 0);
    FIELD(u16, child, 0x42) |= 4;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, child, 0xc), 0);
    FIELD(s32, object, 0x54) = 0;
    FIELD(s32, object, 0x58) = 0;
    FIELD(s32, object, 0x74) = 101;
    FIELD(s32, object, 0x78) = 0;
    FIELD(s32, object, 0x7c) = 0;
    FIELD(u8, object, 0x8b) = 0;
    FIELD(s32, object, 0x80) = 0;
    FIELD(s32, object, 0x84) = 0;
    FIELD(u16, object, 0x88) = 0;
    FIELD(s32, object, 0x8c) = 0;
    return object;
}

/*
 * Construct the second address-distinct single-child late variant using table
 * data_ov042_0220b5f4 and IDs 0x12F4..0x12F6. Its setup matches the first
 * variant except that child word +0x44 is initialized to -60 and object +0x8C
 * is not written. Returns object after transferring SDK resource ownership.
 */
extern "C" void *func_ov042_022087a0(void *object, void *owner, s32 heap)
{
    func_ov042_021fd66c(object);
    FIELD(void *, object, 0) = data_ov042_0220b5f4;
    func_ov042_021fcf80((u8 *)object + 0x50);
    func_ov042_021fcf80((u8 *)object + 0x5c);
    func_ov042_021fcf80((u8 *)object + 0x68);
    FIELD(void *, object, 0x48) = owner;
    void *child = func_0209a208(object, 0x12f4, 0x12f5, 0x12f6, heap, 2);
    FIELD(void *, object, 0x4c) = child;
    RecordConfigure configure = *(RecordConfigure *)FIELD(void *, object, 0);
    configure(object, child, 0x80000, -0x50000, 0, 0);
    FIELD(u16, child, 0x42) |= 4;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, child, 0xc), 0);
    FIELD(s32, child, 0x44) = -60;
    FIELD(s32, object, 0x54) = 0;
    FIELD(s32, object, 0x58) = 0;
    FIELD(s32, object, 0x74) = 101;
    FIELD(s32, object, 0x78) = 0;
    FIELD(s32, object, 0x7c) = 0;
    FIELD(u8, object, 0x8b) = 0;
    FIELD(s32, object, 0x80) = 0;
    FIELD(u16, object, 0x88) = 0;
    FIELD(s32, object, 0x84) = 0;
    return object;
}

/*
 * Construct the third single-child variant. After common and embedded-element
 * initialization, select IDs 0x12EE..0x12F0 for subtype zero or
 * 0x12F1..0x12F3 otherwise, create the child with mode 2, and configure its
 * fixed-point coordinates to 0x80000/-0x50000. Hide and disable the child, set
 * child +0x44 to -30, initialize +0x78 to 101, clear the remaining recovered
 * state fields, store subtype's low byte at +0x8E, and return object.
 */
extern "C" void *func_ov042_02208ffc(void *object, void *owner, s32 heap,
                                     s32 subtype)
{
    func_ov042_021fd66c(object);
    FIELD(void *, object, 0) = data_ov042_0220b62c;
    func_ov042_021fcf80((u8 *)object + 0x50);
    func_ov042_021fcf80((u8 *)object + 0x5c);
    func_ov042_021fcf80((u8 *)object + 0x68);
    FIELD(void *, object, 0x48) = owner;
    s32 resource = subtype == 0 ? 0x12ee : 0x12f1;
    void *child = func_0209a208(object, resource, resource + 1, resource + 2,
                                heap, 2);
    FIELD(void *, object, 0x4c) = child;
    RecordConfigure configure = *(RecordConfigure *)FIELD(void *, object, 0);
    configure(object, child, 0x80000, -0x50000, 0, 0);
    FIELD(u16, child, 0x42) |= 4;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, child, 0xc), 0);
    FIELD(s32, child, 0x44) = -30;
    FIELD(s32, object, 0x54) = 0;
    FIELD(s32, object, 0x58) = 0;
    FIELD(s32, object, 0x78) = 101;
    FIELD(s32, object, 0x7c) = 0;
    FIELD(s32, object, 0x80) = 0;
    FIELD(u8, object, 0x8f) = 0;
    FIELD(s32, object, 0x84) = 0;
    FIELD(s32, object, 0x88) = 0;
    FIELD(u16, object, 0x8c) = 0;
    FIELD(u8, object, 0x8e) = (u8)subtype;
    return object;
}

/*
 * Construct the fourth address-distinct single-child variant. It uses table
 * data_ov042_0220b664 and IDs 0x12F4..0x12F6, then follows the confirmed
 * second-variant contract: fixed coordinates, hidden and disabled child,
 * child +0x44=-60, state +0x74=101, and cleared motion fields through +0x88.
 * Returns object with ownership of the created SDK resource.
 */
extern "C" void *func_ov042_0220999c(void *object, void *owner, s32 heap)
{
    func_ov042_021fd66c(object);
    FIELD(void *, object, 0) = data_ov042_0220b664;
    func_ov042_021fcf80((u8 *)object + 0x50);
    func_ov042_021fcf80((u8 *)object + 0x5c);
    func_ov042_021fcf80((u8 *)object + 0x68);
    FIELD(void *, object, 0x48) = owner;
    void *child = func_0209a208(object, 0x12f4, 0x12f5, 0x12f6, heap, 2);
    FIELD(void *, object, 0x4c) = child;
    RecordConfigure configure = *(RecordConfigure *)FIELD(void *, object, 0);
    configure(object, child, 0x80000, -0x50000, 0, 0);
    FIELD(u16, child, 0x42) |= 4;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, child, 0xc), 0);
    FIELD(s32, child, 0x44) = -60;
    FIELD(s32, object, 0x54) = 0;
    FIELD(s32, object, 0x58) = 0;
    FIELD(s32, object, 0x74) = 101;
    FIELD(s32, object, 0x78) = 0;
    FIELD(s32, object, 0x7c) = 0;
    FIELD(u8, object, 0x8b) = 0;
    FIELD(s32, object, 0x80) = 0;
    FIELD(u16, object, 0x88) = 0;
    return object;
}

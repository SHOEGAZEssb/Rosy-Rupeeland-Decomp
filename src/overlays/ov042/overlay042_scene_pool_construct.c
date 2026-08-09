#include "tingle/types.h"

/*
 * Overlay 42 main scene-pool construction. This recovered constructor builds
 * the ordinary-record and secondary-child storage used by the overlay's shared
 * effect scene, initializes both free lists, and creates hidden SDK children.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *func_ov042_021fd66c(void *object);
extern "C" void func_ov042_021fcf80(void *element);
extern "C" void func_ov042_021fcf9c(void *element);
extern "C" void __construct_array(void *array, s32 count, s32 size,
                                    void (*constructor)(void *),
                                    void (*destructor)(void *));
extern "C" void *func_0209a208(void *owner, s32 resource0, s32 resource1,
                                 s32 resource2, s32 heap, s32 mode);
extern "C" void func_0209a07c(void *child);
extern "C" u8 data_ov042_0220b534[];

typedef void (*RecordConfigure)(void *, void *, s32, s32, s32, s32);

/*
 * Given object, owner, and heap, initialize the common scene base and install
 * the confirmed table. Construct 100 twelve-byte elements at +0x4C and +0x4FC
 * plus 48 at +0xFE8 and +0x1228. Initialize the 100-entry ordinary free list
 * with inactive state -1 and head zero. Create 48 children using IDs
 * 0x21E6..0x21E8 and mode two, configure each at (0x80000,-0x50000), hide and
 * notify it, set +0x44=-100, and initialize the secondary free list. Returns
 * object; the created SDK resources remain owned by it.
 */
extern "C" void *func_ov042_021fd6ac(void *object, void *owner, s32 heap)
{
    func_ov042_021fd66c(object);
    FIELD(void *, object, 0) = data_ov042_0220b534;
    __construct_array((u8 *)object + 0x4c, 100, 12,
                      func_ov042_021fcf80, func_ov042_021fcf9c);
    __construct_array((u8 *)object + 0x4fc, 100, 12,
                      func_ov042_021fcf80, func_ov042_021fcf9c);
    __construct_array((u8 *)object + 0xfe8, 48, 12,
                      func_ov042_021fcf80, func_ov042_021fcf9c);
    __construct_array((u8 *)object + 0x1228, 48, 12,
                      func_ov042_021fcf80, func_ov042_021fcf9c);
    FIELD(void *, object, 0x48) = owner;
    for (s32 i = 99; i >= 0; --i) {
        FIELD(s32, object, 0xb3c + i * 4) = -1;
        FIELD(s32, object, 0xd94 + i * 4) = i + 1;
    }
    FIELD(s32, object, 0xf20) = -1;
    FIELD(s32, object, 0xf24) = 0;

    for (s32 i = 47; i >= 0; --i) {
        void *child = func_0209a208(object, 0x21e6, 0x21e7, 0x21e8,
                                     heap, 2);
        FIELD(void *, object, 0xf28 + i * 4) = child;
        RecordConfigure configure = *(RecordConfigure *)FIELD(void *, object, 0);
        configure(object, child, 0x80000, -0x50000, 0, 0);
        FIELD(u16, child, 0x42) |= 4;
        FIELD(s32, child, 0x44) = -100;
        func_0209a07c(child);
        FIELD(s32, object, 0x14c8 + i * 4) = -1;
        FIELD(s32, object, 0x1588 + i * 4) = i + 1;
    }
    FIELD(s32, object, 0x1644) = 0;
    FIELD(s32, object, 0x1648) = 0;
    return object;
}

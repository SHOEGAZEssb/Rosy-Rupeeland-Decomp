#include "tingle/types.h"

/*
 * Overlay 45 sprite-object factory. This recovered selector allocates a
 * 0x38-byte paired-sprite object and chooses its resource triplet from fixed
 * IDs, global descriptor records, game progress, or an indexed table.
 * Matching assembly preserves the original compiler's deliberately duplicated
 * switch arms; this file is the documented portable implementation.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u8 data_ov045_0220d5e0[];
extern "C" void *gHeapContext;
extern "C" void *gGameWork;
extern "C" u8 data_020ee8e0[];
extern "C" u8 data_020ed8e0[];
extern "C" u8 data_020ee4e0[];
extern "C" u8 data_020ee6e0[];
extern "C" u8 data_020ee7e0[];
extern "C" u8 data_020ee9e0[];
extern "C" u8 data_020eeae0[];
extern "C" u16 data_020ed740[];
extern "C" u16 data_020ed742[];
extern "C" u16 data_020ed744[];
extern "C" void *Heap_Alloc(s32 size, const void *tag, s32 alignment,
                              void *heap);
extern "C" void *func_ov045_0220be4c(void *object, s32 first, s32 second,
                                      s32 third, s32 spriteValue);
extern "C" void *func_ov045_0220c314(void *object);
extern "C" s32 GameWork_TestFlag(void *work, s32 flag);

#define ALLOCATE_PAIR() Heap_Alloc(0x38, data_ov045_0220d5e0, 4, gHeapContext)

/*
 * Allocate and construct a paired-sprite object for selector 0..17, returning
 * null on allocation failure. The second input refines selector 8: value 7
 * creates the derived scene, value 0x2C uses progress-sensitive IDs, and other
 * values index three halfword tables with stride 0x68. The third input is
 * forwarded as the normal constructor's sprite value. Selector 9 uses the
 * same progress flag 0x3A5; selectors 10..17 read confirmed triplets from
 * global descriptor offsets. Out-of-range selectors use the selector-0 IDs.
 * Heap, resource, sprite, PRNG, and possibly display-hardware state change.
 */
extern "C" void *func_ov045_0220c48c(u32 selector, s32 variant,
                                      s32 spriteValue)
{
    void *object;
    s32 first;

    switch (selector) {
    default:
    case 0:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        first = 0x1563;
        return func_ov045_0220be4c(object, first, first + 1, first + 2,
                                   spriteValue);
    case 1:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        first = 0x1572;
        return func_ov045_0220be4c(object, first, first + 1, first + 2,
                                   spriteValue);
    case 2:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        first = 0x1584;
        return func_ov045_0220be4c(object, first, first + 1, first + 2,
                                   spriteValue);
    case 3:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        first = 0x1581;
        return func_ov045_0220be4c(object, first, first + 1, first + 2,
                                   spriteValue);
    case 4:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        first = 0x1575;
        return func_ov045_0220be4c(object, first, first + 1, first + 2,
                                   spriteValue);
    case 5:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        first = 0x156c;
        return func_ov045_0220be4c(object, first, first + 1, first + 2,
                                   spriteValue);
    case 6:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        first = 0x1566;
        return func_ov045_0220be4c(object, first, first + 1, first + 2,
                                   spriteValue);
    case 7:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        first = 0x156f;
        return func_ov045_0220be4c(object, first, first + 1, first + 2,
                                   spriteValue);
    case 8:
        if (variant == 7) {
            object = ALLOCATE_PAIR();
            if (object == 0)
                return 0;
            return func_ov045_0220c314(object);
        }
        if (variant == 0x2c) {
            if (GameWork_TestFlag(gGameWork, 0x3a5) != 0) {
                object = ALLOCATE_PAIR();
                if (object == 0)
                    return 0;
                return func_ov045_0220be4c(
                    object, FIELD(u16, data_020ee8e0, 0x40),
                    FIELD(u16, data_020ee8e0, 0x42),
                    FIELD(u16, data_020ee8e0, 0x44), spriteValue);
            }
            object = ALLOCATE_PAIR();
            if (object == 0)
                return 0;
            first = 0x1599;
            return func_ov045_0220be4c(object, first, first + 1, first + 2,
                                       spriteValue);
        }
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        return func_ov045_0220be4c(
            object, data_020ed740[variant * 0x34],
            data_020ed742[variant * 0x34],
            data_020ed744[variant * 0x34], spriteValue);
    case 9:
        if (GameWork_TestFlag(gGameWork, 0x3a5) != 0) {
            object = ALLOCATE_PAIR();
            if (object == 0)
                return 0;
            return func_ov045_0220be4c(
                object, FIELD(u16, data_020ee8e0, 0x40),
                FIELD(u16, data_020ee8e0, 0x42),
                FIELD(u16, data_020ee8e0, 0x44), spriteValue);
        }
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        first = 0x1599;
        return func_ov045_0220be4c(object, first, first + 1, first + 2,
                                   spriteValue);
    case 10:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        return func_ov045_0220be4c(
            object, FIELD(u16, data_020ed8e0, 0xd0),
            FIELD(u16, data_020ed8e0, 0xd2),
            FIELD(u16, data_020ed8e0, 0xd4), spriteValue);
    case 11:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        return func_ov045_0220be4c(
            object, FIELD(u16, data_020ee4e0, 0x98),
            FIELD(u16, data_020ee4e0, 0x9a),
            FIELD(u16, data_020ee4e0, 0x9c), spriteValue);
    case 12:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        return func_ov045_0220be4c(
            object, FIELD(u16, data_020ee6e0, 0x38),
            FIELD(u16, data_020ee6e0, 0x3a),
            FIELD(u16, data_020ee6e0, 0x3c), spriteValue);
    case 13:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        return func_ov045_0220be4c(
            object, FIELD(u16, data_020ee7e0, 0x70),
            FIELD(u16, data_020ee7e0, 0x72),
            FIELD(u16, data_020ee7e0, 0x74), spriteValue);
    case 14:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        return func_ov045_0220be4c(
            object, FIELD(u16, data_020ee9e0, 0x78),
            FIELD(u16, data_020ee9e0, 0x7a),
            FIELD(u16, data_020ee9e0, 0x7c), spriteValue);
    case 15:
    case 17:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        return func_ov045_0220be4c(
            object, FIELD(u16, data_020ee9e0, 0xe0),
            FIELD(u16, data_020ee9e0, 0xe2),
            FIELD(u16, data_020ee9e0, 0xe4), spriteValue);
    case 16:
        object = ALLOCATE_PAIR();
        if (object == 0)
            return 0;
        return func_ov045_0220be4c(
            object, FIELD(u16, data_020eeae0, 0x48),
            FIELD(u16, data_020eeae0, 0x4a),
            FIELD(u16, data_020eeae0, 0x4c), spriteValue);
    }
}

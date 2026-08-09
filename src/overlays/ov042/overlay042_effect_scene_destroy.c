#include "tingle/types.h"

/*
 * Overlay 42 effect-scene teardown. This recovered destructor releases the
 * scene's pooled element storage and each family of optional derived objects
 * before delegating to the common scene base destructor.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void __destroy_arr(void *array, s32 count, s32 elementSize,
                                void (*destructor)(void *));
extern "C" void Heap_Free(void *allocation);
extern "C" void func_02099fb0(void *object);
extern "C" void func_ov042_021fcf9c(void *element);
extern "C" void func_ov042_02207ef0(void *object);
extern "C" void func_ov042_02208894(void *object);
extern "C" void func_ov042_02209128(void *object);
extern "C" void func_ov042_02209a8c(void *object);
extern "C" u32 data_ov042_0220b57c;

/*
 * Restore the confirmed vtable at +0, destroy the two 64-element arrays in
 * the optional +0xA0 allocation, and free that allocation. Then destroy and
 * free five +0x8C objects, two +0x84 objects, three +0x78 objects, and four
 * +0x68 objects in descending order, clearing each non-null slot. Finish with
 * common base teardown and return the original object without freeing it.
 */
extern "C" void *func_ov042_0220049c(void *object)
{
    FIELD(u32, object, 0) = (u32)&data_ov042_0220b57c;
    void *storage = FIELD(void *, object, 0xa0);
    if (storage != 0) {
        __destroy_arr((u8 *)storage + 0x444, 0x40, 0xc,
                      func_ov042_021fcf9c);
        __destroy_arr((u8 *)storage + 0x144, 0x40, 0xc,
                      func_ov042_021fcf9c);
        Heap_Free(storage);
    }
    for (s32 i = 4; i >= 0; --i) {
        void *entry = FIELD(void *, object, 0x8c + i * 4);
        if (entry != 0) {
            func_ov042_02209a8c(entry);
            Heap_Free(entry);
            FIELD(void *, object, 0x8c + i * 4) = 0;
        }
    }
    for (s32 i = 1; i >= 0; --i) {
        void *entry = FIELD(void *, object, 0x84 + i * 4);
        if (entry != 0) {
            func_ov042_02209128(entry);
            Heap_Free(entry);
            FIELD(void *, object, 0x84 + i * 4) = 0;
        }
    }
    for (s32 i = 2; i >= 0; --i) {
        void *entry = FIELD(void *, object, 0x78 + i * 4);
        if (entry != 0) {
            func_ov042_02208894(entry);
            Heap_Free(entry);
            FIELD(void *, object, 0x78 + i * 4) = 0;
        }
    }
    for (s32 i = 3; i >= 0; --i) {
        void *entry = FIELD(void *, object, 0x68 + i * 4);
        if (entry != 0) {
            func_ov042_02207ef0(entry);
            Heap_Free(entry);
            FIELD(void *, object, 0x68 + i * 4) = 0;
        }
    }
    func_02099fb0(object);
    return object;
}

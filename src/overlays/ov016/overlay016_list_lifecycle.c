#include "tingle/types.h"

/* Overlay 16 list/presentation object construction and destruction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18;
extern u8 data_021e9e00[];
extern const u32 data_ov016_02201394[];
extern const char data_ov016_02201570[];
extern const char data_ov016_02201578[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void *func_02003e20(u32, const void *, s32, void *);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void func_02073e48(void *, u32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void func_02092798(void *);
extern void func_020927b8(void *);
extern void func_02092814(void *, s32);
extern void *func_02094154(void *, void *, s32, s32, s32, s32, s32);
extern void func_02094574(void *);
extern void *func_020c09cc(void *, s32, s32, s32, void (*)(void *), s32);
extern void func_020c0c24(void *, s32, s32, void (*)(void *));
extern void func_ov016_021fce00(void *);
extern void func_ov016_021fd0dc(void *);
extern void func_ov016_021fd1e0(void *);
#ifdef __cplusplus
}
#endif

/*
 * Construct the 0x64-byte list/presentation object from owner and table index.
 * Initialize embedded resources +0x0C/+0x18/+0x28, acquire two owner children,
 * and load confirmed resource IDs 0x19-0x1B and 0x60-0x62. Capacity comes from
 * data_021E9E00+4; a nonzero capacity allocates and constructs that many 0x14-
 * byte descriptors plus a matching presentation object, while zero capacity
 * creates the presentation with its one-entry fallback. Initialize its graphic,
 * hide all children, queue values 0x7000/0x7005, and return state. Heap and SDK
 * allocations plus presentation resources are observable; no direct MMIO occurs.
 */
extern "C" void *func_ov016_021fce34(void *state, void *owner, s32 tableIndex)
{
    s32 capacity;
    void *object;

    func_02071ea4((u8 *)state + 0xc);
    func_02071ea4((u8 *)state + 0x18);
    func_02092798((u8 *)state + 0x28);
    FIELD(u32, state, 0x60) = data_ov016_02201394[tableIndex];
    FIELD(void *, state, 0) = owner;
    FIELD(void *, state, 4) = GraphicsSpriteGroupOwner_CreateGroup(owner);
    FIELD(s32, FIELD(void *, state, 4), 0x18) = 0x30;
    FIELD(s32, FIELD(void *, state, 4), 0x1c) = 0x20;
    FIELD(void *, state, 8) = GraphicsSpriteGroupOwner_CreateGroup(owner);
    func_02071ee0((u8 *)state + 0x18, data_020f4e18, 0x19, 0x1a, 0x1b);
    func_02071ee0((u8 *)state + 0xc, data_020f4e18, 0x60, 0x61, 0x62);

    capacity = FIELD(s32, data_021e9e00, 4);
    FIELD(s32, state, 0x50) = capacity;
    FIELD(s32, state, 0x54) = 0;
    if (capacity != 0) {
        object = func_02003e20(capacity * 0x14 + 8, data_ov016_02201570, 4,
                              gHeapContext);
        if (object != 0) {
            object = func_020c09cc(object, capacity, 0x14, 8,
                                   func_ov016_021fce00, 0);
        }
        FIELD(void *, state, 0x4c) = object;
        object = Heap_Alloc(0x80, data_ov016_02201578, 4, gHeapContext);
        if (object != 0) {
            object = func_02094154(object, owner, capacity, 5, 0xd6, 0x1c, 0xc);
        }
        FIELD(void *, state, 0x58) = object;
        FIELD(void *, state, 0x24) = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 8),
                                                   (u8 *)state + 0x18, 2);
        func_02073e48(FIELD(void *, state, 0x24), FIELD(u32, state, 0x60),
                      0x26, 0xaa, 1, 0, 0);
    } else {
        FIELD(void *, state, 0x4c) = 0;
        object = Heap_Alloc(0x80, data_ov016_02201578, 4, gHeapContext);
        if (object != 0) {
            object = func_02094154(object, owner, 1, 1, 0xd6, 0x1c, 8);
        }
        FIELD(void *, state, 0x58) = object;
        FIELD(void *, state, 0x24) = 0;
    }
    func_02094574(FIELD(void *, state, 0x58));
    func_ov016_021fd1e0(state);
    func_02092814((u8 *)state + 0x28, 0x7000);
    func_02092814((u8 *)state + 0x28, 0x7005);
    return state;
}

/*
 * Destroy the two owner children, delete the presentation object through vtable
 * slot +4, destroy any descriptor array using the recovered no-op callback, and
 * tear down embedded resources +0x28/+0x18/+0x0C. Return the original state
 * pointer. Heap/presentation resources are released; no direct hardware access.
 */
extern "C" void *func_ov016_021fd06c(void *state)
{
    typedef void (*DeleteFunction)(void *);
    void *presentation;

    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 4));
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 8));
    presentation = FIELD(void *, state, 0x58);
    if (presentation != 0) {
        DeleteFunction *vtable = *(DeleteFunction **)presentation;
        vtable[1](presentation);
    }
    if (FIELD(void *, state, 0x4c) != 0) {
        func_020c0c24(FIELD(void *, state, 0x4c), 0x14, 8, func_ov016_021fd0dc);
    }
    func_020927b8((u8 *)state + 0x28);
    func_02071eb8((u8 *)state + 0x18);
    func_02071eb8((u8 *)state + 0xc);
    return state;
}

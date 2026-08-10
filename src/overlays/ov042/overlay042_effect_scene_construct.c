#include "tingle/types.h"

/*
 * Overlay 42 effect-scene construction. This recovered constructor creates
 * the shared record pool, presentation children, four families of derived
 * effect objects, and the scene's offset-derived runtime state.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*RecordConfigure)(void *, void *, s32, s32, s32, s32);

extern "C" void *Heap_Alloc(s32 size, void *allocator, s32 alignment,
                              void *heapContext);
extern "C" void *func_ov042_021fd66c(void *object);
extern "C" void func_ov042_021fcf80(void *element);
extern "C" void *func_ov042_022050b0(void *object, void *owner);
extern "C" void *func_ov042_0220999c(void *object, void *owner, s32 heap);
extern "C" void *func_ov042_02207e04(void *object, void *owner, s32 heap);
extern "C" void *func_ov042_022087a0(void *object, void *owner, s32 heap);
extern "C" void *func_ov042_02208ffc(void *object, void *owner, s32 heap,
                                      s32 subtype);
extern "C" void func_ov042_02209190(void *object);
extern "C" void func_ov042_02200950(void *object);
extern "C" void *func_0209a208(void *owner, s32 resource0, s32 resource1,
                                 s32 resource2, s32 heap, s32 mode);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *animation, u8 index);
extern "C" void func_0209a2a4(void *child, void *parent);
extern "C" u8 data_ov042_0220b57c[];
extern "C" u8 data_ov042_0220b590[];
extern "C" void *gHeapContext;

static void configure_child(void *scene, void *child,
                            s32 x, s32 y, s32 z, s32 extra)
{
    RecordConfigure configure = *(RecordConfigure *)FIELD(void *, scene, 0);
    configure(scene, child, x, y, z, extra);
}

static void *create_child(void *scene, s32 firstResource, s32 heap, s32 mode,
                          s32 x, s32 y, u8 animation, bool hidden)
{
    void *child = func_0209a208(scene, firstResource, firstResource + 1,
                                firstResource + 2, heap, mode);
    configure_child(scene, child, x, y, 0, 0);
    if (hidden)
        FIELD(u16, child, 0x42) |= 4;
    else
        FIELD(u16, child, 0x42) &= (u16)~4;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, child, 0x0c), animation);
    return child;
}

/*
 * Given scene storage, owner, and heap identifier, initialize the common scene
 * base and install the confirmed table. Initialize the 16 embedded element
 * fields from +0xA4 through +0x27C. Allocate the 0x848-byte 64-record pool and
 * five variant-4 objects, create four primary presentation children plus three
 * hidden auxiliary children, then allocate four variant-1, three variant-2,
 * and two subtype-indexed variant-3 objects. Allocation failures are retained
 * as null entries exactly as observed; later resource creation is unconditional.
 *
 * The constructor configures resource IDs 0x12E0..0x12F9 and 0x1396/0x1078,
 * parent links, visibility flags, animation indices, draw-order words, initial
 * fixed-point positions, state counters, and sentinel -1 fields. It calls the
 * sample-history reset helper and returns the original scene. Heap ownership,
 * SDK presentation state, and child relationships change.
 */
extern "C" void *func_ov042_021ffee4(void *scene, void *owner, s32 heap)
{
    func_ov042_021fd66c(scene);
    FIELD(void *, scene, 0) = data_ov042_0220b57c;
    const u16 elementOffsets[] = {
        0xa4, 0xb0, 0x154, 0x160, 0x170, 0x17c, 0x18c, 0x198,
        0x1a4, 0x1f4, 0x200, 0x214, 0x250, 0x264, 0x270, 0x27c
    };
    for (u32 i = 0; i < sizeof(elementOffsets) / sizeof(elementOffsets[0]); ++i)
        func_ov042_021fcf80((u8 *)scene + elementOffsets[i]);
    FIELD(void *, scene, 0x48) = owner;

    void *pool = Heap_Alloc(0x848, data_ov042_0220b590, 4, gHeapContext);
    if (pool != 0)
        pool = func_ov042_022050b0(pool, owner);
    FIELD(void *, scene, 0xa0) = pool;

    for (s32 i = 4; i >= 0; --i) {
        void *entry = Heap_Alloc(0x8c, data_ov042_0220b590, 4, gHeapContext);
        if (entry != 0)
            entry = func_ov042_0220999c(entry, owner, heap);
        FIELD(void *, scene, 0x8c + i * 4) = entry;
    }

    void *primary = create_child(scene, 0x12e0, heap, 2,
                                  0x80000, -0x50000, 10, false);
    FIELD(void *, scene, 0x4c) = primary;

    void *secondary = create_child(scene, 0x12e3, heap, 1,
                                    0, -0x29000, 7, false);
    FIELD(void *, scene, 0x50) = secondary;
    FIELD(s32, secondary, 0x44) = -10;
    func_0209a2a4(secondary, primary);

    void *tertiary = create_child(scene, 0x12e8, heap, 2, 0, 0, 0, false);
    FIELD(void *, scene, 0x54) = tertiary;
    FIELD(s32, tertiary, 0x44) = 10;
    func_0209a2a4(tertiary, primary);

    void *hidden = create_child(scene, 0x12f7, heap, 2,
                                 0x80000, -0x3c000, 0, true);
    FIELD(void *, scene, 0x58) = hidden;
    FIELD(s32, hidden, 0x44) = -10;

    for (s32 i = 2; i >= 0; --i) {
        void *child = func_0209a208(scene, 0x1396, 0x1078, 0x1397, heap, 2);
        FIELD(void *, scene, 0x5c + i * 4) = child;
        configure_child(scene, child, 0, 0, 0, 0);
        FIELD(u16, child, 0x42) |= 4;
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, child, 0x0c), (u8)i);
    }
    FIELD(s32, FIELD(void *, scene, 0x5c), 0x44) = -125;
    FIELD(s32, FIELD(void *, scene, 0x60), 0x44) = -127;
    FIELD(s32, FIELD(void *, scene, 0x64), 0x44) = -126;
    func_ov042_02200950(scene);

    for (s32 i = 3; i >= 0; --i) {
        void *entry = Heap_Alloc(0x90, data_ov042_0220b590, 4, gHeapContext);
        if (entry != 0)
            entry = func_ov042_02207e04(entry, owner, heap);
        FIELD(void *, scene, 0x68 + i * 4) = entry;
    }
    for (s32 i = 2; i >= 0; --i) {
        void *entry = Heap_Alloc(0x8c, data_ov042_0220b590, 4, gHeapContext);
        if (entry != 0)
            entry = func_ov042_022087a0(entry, owner, heap);
        FIELD(void *, scene, 0x78 + i * 4) = entry;
    }
    for (s32 i = 1; i >= 0; --i) {
        void *entry = Heap_Alloc(0x90, data_ov042_0220b590, 4, gHeapContext);
        if (entry != 0)
            entry = func_ov042_02208ffc(entry, owner, heap, i);
        FIELD(void *, scene, 0x84 + i * 4) = entry;
        func_ov042_02209190(entry);
    }

    FIELD(s32, scene, 0xa8) = 0;
    FIELD(s32, scene, 0xac) = -0x50000;
    FIELD(s32, scene, 0x164) = 0;
    FIELD(s32, scene, 0x168) = -0x41000;
    FIELD(s32, scene, 0x174) = 0;
    FIELD(s32, scene, 0x178) = -0x26000;
    const u16 zeroOffsets[] = {
        0x180, 0x184, 0x190, 0x194, 0x19c, 0x1a0, 0x1a8, 0x1ac,
        0xbc, 0xc0, 0xd8, 0xdc, 0xc4, 0x1e4, 0x1e8, 0xc8, 0xcc,
        0x1ec, 0x1b4, 0x1b8, 0x1c0, 0x1bc, 0x1c4, 0x1c8, 0x1cc,
        0x1d0, 0x1d4, 0x1d8, 0x23c, 0x240, 0x244, 0x248, 0x24c
    };
    for (u32 i = 0; i < sizeof(zeroOffsets) / sizeof(zeroOffsets[0]); ++i)
        FIELD(s32, scene, zeroOffsets[i]) = 0;
    FIELD(s32, scene, 0x1b0) = 1;
    FIELD(s32, scene, 0xe0) = 0x352;
    FIELD(s32, scene, 0xe4) = 4;
    FIELD(s32, scene, 0x16c) = -1;
    FIELD(s32, scene, 0x150) = -1;
    return scene;
}

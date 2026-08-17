#include "tingle/types.h"

/* Overlay 34 owner construction and paired non-deleting/deleting destructors. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern void *data_021052fc;
extern const u8 data_ov034_021ff194[];
extern const u8 data_ov034_021ff1a8[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Presentation_Init(void *object);
extern void *GraphicsArchive_AcquireOwlvResource(void *resourceContext, s32 resourceId);
extern void *func_0201e0ec(void *globalRecord);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment,
                       void *heapContext);
extern void func_ov034_021fcff0(void *state, s32 side);
extern void PresentationScalar_SetImmediate(void *embedded, s32 capacity);
extern void Heap_Free(void *allocation);
extern void GraphicsArchive_ReleaseOwlvResource(void *resourceContext, void *resource);
extern void func_ov034_021fce00(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the overlay-34 owner. It initializes the common base, installs
 * vtable 0x021FF194, acquires graphics resource 0x5001 into +0x9C, resolves a
 * global record at +0x2F7C and copies its +0x35C/+0x434/+0xD4/+0x1AC/+0x284
 * pointers to owner +0xAC..+0xBC. It allocates three 0x2C-byte sector states at
 * +0xA0..+0xA8, initializes them with indices 0..2, and seeds each phase +0x1C
 * to 0x1800. Embedded buffer +0x6C is initialized with capacity zero and fields
 * +0xC0/+0xC4 clear. Returns `owner`; heap/resource/engine state changes, with
 * no direct MMIO. The binary assumes each sector-state allocation succeeds.
 */
extern "C" void *func_ov034_021fd544(void *owner)
{
    Presentation_Init(owner);
    FIELD(const void *, owner, 0) = data_ov034_021ff194;
    FIELD(void *, owner, 0x9c) = GraphicsArchive_AcquireOwlvResource(data_020f4e18[0], 0x5001);

    void *record = func_0201e0ec((u8 *)data_021052fc + 0x2f7c);
    FIELD(void *, owner, 0xac) = FIELD(void *, record, 0x35c);
    FIELD(void *, owner, 0xb0) = FIELD(void *, record, 0x434);
    FIELD(void *, owner, 0xb4) = FIELD(void *, record, 0xd4);
    FIELD(void *, owner, 0xb8) = FIELD(void *, record, 0x1ac);
    FIELD(void *, owner, 0xbc) = FIELD(void *, record, 0x284);

    for (s32 i = 0; i < 3; ++i) {
        void *state = Heap_Alloc(0x2c, data_ov034_021ff1a8, 4,
                                 gHeapContext);
        if (state != 0)
            state = (func_ov034_021fcff0(state, i), state);
        FIELD(void *, owner, 0xa0 + i * 4) = state;
        FIELD(s32, state, 0x1c) = 0x1800;
    }
    PresentationScalar_SetImmediate((u8 *)owner + 0x6c, 0);
    FIELD(s32, owner, 0xc4) = 0;
    FIELD(s32, owner, 0xc0) = 0;
    return owner;
}

/* Releases the three owned sector-state allocations and resource handle. */
static void release_owned_state(void *owner)
{
    FIELD(const void *, owner, 0) = data_ov034_021ff194;
    for (s32 i = 0; i < 3; ++i) {
        void *state = FIELD(void *, owner, 0xa0 + i * 4);
        if (state != 0)
            Heap_Free(state);
    }
    GraphicsArchive_ReleaseOwlvResource(data_020f4e18[0], FIELD(void *, owner, 0x9c));
    func_ov034_021fce00(owner);
}

/*
 * Non-deleting destructor: releases all three states and graphics resource,
 * invokes the base hook, and returns `owner` without freeing it. Heap and
 * resource state change; there is no direct hardware access.
 */
extern "C" void *func_ov034_021fd634(void *owner)
{
    release_owned_state(owner);
    return owner;
}

/*
 * Deleting destructor: performs the same owned-state/resource cleanup, frees
 * `owner`, and returns its now-invalid original address as observed in the
 * binary. Callers must not dereference it afterward; no direct MMIO occurs.
 */
extern "C" void *func_ov034_021fd690(void *owner)
{
    release_owned_state(owner);
    Heap_Free(owner);
    return owner;
}

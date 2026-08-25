#include "tingle/types.h"

/*
 * Overlay 41 derived scene-object construction. This recovered constructor
 * allocates per-entry tracking arrays, creates twelve render resources, and
 * instantiates mode-specific records from a static descriptor table.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void *func_ov041_021ff1cc(void *);
void func_ov041_021fd000(void *);
void *Heap_AllocAlternateEntry(s32, const void *, s32, void *);
void func_020c09cc(void *, s32, s32, s32, void *, void *);
void *func_0209a208(void *, s32, s32, s32, s32, s32);
void VecFx32Object_Init(void *);
void VecFx32Object_Destroy(void *);
void *func_ov041_021ff5a8(void *, s32, const void *);
void func_ov041_021fce00(void *);
extern u8 data_ov041_02205820;
extern u8 data_ov041_0220598c;
extern u8 gHeapContext;
extern const s32 data_ov041_02204d38[];
extern const s32 data_ov041_02204f30[];
}

typedef void (*PlacementCallback)(void *, void *, s32, s32, s32, s32);

static void *allocate_overlay_array(s32 bytes)
{
    return Heap_AllocAlternateEntry(bytes, &data_ov041_0220598c, 4, &gHeapContext);
}

/*
 * Initialize object from owner and resource context. Mode two uses 42 static
 * descriptors; other modes use 190. Six heap arrays are allocated, with the
 * two 12-byte-record arrays constructed element-wise. Twelve render resources
 * are created and placed through virtual slot zero, then one child is created
 * for every static descriptor. The object pointer is returned. This mutates
 * owner+0x1FC for descriptor types 1/3 and takes ownership of all allocations.
 */
extern "C" void *func_ov041_021ff20c(void *object, void *owner,
                                      void *resourceContext)
{
    func_ov041_021ff1cc(object);
    FIELD(void *, object, 0) = &data_ov041_02205820;
    func_ov041_021fd000((u8 *)object + 0xa0);
    FIELD(void *, object, 0x48) = owner;

    s32 count;
    const s32 *descriptors;
    if (FIELD(s32, owner, 0x1f4) == 2) {
        count = 0x2a;
        descriptors = data_ov041_02204d38;
    } else {
        count = 0xbe;
        descriptors = data_ov041_02204f30;
    }
    FIELD(s32, object, 0x1ac) = count;
    FIELD(void *, object, 0x80) = allocate_overlay_array(count * 2);

    void *recordsA = allocate_overlay_array(count * 12 + 8);
    if (recordsA != 0)
        func_020c09cc(recordsA, count, 12, 8,
                      (void *)func_ov041_021fd000,
                      (void *)func_ov041_021fce00);
    FIELD(void *, object, 0x84) = recordsA;

    void *recordsB = allocate_overlay_array(count * 12 + 8);
    if (recordsB != 0)
        func_020c09cc(recordsB, count, 12, 8,
                      (void *)func_ov041_021fd000,
                      (void *)func_ov041_021fce00);
    FIELD(void *, object, 0x88) = recordsB;
    FIELD(void *, object, 0x8c) = allocate_overlay_array(count * 2);
    FIELD(void *, object, 0x90) = allocate_overlay_array(count * 4);
    FIELD(void *, object, 0x94) = allocate_overlay_array(count * 2);
    FIELD(void *, object, 0x98) = allocate_overlay_array(count * 2);

    for (s32 i = count - 1; i >= 0; --i) {
        ((s16 *)FIELD(void *, object, 0x80))[i] = -1;
        ((s16 *)FIELD(void *, object, 0x98))[i] = -1;
    }

    for (s32 slot = 11; slot >= 0; --slot) {
        void *render = func_0209a208(object, 0x23a5, 0x23a6, 0x23a7,
                                     (s32)resourceContext, 1);
        FIELD(void *, object, 0x4c + slot * 4) = render;
        PlacementCallback place = *(PlacementCallback *)FIELD(void *, object, 0);
        place(object, render, 0x40000, 0x64000, 0, 0);
        FIELD(u16, render, 0x42) |= 4;
    }

    for (s32 i = count - 1; i >= 0; --i) {
        s32 position[4];
        VecFx32Object_Init(position);
        position[1] = descriptors[i * 3 + 1] << 12;
        position[2] = descriptors[i * 3 + 2] << 12;
        position[3] = 0;
        s32 type = descriptors[i * 3];
        if (type == 1 || type == 3)
            ++FIELD(s32, owner, 0x1fc);
        FIELD(void *, object, 0x9c) =
            func_ov041_021ff5a8(object, type, position);
        VecFx32Object_Destroy(position);
    }
    FIELD(s32, object, 0xa4) = 0x80000;
    FIELD(s32, object, 0xa8) = 0x1f4000;
    FIELD(s32, object, 0x1a8) = 0;
    return object;
}

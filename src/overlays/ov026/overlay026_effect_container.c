#include "tingle/types.h"

/* Overlay 26 composite effect construction and destruction for mesh, fan, and panel children. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18;
extern void *gHeapContext;
extern const s16 data_020c9670[];
extern const u16 data_ov026_022040cc[];
extern const s32 data_ov026_0220426c[];
extern const u8 data_ov026_02204960[];
extern const u8 data_ov026_02204a40[];
extern const u8 data_ov026_02204a50[];
extern const u8 data_ov026_02204a58[];
extern const u8 data_ov026_02204a60[];
extern const u8 data_ov026_02204a68[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern void GraphicsArchive_ReleaseOwlvResource(void *, void *);
extern void *GraphicsArchive_AcquireOwlvResource(void *, s32);
extern void *Graphics3DResourceBinding_Init(void *, void *, void *, u16, u16);
extern void Graphics3DResourceBinding_Destroy(void *);
extern void PresentationScalar_SetImmediate(void *, s32);
extern void Presentation_Init(void *);
extern void Presentation_SetPosition(void *, s32, s32, s32);
extern void *func_ov026_021fce50(void *);
extern void *func_ov026_021fce54(void *, void *, s32, u16);
extern void *func_ov026_021fd9c4(void *, void *, s32, s32);
extern void *func_ov026_021fdd84(void *, void *);
extern void *func_ov026_021fe2c8(void *, s32);
#ifdef __cplusplus
}
#endif

typedef void *(*ObjectMethod)(void *);

/* Invokes inferred destruction slot +4 if an owned polymorphic child exists. */
static void destroy_child(void *child)
{
    if (child != 0)
        ((ObjectMethod *)FIELD(void *, child, 0))[1](child);
}

/*
 * Constructs a composite effect around `resource_arg`. Eight 0x18 resource
 * records come from the halfword-pair table at 0x022040CC. Nine tube children
 * at +0xA0 use the index/length pairs at 0x0220426C and accumulate total axial
 * length in +0x13C. It also creates a disc (+0xE0), radial fan (+0xE4), a fixed
 * panel (+0xE8), and four circularly offset panels (+0xEC). The circle uses the
 * SDK sine/cosine table with radius 0x266. Runtime fields +0x120/+0x124/+0x12C/
 * +0x130 are cleared. Returns `object`; all allocations use heap 4.
 */
extern "C" void *func_ov026_021fef9c(void *object, void *resource_arg)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov026_02204960;

    for (s32 i = 0; i < 8; ++i) {
        void *record = Heap_Alloc(0x18, data_ov026_02204a40, 4, gHeapContext);
        if (record != 0)
            record = Graphics3DResourceBinding_Init(record, data_020f4e18, resource_arg,
                                   data_ov026_022040cc[i * 2],
                                   data_ov026_022040cc[i * 2 + 1]);
        FIELD(void *, object, 0xfc + i * 4) = record;
    }

    FIELD(s32, object, 0x9c) = 9;
    Presentation_SetPosition(object, 0, 8, 0);
    for (s32 i = 0; i < 16; ++i)
        FIELD(void *, object, 0xa0 + i * 4) = 0;
    FIELD(s32, object, 0x13c) = 0;

    for (s32 i = 0; i < FIELD(s32, object, 0x9c); ++i) {
        s32 resource_index = data_ov026_0220426c[i * 2];
        s32 segment_length = data_ov026_0220426c[i * 2 + 1];
        void *tube = Heap_Alloc(0x2c, data_ov026_02204a58, 4, gHeapContext);
        if (tube != 0)
            tube = func_ov026_021fd9c4(tube,
                    FIELD(void *, object, 0xfc + resource_index * 4),
                    segment_length, -(FIELD(s32, object, 0x13c) << 10));
        FIELD(void *, object, 0xa0 + i * 4) = tube;
        FIELD(s32, object, 0x13c) += segment_length;
    }

    void *disc = Heap_Alloc(0x20, data_ov026_02204a60, 4, gHeapContext);
    if (disc != 0)
        disc = func_ov026_021fdd84(disc, resource_arg);
    FIELD(void *, object, 0xe0) = disc;

    void *fan = Heap_Alloc(0x20, data_ov026_02204a68, 4, gHeapContext);
    if (fan != 0)
        fan = func_ov026_021fe2c8(fan, -(FIELD(s32, object, 0x13c) << 10));
    FIELD(void *, object, 0xe4) = fan;

    void *model_resource = GraphicsArchive_AcquireOwlvResource(data_020f4e18, 0x5000);
    FIELD(void *, object, 0x11c) = model_resource;
    void *panel = Heap_Alloc(0xb0, data_ov026_02204a50, 4, gHeapContext);
    if (panel != 0)
        panel = func_ov026_021fce54(panel, model_resource, 0, 0x7fff);
    FIELD(void *, object, 0xe8) = panel;
    Presentation_SetPosition(panel, 0, 0, -0x266);
    PresentationScalar_SetImmediate((u8 *)panel + 0x4c, 0x8000);
    PresentationScalar_SetImmediate((u8 *)panel + 0x6c, 0xcd);

    for (s32 i = 0; i < 4; ++i) {
        /* Quarter-turn indices select interleaved sine/cosine entries. */
        s32 table_index = i * 1024;
        s32 x = (data_020c9670[table_index * 2] * 0x266) >> 12;
        s32 z = (data_020c9670[table_index * 2 + 1] * 0x266) >> 12;
        void *orbit = Heap_Alloc(0xb0, data_ov026_02204a50, 4, gHeapContext);
        if (orbit != 0)
            orbit = func_ov026_021fce54(orbit, model_resource, 2, 0x7fff);
        FIELD(void *, object, 0xec + i * 4) = orbit;
        Presentation_SetPosition(orbit, x, -(FIELD(s32, object, 0x13c) << 10), z);
        PresentationScalar_SetImmediate((u8 *)orbit + 0x6c, 0x29);
        FIELD(s32, orbit, 0xac) = 0;
    }

    FIELD(s32, object, 0x120) = 0;
    FIELD(s32, object, 0x124) = 0;
    FIELD(s32, object, 0x12c) = 0;
    FIELD(s32, object, 0x130) = 0;
    return object;
}

/* Releases every resource record and child owned by the composite object. */
static void teardown_effect_container(void *object)
{
    for (s32 i = 0; i < 8; ++i) {
        void *record = FIELD(void *, object, 0xfc + i * 4);
        if (record != 0) {
            Graphics3DResourceBinding_Destroy(record);
            Heap_Free(record);
        }
    }
    for (s32 i = 0; i < FIELD(s32, object, 0x9c); ++i)
        destroy_child(FIELD(void *, object, 0xa0 + i * 4));
    destroy_child(FIELD(void *, object, 0xe0));
    destroy_child(FIELD(void *, object, 0xe4));
    destroy_child(FIELD(void *, object, 0xe8));
    for (s32 i = 0; i < 4; ++i)
        destroy_child(FIELD(void *, object, 0xec + i * 4));
    GraphicsArchive_ReleaseOwlvResource(data_020f4e18, FIELD(void *, object, 0x11c));
    func_ov026_021fce50(object);
}

/*
 * Restores the composite vtable, releases all eight resource records and all
 * owned children, releases model resource +0x11C, and tears down the base.
 * Returns `object` without freeing its storage.
 */
extern "C" void *func_ov026_021ff2d0(void *object)
{
    FIELD(const void *, object, 0) = data_ov026_02204960;
    teardown_effect_container(object);
    return object;
}

/* Performs the full 0x021FF2D0 teardown, frees `object`, and returns its old address. */
extern "C" void *func_ov026_021ff3e0(void *object)
{
    FIELD(const void *, object, 0) = data_ov026_02204960;
    teardown_effect_container(object);
    Heap_Free(object);
    return object;
}

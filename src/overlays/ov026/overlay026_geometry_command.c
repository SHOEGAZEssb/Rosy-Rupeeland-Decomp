#include "tingle/types.h"

/* Overlay 26 geometry-command object construction and Nintendo DS G3 FIFO submission. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern const u8 data_ov026_02204a28[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_01ff88c4(s32, const void *, const void *);
extern void Presentation_Init(void *);
extern void func_020b0808(s32, s32);
extern void func_020b0844(s32, s32);
extern void func_020b0880(s32, s32);
extern void func_ov026_021fcff4(u16, u16, s32);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a 0xB0-byte geometry command object. `resource` and `entry` select
 * a 12-byte display-list record, `polygon` initializes +0xA4, transform fields
 * +0xA6..+0xAA are cleared, and submission is enabled at +0xAC. Returns object.
 */
extern "C" void *func_ov026_021fce00(void *object, void *resource,
                                      s32 entry, u16 polygon)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov026_02204a28;
    FIELD(void *, object, 0x9c) = resource;
    FIELD(s32, object, 0xa0) = entry;
    FIELD(u16, object, 0xa4) = polygon;
    FIELD(u16, object, 0xa6) = 0;
    FIELD(u16, object, 0xa8) = 0;
    FIELD(u16, object, 0xaa) = 0;
    FIELD(s32, object, 0xac) = 1;
    return object;
}

/* No-op virtual hook; accepts an object and has no observable side effects. */
extern "C" void func_ov026_021fce50(void *object)
{
    (void)object;
}

/* Alternate constructor entry with the same recovered layout and return value. */
extern "C" void *func_ov026_021fce54(void *object, void *resource,
                                      s32 entry, u16 polygon)
{
    return func_ov026_021fce00(object, resource, entry, polygon);
}

/*
 * Submits the enabled object to the DS geometry engine. Fixed-point rotations
 * at +0x40/+0x50/+0x60 index the interleaved sine/cosine table, translation and
 * scale values are written through G3 command ports, polygon/texture parameters
 * come from +0xA4..+0xAA, and the selected 12-byte display list is executed.
 * Returns void and performs direct hardware FIFO writes.
 */
extern "C" void func_ov026_021fcea4(void *object)
{
    if (!FIELD(s32, object, 0xac))
        return;

    volatile u32 *const mtx_trans = (volatile u32 *)0x04000444;
    volatile u32 *const mtx_scale = (volatile u32 *)0x0400046c;
    volatile u32 *const tex_param = (volatile u32 *)0x040004c4;
    volatile u32 *const swap_buffers = (volatile u32 *)0x04000448;

    *mtx_trans = 0;
    *mtx_trans = FIELD(u32, object, 0x10);
    *mtx_trans = FIELD(u32, object, 0x20);
    *mtx_trans = FIELD(u32, object, 0x30);

    u16 x = (u16)FIELD(u32, object, 0x40);
    u16 y = (u16)FIELD(u32, object, 0x50);
    u16 z = (u16)FIELD(u32, object, 0x60);
    s32 xi = (s16)x >> 4;
    s32 yi = (s16)y >> 4;
    s32 zi = (s16)z >> 4;
    func_020b0880(data_020c9670[xi * 2], data_020c9670[xi * 2 + 1]);
    func_020b0844(data_020c9670[yi * 2], data_020c9670[yi * 2 + 1]);
    func_020b0808(data_020c9670[zi * 2], data_020c9670[zi * 2 + 1]);

    *mtx_scale = FIELD(u32, object, 0x70);
    *mtx_scale = FIELD(u32, object, 0x70);
    *mtx_scale = FIELD(u32, object, 0x70);
    func_ov026_021fcff4(FIELD(u16, object, 0xa4),
                        FIELD(u16, object, 0xa6), 0);
    *tex_param = FIELD(u16, object, 0xa8) |
                 ((u32)FIELD(u16, object, 0xaa) << 16);

    u8 *base = (u8 *)FIELD(void *, object, 0x9c);
    s32 offset = FIELD(s32, object, 0xa0) * 12;
    void *list = base + FIELD(u32, base, 0x24 + offset);
    void *data = base + FIELD(u32, base, 0x20 + offset);
    func_01ff88c4(3, list, data);
    *swap_buffers = 1;
}

/*
 * Packs two halfwords and the boolean form of `enabled` into the geometry
 * polygon-attribute command port at 0x040004C0. Returns void; direct HW write.
 */
extern "C" void func_ov026_021fcff4(u16 low, u16 high, s32 enabled)
{
    *(volatile u32 *)0x040004c0 = low | ((u32)high << 16) |
                                  ((enabled != 0) << 15);
}

/*
 * Returns a compact span derived from three words: when word 0 has either low
 * bit set it uses word 1 as the upper value, otherwise word 0, then subtracts
 * word 2. No state changes; the exact descriptor semantics are still unknown.
 */
extern "C" s32 func_ov026_021fd018(const u32 *descriptor)
{
    u32 upper = descriptor[0];
    if (upper & 3)
        upper = descriptor[1];
    return upper - descriptor[2];
}

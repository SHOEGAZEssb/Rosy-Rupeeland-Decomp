#include "tingle/types.h"

/* Overlay 34 GX matrix/viewport setup and compact render-state helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

extern const s16 data_020c9670[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020b0880(s32 sine, s32 cosine);
extern void func_020b0844(s32 sine, s32 cosine);
extern void func_020b0808(s32 sine, s32 cosine);
extern void func_ov034_021fcf90(u16 low, u16 high, s32 enabled);
extern void func_ov034_021fcfb4(u16 low, u16 high, s32 enabled);
extern void *func_ov034_021fcfd8(void *owner, s32 index);
extern void func_01ff88c4(s32 first, void *resource, s32 entry, s32 count);
#ifdef __cplusplus
}
#endif

/* Applies a table-driven rotation from a 16-bit angle through the selected axis helper. */
static void apply_rotation(u32 angle, void (*apply)(s32, s32))
{
    u32 index = (u16)angle >> 4;
    apply(data_020c9670[index * 2], data_020c9670[index * 2 + 1]);
}

/*
 * Emits the render object's transform and draw setup to the Nintendo DS GX
 * command ports. It clears GXSTAT at 0x04000444, streams object words +0x10,
 * +0x20, and +0x30 to matrix FIFO port 0x04000470, applies table-derived
 * rotations from +0x40/+0x50/+0x60, streams +0x70 three times to 0x0400046C,
 * programs registers 0x040004C0/0x040004C4 from +0xA4/+0xA6, resolves the
 * indexed resource through owner +0x9C/+0xA0, submits twelve entries through
 * func_01ff88c4, and finally writes 1 to 0x04000448. Returns no value and has
 * direct GX/MMIO effects in addition to renderer state changes.
 */
extern "C" void func_ov034_021fce50(void *object)
{
    REG32(0x04000444) = 0;
    REG32(0x04000470) = FIELD(u32, object, 0x10);
    REG32(0x04000470) = FIELD(u32, object, 0x20);
    REG32(0x04000470) = FIELD(u32, object, 0x30);
    apply_rotation(FIELD(u32, object, 0x40), func_020b0880);
    apply_rotation(FIELD(u32, object, 0x50), func_020b0844);
    apply_rotation(FIELD(u32, object, 0x60), func_020b0808);
    REG32(0x0400046c) = FIELD(u32, object, 0x70);
    REG32(0x0400046c) = FIELD(u32, object, 0x70);
    REG32(0x0400046c) = FIELD(u32, object, 0x70);
    func_ov034_021fcf90(FIELD(u16, object, 0xa4),
                        FIELD(u16, object, 0xa6), 0);
    func_ov034_021fcfb4(FIELD(u16, object, 0xa4), 0, 0);

    void *owner = FIELD(void *, object, 0x9c);
    s32 index = FIELD(s32, object, 0xa0);
    void *resource = func_ov034_021fcfd8(owner, index);
    void *table = FIELD(void *, owner, 0x24);
    func_01ff88c4(3, resource, FIELD(s32, table, index * 12), 12);
    REG32(0x04000448) = 1;
}

/*
 * Packs `low`, `high`, and boolean `enabled` into the GX register at
 * 0x040004C0 (`low | high<<16 | enabled<<15`). Returns no value and directly
 * changes display-engine MMIO.
 */
extern "C" void func_ov034_021fcf90(u16 low, u16 high, s32 enabled)
{
    REG32(0x040004c0) = low | ((u32)high << 16) |
                        ((enabled != 0 ? 1u : 0u) << 15);
}

/*
 * Packs `low`, `high`, and boolean `enabled` identically into GX register
 * 0x040004C4. Returns no value and directly changes display-engine MMIO.
 */
extern "C" void func_ov034_021fcfb4(u16 low, u16 high, s32 enabled)
{
    REG32(0x040004c4) = low | ((u32)high << 16) |
                        ((enabled != 0 ? 1u : 0u) << 15);
}

/*
 * Resolves owner entry `index`: owner +0x24 points to 12-byte records, whose
 * +4 word is an offset relative to the same table base. Returns that computed
 * address and changes no state or hardware.
 */
extern "C" void *func_ov034_021fcfd8(void *owner, s32 index)
{
    u8 *table = (u8 *)FIELD(void *, owner, 0x24);
    return table + FIELD(u32, table, index * 12 + 4);
}

/*
 * Initializes the recovered 0x2C-byte motion/render state. It stores `side` at
 * +0, sets +4 to -0x480 for side 0 or zero for side 1 (and the corresponding
 * linear extension for other inputs), and clears +8..+0x28. Returns no value
 * and performs no SDK or hardware operation.
 */
extern "C" void func_ov034_021fcff0(void *state, s32 side)
{
    FIELD(s32, state, 0) = side;
    FIELD(s32, state, 4) = (side - 1) * 0x480;
    for (s32 offset = 8; offset <= 0x28; offset += 4)
        FIELD(s32, state, offset) = 0;
}

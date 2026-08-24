#include "tingle/types.h"

/* Overlay 36 immediate-mode renderer for the timed segment effect. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

extern const s16 gFx32CosSinTable[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov036_021fd660(s16 first, u16 second, u16 third);
#ifdef __cplusplus
}
#endif

/*
 * Multiplies two signed values and applies the original signed Q12 truncation.
 * The correction makes negative products truncate toward zero rather than
 * toward negative infinity. No external state changes.
 */
static s32 mul_q12_trunc(s32 first, s32 second)
{
    s32 product = first * second;
    return (product + ((u32)(product >> 11) >> 20)) >> 12;
}

/* Writes the low 16 bits of an X/Y pair to the packed GX vertex FIFO. */
static void write_xy(s32 x, s32 y)
{
    REG32(0x04000494) = (u16)x | ((u32)(u16)y << 16);
}

/*
 * Draws the segment effect held in object. Angle +0x60 selects a signed pair
 * from gFx32CosSinTable; size +0xAC scales that direction in Q12. The inferred
 * endpoints at +0x9C/+0xA0 and +0xA4/+0xA8 are expanded into a six-vertex
 * strip, with packed color +0xB6 on the center pair and zero on the outer
 * pairs. Transform coordinates +0x9C/+0xA0/+0x30 are submitted first. It
 * returns nothing and directly changes Nintendo DS GX FIFO/MMIO state.
 */
extern "C" void func_ov036_021fd97c(void *object)
{
    s32 index = (FIELD(s32, object, 0x60) >> 4) * 2;
    s32 offsetX = mul_q12_trunc(FIELD(s32, object, 0xac),
                                gFx32CosSinTable[index]);
    s32 offsetY = mul_q12_trunc(FIELD(s32, object, 0xac),
                                gFx32CosSinTable[index + 1]);

    REG32(0x04000500) = 1;
    REG32(0x04000480) = FIELD(u16, object, 0xb6);
    func_ov036_021fd660(FIELD(s16, object, 0x9c),
                        FIELD(u16, object, 0xa0),
                        FIELD(u16, object, 0x30));
    write_xy(FIELD(s16, object, 0xa4), FIELD(s16, object, 0xa8));

    REG32(0x04000480) = 0;
    write_xy(FIELD(s16, object, 0xa4) + offsetX,
             FIELD(s16, object, 0xa8) + offsetY);
    write_xy(FIELD(s16, object, 0x9c) + offsetX,
             FIELD(s16, object, 0xa0) + offsetY);

    REG32(0x04000480) = FIELD(u16, object, 0xb6);
    write_xy(FIELD(s16, object, 0xa4), FIELD(s16, object, 0xa8));
    write_xy(FIELD(s16, object, 0x9c), FIELD(s16, object, 0xa0));

    REG32(0x04000480) = 0;
    write_xy(FIELD(s16, object, 0x9c) - offsetX,
             FIELD(s16, object, 0xa0) - offsetY);
    write_xy(FIELD(s16, object, 0xa4) - offsetX,
             FIELD(s16, object, 0xa8) - offsetY);
    REG32(0x04000504) = 0;
}

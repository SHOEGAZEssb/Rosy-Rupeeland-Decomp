#include "tingle/types.h"

/* Overlay 36 timed motion-primitive immediate-mode GX rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

extern const s16 gFx32CosSinTable[];
extern const u8 data_ov036_02205ad0[];
extern const u8 data_ov036_02205be4[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020b0808(s16 sine, s16 cosine);
extern void func_ov036_021fd660(s16 first, u16 second, u16 third);
#ifdef __cplusplus
}
#endif

/*
 * Draws a timed motion primitive unless hidden flag bit 0 is set or scaled
 * value +0x70<<4 is nonpositive. It loads translation, X/Y scale from +0x70
 * with unit Z scale, and Z rotation +0x60 through gFx32CosSinTable. Types +0x9A
 * 0/1 emit one coordinate plus two packed vertex words from offsets 0x90..0x9A
 * of data_ov036_02205ad0, using colors +0xB4/+0xB6. Type 2 emits six analogous
 * records of 12 bytes from data_ov036_02205be4. Other types submit no vertices.
 * It has no return value and directly changes Nintendo DS GX FIFO/MMIO state.
 */
extern "C" void func_ov036_021fd4c8(void *object)
{
    if (FIELD(u16, object, 0x98) & 1)
        return;
    s32 scale = FIELD(s32, object, 0x70) << 4;
    if (scale <= 0)
        return;

    REG32(0x04000444) = 0;
    REG32(0x04000470) = FIELD(u32, object, 0x10);
    REG32(0x04000470) = FIELD(u32, object, 0x20);
    REG32(0x04000470) = FIELD(u32, object, 0x30);
    REG32(0x0400046c) = scale;
    REG32(0x0400046c) = scale;
    REG32(0x0400046c) = 0x1000;
    s32 index = (FIELD(s32, object, 0x60) >> 4) * 2;
    func_020b0808(gFx32CosSinTable[index], gFx32CosSinTable[index + 1]);
    REG32(0x04000500) = 0;

    s32 type = FIELD(s16, object, 0x9a);
    if (type == 0 || type == 1) {
        REG32(0x04000480) = FIELD(u16, object, 0xb4);
        func_ov036_021fd660(FIELD(s16, data_ov036_02205ad0, 0x90),
                            FIELD(u16, data_ov036_02205ad0, 0x92), 0);
        REG32(0x04000480) = FIELD(u16, object, 0xb6);
        REG32(0x04000494) =
            FIELD(u16, data_ov036_02205ad0, 0x94) |
            ((u32)FIELD(u16, data_ov036_02205ad0, 0x96) << 16);
        REG32(0x04000494) =
            FIELD(u16, data_ov036_02205ad0, 0x98) |
            ((u32)FIELD(u16, data_ov036_02205ad0, 0x9a) << 16);
    } else if (type == 2) {
        for (s32 i = 0; i < 6; ++i) {
            const u8 *record = data_ov036_02205be4 + i * 12;
            REG32(0x04000480) = FIELD(u16, object, 0xb6);
            func_ov036_021fd660(FIELD(s16, record, 0),
                                FIELD(u16, record, 2), 0);
            REG32(0x04000480) = FIELD(u16, object, 0xb4);
            REG32(0x04000494) = FIELD(u16, record, 4) |
                                ((u32)FIELD(u16, record, 6) << 16);
            REG32(0x04000494) = FIELD(u16, record, 8) |
                                ((u32)FIELD(u16, record, 10) << 16);
        }
    }
    REG32(0x04000504) = 0;
    REG32(0x04000448) = 1;
}

/*
 * Emits one packed pair of low-16-bit coordinates followed by a low-16-bit
 * third coordinate to GX FIFO register 0x0400048C. It returns nothing and
 * directly changes GX command state.
 */
extern "C" void func_ov036_021fd660(s16 first, u16 second, u16 third)
{
    REG32(0x0400048c) = (u16)first | ((u32)second << 16);
    REG32(0x0400048c) = third;
}

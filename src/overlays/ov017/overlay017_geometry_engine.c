#include "tingle/types.h"

/* Overlay 17 Nintendo DS geometry-engine command and grid-render helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov017_021fd60c(s32, s32, s32, s32, s32, s32);
extern void func_ov017_021fd638(void);
extern void func_ov017_021fd64c(s32, s32, s32);
extern void func_ov017_021fd680(s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Busy-wait until bit 15 of the Nintendo DS square-root control register at
 * 0x040002B0 clears, then return the 32-bit result at 0x040002B4. No input or
 * memory state is used; this synchronously observes math-unit hardware.
 */
extern "C" u32 func_ov017_021fd3f0(void)
{
    while ((*(volatile u16 *)0x040002b0 & 0x8000) != 0) {
    }
    return *(volatile u32 *)0x040002b4;
}

/*
 * Render the overlay's 8x8 grid cells from two parallel 9x9 arrays at state
 * +0x8DC and +0x144. Configure polygon attributes (1,0,2,8,0x18,0), clear the
 * texture-image parameter, then emit four paired packed-coordinate commands for
 * each cell in row+1/row order and write geometry BEGIN value 2 / END value 0
 * at 0x04000500/0x04000504. Input grid memory is read only; return void. This
 * directly submits Nintendo DS geometry-engine commands.
 */
extern "C" void func_ov017_021fd414(void *state)
{
    s32 row;

    func_ov017_021fd60c(1, 0, 2, 8, 0x18, 0);
    func_ov017_021fd638();
    for (row = 0; row < 8; row++) {
        s32 column;
        for (column = 0; column < 8; column++) {
            void *valuesNext = (u8 *)state + 0x8dc +
                               (row + 1) * 0x6c + column * 0xc;
            void *coordsNext = (u8 *)state + 0x144 +
                               (row + 1) * 0x6c + column * 0xc;
            void *valuesCurrent = (u8 *)state + 0x8dc +
                                  row * 0x6c + column * 0xc;
            void *coordsCurrent = (u8 *)state + 0x144 +
                                  row * 0x6c + column * 0xc;

            *(volatile u32 *)0x04000500 = 2;
            func_ov017_021fd64c(FIELD(s16, valuesNext, 0),
                                FIELD(s16, valuesNext, 4),
                                FIELD(s16, valuesNext, 8));
            func_ov017_021fd680(FIELD(s16, coordsNext, 0),
                                FIELD(s16, coordsNext, 4),
                                FIELD(s16, coordsNext, 8));
            func_ov017_021fd64c(FIELD(s16, valuesNext, 0xc),
                                FIELD(s16, valuesNext, 0x10),
                                FIELD(s16, valuesNext, 0x14));
            func_ov017_021fd680(FIELD(s16, coordsNext, 0xc),
                                FIELD(s16, coordsNext, 0x10),
                                FIELD(s16, coordsNext, 0x14));
            func_ov017_021fd64c(FIELD(s16, valuesCurrent, 0),
                                FIELD(s16, valuesCurrent, 4),
                                FIELD(s16, valuesCurrent, 8));
            func_ov017_021fd680(FIELD(s16, coordsCurrent, 0),
                                FIELD(s16, coordsCurrent, 4),
                                FIELD(s16, coordsCurrent, 8));
            func_ov017_021fd64c(FIELD(s16, valuesCurrent, 0xc),
                                FIELD(s16, valuesCurrent, 0x10),
                                FIELD(s16, valuesCurrent, 0x14));
            func_ov017_021fd680(FIELD(s16, coordsCurrent, 0xc),
                                FIELD(s16, coordsCurrent, 0x10),
                                FIELD(s16, coordsCurrent, 0x14));
            *(volatile u32 *)0x04000504 = 0;
        }
    }
}

/*
 * Pack six caller fields into the polygon-attribute word at 0x040004A4: fields
 * 0-2 occupy bits 0, 4, and 6; field 3 starts at bit 24; stack argument 5 starts
 * at bit 16; and stack argument 6 is ORed directly. Return void. This directly
 * changes Nintendo DS geometry polygon state.
 */
extern "C" void func_ov017_021fd60c(s32 value0, s32 value1, s32 value2,
                                      s32 value3, s32 value4, s32 value5)
{
    *(volatile u32 *)0x040004a4 =
        (u32)value0 | ((u32)value1 << 4) | ((u32)value2 << 6) |
        (u32)value5 | ((u32)value4 << 16) | ((u32)value3 << 24);
}

/*
 * Write zero to the Nintendo DS geometry texture-image parameter register at
 * 0x040004A8. There are no inputs or memory effects; return void.
 */
extern "C" void func_ov017_021fd638(void)
{
    *(volatile u32 *)0x040004a8 = 0;
}

/*
 * Arithmetic-shift three signed coordinate inputs, retain each low ten bits,
 * pack them at bit positions 0/10/20, and write the word to geometry register
 * 0x04000484. Return void; this directly submits one packed vertex command.
 */
extern "C" void func_ov017_021fd64c(s32 x, s32 y, s32 z)
{
    *(volatile u32 *)0x04000484 =
        ((u32)(x >> 3) & 0x3ff) |
        (((u32)(y >> 3) & 0x3ff) << 10) |
        (((u32)(z >> 3) & 0x3ff) << 20);
}

/*
 * Truncate X/Y/Z to signed-coordinate halfwords, write packed X/Y and then Z
 * as two consecutive words to geometry register 0x0400048C, and return void.
 * This directly submits a two-word Nintendo DS vertex command.
 */
extern "C" void func_ov017_021fd680(s32 x, s32 y, s32 z)
{
    volatile u32 *command = (volatile u32 *)0x0400048c;
    *command = (u16)x | ((u32)(u16)y << 16);
    *command = (u16)z;
}

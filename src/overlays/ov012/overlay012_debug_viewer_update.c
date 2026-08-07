#include "tingle/types.h"

/*
 * Overlay 12 object-viewer update and debug rendering. This recovered routine
 * handles viewer input, updates the selected transform/resource, prints its
 * diagnostics, and submits the object and optional bounds to the 3D engine.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov012_021fe4d0[];
extern const s32 data_ov012_021fe51c[];
#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov012_021fd044(s32);
extern void func_ov012_021fcef4(void *);
extern void func_ov012_021fcfd4(void *, s32);
extern void func_ov012_021fd148(void *, s32, s32, s32);
extern void func_ov012_021fd5ac(void *);
extern void func_ov012_021fd63c(void *);
extern s32 func_ov012_021fd668(void *, s32, s32, s32, s32);
extern s32 func_ov012_021fd6ac(void *, s32, s32, s32, s32);
extern void func_020b0300(u32, u32, u32, u32, u32);
#ifdef __cplusplus
}
#endif

/*
 * Process one viewer frame from the input object at state +0x50. Newly pressed
 * bit 3 restores defaults. Repeated bit 0x100 changes the screen-space offsets
 * +0x198/+0x19C, clamped to [-128,127] and [-96,95]. Otherwise, held bit
 * 0x200 toggles optional bounds rendering and up/down wrap menu row +0x190
 * across 11 entries. When state flag bit 9 at +0x44 is set, signed deltas at
 * +0x64/+0x68 are accumulated into angle fields +0x1A8/+0x1A4 in steps of
 * 0x80. These input-bit meanings and field effects are confirmed; the terms
 * screen-space, bounds, angle, and scale are inferred from the downstream
 * geometry operations and debug labels.
 *
 * Rows 0..10 respectively select a 24-byte resource, select one of its
 * 12-byte draw records, clamp scale-table index +0x1A0, toggle +0x1B4, toggle
 * the DISP3DCNT bit represented by +0x1B8, clamp +0x1C0 to [0,31], edit three
 * 16-bit angles by 0x100, set monochrome clear intensity +0x194, and toggle
 * +0x1BC. The transform at +0x158 receives translated offsets, scale-table
 * values, and the three angles before it is submitted and draw record +0x18C
 * is selected. The retail implementation additionally prints all menu and
 * resource diagnostics, updates SDK camera state, emits GX commands, draws
 * optional geometry bounds, and clears/restores several mapped 3D registers.
 *
 * Newly pressed bit 1 writes transition field +0x6C and reinitializes embedded
 * member +0x24 from the descriptor at data_ov012_021fe4d0. The function always
 * returns zero. The exact assembly fallback preserves the compiler-sensitive
 * debug-print, matrix, FIFO, and MMIO ordering omitted from this readable
 * portable reference.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov012_021fd73c(void *state)
{
    u8 *input = FIELD(u8 *, state, 0x50);
    u16 repeat = FIELD(u16, input, 0);
    u16 pressed = FIELD(u16, input, 2);
    u16 held = FIELD(u16, input, 6);
    s32 row;

    if (pressed & 8) {
        func_ov012_021fd5ac(state);
    }

    if (repeat & 0x100) {
        if (repeat & 0x20) {
            if (--FIELD(s32, state, 0x198) < -128)
                FIELD(s32, state, 0x198) = -128;
        } else if (repeat & 0x10) {
            if (++FIELD(s32, state, 0x198) >= 128)
                FIELD(s32, state, 0x198) = 127;
        }
        if (repeat & 0x80) {
            if (--FIELD(s32, state, 0x19c) < -96)
                FIELD(s32, state, 0x19c) = -96;
        } else if (repeat & 0x40) {
            if (++FIELD(s32, state, 0x19c) >= 96)
                FIELD(s32, state, 0x19c) = 95;
        }
    } else {
        if (held & 0x200)
            FIELD(s32, state, 0x1b0) ^= 1;

        /* Bit 9 is isolated by the original `(value << 22) >> 31` sequence. */
        if (FIELD(u32, state, 0x44) & 0x200) {
            FIELD(s32, state, 0x1a8) += FIELD(s32, state, 0x64) << 7;
            FIELD(s32, state, 0x1a4) += FIELD(s32, state, 0x68) << 7;
        }

        row = FIELD(s32, state, 0x190);
        if (held & 0x40)
            row = row == 0 ? 10 : row - 1;
        else if (held & 0x80)
            row = row == 10 ? 0 : row + 1;
        FIELD(s32, state, 0x190) = row;

        switch (row) {
        case 0:
            if (held & 0x30) {
                FIELD(s32, state, 0x188) = func_ov012_021fd6ac(
                    state, FIELD(s32, state, 0x188), 0,
                    FIELD(s32, state, 0x184) - 1, 1);
                func_ov012_021fd63c(state);
            }
            break;
        case 1:
            if (held & 0x30) {
                u8 *resource = FIELD(u8 *, state, 0x15c);
                u8 *records = FIELD(u8 *, resource, 0x20);
                FIELD(s32, state, 0x18c) = func_ov012_021fd6ac(
                    state, FIELD(s32, state, 0x18c), 0,
                    FIELD(s32, records, 4) - 1, 1);
            }
            break;
        case 2:
            FIELD(s32, state, 0x1a0) = func_ov012_021fd668(
                state, FIELD(s32, state, 0x1a0), 0, 6, 1);
            break;
        case 3:
            if (held & 0x30)
                FIELD(s32, state, 0x1b4) ^= 1;
            break;
        case 4:
            if (held & 0x30) {
                FIELD(s32, state, 0x1b8) ^= 1;
                func_ov012_021fd044(FIELD(s32, state, 0x1b8));
            }
            break;
        case 5:
            FIELD(s32, state, 0x1c0) = func_ov012_021fd668(
                state, FIELD(s32, state, 0x1c0), 0, 31, 1);
            break;
        case 6:
            if (repeat & 0x20) FIELD(s32, state, 0x1a4) -= 0x100;
            else if (repeat & 0x10) FIELD(s32, state, 0x1a4) += 0x100;
            break;
        case 7:
            if (repeat & 0x20) FIELD(s32, state, 0x1a8) -= 0x100;
            else if (repeat & 0x10) FIELD(s32, state, 0x1a8) += 0x100;
            break;
        case 8:
            if (repeat & 0x20) FIELD(s32, state, 0x1ac) -= 0x100;
            else if (repeat & 0x10) FIELD(s32, state, 0x1ac) += 0x100;
            break;
        case 9:
            if (held & 0x30) {
                u32 intensity = (u32)func_ov012_021fd668(
                    state, FIELD(s32, state, 0x194), 0, 31, 1);
                FIELD(s32, state, 0x194) = (s32)intensity;
                func_020b0300((u16)(intensity | intensity << 5 |
                                      intensity << 10),
                              31, 0x7fff, 63, 0);
            }
            break;
        case 10:
            if (held & 0x30)
                FIELD(s32, state, 0x1bc) ^= 1;
            break;
        }
    }

    FIELD(s32, state, 0x160) = FIELD(s32, state, 0x198) << 4;
    FIELD(s32, state, 0x164) = FIELD(s32, state, 0x19c) << 4;
    FIELD(s32, state, 0x168) = 0;
    FIELD(u32, state, 0x178) = (u16)FIELD(s32, state, 0x1a4);
    FIELD(u32, state, 0x17c) = (u16)FIELD(s32, state, 0x1a8);
    FIELD(u32, state, 0x180) = (u16)FIELD(s32, state, 0x1ac);
    FIELD(s32, state, 0x16c) = data_ov012_021fe51c[FIELD(s32, state, 0x1a0)];
    FIELD(s32, state, 0x170) = FIELD(s32, state, 0x16c);
    FIELD(s32, state, 0x174) = FIELD(s32, state, 0x16c);

    func_ov012_021fcef4((u8 *)state + 0x158);
    func_ov012_021fcfd4((u8 *)state + 0x158, FIELD(s32, state, 0x18c));

    if (pressed & 2) {
        FIELD(s32, state, 0x6c) = 0x10;
        func_ov012_021fd148((u8 *)state + 0x24,
                            (s32)data_ov012_021fe4d0[4],
                            (s32)data_ov012_021fe4d0[5] - 0x48, 0);
    }
    return 0;
}

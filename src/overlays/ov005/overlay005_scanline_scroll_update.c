#include "tingle/types.h"

/*
 * Overlay 5 scanline-scroll update. This recovered callback derives one
 * sub-engine scroll value from VCOUNT, global phase state, and a 32-entry table.
 */

typedef struct Overlay005ScanlineState {
    u8 field_000[0x20];
    u32 field_020_0_9 : 10;
    s32 enabled_020_10 : 1;
    u32 field_020_11_31 : 21;
} Overlay005ScanlineState;

#ifdef __cplusplus
extern "C" {
#endif
extern const s16 data_ov005_021fc91c[32];
extern const u8 gSystemState[];
#ifdef __cplusplus
}
#endif

/*
 * Copy data_ov005_021fc91c into a local 32-halfword table, matching the
 * original compiler-generated stack data. If +0x20 bit 10 is enabled, read DS
 * VCOUNT at 0x04000006; for visible lines below 192, compute index
 * `(VCOUNT + ((u32)gSystemState[+0x64] >> 3)) & 31`, load the signed table
 * entry, mask it to nine bits, and write register 0x0400101C. Return zero.
 * The destination is confirmed sub-engine MMIO, though the exact BG scroll
 * field name is not assigned here.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov005_021fc7d8(Overlay005ScanlineState *state)
{
    s16 table[32];
    s32 index;

    for (index = 0; index < 32; index++) {
        table[index] = data_ov005_021fc91c[index];
    }
    if (state->enabled_020_10) {
        u16 vcount = *(volatile u16 *)0x04000006;

        if (vcount < 192) {
            u32 phase = *(const u32 *)(gSystemState + 0x64);
            index = (vcount + (phase >> 3)) & 31;
            *(volatile u32 *)0x0400101c = table[index] & 0x1ff;
        }
    }
    return 0;
}

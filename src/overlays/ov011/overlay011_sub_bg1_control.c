#include "tingle/types.h"

/* Overlay 11 sub-engine BG1 control-register encoding. */

/*
 * Preserve only bits 0, 1, and 6 of sub BG1CNT, then encode the five inputs
 * into priority (bits 0..1), character base (bits 7..), screen base (bits
 * 8..), size (bits 2..), and overflow/wrap (bit 13). The shift layout and
 * direct MMIO write to 0x0400100A are confirmed; callers constrain values to
 * the hardware field widths. Returns no value.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay011_SetSubBg1Enabled(s32 priority, s32 characterBase, s32 screenBase,
                         s32 size, s32 overflow)
{
    volatile u16 *bg1cnt = (volatile u16 *)0x0400100a;
    u32 value = *bg1cnt & 0x43;

    value |= (u32)priority << 14;
    value |= (u32)characterBase << 7;
    value |= (u32)screenBase << 8;
    value |= (u32)size << 2;
    value |= (u32)overflow << 13;
    *bg1cnt = (u16)value;
}

#include "tingle/types.h"

/*
 * Overlay 9 main-engine BG3 control. This recovered helper updates selected
 * BG3CNT layout and color-depth fields while retaining priority and mosaic.
 */

/*
 * Preserve BG3CNT bits 0, 1, and 6, then insert screen size at bits 14..15,
 * color-depth at bit 7, screen-base at bits starting at 8, and character-base
 * at bits starting at 2. Return no value. This directly writes the Nintendo DS
 * main-engine BG3CNT register at I/O address 0x0400000E.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov009_021fce48(u32 screenSize, u32 colorDepth, u32 screenBase,
                         u32 characterBase)
{
    volatile u16 *bg3cnt = (volatile u16 *)0x0400000e;
    u32 value = *bg3cnt & 0x43;

    value |= screenSize << 14;
    value |= colorDepth << 7;
    value |= screenBase << 8;
    value |= characterBase << 2;
    *bg3cnt = (u16)value;
}

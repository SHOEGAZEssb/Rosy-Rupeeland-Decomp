#include "tingle/types.h"

/*
 * Provide recovered low-level Nintendo DS BG1/BG2 control-register helpers.
 * The four writers preserve priority and mosaic bits selected by mask 0x43,
 * then replace the remaining caller-controlled BGCNT fields on the main or
 * sub display engine.
 */

#ifdef __cplusplus
extern "C" {
#endif

/* Recovered no-op hook; it accepts no confirmed inputs and changes no state. */
void DisplayControlElement_NoOp(void)
{
}

/*
 * Preserve priority and mosaic in main BG1CNT, then set screen size, color
 * mode, screen-base block, character-base block, and extended-palette slot.
 * The function has no return value and writes display hardware directly.
 */
void MainBg1_SetControl(u32 screenSize, u32 colorMode, u32 screenBaseBlock,
                        u32 charBaseBlock, u32 extendedPaletteSlot)
{
    volatile u16 *reg = (volatile u16 *)0x0400000a;
    *reg = (u16)((*reg & 0x43) | (screenSize << 14) | (colorMode << 7) |
                 (screenBaseBlock << 8) | (charBaseBlock << 2) |
                 (extendedPaletteSlot << 13));
}

/*
 * Preserve priority and mosaic in main BG2CNT, then set screen size, color
 * mode, screen-base block, and character-base block. Writes hardware directly.
 */
void MainBg2_SetControl(u32 screenSize, u32 colorMode, u32 screenBaseBlock,
                        u32 charBaseBlock)
{
    volatile u16 *reg = (volatile u16 *)0x0400000c;
    *reg = (u16)((*reg & 0x43) | (screenSize << 14) | (colorMode << 7) |
                 (screenBaseBlock << 8) | (charBaseBlock << 2));
}

/*
 * Sub-engine counterpart of MainBg1_SetControl, writing sub BG1CNT with the
 * same preserved mask and five field positions. Writes hardware directly.
 */
void SubBg1_SetControl(u32 screenSize, u32 colorMode, u32 screenBaseBlock,
                       u32 charBaseBlock, u32 extendedPaletteSlot)
{
    volatile u16 *reg = (volatile u16 *)0x0400100a;
    *reg = (u16)((*reg & 0x43) | (screenSize << 14) | (colorMode << 7) |
                 (screenBaseBlock << 8) | (charBaseBlock << 2) |
                 (extendedPaletteSlot << 13));
}

/*
 * Sub-engine counterpart of MainBg2_SetControl, writing sub BG2CNT while
 * preserving priority and mosaic.
 */
void SubBg2_SetControl(u32 screenSize, u32 colorMode, u32 screenBaseBlock,
                       u32 charBaseBlock)
{
    volatile u16 *reg = (volatile u16 *)0x0400100c;
    *reg = (u16)((*reg & 0x43) | (screenSize << 14) | (colorMode << 7) |
                 (screenBaseBlock << 8) | (charBaseBlock << 2));
}

#ifdef __cplusplus
}
#endif

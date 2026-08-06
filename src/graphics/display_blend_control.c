#include "tingle/types.h"

/*
 * Provide recovered low-level Nintendo DS display blend-control helpers.  The
 * four register writers preserve bits selected by mask 0x43 and pack caller
 * fields into the main/sub-engine BLDCNT and BLDALPHA-adjacent halfwords.
 */

/* Recovered no-op hook; it accepts no confirmed inputs and changes no state. */
void func_02020d9c(void)
{
}

/*
 * Preserve bits 0, 1, and 6 of main-engine register 0x0400000a, then pack
 * first through fifth at bit positions 14, 7, 8, 2, and 13 respectively.
 * The function has no return value and writes the display hardware directly.
 */
void func_02020da0(u32 first, u32 second, u32 third, u32 fourth, u32 fifth)
{
    volatile u16 *reg = (volatile u16 *)0x0400000a;
    *reg = (u16)((*reg & 0x43) | (first << 14) | (second << 7) |
                 (third << 8) | (fourth << 2) | (fifth << 13));
}

/*
 * Preserve bits selected by 0x43 in main-engine register 0x0400000c and pack
 * four inputs at bit positions 14, 7, 8, and 2.  Writes hardware directly.
 */
void func_02020dd4(u32 first, u32 second, u32 third, u32 fourth)
{
    volatile u16 *reg = (volatile u16 *)0x0400000c;
    *reg = (u16)((*reg & 0x43) | (first << 14) | (second << 7) |
                 (third << 8) | (fourth << 2));
}

/*
 * Sub-engine counterpart of func_02020da0, writing register 0x0400100a with
 * the same preserved mask and five field positions.  Writes hardware directly.
 */
void func_02020e00(u32 first, u32 second, u32 third, u32 fourth, u32 fifth)
{
    volatile u16 *reg = (volatile u16 *)0x0400100a;
    *reg = (u16)((*reg & 0x43) | (first << 14) | (second << 7) |
                 (third << 8) | (fourth << 2) | (fifth << 13));
}

/*
 * Sub-engine counterpart of func_02020dd4, writing register 0x0400100c from
 * four packed inputs while preserving the bits selected by 0x43.
 */
void func_02020e34(u32 first, u32 second, u32 third, u32 fourth)
{
    volatile u16 *reg = (volatile u16 *)0x0400100c;
    *reg = (u16)((*reg & 0x43) | (first << 14) | (second << 7) |
                 (third << 8) | (fourth << 2));
}

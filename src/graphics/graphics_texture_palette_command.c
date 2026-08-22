/* Palette-base command packing for immediate 3D texture resources. */

#include "tingle/types.h"

#define REG_G3_PLTT_BASE (*(volatile u32 *)0x040004ac)

#ifndef MATCHING
extern void TingleNativeG3_SetPaletteBase(u32 value);
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Select a texture palette address. Format 2 uses eight-byte palette units;
 * all other formats use sixteen-byte units. The command is synchronous.
 */
void func_0209b454(u32 address, u32 format)
{
    u32 value = address >> (format == 2 ? 3 : 4);

    REG_G3_PLTT_BASE = value;
#ifndef MATCHING
    TingleNativeG3_SetPaletteBase(value);
#endif
}

#ifdef __cplusplus
}
#endif

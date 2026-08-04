#include "tingle/graphics_hardware.h"
#include "tingle/system.h"
#include "tingle/types.h"

/*
 * Low-level graphics-hardware bootstrap. This initializes the NitroSDK 2D/3D
 * engines, grants the CPU temporary LCDC access to all VRAM, clears VRAM/OAM
 * and both palette banks, and establishes two game-owned display defaults.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void GX_Init(void);
extern void G3X_Init(void);
extern void GX_SetBankForLCDC(u32 banks);
extern void GX_DisableBankForLCDC(void);
extern void MIi_CpuClearFast(u32 value, void *destination, u32 size);

#ifdef __cplusplus
}
#endif

#define REG_POWCNT1 (*(volatile u16 *)0x04000304)

/*
 * Initialize the DS graphics engines and clear their directly visible memory.
 * There are no inputs or return value. The routine changes POWCNT1, VRAM bank
 * ownership, all 0xa4000 bytes of VRAM, OAM, the main/sub palettes, and fields
 * 0x5e and 0x60 of gSystemState. The exact meaning of field 0x5e is not yet
 * confirmed; its initial value is 0x40.
 */
void func_0200284c(void)
{
    GX_Init();
    G3X_Init();

    /* Enable both display engines and the 3D core while retaining other bits. */
    REG_POWCNT1 = (REG_POWCNT1 & ~0x020e) | 0x020e;

    /* 0x1ff selects every VRAM bank exposed through the LCDC address window. */
    GX_SetBankForLCDC(0x1ff);
    MIi_CpuClearFast(0, (void *)0x06800000, 0x000a4000);
    GX_DisableBankForLCDC();

    /* Retail initializes OAM words to 0xc0, then clears both 1 KiB palettes. */
    MIi_CpuClearFast(0xc0, (void *)0x07000000, 0x400);
    MIi_CpuClearFast(0, (void *)0x05000000, 0x400);
    MIi_CpuClearFast(0, (void *)0x05000400, 0x400);

    gSystemState.unknown5E = 0x40;
    gSystemState.unknown60 = 0;
}

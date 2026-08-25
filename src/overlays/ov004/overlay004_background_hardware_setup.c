#include "tingle/types.h"

/*
 * Overlay 4 background hardware setup. This recovered helper configures paired
 * background-control registers and matching layer services on both DS engines.
 */

typedef struct Overlay004BackgroundHardwareState {
    u8 field_000[0x48];
    s32 mainLayer_048;
    s32 subLayer_04c;
} Overlay004BackgroundHardwareState;

#ifdef __cplusplus
extern "C" {
#endif
extern void TitleDisplay_ConfigureMain2dEngine(s32 layer);
extern void TitleDisplay_SetMainBgPriorities(s32 first, s32 second, s32 third, s32 fourth);
extern void TitleDisplay_ConfigureSub2dEngine(s32 layer);
extern void TitleDisplay_SetSubBgPriorities(s32 first, s32 second, s32 third, s32 fourth);
#ifdef __cplusplus
}
#endif

/*
 * Clear bit 15 of the halfword at 0x04000304, store layer value 0x18 at state
 * offsets +0x48/+0x4C, and initialize layer 5 through the paired main/sub
 * service calls. For both engines, rewrite BG2CNT (0x0400000C/0x0400100C) as
 * (old & 0x43) | 0xB800 and BG3CNT (+2) as (old & 0x43) | 0xBC10, then call
 * the corresponding four-argument setup routine with (0,1,2,3). Returns no
 * value. These are confirmed direct Nintendo DS MMIO effects; the precise
 * meanings of the retained 0x43 bits remain described by the hardware format.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay004_SetupBackgroundHardware(Overlay004BackgroundHardwareState *state)
{
    volatile u16 *control = (volatile u16 *)0x04000304;
    volatile u16 *mainBg = (volatile u16 *)0x0400000c;
    volatile u16 *subBg = (volatile u16 *)0x0400100c;

    *control &= (u16)~0x8000;
    state->mainLayer_048 = 0x18;
    TitleDisplay_ConfigureMain2dEngine(5);
    mainBg[0] = (mainBg[0] & 0x43) | 0xb800;
    mainBg[1] = (mainBg[1] & 0x43) | 0xbc10;
    TitleDisplay_SetMainBgPriorities(0, 1, 2, 3);
    state->subLayer_04c = 0x18;
    TitleDisplay_ConfigureSub2dEngine(5);
    subBg[0] = (subBg[0] & 0x43) | 0xb800;
    subBg[1] = (subBg[1] & 0x43) | 0xbc10;
    TitleDisplay_SetSubBgPriorities(0, 1, 2, 3);
}

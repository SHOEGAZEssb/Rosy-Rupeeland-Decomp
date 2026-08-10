#include "tingle/types.h"

/* Overlay 25 terminal state initialization and dual-engine frame callbacks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02092314(void *, s32, s32);
extern void func_020929f4(void *);
extern void func_02092a34(void *, s32);
#ifdef __cplusplus
}
#endif

/* Initializes command 0xE2 for 16 ticks in state zero; always returns one. */
extern "C" s32 func_ov025_02202b44(void *scene)
{
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_02092314(scene, 0xe2, 0x10);
        FIELD(s32, scene, 4)++;
        FIELD(s32, scene, 8) = 0;
        break;
    case 1:
        break;
    }
    return 1;
}

/*
 * While scene flag bit 10 is set, installs +0x48/+0x4C in the main/sub
 * DISPCNT display-mode fields. It clears main BG3CNT without owner +0x598 or
 * updates input +0x5A0 otherwise. These volatile writes are NDS MMIO effects.
 */
extern "C" s32 func_ov025_02202b88(void *scene)
{
    if ((s32)(FIELD(u32, scene, 0x20) << 21) >> 31) {
        volatile u32 *const dispcnt_a = (volatile u32 *)0x04000000;
        volatile u32 *const dispcnt_b = (volatile u32 *)0x04001000;
        *dispcnt_a = (*dispcnt_a & ~0x1f00) |
                     (FIELD(u32, scene, 0x48) << 8);
        *dispcnt_b = (*dispcnt_b & ~0x1f00) |
                     (FIELD(u32, scene, 0x4c) << 8);
        if (!FIELD(void *, scene, 0x598))
            *(volatile u32 *)0x0400001c = 0;
        else
            func_020929f4((u8 *)scene + 0x5a0);
    }
    return 0;
}

/*
 * While scene flag bit 10 is set and owner +0x598 exists, submits zero to
 * input object +0x5A0. Input state may change; returns zero.
 */
extern "C" s32 func_ov025_02202bf0(void *scene)
{
    if (((s32)(FIELD(u32, scene, 0x20) << 21) >> 31) &&
        FIELD(void *, scene, 0x598))
        func_02092a34((u8 *)scene + 0x5a0, 0);
    return 0;
}

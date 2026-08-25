#include "tingle/types.h"

/* Overlay 29 gated display-register and embedded-input frame callbacks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020929f4(void *);
extern void GraphicsAffineScanlineWave_Apply(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * When scene flag bit 10 at +0x20 is set, replaces main/sub DISPCNT bits 8..12
 * from fields +0x48/+0x4C, writes `(field +0xE0 << 16) & 0x01FF0000` to the
 * 32-bit register pair at 0x04000014, and advances embedded state +0xEC through
 * the SDK. Returns zero; scene SDK state and Nintendo DS display MMIO change.
 */
extern "C" s32 func_ov029_021fd3d4(void *state)
{
    if (FIELD(u32, state, 0x20) & 0x400) {
        volatile u32 *mainDispcnt = (volatile u32 *)0x04000000;
        volatile u32 *subDispcnt = (volatile u32 *)0x04001000;
        *mainDispcnt = (*mainDispcnt & ~0x1f00u) |
                       ((u32)FIELD(s32, state, 0x48) << 8);
        *subDispcnt = (*subDispcnt & ~0x1f00u) |
                      ((u32)FIELD(s32, state, 0x4c) << 8);
        *(volatile u32 *)0x04000014 =
            ((u32)FIELD(s32, state, 0xe0) << 16) & 0x01ff0000;
        func_020929f4((u8 *)state + 0xec);
    }
    return 0;
}

/*
 * When scene flag bit 10 at +0x20 is set, advances embedded state +0xEC with
 * argument zero. Returns zero; SDK state may change and no MMIO is direct.
 */
extern "C" s32 func_ov029_021fd43c(void *state)
{
    if (FIELD(u32, state, 0x20) & 0x400)
        GraphicsAffineScanlineWave_Apply((u8 *)state + 0xec, 0);
    return 0;
}

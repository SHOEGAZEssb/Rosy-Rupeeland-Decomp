#include "tingle/types.h"

/* Overlay 36 top-level scene update, render callback, and fixed offset helper. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

typedef s32 (*QueryCallback)(void *object);
typedef void (*RenderCallback)(void *object);

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov048_0220ba90(void *state);
extern s32 func_ov043_0220b9bc(void *state);
extern void func_020b0558(void);
extern void func_ov048_0220bad4(void *state);
#ifdef __cplusplus
}
#endif

/*
 * When scene flag +0x20 bit 0x400 is set, updates shared state +0x98 and
 * replaces main-engine DISPCNT bits 8..12 with low bits from +0x48. Always
 * returns zero; shared state and the Nintendo DS display-control register may
 * change.
 */
extern "C" s32 func_ov036_02204aa0(void *scene)
{
    if ((FIELD(u32, scene, 0x20) & 0x400) != 0) {
        func_ov048_0220ba90((u8 *)scene + 0x98);
        u32 display = REG32(0x04000000);
        display &= ~0x1f00;
        display |= FIELD(u32, scene, 0x48) << 8;
        REG32(0x04000000) = display;
    }
    return 0;
}

/*
 * Queries controller +0x60 through vtable slot +0x10. If shared-state query
 * +0x98 returns one, subtracts the recovered 0x47E offset. It resets common
 * GX state, writes clear color 0x7FFF and zero clear depth/companion state,
 * stores controller render fields +0x98=0 and +0x9C=query result, invokes
 * controller vtable render slot +0xC, commits GX state, clears register
 * 0x04000540, and finalizes shared state +0x98. Returns nothing and directly
 * changes Nintendo DS GX registers plus controller render state.
 */
extern "C" void func_ov036_02204ae0(void *scene)
{
    void *controller = FIELD(void *, scene, 0x60);
    s32 value =
        (*(QueryCallback *)((u8 *)FIELD(void *, controller, 0) + 0x10))(
            controller);
    if (func_ov043_0220b9bc((u8 *)scene + 0x98) == 1)
        value -= 0x47e;
    func_020b0558();
    REG32(0x040004c0) = 0x7fff;
    REG32(0x040004c4) = 0;
    REG32(0x04000444) = 0;
    FIELD(s32, controller, 0x98) = 0;
    FIELD(s32, controller, 0x9c) = value;
    (*(RenderCallback *)((u8 *)FIELD(void *, controller, 0) + 0xc))(
        controller);
    REG32(0x04000448) = 1;
    REG32(0x04000540) = 0;
    func_ov048_0220bad4((u8 *)scene + 0x98);
}

/*
 * Returns the fixed recovered scene offset 0x47E. It has no inputs, state
 * changes, or hardware/SDK effects.
 */
extern "C" s32 func_ov036_02204b74(void)
{
    return 0x47e;
}

#include "tingle/types.h"

/* Overlay 37 presentation-to-scene drawing bridge and fixed display offset. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

typedef s32 (*Overlay037QueryFn)(void *scene);
typedef void (*Overlay037RenderFn)(void *scene);

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_ov043_0220b9bc(void *state);
extern void func_020b0558(void);
extern void func_ov048_0220bad4(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Queries main scene +0x5C through vtable slot +0x10, subtracting the fixed
 * 0x47E display offset when the shared +0x94 subsystem reports state 1. It
 * resets geometry state, writes the derived value to scene +0x98 (clearing
 * +0x94), invokes scene vtable slot +0xC to render, flushes geometry, clears
 * MMIO 0x04000540, and advances the shared subsystem. Returns nothing;
 * geometry hardware, scene render fields, and shared presentation state change.
 */
extern "C" void func_ov037_021fe81c(void *presentation)
{
    void *scene = FIELD(void *, presentation, 0x5c);
    Overlay037QueryFn *vtable = FIELD(Overlay037QueryFn *, scene, 0);
    s32 value = vtable[4](scene);
    if (func_ov043_0220b9bc((u8 *)presentation + 0x94) == 1)
        value -= 0x47e;
    func_020b0558();
    REG32(0x040004c0) = 0x7fff;
    REG32(0x040004c4) = 0;
    REG32(0x04000444) = 0;
    FIELD(s32, scene, 0x94) = 0;
    FIELD(s32, scene, 0x98) = value;
    ((Overlay037RenderFn *)vtable)[3](scene);
    REG32(0x04000448) = 1;
    REG32(0x04000540) = 0;
    func_ov048_0220bad4((u8 *)presentation + 0x94);
}

/* Returns the confirmed fixed presentation offset 0x47E; no state changes. */
extern "C" s32 func_ov037_021fe8b0(void)
{
    return 0x47e;
}

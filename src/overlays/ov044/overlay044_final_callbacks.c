#include "tingle/types.h"

/*
 * Overlay 44 final callbacks. These recovered wrappers provide a completed
 * display flush result and route main/sub display control either through an
 * active child scene or directly to Nintendo DS display registers.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_ov044_0220c880(void *object);

typedef void (*DisplayMethod)(void *object);

/*
 * Flush all scene display resources through func_ov044_0220c880 and return one
 * to report completion. Graphics state changes through the flush helper.
 */
extern "C" s32 func_ov044_0220d20c(void *object)
{
    func_ov044_0220c880(object);
    return 1;
}

/*
 * Return zero after an optional display update. When object flag bit ten is
 * clear, perform no writes. When set and child scene +0x23C exists, invoke its
 * virtual slot +0x0C for the main display; otherwise replace DISPCNT bits
 * 8..12 at 0x04000000 with scene value +0x48. Then always replace the same bits
 * in sub-engine DISPCNT at 0x04001000 with value +0x4C. These are direct
 * Nintendo DS hardware register effects.
 */
extern "C" s32 func_ov044_0220d21c(void *object)
{
    if (!(FIELD(u32, object, 0x20) & 0x400))
        return 0;
    void *child = FIELD(void *, object, 0x23c);
    if (child) {
        void *vtable = FIELD(void *, child, 0);
        FIELD(DisplayMethod, vtable, 0xc)(child);
    } else {
        volatile u32 *mainDisplay = (volatile u32 *)0x04000000;
        *mainDisplay = (*mainDisplay & ~0x1f00) |
                       (FIELD(u32, object, 0x48) << 8);
    }
    volatile u32 *subDisplay = (volatile u32 *)0x04001000;
    *subDisplay = (*subDisplay & ~0x1f00) |
                  (FIELD(u32, object, 0x4c) << 8);
    return 0;
}

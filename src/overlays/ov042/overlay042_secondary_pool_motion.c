#include "tingle/types.h"

/*
 * Overlay 42 secondary-pool homing motion. This recovered updater processes
 * state-three child slots, derives fixed-point velocity toward a fixed scene
 * coordinate, and returns children that have reached that coordinate.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" s32 func_020adc40(s32 squaredLength);
extern "C" s32 func_020adc90(s32 numerator, s32 denominator);
extern "C" void func_ov042_021fea08(void *pool, s32 index);

/*
 * Given a pool and time value, scan all 48 slots in descending order. For each
 * confirmed state-three slot, store the low half of time*1000 at +0x1468 and
 * aim its child position at (0x80000,0x88000). Store a normalized velocity,
 * scaled by 4 minus the slot payload at +0x122C, in the following two payload
 * words. A child already at the target is released through the pool helper.
 * Pool and child state change; no value is returned.
 */
extern "C" void func_ov042_021fe8e4(void *pool, s32 time)
{
    u16 phase = (u16)(time * 1000);
    for (s32 i = 47; i >= 0; --i) {
        if (FIELD(s32, pool, 0x14c8 + i * 4) != 3)
            continue;
        FIELD(u16, pool, 0x1468 + i * 2) = phase;
        void *child = FIELD(void *, pool, 0xf28 + i * 4);
        s32 dx = 0x80000 - FIELD(s32, child, 0x30);
        s32 dy = 0x88000 - FIELD(s32, child, 0x34);
        s32 scale = 4 - FIELD(s32, pool, 0x122c + i * 12);
        s32 length = func_020adc40((s32)((((s64)dx * dx + 0x800) >> 12) +
                                         (((s64)dy * dy + 0x800) >> 12)));
        if (length == 0) {
            func_ov042_021fea08(pool, i);
            continue;
        }
        FIELD(s32, pool, 0x122c + i * 12) =
            scale * func_020adc90(dx, length);
        FIELD(s32, pool, 0x1230 + i * 12) =
            scale * func_020adc90(dy, length);
    }
}

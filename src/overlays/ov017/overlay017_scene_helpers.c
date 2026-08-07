#include "tingle/types.h"

/* Overlay 17 small scene helpers for global objects, display state, timers, and progress tests. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov017_02201618[];
extern void *data_021e9ac0;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020651a4(void *);
#ifdef __cplusplus
}
#endif

/*
 * Install vtable data_ov017_02201618 and clear words +4/+8. Returns state in
 * the incoming result register; only object memory changes and no SDK or
 * hardware state is touched.
 */
extern "C" void *func_ov017_021ff150(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov017_02201618;
    FIELD(s32, state, 4) = 0;
    FIELD(s32, state, 8) = 0;
    return state;
}

/*
 * If flag bit 10 of word +0x20 is set, replace display-control bits 8..12 for
 * the main and sub engines with values +0x48/+0x4C. Always return zero. Object
 * memory is read only, but Nintendo DS display MMIO at 0x04000000/0x04001000
 * may change; no SDK helper is called.
 */
extern "C" s32 func_ov017_021ff544(void *state)
{
    if (FIELD(u32, state, 0x20) & (1U << 10)) {
        volatile u32 *mainDisplay = (volatile u32 *)0x04000000;
        volatile u32 *subDisplay = (volatile u32 *)0x04001000;
        *mainDisplay = (*mainDisplay & ~0x1f00U) |
                       (FIELD(u32, state, 0x48) << 8);
        *subDisplay = (*subDisplay & ~0x1f00U) |
                      (FIELD(u32, state, 0x4c) << 8);
    }
    return 0;
}

/*
 * Tick a two-word countdown. If current +0 is zero, return zero. Otherwise
 * decrement it; return one only when its pre-decrement value equaled +4. The
 * timer changes in place and no SDK or hardware state is touched.
 */
extern "C" s32 func_ov017_0220087c(void *timer)
{
    u32 current = FIELD(u32, timer, 0);
    if (current == 0) {
        return 0;
    }
    FIELD(u32, timer, 0) = current - 1;
    return current == FIELD(u32, timer, 4);
}

/*
 * Pack low value in bits 0..15, high value starting at bit 16, and a normalized
 * boolean at bit 15, then write the word to Nintendo DS geometry register
 * 0x040004C0. Returns void; caller memory and SDK state are unchanged, while
 * geometry-engine MMIO changes directly.
 */
extern "C" void func_ov017_02200a8c(u32 low, u32 high, s32 enabled)
{
    *(volatile u32 *)0x040004c0 = low | (high << 16) |
                                  ((enabled != 0) << 15);
}

/*
 * Query the subsystem at global object data_021E9AC0 +0x1C and return one when
 * its reported value is at least 99, otherwise zero. Global/SDK state is read
 * only and no direct hardware access occurs.
 */
extern "C" s32 func_ov017_02200bf8(void)
{
    return func_020651a4((u8 *)data_021e9ac0 + 0x1c) >= 0x63;
}

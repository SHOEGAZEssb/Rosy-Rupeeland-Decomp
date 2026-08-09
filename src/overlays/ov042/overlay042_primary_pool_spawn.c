#include "tingle/types.h"

/*
 * Overlay 42 primary effect-pool allocation. These recovered entry points pop
 * a slot from the signed free-list head at +0xF24, initialize parallel arrays
 * belonging to that slot, and install a caller-supplied 12-byte element.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 genrand_int32(void);
extern "C" void func_ov042_021fda0c(void *destination, const void *source);

/*
 * Initialize the shared fields for one available slot. Store state, a random
 * low-halfword seed, copy position to +0x4C+index*12, clear the halfword at
 * +0xA74 and mirror its zero into words +0x504/+0x500, store parameter at
 * +0xCCC, then advance +0xF24 through the word link at +0xD94. This helper is
 * a portable expression of the repeated confirmed layout; no value is returned.
 */
static void activate_slot(void *pool, s32 state, const void *position,
                          s16 parameter)
{
    s32 index = FIELD(s32, pool, 0xf24);
    FIELD(s32, pool, 0xb3c + index * 4) = state;
    FIELD(u16, pool, 0x9ac + index * 2) = (u16)genrand_int32();
    func_ov042_021fda0c((u8 *)pool + 0x4c + index * 12, position);
    FIELD(u16, pool, 0xa74 + index * 2) = 0;
    FIELD(s32, pool, 0x504 + index * 12) = 0;
    FIELD(s32, pool, 0x500 + index * 12) = 0;
    FIELD(u16, pool, 0xccc + index * 2) = (u16)parameter;
    FIELD(s32, pool, 0xf24) = FIELD(s32, pool, 0xd94 + index * 4);
}

/*
 * If a free slot exists, allocate it with state two when variant is zero or
 * state three otherwise, copy position, use parameter -1, and advance the free
 * list through activate_slot. A negative head leaves pool unchanged; no return.
 */
extern "C" void func_ov042_021fdbc8(void *pool, s32 variant,
                                     const void *position)
{
    if (FIELD(s32, pool, 0xf24) < 0)
        return;
    activate_slot(pool, variant == 0 ? 2 : 3, position, -1);
}

/*
 * Allocate the same state-two/state-three slot variant as
 * func_ov042_021fdbc8, but store the caller's fourth argument narrowed to the
 * +0xCCC halfword parameter. A negative free-list head is ignored; no return.
 */
extern "C" void func_ov042_021fdc88(void *pool, s32 variant,
                                     const void *position, s32 parameter)
{
    if (FIELD(s32, pool, 0xf24) < 0)
        return;
    activate_slot(pool, variant == 0 ? 2 : 3, position, (s16)parameter);
}

/*
 * If a free slot exists, allocate it with fixed state four, copy position,
 * store mode narrowed at +0xCCC, clear its counters, and advance the head.
 * This is the entry point used by the late emission dispatcher; no return.
 */
extern "C" void func_ov042_021fdd48(void *pool, s32 mode,
                                     const void *position)
{
    if (FIELD(s32, pool, 0xf24) < 0)
        return;
    activate_slot(pool, 4, position, (s16)mode);
}

/*
 * Allocate state five from +0xF24 using the caller's low 16-bit seed rather
 * than the random generator. Copy position, clear both word counters, the
 * +0xA74 halfword, and parameter +0xCCC, then advance the free-list head.
 * A negative head leaves pool unchanged; no value is returned.
 */
extern "C" void func_ov042_021fde00(void *pool, u16 seed,
                                     const void *position)
{
    s32 index = FIELD(s32, pool, 0xf24);
    if (index < 0)
        return;
    FIELD(s32, pool, 0xb3c + index * 4) = 5;
    FIELD(u16, pool, 0x9ac + index * 2) = seed;
    func_ov042_021fda0c((u8 *)pool + 0x4c + index * 12, position);
    FIELD(u16, pool, 0xa74 + index * 2) = 0;
    FIELD(s32, pool, 0x504 + index * 12) = 0;
    FIELD(s32, pool, 0x500 + index * 12) = 0;
    FIELD(u16, pool, 0xccc + index * 2) = 0;
    FIELD(s32, pool, 0xf24) = FIELD(s32, pool, 0xd94 + index * 4);
}

/*
 * Allocate state six, clamping duration to [6,30]. Store a random low-halfword
 * seed and position, initialize word +0x500 to duration*2 and +0x504 to zero,
 * store duration at +0xA74 and 0x7FFF at +0xCCC, then advance the free-list
 * head. A negative head has no effect and no value is returned.
 */
extern "C" void func_ov042_021fdeac(void *pool, s32 duration,
                                     const void *position)
{
    s32 index = FIELD(s32, pool, 0xf24);
    if (index < 0)
        return;
    if (duration < 6)
        duration = 6;
    if (duration > 30)
        duration = 30;
    FIELD(s32, pool, 0xb3c + index * 4) = 6;
    FIELD(u16, pool, 0x9ac + index * 2) = (u16)genrand_int32();
    func_ov042_021fda0c((u8 *)pool + 0x4c + index * 12, position);
    FIELD(s32, pool, 0x500 + index * 12) = duration * 2;
    FIELD(s32, pool, 0x504 + index * 12) = 0;
    FIELD(u16, pool, 0xa74 + index * 2) = (u16)duration;
    FIELD(u16, pool, 0xccc + index * 2) = 0x7fff;
    FIELD(s32, pool, 0xf24) = FIELD(s32, pool, 0xd94 + index * 4);
}

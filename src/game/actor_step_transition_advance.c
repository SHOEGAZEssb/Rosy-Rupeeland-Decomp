#include "tingle/types.h"

/* Advance the active 24-frame actor step transition. */
typedef struct StepAdvanceVTable {
    u8 field_00[0x40];
    void (*complete_40)(void *);
} StepAdvanceVTable;

extern s32 data_020c3a48[4][25];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020050a4(void *, const void *);
#ifdef __cplusplus
}
#endif

/*
 * Return zero when state halfword 0xac equals 0xff. While timer 0xae is
 * positive, decrement it, add per-frame deltas 0xc0/0xc4 to X/Y, and set Z to
 * base 0xbc plus the curve entry data_020c3a48[state][24-timer]; return one.
 * When the timer has expired, call vtable offset 0x40, copy vector 0xb0 to
 * position 0x18, and return two. The retail body copies the 0x320-byte curve
 * table to its stack before indexing; matching assembly preserves that
 * compiler-sensitive schedule. No direct hardware access occurs.
 */
s32 func_02032144(void *self)
{
    u8 *actor = (u8 *)self;
    s16 state = *(s16 *)(actor + 0xac);
    s16 timer;

    if (state == 0xff)
        return 0;
    timer = *(s16 *)(actor + 0xae);
    if (timer > 0) {
        timer--;
        *(s16 *)(actor + 0xae) = timer;
        *(s32 *)(actor + 0x1c) += *(s32 *)(actor + 0xc0);
        *(s32 *)(actor + 0x20) += *(s32 *)(actor + 0xc4);
        *(s32 *)(actor + 0x24) =
            *(s32 *)(actor + 0xbc) + data_020c3a48[state][24 - timer];
        return 1;
    }
    (*(StepAdvanceVTable **)actor)->complete_40(actor);
    func_020050a4(actor + 0x18, actor + 0xb0);
    return 2;
}

#include "tingle/types.h"

/* Smooth shared directional motion and advance the actor-interaction subsystems. */
extern u16 data_02105680;
extern u16 data_02105682;
extern s32 data_02105684[2];
extern s16 data_020c9670[];
extern u8 data_021056e4[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0204cfa4(void);
extern void func_02034ecc(void);
extern void func_02053560(void);
extern void func_0203d944(void);
extern void func_02045028(void);
#ifdef __cplusplus
}
#endif

/*
 * Decode the low byte of data_02105680 as the recovered directional-table
 * index, scale its signed pair by three times data_02105682, and replace both
 * shared motion components with one quarter of three times their old value
 * plus the new fixed-point contribution. If magnitude is zero and
 * func_0204cfa4 returns less than 41, clear both components. Advance the four
 * recovered runtime helpers in order, clearing the leading resource-table
 * halfword before func_02045028. Returns no value; helper calls change global
 * engine state. The matching fallback preserves compiler-sensitive shifts.
 */
void ActorInteractionRuntime_Update(void)
{
    u32 index = (u8)data_02105680 * 0x10;
    s32 scale = data_02105682 * 3;
    s32 first = data_020c9670[index];
    s32 second = data_020c9670[index + 1];

    data_02105684[0] =
        (data_02105684[0] * 3 + ((scale * first) >> 12)) >> 2;
    data_02105684[1] =
        (data_02105684[1] * 3 + ((scale * second) >> 12)) >> 2;
    if (data_02105682 == 0 && func_0204cfa4() < 0x29) {
        data_02105684[0] = 0;
        data_02105684[1] = 0;
    }
    func_02034ecc();
    func_02053560();
    func_0203d944();
    *(u16 *)data_021056e4 = 0;
    func_02045028();
}

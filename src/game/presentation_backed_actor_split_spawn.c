#include "tingle/types.h"

/*
 * Recovered amount-splitting spawner for presentation-backed actors. It maps
 * a signed amount onto denomination thresholds, creates at most five type-10
 * actors, and rotates their initial velocity selection using global state.
 */

extern const s16 data_020c3e78[];
extern const s16 data_020c9670[];
extern u16 data_02105788[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_02005058(void *vector);
extern void *func_0204e2ac(s32 type, u32 value_1f4, u32 value_1f2,
                           const void *position, const void *vector_38,
                           u32 descriptor_arg0, u32 descriptor_arg1,
                           u32 descriptor_arg2, u32 selection,
                           u32 value_1ef, s32 enable_flag_200);
extern s32 func_020adae4(s32 numerator, s32 denominator);
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

typedef struct FxVector3 {
    s32 x;
    s32 y;
    s32 z;
} FxVector3;

/*
 * Inputs are the spawned actors' playback value, a signed amount, their
 * position source, and an opaque descriptor argument. Choose an initial tier
 * from one third of the amount, repeatedly subtract the largest applicable
 * threshold in data_020c3e78, and spawn no more than five type-10 actors. The
 * Y/Z velocity components come from data_020c9670 at the global angle's upper
 * bits and are scaled by 3/2. After each spawn, advance that angle by a random
 * remainder modulo 0x3000 plus 0x1800. Returns nothing; actor-manager and RNG
 * state change, while hardware is not accessed directly.
 */
void func_0204e3f4(u32 playback_value, s32 amount,
                   const void *position, u32 descriptor_arg)
{
    FxVector3 velocity;
    s32 third = func_020adae4(amount, 3);
    s32 tier = 0;
    s32 spawned;

    func_0200500c(&velocity, 0, 0, 0x2000);
    while (tier < 7 && data_020c3e78[tier] <= third)
        tier++;
    if (tier > 0)
        tier--;

    for (spawned = 0; spawned < 5 && amount > 0; spawned++) {
        s32 candidate;
        for (candidate = tier; candidate >= 0; candidate--) {
            s32 denomination = data_020c3e78[candidate];
            if (denomination <= amount) {
                s32 angle_index = ((s16)data_02105788[0] >> 4);
                amount = (s16)(amount - denomination);
                velocity.y = func_020adae4(
                    data_020c9670[angle_index * 2 + 1] * 3, 2);
                velocity.z = func_020adae4(
                    data_020c9670[angle_index * 2] * 3, 2);
                func_0204e2ac(10, playback_value, denomination, position,
                              &velocity, 0x300d, 0x300e, 0x300f,
                              candidate, 7, 1);
                data_02105788[0] = (u16)(data_02105788[0] +
                    (genrand_int32() % 0x3000) + 0x1800);
                break;
            }
        }
    }
    func_02005058(&velocity);
}


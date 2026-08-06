#include "tingle/types.h"

/* Retire completed feedback slots and derive a positive randomized value from an input. */
extern void *data_021056f4[6];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 numerator, s32 denominator);
extern u64 func_020bf1f8(u32 value, u32 divisor);
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

/*
 * Update each of six nonnull feedback presentations through vtable slot +0x08.
 * When it returns nonzero, destroy that entry through slot +0x04 and clear the
 * slot. Returns no value; virtual calls advance or release presentation state.
 */
void func_0203ad64(void)
{
    s32 i;
    for (i = 0; i < 6; ++i) {
        void *object = data_021056f4[i];
        if (object != 0 &&
            (*(s32 (**)(void *))(*(u8 **)object + 8))(object) != 0) {
            object = data_021056f4[i];
            if (object != 0)
                (*(void (**)(void *))(*(u8 **)object + 4))(object);
            data_021056f4[i] = 0;
        }
    }
}

/*
 * Divide input by ten, subtract that quotient from input, then add an RNG
 * remainder. The modulus is twice the quotient when it exceeds one, otherwise
 * it is one or two according to RNG bit 0x100. Clamp the result to at least
 * one and return it. RNG and division helpers affect global RNG/SDK state.
 */
s32 func_0203adc4(s32 value)
{
    s32 quotient = func_020befec(value, 10);
    s32 result = value - quotient;
    u32 random = genrand_int32();
    u32 modulus = quotient > 1 ? (u32)quotient * 2 :
                                  ((random & 0x100) != 0 ? 2 : 1);
    result += (s32)(func_020bf1f8(random, modulus) >> 32);
    if (result <= 0)
        result = 1;
    return result;
}

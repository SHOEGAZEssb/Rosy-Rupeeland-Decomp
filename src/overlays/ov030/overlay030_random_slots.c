#include "tingle/types.h"

/* Overlay 30 randomized seven-slot activation mask and record helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay030Pair {
    u16 value;
    u16 flag;
} Overlay030Pair;

#ifdef __cplusplus
extern "C" {
#endif
extern u32 genrand_int32(void);
extern void func_ov030_021fcf04(void *, const void *);
#ifdef __cplusplus
}
#endif

/*
 * Clears words +0/+4 and the first halfword of seven four-byte records at +8.
 * It creates seven temporary records with random 16-bit keys, marks the first
 * three flags, sorts all records by ascending key through 0x021FCF04 swaps, and
 * copies the shuffled flags into each destination record's second halfword.
 * Thus exactly three of seven slots are enabled. Returns `object`; PRNG state
 * and object memory change, with no SDK or hardware effects.
 */
extern "C" void *func_ov030_021fce00(void *object)
{
    FIELD(s32, object, 0) = 0;
    FIELD(s32, object, 4) = 0;
    Overlay030Pair temporary[7];
    for (s32 i = 0; i < 7; ++i) {
        FIELD(u16, object, 8 + i * 4) = 0;
        temporary[i].value = (u16)genrand_int32();
        temporary[i].flag = 0;
    }
    for (s32 i = 0; i < 3; ++i)
        temporary[i].flag = 1;
    for (s32 i = 0; i < 6; ++i) {
        for (s32 j = i + 1; j < 7; ++j) {
            if (temporary[i].value > temporary[j].value) {
                Overlay030Pair swap;
                func_ov030_021fcf04(&swap, &temporary[i]);
                func_ov030_021fcf04(&temporary[i], &temporary[j]);
                func_ov030_021fcf04(&temporary[j], &swap);
            }
        }
    }
    for (s32 i = 0; i < 7; ++i)
        FIELD(u16, object, 0xa + i * 4) = temporary[i].flag;
    return object;
}

/* Copies two halfwords from `source` to `destination`; returns void. */
extern "C" void func_ov030_021fcf04(void *destination, const void *source)
{
    FIELD(u16, destination, 0) = FIELD(u16, source, 0);
    FIELD(u16, destination, 2) = FIELD(u16, source, 2);
}

/* No-op callback: ignores `object`, changes no state, and returns void. */
extern "C" void func_ov030_021fcf18(void *object)
{
    (void)object;
}

/* Second no-op callback: ignores `object`, changes no state, and returns void. */
extern "C" void func_ov030_021fcf1c(void *object)
{
    (void)object;
}

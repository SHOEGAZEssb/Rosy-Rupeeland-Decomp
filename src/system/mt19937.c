#include "tingle/random.h"

/*
 * MT19937 by Makoto Matsumoto and Takuji Nishimura.
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * This implementation was recovered from the retail binary and independently
 * expressed here. Its constants, state layout, and default seed wrapper match
 * the authors' 2002 reference implementation. See LICENSES/MT19937.txt.
 */

#define MT_N 624
#define MT_M 397
#define MT_MATRIX_A 0x9908b0dfU
#define MT_UPPER_MASK 0x80000000U
#define MT_LOWER_MASK 0x7fffffffU

u32 gMtState[MT_N];
int gMtIndex = MT_N + 1;
u32 gMtMag01[2] = { 0, MT_MATRIX_A };

/* Seed the generator and expand one value into all 624 state words. */
void init_genrand(u32 seed)
{
    gMtState[0] = seed & 0xffffffffU;
    for (gMtIndex = 1; gMtIndex < MT_N; gMtIndex++) {
        gMtState[gMtIndex] =
            1812433253U *
                (gMtState[gMtIndex - 1] ^ (gMtState[gMtIndex - 1] >> 30)) +
            gMtIndex;
        gMtState[gMtIndex] &= 0xffffffffU;
    }
}

/*
 * Seed the generator from an array. The two mixing passes and the forced high
 * bit are part of the authors' reference initialization algorithm.
 */
void init_by_array(const u32 *initKey, int keyLength)
{
    int i;
    int j;
    int count;

    init_genrand(19650218U);
    i = 1;
    j = 0;
    count = MT_N > keyLength ? MT_N : keyLength;

    for (; count != 0; count--) {
        gMtState[i] = (gMtState[i] ^
                       ((gMtState[i - 1] ^ (gMtState[i - 1] >> 30)) *
                        1664525U)) +
                      initKey[j] + j;
        gMtState[i] &= 0xffffffffU;
        i++;
        j++;
        if (i >= MT_N) {
            gMtState[0] = gMtState[MT_N - 1];
            i = 1;
        }
        if (j >= keyLength) {
            j = 0;
        }
    }

    for (count = MT_N - 1; count != 0; count--) {
        gMtState[i] = (gMtState[i] ^
                       ((gMtState[i - 1] ^ (gMtState[i - 1] >> 30)) *
                        1566083941U)) -
                      i;
        gMtState[i] &= 0xffffffffU;
        i++;
        if (i >= MT_N) {
            gMtState[0] = gMtState[MT_N - 1];
            i = 1;
        }
    }

    gMtState[0] = MT_UPPER_MASK;
}

/*
 * Return one tempered 32-bit value. A fresh state block is generated when all
 * 624 existing words have been consumed; an untouched generator uses the
 * reference implementation's default seed.
 */
u32 genrand_int32(void)
{
    u32 value;
    int i;

    if (gMtIndex >= MT_N) {
        if (gMtIndex == MT_N + 1) {
            init_genrand(5489U);
        }

        for (i = 0; i < MT_N - MT_M; i++) {
            value = (gMtState[i] & MT_UPPER_MASK) |
                    (gMtState[i + 1] & MT_LOWER_MASK);
            gMtState[i] = gMtState[i + MT_M] ^ (value >> 1) ^ gMtMag01[value & 1];
        }
        for (; i < MT_N - 1; i++) {
            value = (gMtState[i] & MT_UPPER_MASK) |
                    (gMtState[i + 1] & MT_LOWER_MASK);
            gMtState[i] = gMtState[i + MT_M - MT_N] ^
                          (value >> 1) ^ gMtMag01[value & 1];
        }

        value = (gMtState[MT_N - 1] & MT_UPPER_MASK) |
                (gMtState[0] & MT_LOWER_MASK);
        gMtState[MT_N - 1] = gMtState[MT_M - 1] ^
                             (value >> 1) ^ gMtMag01[value & 1];
        gMtIndex = 0;
    }

    value = gMtState[gMtIndex++];
    value ^= value >> 11;
    value ^= (value << 7) & 0x9d2c5680U;
    value ^= (value << 15) & 0xefc60000U;
    value ^= value >> 18;
    return value;
}

/* Initialize the game's deterministic default random-number sequence. */
void InitRandom(void)
{
    const u32 initialSeed[4] = { 0x123, 0x234, 0x345, 0x456 };
    init_by_array(initialSeed, 4);
}

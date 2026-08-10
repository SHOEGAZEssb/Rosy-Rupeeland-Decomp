#include "tingle/types.h"

/*
 * Recovered random selector for type-seven actor records. It filters the
 * 36-entry record table by phase, flags, exclusions, and a requested class.
 */

extern u8 *gGameWork;
extern u8 data_020e16b0[];
extern u8 data_020ea9b0[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern u32 genrand_int32(void);
extern s32 func_020ada8c(u32 value, s32 divisor);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are a selector code, phase byte, and two unused recovered arguments.
 * Codes 0x0a..0x0c require record halfword +0x36 to equal 2, 1, or 0;
 * code 0x0d accepts any value. Other codes return -1 immediately.
 *
 * Build seven excluded identifiers from the phase-indexed three-halfword list
 * at game-work +0x1aa, the low halves of three words at +0x3d0, and global
 * data_020e16b0+0x2b4. A record is eligible when byte +0x55 equals phase,
 * GameWork_TestFlag accepts word +0x64, its leading identifier is not excluded,
 * and its optional class matches. Choose uniformly from eligible table indices
 * using the low 31 random bits and return that record's signed identifier, or
 * -1 when none qualify. Global tables and game work are read; RNG state may
 * change, with no direct hardware effects.
 */
s32 Type7Actor_SelectRandomEligibleRecordId(s32 selector, u32 phase, u32 unused2, u32 unused3)
{
    s16 excluded[7];
    s16 candidates[36];
    s32 requiredClass;
    s32 candidateCount = 0;
    s32 index;
    (void)unused2;
    (void)unused3;

    if (selector == 0x0d)
        requiredClass = -1;
    else if (selector == 0x0c)
        requiredClass = 0;
    else if (selector == 0x0b)
        requiredClass = 1;
    else if (selector == 0x0a)
        requiredClass = 2;
    else
        return -1;

    for (index = 0; index < 3; ++index)
        excluded[index] = *(s16 *)(gGameWork + 0x1aa + phase * 6 + index * 2);
    for (index = 0; index < 3; ++index)
        excluded[index + 3] = *(s16 *)(gGameWork + 0x3d0 + index * 4);
    excluded[6] = *(s16 *)(data_020e16b0 + 0x2b4);

    for (index = 0; index < 36; ++index) {
        u8 *record = data_020ea9b0 + index * 0x68;
        s32 excludedIndex;
        s32 isExcluded = 0;
        if (record[0x55] != (u8)phase
            || GameWork_TestFlag(gGameWork, *(u32 *)(record + 0x64)) == 0)
            continue;
        for (excludedIndex = 0; excludedIndex < 7; ++excludedIndex) {
            if (*(s16 *)record == excluded[excludedIndex]) {
                isExcluded = 1;
                break;
            }
        }
        if (isExcluded)
            continue;
        if (requiredClass != -1
            && requiredClass != *(u16 *)(record + 0x36))
            continue;
        candidates[candidateCount++] = (s16)index;
    }

    if (candidateCount < 1)
        return -1;
    index = func_020ada8c(genrand_int32() & 0x7fffffff, candidateCount);
    return *(s16 *)(data_020ea9b0 + candidates[index] * 0x68);
}

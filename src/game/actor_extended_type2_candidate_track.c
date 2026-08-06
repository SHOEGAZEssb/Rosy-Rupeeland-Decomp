#include "tingle/types.h"

/*
 * Recovered extended type-two actor candidate tracking. It validates a supplied
 * object, advances a saturating timer, and dispatches or stores the candidate.
 */
extern u8 data_020e8380[];

/*
 * A null candidate clears actor +0x264 and returns one. Otherwise virtual +0x148
 * validates actor and candidate; a zero result clears +0x264 and returns zero.
 * Increment byte +0x269 up to 32, derive descriptor class from
 * data_020e8380[index*0x30]+0x1e shifted down two, and map classes 0,1,2,3+
 * to thresholds 2,4,8,16. For classes through two whose timer reaches the
 * threshold, invoke virtual +0xf4 with the candidate. All other accepted paths
 * store candidate at +0x264 and set byte +0x268 to 12. Return one for every
 * accepted candidate. Actor and virtual state may change; descriptor data is
 * read only and no direct SDK or hardware operation occurs.
 */
s32 func_0204322c(void *self, void *candidate)
{
    u8 *actor = (u8 *)self;
    u32 descriptorClass;
    u32 threshold;

    if (candidate == 0) {
        *(void **)(actor + 0x264) = 0;
        return 1;
    }
    if ((*(s32 (**)(void *, void *))(*(u8 **)actor + 0x148))
            (actor, candidate) == 0) {
        *(void **)(actor + 0x264) = 0;
        return 0;
    }
    if (actor[0x269] < 32)
        ++actor[0x269];
    descriptorClass =
        *(u16 *)(data_020e8380 + *(u16 *)(actor + 0x4e) * 0x30 + 0x1e) >> 2;
    switch (descriptorClass) {
    case 0: threshold = 2; break;
    case 1: threshold = 4; break;
    case 2: threshold = 8; break;
    default: threshold = 16; break;
    }
    if (descriptorClass <= 2 && actor[0x269] >= threshold) {
        (*(void (**)(void *, void *))(*(u8 **)actor + 0xf4))(actor, candidate);
    } else {
        *(void **)(actor + 0x264) = candidate;
        actor[0x268] = 12;
    }
    return 1;
}

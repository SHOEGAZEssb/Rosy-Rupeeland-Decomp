#include "tingle/types.h"

/* Query a recovered pointer list and smooth actor height against an attachment range. */
extern u8 data_0210568c[];
extern void *data_02105690[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020adae4(s32 numerator, s32 denominator);
extern s32 func_020be334(s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Ignore first and linearly scan data_02105690 for target using the signed
 * halfword count at data_0210568c +0x02. Return one on identity match, else
 * zero. No state changes and no helpers are called.
 */
s32 func_02039c3c(void *first, void *target)
{
    s32 i;
    (void)first;
    for (i = 0; i < *(s16 *)(data_0210568c + 2); ++i)
        if (data_02105690[i] == target)
            return 1;
    return 0;
}

/*
 * Without object +0x270, use actor +0x84 as both target bounds. With it, add
 * object +0x14/+0x18 to actor base +0x1dc. Replace actor height +0x24 by
 * (17*old + lower)/18. When no object exists or object byte +0x10 bit two is
 * set, set actor +0xd0 bit 0x20 if the absolute distance from the upper bound
 * is below 0x4000; otherwise clear that bit. An object lacking bit two always
 * clears it. Returns no value; fixed division and absolute-value helpers have
 * arithmetic-only effects.
 */
void func_02039c7c(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *object = *(u8 **)(actor + 0x270);
    s32 lower;
    s32 upper;
    if (object == 0) {
        lower = *(s32 *)(actor + 0x84);
        upper = lower;
    } else {
        lower = *(s32 *)(actor + 0x1dc) + *(s32 *)(object + 0x14);
        upper = *(s32 *)(actor + 0x1dc) + *(s32 *)(object + 0x18);
    }
    *(s32 *)(actor + 0x24) =
        func_020adae4(*(s32 *)(actor + 0x24) * 17 + lower, 18);
    if ((object == 0 || (object[0x10] & 2) != 0) &&
        func_020be334(*(s32 *)(actor + 0x24) - upper) < 0x4000) {
        *(u32 *)(actor + 0xd0) |= 0x20;
        return;
    }
    *(u32 *)(actor + 0xd0) &= ~0x20;
}

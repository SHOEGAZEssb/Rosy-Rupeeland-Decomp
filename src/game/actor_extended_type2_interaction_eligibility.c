#include "tingle/types.h"

/*
 * Recovered extended type-two actor interaction eligibility predicate. It
 * combines descriptor class, callback identity, activity, ownership, and flags.
 */
extern u8 data_020e8380[];
extern u8 data_020df9e8[];
extern u8 data_020dfbd8[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02033f44(void *actor);
#ifdef __cplusplus
}
#endif

/* Match a stored callback pair, including the null member-function form. */
static s32 callback_pair_matches(const u8 *actor)
{
    u32 first = *(const u32 *)(actor + 0x218);
    if (first != *(u32 *)(data_020df9e8 + 0x1f0))
        return 0;
    return *(const u32 *)(actor + 0x21c) == *(u32 *)(data_020dfbd8 + 4) ||
           first == 0;
}

/*
 * Return one only when actor +0x10 bit 0x1000000 is clear and bit two is set;
 * descriptor record data_020e8380[index*0x30]+0x1e shifted down two is below
 * five; callback +0x218/+0x21c is not global representation +0x1f0; +0x260 bit
 * 0x10000 is clear; +0x260 bit one is set while virtual +0xa8 reports inactive;
 * func_02033f44 returns the same value for actor and other; +0xd0 bit 0x10 is
 * clear; +0x24 equals +0x1dc; and +0xd0 bit 0x100 is clear. Otherwise return
 * zero. Inputs and global descriptor/callback data are read only; virtual and
 * bookkeeping queries may have engine-visible effects but no direct hardware
 * operation occurs.
 */
s32 func_020430ec(void *self, void *other)
{
    u8 *actor = (u8 *)self;
    u32 flags10 = *(u32 *)(actor + 0x10);
    u32 flags260;
    u32 flagsD0;

    if ((flags10 & 0x1000000) != 0 || (flags10 & 4) == 0)
        return 0;
    if ((*(u16 *)(data_020e8380 + *(u16 *)(actor + 0x4e) * 0x30 + 0x1e) >> 2) >= 5)
        return 0;
    if (callback_pair_matches(actor))
        return 0;
    flags260 = *(u32 *)(actor + 0x260);
    if ((flags260 & 0x10000) != 0)
        return 0;
    if ((flags260 & 2) == 0 ||
        (*(s32 (**)(void *))(*(u8 **)actor + 0xa8))(actor) != 0)
        return 0;
    if (func_02033f44(actor) != func_02033f44(other))
        return 0;
    flagsD0 = *(u32 *)(actor + 0xd0);
    if ((flagsD0 & 0x10) != 0 ||
        *(u32 *)(actor + 0x24) != *(u32 *)(actor + 0x1dc))
        return 0;
    return (flagsD0 & 0x100) == 0;
}

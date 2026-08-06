#include "tingle/types.h"

/*
 * Recovered randomized acceptance predicate for type-seven actor interactions.
 * It uses record subtype and callback state to occasionally force a reset.
 */
#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02046d8c(const void *actor);
extern u32 genrand_int32(void);
extern s32 func_020ada8c(s32 value, s32 divisor);
extern void func_02047f38(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Return one unconditionally when collision flag
 * +0xd0/0x40000 is set or record subtype +0x54 is one. For subtype zero, return
 * one when func_02046d8c recognizes the callback or with four-in-five random
 * outcomes; on the remaining outcome run func_02047f38 and return zero. For
 * subtype two, return one on random modulo three equal to zero, otherwise run
 * func_02047f38 and return zero. Other subtypes return zero. The random stream,
 * actor callback, animation, resource, and game-work state may change through
 * the reset; there is no direct hardware access.
 */
s32 func_020486a8(void *self)
{
    u8 *actor = (u8 *)self;
    u8 subtype;

    if ((*(u32 *)(actor + 0xd0) & 0x40000) != 0)
        return 1;
    subtype = (*(u8 **)(actor + 0x29c))[0x54];
    if (subtype == 1)
        return 1;
    if (subtype == 0) {
        if (func_02046d8c(actor) != 0)
            return 1;
        if (func_020ada8c((s32)(genrand_int32() & 0x7fffffff), 5) != 0)
            return 1;
        func_02047f38(actor);
        return 0;
    }
    if (subtype == 2) {
        if (func_020ada8c((s32)(genrand_int32() & 0x7fffffff), 3) == 0)
            return 1;
        func_02047f38(actor);
        return 0;
    }
    return 0;
}

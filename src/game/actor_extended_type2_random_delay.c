#include "tingle/types.h"

/*
 * Recovered extended type-two actor randomized delay. It refreshes the actor
 * transform and arms a stored member callback after a 120..239 tick interval.
 */
extern u8 data_020df9e8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020050a4(void *destination, ...);
extern u32 genrand_int32(void);
extern s32 func_020ada8c(s32 value, s32 divisor);
#ifdef __cplusplus
}
#endif

/*
 * Enter state two and reset transform +0x78 from +0x18. When signed counter
 * +0x25a is zero, choose random threshold +0x258 in [120,239]. On later calls,
 * once the counter is at least that unsigned threshold, install global member
 * pair +0x218/+0x21c at actor +0x220/+0x224. Increment +0x25a and always return
 * zero. Actor, transform, and random state may change; no direct hardware or
 * SDK operation occurs.
 */
s32 func_02041e18(void *self)
{
    u8 *actor = (u8 *)self;
    *(u16 *)(actor + 0xd6) = 2;
    func_020050a4(actor + 0x78, actor + 0x18);
    if (*(s16 *)(actor + 0x25a) == 0) {
        *(u16 *)(actor + 0x258) =
            (u16)(func_020ada8c((s32)(genrand_int32() & 0x7fffffff), 120) + 120);
    } else if (*(s16 *)(actor + 0x25a) >= *(u16 *)(actor + 0x258)) {
        *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0x218);
        *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0x21c);
    }
    ++*(s16 *)(actor + 0x25a);
    return 0;
}

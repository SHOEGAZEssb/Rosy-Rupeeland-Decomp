#include "tingle/types.h"

/* Recovered staged-counter and descriptor dispatch for the table-configured actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02040f4c(void *actor, void *descriptorRecord);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are actor and descriptorRecord. When actor record +0x2a4 exists, clear
 * +0x260 bit 0x20 and advance three signed counter/limit pairs in order:
 * +0x298/+0x29a, +0x29c/+0x29e, and +0x2a0/+0x2a2. At the first-counter limit,
 * reset all counters, invoke vtable +0xd0 with actor +0x18, and, when limit
 * +0x29e is zero, invoke vtable +0x1d4 with descriptor signed byte +0x25. While
 * the second counter is below its limit, invoke +0xd0 then increment it and
 * invoke +0x1d4 on reaching the limit. While the third counter is below its
 * limit, increment it and invoke +0xd0. Each of those active phases enters
 * state 13, sets byte +0x24c to two, and returns zero. Once all three phases are
 * exhausted, increment +0x298. The fallthrough path sets +0x260 bit 0x20,
 * forwards actor and descriptorRecord to func_02040f4c, and returns its result.
 * Actor, callback, and descriptor-processing state may change.
 */
s32 func_0204497c(void *self, void *descriptorRecord)
{
    u8 *actor = (u8 *)self;
    if (*(void **)(actor + 0x2a4) != 0) {
        *(u32 *)(actor + 0x260) &= ~0x20u;
        if (*(s16 *)(actor + 0x298) == *(s16 *)(actor + 0x29a)) {
            *(u16 *)(actor + 0x298) = 0;
            *(u16 *)(actor + 0x29c) = 0;
            *(u16 *)(actor + 0x2a0) = 0;
            (*(void (**)(void *, void *))(*(u8 **)actor + 0xd0))(
                actor, actor + 0x18);
            if (*(s16 *)(actor + 0x29e) == 0) {
                (*(void (**)(void *, s32))(*(u8 **)actor + 0x1d4))(
                    actor, *(s8 *)((u8 *)descriptorRecord + 0x25));
            }
            *(u16 *)(actor + 0xd6) = 13;
            actor[0x24c] = 2;
            return 0;
        }
        if (*(s16 *)(actor + 0x29c) < *(s16 *)(actor + 0x29e)) {
            (*(void (**)(void *, void *))(*(u8 **)actor + 0xd0))(
                actor, actor + 0x18);
            ++*(s16 *)(actor + 0x29c);
            if (*(s16 *)(actor + 0x29c) == *(s16 *)(actor + 0x29e)) {
                (*(void (**)(void *, s32))(*(u8 **)actor + 0x1d4))(
                    actor, *(s8 *)((u8 *)descriptorRecord + 0x25));
            }
            *(u16 *)(actor + 0xd6) = 13;
            actor[0x24c] = 2;
            return 0;
        }
        if (*(s16 *)(actor + 0x2a0) < *(s16 *)(actor + 0x2a2)) {
            ++*(s16 *)(actor + 0x2a0);
            (*(void (**)(void *, void *))(*(u8 **)actor + 0xd0))(
                actor, actor + 0x18);
            *(u16 *)(actor + 0xd6) = 13;
            actor[0x24c] = 2;
            return 0;
        }
        ++*(s16 *)(actor + 0x298);
    }
    *(u32 *)(actor + 0x260) |= 0x20;
    return func_02040f4c(actor, descriptorRecord);
}

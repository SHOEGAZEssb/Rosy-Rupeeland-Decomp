#include "tingle/types.h"

/* Recovered cyclic staged-counter dispatch for the table-configured actor subclass. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02040f4c(void *actor, void *descriptorRecord);
#ifdef __cplusplus
}
#endif

/*
 * With a nonnull table record +0x2a4, clear +0x260 bit 0x20 and use subclass
 * cycle +0x2a8 to choose the first-counter limit: +0x29a for cycle zero or
 * +0x2aa for positive cycles. Reaching that limit resets counters +0x298,
 * +0x29c, and +0x2a0, invokes vtable +0xd0 with actor +0x18, optionally invokes
 * vtable +0x1d4 with descriptor signed byte +0x25 when +0x29e is zero, advances
 * +0x2a8 modulo three, enters state 13/mode byte two, sets actor +0xd0 bit
 * 0x1000, and returns zero. Otherwise advance the +0x29c/+0x29e phase as in
 * ActorExtendedTable_UpdateStagedCounters. Cycle zero may next advance +0x2a0/+0x2a2. Finally increment
 * +0x298; a positive cycle remains in state 13 and returns zero, while cycle
 * zero falls through. The fallthrough path sets +0x260 bit 0x20 and returns
 * func_02040f4c(actor,descriptorRecord). Actor and callback state may change.
 */
s32 ActorExtendedTableCyclic_UpdateStagedCounters(void *self, void *descriptorRecord)
{
    u8 *actor = (u8 *)self;
    if (*(void **)(actor + 0x2a4) != 0) {
        s16 cycle;
        *(u32 *)(actor + 0x260) &= ~0x20u;
        cycle = *(s16 *)(actor + 0x2a8);
        if ((cycle == 0
             && *(s16 *)(actor + 0x298) == *(s16 *)(actor + 0x29a))
            || (cycle > 0
                && *(s16 *)(actor + 0x298) == *(s16 *)(actor + 0x2aa))) {
            *(u16 *)(actor + 0x298) = 0;
            *(u16 *)(actor + 0x2a0) = 0;
            *(u16 *)(actor + 0x29c) = 0;
            (*(void (**)(void *, void *))(*(u8 **)actor + 0xd0))(
                actor, actor + 0x18);
            if (*(s16 *)(actor + 0x29e) == 0) {
                (*(void (**)(void *, s32))(*(u8 **)actor + 0x1d4))(
                    actor, *(s8 *)((u8 *)descriptorRecord + 0x25));
            }
            ++*(s16 *)(actor + 0x2a8);
            if (*(s16 *)(actor + 0x2a8) >= 3)
                *(u16 *)(actor + 0x2a8) = 0;
            *(u16 *)(actor + 0xd6) = 13;
            actor[0x24c] = 2;
            *(u32 *)(actor + 0xd0) |= 0x1000;
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
        if (cycle == 0
            && *(s16 *)(actor + 0x2a0) < *(s16 *)(actor + 0x2a2)) {
            ++*(s16 *)(actor + 0x2a0);
            (*(void (**)(void *, void *))(*(u8 **)actor + 0xd0))(
                actor, actor + 0x18);
            *(u16 *)(actor + 0xd6) = 13;
            actor[0x24c] = 2;
            return 0;
        }
        ++*(s16 *)(actor + 0x298);
        if (*(s16 *)(actor + 0x2a8) > 0) {
            *(u16 *)(actor + 0xd6) = 13;
            actor[0x24c] = 2;
            return 0;
        }
    }
    *(u32 *)(actor + 0x260) |= 0x20;
    return func_02040f4c(actor, descriptorRecord);
}

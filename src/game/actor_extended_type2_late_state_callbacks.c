#include "tingle/types.h"

/*
 * Recovered extended type-two actor late-state callback helpers. They install
 * callback representations for states two and 22 and provide a null predicate.
 */
extern u8 data_020df9e8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_RestoreSavedFlags(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Invoke Actor_RestoreSavedFlags, clear actor +0x10 mask 0x1f0000, install global pairs
 * +0x288/+0x28c and +0x280/+0x284 at +0x218..+0x224, clear +0xd0 bit 0x200,
 * enter state two, and return zero. Actor/callback state may change; no direct
 * SDK or hardware operation occurs.
 */
s32 ActorExtendedType2_EnterState2WithCallbacks(void *self)
{
    u8 *actor = (u8 *)self;
    Actor_RestoreSavedFlags(actor);
    *(u32 *)(actor + 0x10) &= ~0x1f0000;
    *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x288);
    *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x28c);
    *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0x280);
    *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0x284);
    *(u32 *)(actor + 0xd0) &= ~0x200;
    *(u16 *)(actor + 0xd6) = 2;
    return 0;
}

/*
 * Clear actor +0x260 bit zero, set mode byte +0x24c to eight, enter state 22,
 * and decrement signed counter +0x25a. When it becomes negative, install global
 * pairs +0x278/+0x27c and +0x270/+0x274 at +0x218..+0x224. Always return zero;
 * only actor/callback state changes and no SDK or hardware operation occurs.
 */
s32 ActorExtendedType2_UpdateState22Countdown(void *self)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0x260) &= ~1;
    actor[0x24c] = 8;
    *(u16 *)(actor + 0xd6) = 22;
    --*(s16 *)(actor + 0x25a);
    if (*(s16 *)(actor + 0x25a) < 0) {
        *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x278);
        *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x27c);
        *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0x270);
        *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0x274);
    }
    return 0;
}

/*
 * Constant-false callback predicate. It ignores all caller context, changes no
 * state, performs no SDK or hardware operation, and returns zero.
 */
s32 ActorExtendedType2_ReturnFalseLateState(void)
{
    return 0;
}

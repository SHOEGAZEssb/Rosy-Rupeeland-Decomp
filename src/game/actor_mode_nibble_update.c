#include "tingle/types.h"

/* Consume recovered mode-nibble actor flags and run its virtual update sequence. */
#ifdef __cplusplus
extern "C" {
#endif
extern void ActorDerivedRuntime_UpdateFrame(void *actor);
extern void Actor_UpdateAnimationState(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * If actor +0x10 bit 0x01000000 is set, forward directly to ActorDerivedRuntime_UpdateFrame and
 * return. Otherwise invoke virtual +0x18 and inspect low 12 bits of halfword
 * +0x208. Bit one is consumed immediately and sets halfword +0xd6 to one. If
 * +0x10 bit eight is set, invoke virtual +0x74 with actor field +0xf0 and
 * return; otherwise, unless the high mode nibble equals four, OR bits two and
 * four into actor flags +0x14. When bit one was absent, bit two is consumed
 * only while +0xd6 equals one and attachment +0x54 halfword +0x24 has bit one;
 * consuming it clears +0xd6. Finish through virtual +0xa4,
 * Actor_UpdateAnimationState, and virtual +0x20. Returns no value; virtual and base helpers
 * have observable actor/presentation effects.
 */
void ActorModeNibble_UpdateFrame(void *self)
{
    u8 *actor = (u8 *)self;
    u16 value;
    u16 low;
    if ((*(u32 *)(actor + 0x10) & 0x01000000) != 0) {
        ActorDerivedRuntime_UpdateFrame(actor);
        return;
    }
    (*(void (**)(void *))(*(u8 **)actor + 0x18))(actor);
    value = *(u16 *)(actor + 0x208);
    low = value & 0x0fff;
    if ((low & 1) != 0) {
        *(u16 *)(actor + 0x208) = (u16)((value & 0xf000) | (low & ~1));
        *(s16 *)(actor + 0xd6) = 1;
        if ((*(u32 *)(actor + 0x10) & 8) != 0) {
            (*(void (**)(void *, void *))(*(u8 **)actor + 0x74))(
                actor, *(void **)(actor + 0xf0));
            return;
        }
        if ((*(u16 *)(actor + 0x208) >> 12) != 4)
            *(u32 *)(actor + 0x14) |= 6;
    } else if ((low & 2) != 0 && *(s16 *)(actor + 0xd6) == 1 &&
               (*(u16 *)(*(u8 **)(actor + 0x54) + 0x24) & 1) != 0) {
        *(u16 *)(actor + 0x208) = (u16)((value & 0xf000) | (low & ~2));
        *(s16 *)(actor + 0xd6) = 0;
    }
    (*(void (**)(void *))(*(u8 **)actor + 0xa4))(actor);
    Actor_UpdateAnimationState(actor);
    (*(void (**)(void *))(*(u8 **)actor + 0x20))(actor);
}

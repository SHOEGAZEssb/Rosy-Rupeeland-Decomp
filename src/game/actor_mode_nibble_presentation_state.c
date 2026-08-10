#include "tingle/types.h"

/*
 * Apply the mode-nibble actor's recovered state to its attachment and expose
 * field +0x108.
 */
#ifdef __cplusplus
extern "C" {
#endif
extern void func_02072b68(void *attachment, u32 animation);
#ifdef __cplusplus
}
#endif

/*
 * Read signed state halfword +0xd6. State zero selects attachment animation
 * zero, clears attachment halfword +0x24 bit one, and sets bit two. State one
 * selects animation (attachment +0x1c -> +0x20 -> word +0x04 minus one) masked
 * to a byte. When the actor's high mode nibble in +0x208 is not four, clear
 * attachment bits one and two; for mode four, set bit two and clear bit one.
 * Other state values do nothing. Returns no value; animation selection and
 * attachment flag writes change presentation state.
 */
void ActorModeNibble_UpdatePresentationState(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *attachment = *(u8 **)(actor + 0x54);
    s16 state = *(s16 *)(actor + 0xd6);
    if (state == 0) {
        func_02072b68(attachment, 0);
        *(u16 *)(attachment + 0x24) &= ~1;
        *(u16 *)(attachment + 0x24) |= 2;
    } else if (state == 1) {
        u8 *nested = *(u8 **)(attachment + 0x1c);
        u8 *record = *(u8 **)(nested + 0x20);
        func_02072b68(attachment, (*(u32 *)(record + 4) - 1) & 0xff);
        if ((*(u16 *)(actor + 0x208) >> 12) != 4) {
            *(u16 *)(attachment + 0x24) &= ~3;
        } else {
            *(u16 *)(attachment + 0x24) |= 2;
            *(u16 *)(attachment + 0x24) &= ~1;
        }
    }
}

/* Return actor word +0x108 without changing state. */
s32 ActorModeNibble_GetField108(const void *self)
{
    return *(const s32 *)((const u8 *)self + 0x108);
}

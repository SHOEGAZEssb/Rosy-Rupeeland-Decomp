#include "tingle/types.h"

/* Recovered constants, contact forwarding, and link-state callbacks for the source actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorExtendedType2_ApplyContactResponse(void *actor, void *other, s32 context);
#ifdef __cplusplus
}
#endif

/* Accept no meaningful input or state changes and return the fixed value 0x20000. */
s32 func_02044044(void)
{
    return 0x20000;
}

/* Forward all inputs to ActorExtendedType2_ApplyContactResponse and return its collision-response result. */
s32 func_0204404c(void *self, void *other, s32 context)
{
    return ActorExtendedType2_ApplyContactResponse(self, other, context);
}

/*
 * Store partner at actor +0x298, set class flag bit zero at +0x29c, clear bit
 * 0x100 at +0xd0, and set object +0x54 halfwords +0x32/+0x34 to 0x100.
 * Returns no value; link, actor, and presentation state change.
 */
void func_02044058(void *self, void *partner)
{
    u8 *actor = (u8 *)self;
    u8 *object;
    *(void **)(actor + 0x298) = partner;
    *(u32 *)(actor + 0x29c) |= 1;
    *(u32 *)(actor + 0xd0) &= ~0x100u;
    object = *(u8 **)(actor + 0x54);
    *(u16 *)(object + 0x32) = 0x100;
    *(u16 *)(object + 0x34) = 0x100;
}

/* Clear class flag bit zero at actor +0x29c; return no value. */
void func_02044088(void *self)
{
    *(u32 *)((u8 *)self + 0x29c) &= ~1u;
}

/* Clear class flag bit one at actor +0x29c; return no value. */
void func_02044098(void *self)
{
    *(u32 *)((u8 *)self + 0x29c) &= ~2u;
}

/*
 * Return one exactly when signed state +0xd6 is not 16 and class flag bit zero
 * at +0x29c is clear; otherwise return zero. No state or hardware changes occur.
 */
s32 func_020440a8(const void *self)
{
    const u8 *actor = (const u8 *)self;
    return *(const s16 *)(actor + 0xd6) != 16
        && (*(const u32 *)(actor + 0x29c) & 1) == 0;
}

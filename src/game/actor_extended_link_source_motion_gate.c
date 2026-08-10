#include "tingle/types.h"

/* Recovered motion-reset gate for the source-side paired actor class. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200b2c0(void *vector, s32 x, s32 y, s32 z);
extern void Actor_IntegrateMotion(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * When class flags +0x29c have bit zero set, zero the three vector-like fields
 * at +0x38, +0x88, and +0x98 through func_0200b2c0. Otherwise forward actor to
 * Actor_IntegrateMotion. Returns no value; actor motion or base state may change, with
 * no direct SDK or hardware access.
 */
void ActorExtendedLinkSource_UpdateMotion(void *self)
{
    u8 *actor = (u8 *)self;
    if ((*(u32 *)(actor + 0x29c) & 1) != 0) {
        func_0200b2c0(actor + 0x38, 0, 0, 0);
        func_0200b2c0(actor + 0x88, 0, 0, 0);
        func_0200b2c0(actor + 0x98, 0, 0, 0);
        return;
    }
    Actor_IntegrateMotion(actor);
}

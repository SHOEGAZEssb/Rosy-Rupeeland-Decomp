#include "tingle/types.h"

/* Reset type-1 actor contact bookkeeping and optional attachment state. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02032abc(void *actor);
extern void Type7AuxiliaryPresentation_BeginShutdown(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Forward actor to the confirmed contact-count decrement helper and return its
 * result unchanged. This address-derived wrapper has no additional state
 * effects; func_02032abc clears actor flag one when the count reaches zero.
 */
void ActorDerivedType1_DecrementContactCount(void *actor)
{
    func_02032abc(actor);
}

/*
 * Set actor +0xd0 bit 0x80. If optional object +0x270 exists and byte +0x10
 * has bit one set, notify it through Type7AuxiliaryPresentation_BeginShutdown. Then clear actor +0xd0 bit
 * eight, +0x230 bits 0x40/0x100, and halfwords +0x250/+0x268. Returns no
 * value; the optional object call may change runtime attachment state.
 */
void ActorDerivedType1_ResetContactState(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *object;

    *(u32 *)(actor + 0xd0) |= 0x80;
    object = *(u8 **)(actor + 0x270);
    if (object != 0 && (object[0x10] & 1) != 0)
        Type7AuxiliaryPresentation_BeginShutdown(object);
    *(u32 *)(actor + 0xd0) &= ~8;
    *(u32 *)(actor + 0x230) &= ~0x140;
    *(u16 *)(actor + 0x250) = 0;
    *(u16 *)(actor + 0x268) = 0;
}

#include "tingle/types.h"

/* Recovered counter reset and callback-selection helpers for the table-configured actor. */
extern u8 data_020e0ac8[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02040d64(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * If actor record pointer +0x2a4 is nonnull, copy signed limit +0x29a into
 * counter +0x298, copy +0x2a2 into +0x2a0, and clear +0x29c. Otherwise return
 * without changes. Returns no value and has no direct hardware effects.
 */
void ActorExtendedTable_ResetStageCounters(void *self)
{
    u8 *actor = (u8 *)self;
    if (*(void **)(actor + 0x2a4) == 0)
        return;
    *(u16 *)(actor + 0x298) = *(u16 *)(actor + 0x29a);
    *(u16 *)(actor + 0x2a0) = *(u16 *)(actor + 0x2a2);
    *(u16 *)(actor + 0x29c) = 0;
}

/*
 * Copy the callback representation at data_020e0ac8+0x30/+0x34 to actor
 * +0x218/+0x21c, then invoke func_02040d64(actor) and return its result. Actor
 * callback and virtual state may change; no direct SDK or hardware access.
 */
s32 ActorExtendedTable_InstallCallback30AndDispatch(void *self)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0x218) = *(u32 *)(data_020e0ac8 + 0x30);
    *(u32 *)(actor + 0x21c) = *(u32 *)(data_020e0ac8 + 0x34);
    return func_02040d64(actor);
}

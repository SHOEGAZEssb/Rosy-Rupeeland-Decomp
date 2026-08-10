#include "tingle/types.h"

/* Gate and dispatch actor activation modes through virtual slot 0x78. */
extern u8 data_02105310[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorRuntimeCollection_GetBusyState(void *state);
extern s32 ActorRuntimeCollection_GetPendingAttachmentFlag(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Return zero without dispatch when either data_02105310 predicate is nonzero
 * or actor byte 0xe8 is nonzero. Otherwise dispatch activation mode two
 * through actor vtable slot 0x78 and return one. The callback may update
 * resource/presentation or SDK-managed state; the gate itself does not modify
 * actor fields directly.
 */
s32 Actor_TryDispatchActivationMode2(void *self)
{
    u8 *actor = (u8 *)self;
    void (*callback)(void *, s32);

    if (ActorRuntimeCollection_GetBusyState(data_02105310) != 0 || actor[0xe8] != 0 ||
        ActorRuntimeCollection_GetPendingAttachmentFlag(data_02105310) != 0) {
        return 0;
    }
    callback = *(void (**)(void *, s32))(*(u8 **)actor + 0x78);
    callback(actor, 2);
    return 1;
}

/*
 * Dispatch activation mode one through actor vtable slot 0x78 and return one
 * unconditionally. The callback may update actor, resource, or presentation
 * state.
 */
s32 Actor_DispatchActivationMode1(void *self)
{
    u8 *actor = (u8 *)self;
    void (*callback)(void *, s32) =
        *(void (**)(void *, s32))(*(u8 **)actor + 0x78);

    callback(actor, 1);
    return 1;
}

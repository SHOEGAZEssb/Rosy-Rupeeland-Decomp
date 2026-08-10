#include "tingle/game_phase_runtime.h"

/* Dispatch the three queued directional/action requests to the primary actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020057dc(void *point);
extern void *func_02009d78(void *object);
extern s32 ActorCollection_ProcessSelectionQuery(void *collection,
                                                  const void *query);
extern s32 ActorCollection_DispatchQueryUntilHandled(void *collection,
                                                      const void *query);
extern void ActorCollection_BroadcastQuery(void *collection,
                                           const void *query);
#ifdef __cplusplus
}
#endif

/*
 * Reset gameplay halfword 0x294 to -1, then consume the first set request bit
 * among bits 0..2 at runtime offset 0x30b8. A 12-byte point is built from the
 * primary actor's 20.12 position plus offsets 0x30ac/0x30b0 and passed to the
 * corresponding actor action. Bit zero is rejected when the y offset is at
 * least 192. Bits zero and one return the selected action's result; bit two
 * deliberately discards it and returns zero.
 */
s32 GamePhaseRuntime_DispatchActorQueryRequest(GamePhaseRuntime *self)
{
    u8 *b = (u8 *)self;
    u8 point[12];
    u32 flags;

    *(s16 *)((u8 *)*(void **)(b + 0x2ea4) + 0x294) = -1;
    flags = *(u32 *)(b + 0x30b8);
    if (!(flags & 7))
        goto returnZero;

    func_020057dc(point);
    *(s32 *)(point + 4) = *(s32 *)(b + 0x30ac) +
        (*(s32 *)((u8 *)func_02009d78(b + 0x2fbc) + 4) >> 12);
    *(s32 *)(point + 8) = *(s32 *)(b + 0x30b0) +
        (*(s32 *)((u8 *)func_02009d78(b + 0x2fbc) + 8) >> 12);

    flags = *(u32 *)(b + 0x30b8);
    if (flags & 1) {
        *(u32 *)(b + 0x30b8) = flags & ~1;
        if (*(s32 *)(b + 0x30b0) >= 192)
            goto returnZero;
        return ActorCollection_ProcessSelectionQuery(b + 0x28, point);
    }
    if (flags & 2) {
        *(u32 *)(b + 0x30b8) = flags & ~2;
        return ActorCollection_DispatchQueryUntilHandled(b + 0x28, point);
    }
    if (flags & 4) {
        *(u32 *)(b + 0x30b8) = flags & ~4;
        ActorCollection_BroadcastQuery(b + 0x28, point);
    }
returnZero:
    return 0;
}

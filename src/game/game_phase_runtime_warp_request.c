#include "tingle/game_phase_runtime.h"

/* Paired global warp-request setters used by the active game phase. */

extern void *gGameWork;
extern u8 gActorRuntimeCollection[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_SetFlag(void *work, s32 flag);
extern void ActorRuntimeCollection_QueuePendingValue(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Set game flag 0x410, store the integer parts of 20.12 x/y at GameWork
 * offsets 0x5e/0x60, select warp type two at 0x5c, and notify global
 * transition state. self is unused. Returns one.
 */
s32 GamePhaseRuntime_RequestPrimaryWarp(GamePhaseRuntime *self, s32 x, s32 y)
{
    (void)self;
    GameWork_SetFlag(gGameWork, 0x410);
    *(u16 *)((u8 *)gGameWork + 0x5e) = (u16)(x >> 12);
    *(u16 *)((u8 *)gGameWork + 0x60) = (u16)(y >> 12);
    *(u16 *)((u8 *)gGameWork + 0x5c) = 2;
    ActorRuntimeCollection_QueuePendingValue(gActorRuntimeCollection);
    return 1;
}

/*
 * Perform the same global warp request as GamePhaseRuntime_RequestPrimaryWarp but select warp type
 * one at GameWork offset 0x5c. self is unused. Returns one.
 */
s32 func_02008514(GamePhaseRuntime *self, s32 x, s32 y)
{
    (void)self;
    GameWork_SetFlag(gGameWork, 0x410);
    *(u16 *)((u8 *)gGameWork + 0x5e) = (u16)(x >> 12);
    *(u16 *)((u8 *)gGameWork + 0x60) = (u16)(y >> 12);
    *(u16 *)((u8 *)gGameWork + 0x5c) = 1;
    ActorRuntimeCollection_QueuePendingValue(gActorRuntimeCollection);
    return 1;
}

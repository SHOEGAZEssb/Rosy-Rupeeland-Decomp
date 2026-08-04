#include "tingle/game_phase_runtime.h"

/* Paired global warp-request setters used by the active game phase. */

extern void *gGameWork;
extern u8 data_02105310[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_SetFlag(void *work, s32 flag);
extern void func_0200b0d8(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Set game flag 0x410, store the integer parts of 20.12 x/y at GameWork
 * offsets 0x5e/0x60, select warp type two at 0x5c, and notify global
 * transition state. self is unused. Returns one.
 */
s32 func_020084b8(GamePhaseRuntime *self, s32 x, s32 y)
{
    (void)self;
    GameWork_SetFlag(gGameWork, 0x410);
    *(u16 *)((u8 *)gGameWork + 0x5e) = (u16)(x >> 12);
    *(u16 *)((u8 *)gGameWork + 0x60) = (u16)(y >> 12);
    *(u16 *)((u8 *)gGameWork + 0x5c) = 2;
    func_0200b0d8(data_02105310);
    return 1;
}

/*
 * Perform the same global warp request as func_020084b8 but select warp type
 * one at GameWork offset 0x5c. self is unused. Returns one.
 */
s32 func_02008514(GamePhaseRuntime *self, s32 x, s32 y)
{
    (void)self;
    GameWork_SetFlag(gGameWork, 0x410);
    *(u16 *)((u8 *)gGameWork + 0x5e) = (u16)(x >> 12);
    *(u16 *)((u8 *)gGameWork + 0x60) = (u16)(y >> 12);
    *(u16 *)((u8 *)gGameWork + 0x5c) = 1;
    func_0200b0d8(data_02105310);
    return 1;
}

#include "tingle/types.h"

/* Enter and guard the type-1 actor failure state shared with GameWork and audio. */
extern void *gGameWork;
extern void *gLupyContext;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern void GameWork_SetFlag(void *work, u32 flag);
extern s32 func_02010b64(void *context);
extern void func_020338e4(void *actor);
extern void func_02058ce0(void *soundContext);
extern void func_02039bfc(void *actor);
#ifdef __cplusplus
}
#endif

/* Clear actor signed halfword +0x29e. Returns no value and calls no helpers. */
void func_02039ba0(void *self)
{
    *(u16 *)((u8 *)self + 0x29e) = 0;
}

/*
 * Return while GameWork flag 0x3f5 is already set or the Lupy query is
 * positive. Otherwise enter the failure state through func_02039bfc. Returns
 * no value; GameWork/Lupy queries are read-only, while entry changes actor,
 * GameWork, and audio state.
 */
void func_02039bb0(void *self)
{
    if (GameWork_TestFlag(gGameWork, 0x3f5) != 0)
        return;
    if (func_02010b64(gLupyContext) > 0)
        return;
    func_02039bfc(self);
}

/*
 * Call func_020338e4, set actor word +0x248 to 0x46, set GameWork flag 0x3f5,
 * and pass the sound context to func_02058ce0. Returns no value; the helpers
 * alter actor collision/control state, persistent GameWork, and audio state.
 */
void func_02039bfc(void *self)
{
    u8 *actor = (u8 *)self;
    func_020338e4(actor);
    *(u32 *)(actor + 0x248) = 0x46;
    GameWork_SetFlag(gGameWork, 0x3f5);
    func_02058ce0(gSoundContext);
}

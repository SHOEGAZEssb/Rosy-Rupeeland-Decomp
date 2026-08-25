#include "tingle/types.h"

/* Enter and guard the type-1 actor failure state shared with GameWork and audio. */
extern void *gGameWork;
extern void *gGamePhaseCurrencyHud;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern void GameWork_SetFlag(void *work, u32 flag);
extern s32 GamePhaseCurrencyHud_GetCurrency(const void *context);
extern void Actor_ResetMotionForCollisionQuery(void *actor);
extern void Sound_StopAllManagedPlayers(void *soundContext);
extern void Type1Actor_EnterFailureState(void *actor);
#ifdef __cplusplus
}
#endif

/* Clear actor signed halfword +0x29e. Returns no value and calls no helpers. */
void ActorDerivedType1_ClearFailureCounter(void *self)
{
    *(u16 *)((u8 *)self + 0x29e) = 0;
}

/*
 * Return while GameWork flag 0x3f5 is already set or the currency query is
 * positive. Otherwise enter the failure state through
 * Type1Actor_EnterFailureState. Returns
 * no value; GameWork/currency queries are read-only, while entry changes actor,
 * GameWork, and audio state.
 */
void Type1Actor_TryEnterFailureState(void *self)
{
    if (GameWork_TestFlag(gGameWork, 0x3f5) != 0)
        return;
    if (GamePhaseCurrencyHud_GetCurrency(gGamePhaseCurrencyHud) > 0)
        return;
    Type1Actor_EnterFailureState(self);
}

/*
 * Call Actor_ResetMotionForCollisionQuery, set actor word +0x248 to 0x46, set GameWork flag 0x3f5,
 * and pass the sound context to Sound_StopAllManagedPlayers. Returns no value; the helpers
 * alter actor collision/control state, persistent GameWork, and audio state.
 */
void Type1Actor_EnterFailureState(void *self)
{
    u8 *actor = (u8 *)self;
    Actor_ResetMotionForCollisionQuery(actor);
    *(u32 *)(actor + 0x248) = 0x46;
    GameWork_SetFlag(gGameWork, 0x3f5);
    Sound_StopAllManagedPlayers(gSoundContext);
}

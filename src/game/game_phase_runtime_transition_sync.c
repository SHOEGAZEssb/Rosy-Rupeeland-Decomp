#include "tingle/game_phase_runtime.h"

/* Synchronize actors and global gameplay state after a phase transition. */

extern GamePhaseRuntime *gGamePhaseRuntime;
extern void *gGamePhaseCurrencyHud;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorCollection_SetFlagBit1(void *actor, s32 value);
extern void ActorCollection_UpdateFlag800Actors(void *actor);
extern s32 RuntimePresentationManager_UpdatePresentations(
    void *manager, s32 graphicsUpdateArgument);
extern void GamePhaseCurrencyHud_Update(void *context);
#ifdef __cplusplus
}
#endif

/*
 * Temporarily set property zero on the global runtime's secondary actor and
 * remember its prior value, finalize the primary actor, synchronize actor zero
 * for modes 0/2 and actor one for modes 1/2, run transition finalization, then
 * restore the secondary property. It enables object 0x2f7c, advances the currency-HUD
 * context, and invokes virtual slot four on object 0x30e8. Returns no value.
 */
void GamePhaseRuntime_UpdateActorPresentationState(GamePhaseRuntime *self, s32 mode)
{
    u8 *b = (u8 *)self;
    s32 previous = ActorCollection_SetFlagBit1(GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1), 0);

    ActorCollection_UpdateFlag800Actors(b + 0x28);
    if (mode == 0 || mode == 2)
        GamePhaseRuntime_SynchronizeActorPlacement(self, 0);
    if ((u32)(mode - 1) <= 1)
        GamePhaseRuntime_SynchronizeActorPlacement(self, 1);
    GamePhaseRuntime_FinalizeActorCollections(self, self->field_04, 3);
    ActorCollection_SetFlagBit1(GamePhaseRuntime_GetActorCollection(self, 1), previous);
    RuntimePresentationManager_UpdatePresentations(b + 0x2f7c, 1);
    GamePhaseCurrencyHud_Update(gGamePhaseCurrencyHud);
    {
        void *object = *(void **)(b + 0x30e8);
        (*(void (***)(void *))object)[4](object);
    }
}

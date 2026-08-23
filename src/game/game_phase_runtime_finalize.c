#include "tingle/game_phase_runtime.h"

/* Post-transition actor-state application for GamePhaseRuntime. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020086f8(void *state, GamePhaseRuntime *self);
extern void GamePhaseRuntime_BuildSecondaryTransform(void *state, GamePhaseRuntime *self);
extern void ActorCollection_DispatchEventToActors(void *actor, const void *state);
extern void VecFx32Object_Destroy(void *state);
extern void ActorCollection_GetSpriteGroup(void *actor);
extern void GraphicsSpriteGroup_AdvanceAnimations(void);
extern void ActorCollection_DrainRemovalQueue(void *actor);
extern void ActorFeedback_UpdatePresentations(void);
#ifdef __cplusplus
}
#endif

/*
 * Apply a recovered 16-byte state to the primary actor for modes 1/3 and to
 * the optional secondary actor for modes 2/3, then run their reset/finalize
 * hooks. The value argument is unused. Temporary states are explicitly
 * destroyed, and the global completion hook always runs. Returns no value.
 */
void GamePhaseRuntime_FinalizeActorCollections(GamePhaseRuntime *self, s32 value, s32 mode)
{
    u8 primaryState[16];
    u8 secondaryState[16];
    u8 *b = (u8 *)self;
    void *actor;
    (void)value;

    if (mode == 1 || mode == 3) {
        func_020086f8(primaryState, self);
        actor = b + 0x28;
        ActorCollection_DispatchEventToActors(actor, primaryState);
        VecFx32Object_Destroy(primaryState);
        ActorCollection_GetSpriteGroup(actor);
        GraphicsSpriteGroup_AdvanceAnimations();
        ActorCollection_DrainRemovalQueue(actor);
    }

    if ((u32)(mode - 2) <= 1) {
        actor = *(void **)(b + 0x2fb8);
        if (actor != 0) {
            GamePhaseRuntime_BuildSecondaryTransform(secondaryState, self);
            actor = (u8 *)*(void **)(b + 0x2fb8) + 8;
            ActorCollection_DispatchEventToActors(actor, secondaryState);
            VecFx32Object_Destroy(secondaryState);
            actor = (u8 *)*(void **)(b + 0x2fb8) + 8;
            ActorCollection_GetSpriteGroup(actor);
            GraphicsSpriteGroup_AdvanceAnimations();
            actor = (u8 *)*(void **)(b + 0x2fb8) + 8;
            ActorCollection_DrainRemovalQueue(actor);
        }
    }
    ActorFeedback_UpdatePresentations();
}

#include "tingle/game_phase_touch_prompt.h"
#include "tingle/game_work.h"
#include "tingle/scene.h"
#include "tingle/touch_panel.h"

/* Drive touch interaction and the prompt actor's short transition sequence. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern const u32 data_020c3618[];
extern const u32 data_020c3630[];
extern s32 func_02092910(void *spriteState, const TouchPoint *point);
extern s32 Presentation_IsScriptComplete(void *actor);
extern s32 Presentation_IsScriptSuspended(void *actor);
extern void Presentation_SetScript(void *actor, const void *sequence, s32 value);
extern void SpritePresentation_Show(void *actor);
extern void SpritePresentation_Hide(void *actor);
extern s32 ActorDerivedType1_IsActiveRecordType69(void *actor);
extern s32 ActorDerivedType1_IsActiveRecordType6A(void *actor);
extern void ActorDerivedType1_TeardownActiveRecord(void *actor);
extern s32 ActorDerivedType1_IsIdleEligible(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * With game flag 0x3ec set, enable the prompt and advance states 0-4: wait
 * for actor readiness, accept a pressed touch inside its sprite, dispatch the
 * active phase actor or current scene's method20 with value 100, temporarily
 * disable scene updates, and play data_020c3630 before resetting. Without the
 * flag, disable the actor. Normal non-trigger frames re-enable scene updates.
 */
void GamePhaseTouchPrompt_UpdateInteraction(GamePhaseTouchPrompt *self)
{
    if (GameWork_TestFlag(gGameWork, 0x3ec)) {
        SpritePresentation_Show(self->actor);
        switch (self->state) {
        case 0:
            if (!Presentation_IsScriptSuspended(self->actor))
                break;
            *(u32 *)((u8 *)self->actor + 0x90) = 0;
            self->state = 1;
            break;
        case 1:
            if (gTouchPanelManager->state == TOUCH_STATE_PRESSED) {
                TouchPoint point;
                u8 *phaseActor = *(u8 **)((u8 *)data_021052fc + 0x2ea4);
                TouchPanelManager_GetPoint(&point, gTouchPanelManager);
                if (func_02092910(*(void **)((u8 *)self->actor + 0x9c),
                                  &point)) {
                    u32 flags = *(u32 *)(phaseActor + 0x230);
                    if (flags & 0x800) {
                        if (ActorDerivedType1_IsActiveRecordType69(phaseActor) ||
                            ActorDerivedType1_IsActiveRecordType6A(phaseActor))
                            ActorDerivedType1_TeardownActiveRecord(phaseActor);
                    } else if ((flags & 0x20000) ||
                               ActorDerivedType1_IsIdleEligible(phaseActor)) {
                        Scene *scene = SceneManager_GetCurrent(gSceneManager);
                        ((void (*)(Scene *, s32))scene->vtable->method20)(
                            scene, 100);
                    }
                    SceneManager_SetUpdateEnabled(gSceneManager, 0);
                    return;
                }
            }
            break;
        case 2:
            self->state = self->savedState;
            break;
        case 3:
            if (Presentation_IsScriptComplete(self->actor))
                self->state = 4;
            break;
        case 4:
            Presentation_SetScript(self->actor, data_020c3630, 0);
            self->state = 0;
            break;
        }
    } else {
        SpritePresentation_Hide(self->actor);
    }
    SceneManager_SetUpdateEnabled(gSceneManager, 1);
}

/*
 * Save states 0/1, enter state 2, wait three updates, play data_020c3618,
 * wait for actor completion in state 3, then disable it in state 4.
 */
void GamePhaseTouchPrompt_UpdateHideSequence(GamePhaseTouchPrompt *self)
{
    switch (self->state) {
    case 0:
    case 1:
        self->savedState = self->state;
        self->state = 2;
        self->timer = 0;
        /* Retail intentionally falls through and counts this update. */
    case 2:
        if (++self->timer <= 2)
            return;
        Presentation_SetScript(self->actor, data_020c3618, 0);
        self->state = 3;
        return;
    case 3:
        if (Presentation_IsScriptComplete(self->actor))
            self->state = 4;
        return;
    case 4:
        SpritePresentation_Hide(self->actor);
        return;
    }
}

/*
 * Address-distinct twin of GamePhaseTouchPrompt_UpdateHideSequence used by the
 * alternate actor-query branch. Its recovered state changes and graphics
 * effects are identical.
 */
void GamePhaseTouchPrompt_UpdateAlternateHideSequence(GamePhaseTouchPrompt *self)
{
    GamePhaseTouchPrompt_UpdateHideSequence(self);
}

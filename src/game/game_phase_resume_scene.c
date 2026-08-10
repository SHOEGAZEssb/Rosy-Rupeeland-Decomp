#include "tingle/game_phase_resume_scene.h"
#include "tingle/game_work.h"
#include "tingle/heap.h"

/* Resume the covered phase scene after a transition and restore screen fades. */

#ifdef __cplusplus
extern "C" {
#endif
extern SceneVTable data_020d5594;
extern void DisplayBrightness_StartMainTransition(s32 screen, s32 frames);
extern void DisplayBrightness_StartSubTransition(s32 screen, s32 frames);
extern void ActorDescriptorBatch_ApplyCategoryCallback(s32 value);
#ifdef __cplusplus
}
#endif

/* Initialize the Scene, retain skipFade, and set GameWork flag 0x3f3. */
GamePhaseResumeScene *GamePhaseResumeScene_Init(GamePhaseResumeScene *self, s32 skipFade)
{
    Scene_Init(&self->base);
    self->base.vtable = &data_020d5594;
    self->skipFade = skipFade;
    GameWork_SetFlag(gGameWork, 0x3f3);
    return self;
}

/* Clear flag 0x3f3, destroy the Scene base, and return self without freeing. */
GamePhaseResumeScene *GamePhaseResumeScene_Destroy(GamePhaseResumeScene *self)
{
    self->base.vtable = &data_020d5594;
    GameWork_ClearFlag(gGameWork, 0x3f3);
    Scene_Destroy(&self->base);
    return self;
}

/* Clear flag 0x3f3, destroy and free the Scene, and return its old address. */
GamePhaseResumeScene *GamePhaseResumeScene_DestroyAndFree(GamePhaseResumeScene *self)
{
    self->base.vtable = &data_020d5594;
    GameWork_ClearFlag(gGameWork, 0x3f3);
    Scene_Destroy(&self->base);
    Heap_Free(self);
    return self;
}

/*
 * On states 0 and 1, set the phase controller value to 0 then 1 and invoke
 * the current Scene's update method. State 2 optionally consumes GameWork flag
 * 0x386 or starts both screen-1 fades, destroys this Scene, and returns one.
 * Other/incomplete states return zero.
 */
s32 GamePhaseResumeScene_Update(GamePhaseResumeScene *self)
{
    switch (self->base.value08) {
    case 0: {
        Scene *current;
        ActorDescriptorBatch_ApplyCategoryCallback(0);
        current = SceneManager_GetCurrent(gSceneManager);
        current->vtable->update(current);
        self->base.value08++;
    }
        /* fall through */
    case 1: {
        Scene *current;
        ActorDescriptorBatch_ApplyCategoryCallback(1);
        current = SceneManager_GetCurrent(gSceneManager);
        current->vtable->update(current);
        self->base.value08++;
        break;
    }
    case 2:
        if (!self->skipFade) {
            if (GameWork_TestFlag(gGameWork, 0x386))
                GameWork_ClearFlag(gGameWork, 0x386);
            else {
                DisplayBrightness_StartMainTransition(1, 0x10);
                DisplayBrightness_StartSubTransition(1, 0x10);
            }
        }
        if (self)
            self->base.vtable->destroyAndFree(&self->base);
        return 1;
    default:
        break;
    }
    return 0;
}

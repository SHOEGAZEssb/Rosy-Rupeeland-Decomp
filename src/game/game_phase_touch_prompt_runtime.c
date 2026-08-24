#include "tingle/game_phase_touch_prompt.h"
#include "tingle/scene.h"

/* Update prompt state, rendering, and animation from the active phase actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern void GamePhaseTouchPrompt_UpdateInteraction(GamePhaseTouchPrompt *self);
extern void GamePhaseTouchPrompt_UpdateHideSequence(GamePhaseTouchPrompt *self);
extern void GamePhaseTouchPrompt_UpdateAlternateHideSequence(GamePhaseTouchPrompt *self);
extern s32 ActorDerivedType1_IsActiveRecordType69(void *actor);
extern s32 ActorDerivedType1_IsActiveRecordType6A(void *actor);
extern void GraphicsSpriteGroup_AdvanceAnimations(GraphicsSpriteGroup *group);
extern s32 SpritePresentation_GetAnimation(void *actor);
extern void SpritePresentation_SetAnimation(void *actor, s32 animation);
extern void SpritePresentation_Show(void *actor);
extern void SpritePresentation_Hide(void *actor);
#ifdef __cplusplus
}
#endif

typedef s32 (*PromptVirtualQuery)(void *self);
typedef void (*PromptVirtualUpdate)(void *self);

/*
 * When enabled, select the prompt state machine from the current scene and an
 * active phase actor virtual query, update and render the prompt actor/group,
 * then select animation 3, 1, or 0 from actor flag 0x800 and two confirmed
 * actor queries. Returns zero. Offsets 0x2ea4 and 0x230 remain address-derived
 * because the encompassing phase-runtime and actor layouts are incomplete.
 */
s32 GamePhaseTouchPrompt_Update(GamePhaseTouchPrompt *self)
{
    u8 *phaseActor;
    Scene *scene;
    s32 animation;

    if (!self->enabled)
        return 0;
    phaseActor = *(u8 **)((u8 *)gGamePhaseRuntime + 0x2ea4);
    scene = SceneManager_GetCurrent(gSceneManager);
    if (scene->value04 == 1) {
        PromptVirtualQuery query =
            *(PromptVirtualQuery *)(*(u8 **)phaseActor + 0xa8);
        if (query(phaseActor))
            GamePhaseTouchPrompt_UpdateAlternateHideSequence(self);
        else
            GamePhaseTouchPrompt_UpdateInteraction(self);
    } else {
        GamePhaseTouchPrompt_UpdateHideSequence(self);
    }

    (*(PromptVirtualUpdate *)(*(u8 **)self->actor + 8))(self->actor);
    GraphicsSpriteGroup_AdvanceAnimations(self->spriteGroup);
    if (*(u32 *)(phaseActor + 0x230) & 0x800) {
        if (ActorDerivedType1_IsActiveRecordType69(phaseActor))
            animation = 3;
        else if (ActorDerivedType1_IsActiveRecordType6A(phaseActor))
            animation = 1;
        else
            return 0;
    } else {
        animation = 0;
    }
    if (SpritePresentation_GetAnimation(self->actor) != animation)
        SpritePresentation_SetAnimation(self->actor, animation);
    return 0;
}

/*
 * Replace enabled, enable or disable the underlying prompt actor through
 * the corresponding graphics helper, and return the previous enabled value.
 */
s32 GamePhaseTouchPrompt_SetEnabled(GamePhaseTouchPrompt *self, s32 enabled)
{
    s32 previous = self->enabled;
    self->enabled = enabled;
    if (enabled)
        SpritePresentation_Show(self->actor);
    else
        SpritePresentation_Hide(self->actor);
    return previous;
}

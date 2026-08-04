#include "tingle/game_phase_touch_prompt.h"
#include "tingle/scene.h"

/* Update prompt state, rendering, and animation from the active phase actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void func_0201054c(GamePhaseTouchPrompt *self);
extern void func_02010724(GamePhaseTouchPrompt *self);
extern void func_020107bc(GamePhaseTouchPrompt *self);
extern s32 func_02039408(void *actor);
extern s32 func_02039428(void *actor);
extern void func_020740a4(GraphicsSpriteGroup *group);
extern s32 func_020954d4(void *actor);
extern void func_020954c0(void *actor, s32 animation);
extern void func_020954e0(void *actor);
extern void func_020954f4(void *actor);
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
s32 func_020103d8(GamePhaseTouchPrompt *self)
{
    u8 *phaseActor;
    Scene *scene;
    s32 animation;

    if (!self->enabled_20)
        return 0;
    phaseActor = *(u8 **)((u8 *)data_021052fc + 0x2ea4);
    scene = SceneManager_GetCurrent(gSceneManager);
    if (scene->value04 == 1) {
        PromptVirtualQuery query =
            *(PromptVirtualQuery *)(*(u8 **)phaseActor + 0xa8);
        if (query(phaseActor))
            func_020107bc(self);
        else
            func_0201054c(self);
    } else {
        func_02010724(self);
    }

    (*(PromptVirtualUpdate *)(*(u8 **)self->actor_1c + 8))(self->actor_1c);
    func_020740a4(self->spriteGroup_18);
    if (*(u32 *)(phaseActor + 0x230) & 0x800) {
        if (func_02039408(phaseActor))
            animation = 3;
        else if (func_02039428(phaseActor))
            animation = 1;
        else
            return 0;
    } else {
        animation = 0;
    }
    if (func_020954d4(self->actor_1c) != animation)
        func_020954c0(self->actor_1c, animation);
    return 0;
}

/*
 * Replace enabled_20, enable or disable the underlying prompt actor through
 * the corresponding graphics helper, and return the previous enabled value.
 */
s32 func_02010520(GamePhaseTouchPrompt *self, s32 enabled)
{
    s32 previous = self->enabled_20;
    self->enabled_20 = enabled;
    if (enabled)
        func_020954e0(self->actor_1c);
    else
        func_020954f4(self->actor_1c);
    return previous;
}

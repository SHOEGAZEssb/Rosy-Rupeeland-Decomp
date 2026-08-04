#ifndef TINGLE_GAME_PHASE_TOUCH_PROMPT_H
#define TINGLE_GAME_PHASE_TOUCH_PROMPT_H

#include "tingle/graphics_sprite_group.h"
#include "tingle/types.h"

/* Resource-backed prompt owned by the active game-phase state. */
typedef struct GamePhaseTouchPrompt {
    const void *vtable;
    void *field_04;
    void *owner_08;
    GraphicsSpriteSource3 resources_0c;
    GraphicsSpriteGroup *spriteGroup_18;
    void *actor_1c;
    s32 enabled_20;
    s32 timer_24;
    s32 state_28;
    s32 savedState_2c;
} GamePhaseTouchPrompt;

#ifdef __cplusplus
extern "C" {
#endif
GamePhaseTouchPrompt *func_0201022c(GamePhaseTouchPrompt *self, void *owner);
GamePhaseTouchPrompt *func_02010338(GamePhaseTouchPrompt *self);
GamePhaseTouchPrompt *func_02010384(GamePhaseTouchPrompt *self);
s32 func_020103d8(GamePhaseTouchPrompt *self);
s32 func_02010520(GamePhaseTouchPrompt *self, s32 enabled);
void func_0201054c(GamePhaseTouchPrompt *self);
void func_02010724(GamePhaseTouchPrompt *self);
void func_020107bc(GamePhaseTouchPrompt *self);
#ifdef __cplusplus
}
#endif

#endif

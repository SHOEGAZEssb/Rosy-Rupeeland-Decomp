#ifndef TINGLE_GAME_PHASE_TOUCH_PROMPT_H
#define TINGLE_GAME_PHASE_TOUCH_PROMPT_H

#include "tingle/graphics_sprite_group.h"
#include "tingle/types.h"

/* Resource-backed prompt owned by the active game-phase state. */
typedef struct GamePhaseTouchPrompt {
    const void *vtable;
    void *field_04;
    void *owner;
    GraphicsSpriteSource3 resources;
    GraphicsSpriteGroup *spriteGroup;
    void *actor;
    s32 enabled;
    s32 timer;
    s32 state;
    s32 savedState;
} GamePhaseTouchPrompt;

#ifdef __cplusplus
extern "C" {
#endif
GamePhaseTouchPrompt *GamePhaseTouchPrompt_Init(GamePhaseTouchPrompt *self,
                                                void *owner);
GamePhaseTouchPrompt *GamePhaseTouchPrompt_Destroy(GamePhaseTouchPrompt *self);
GamePhaseTouchPrompt *GamePhaseTouchPrompt_DestroyAndFree(
    GamePhaseTouchPrompt *self);
s32 GamePhaseTouchPrompt_Update(GamePhaseTouchPrompt *self);
s32 GamePhaseTouchPrompt_SetEnabled(GamePhaseTouchPrompt *self, s32 enabled);
void GamePhaseTouchPrompt_UpdateInteraction(GamePhaseTouchPrompt *self);
void GamePhaseTouchPrompt_UpdateHideSequence(GamePhaseTouchPrompt *self);
void GamePhaseTouchPrompt_UpdateAlternateHideSequence(
    GamePhaseTouchPrompt *self);
#ifdef __cplusplus
}
#endif

#endif

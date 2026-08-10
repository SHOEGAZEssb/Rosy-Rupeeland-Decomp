#ifndef TINGLE_GAME_PHASE_CURRENCY_HUD_H
#define TINGLE_GAME_PHASE_CURRENCY_HUD_H

#include "tingle/animation_resource.h"
#include "tingle/graphics_sprite_create.h"

/* Two-screen sprite composition that displays the player's stored currency. */
typedef struct GamePhaseCurrencyHud {
    GraphicsSpriteGroup *groups[2];
    AnimationResource resources[4];
    GraphicsSpriteState *digits[2][7];
    GraphicsSpriteState *marker[2];
    GraphicsSpriteState *backdrop[2];
    GraphicsSpriteState *ornaments[2][4];
    u16 flags;
    u16 transitionState;
    u16 transitionTimer;
    u16 ornamentSpawnTimer;
    u16 nextOrnamentIndex;
    u16 soundCooldown;
    s16 baseX;
    s16 baseY;
    u32 transitionStartValue;
    u32 displayedValue;
    u32 transitionDuration;
    u16 thresholdReminderTimer;
    u16 thresholdReminderCount;
} GamePhaseCurrencyHud;

#ifdef __cplusplus
extern "C" {
#endif
GamePhaseCurrencyHud *GamePhaseCurrencyHud_Init(GamePhaseCurrencyHud *self);
u32 GamePhaseCurrencyHud_GetCurrency(void);
void GamePhaseCurrencyHud_SetCurrency(GamePhaseCurrencyHud *self, s32 value);
void GamePhaseCurrencyHud_AddCurrency(GamePhaseCurrencyHud *self, s32 delta,
                                      s32 forcedDuration);
void GamePhaseCurrencyHud_Update(GamePhaseCurrencyHud *self);
void GamePhaseCurrencyHud_UpdateDigits(GamePhaseCurrencyHud *self, u32 value);
void GamePhaseCurrencyHud_SetVisible(GamePhaseCurrencyHud *self, s32 visible);
#ifdef __cplusplus
}
#endif

#endif

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
    s16 transitionTimer;
    s16 ornamentSpawnTimer;
    s16 nextOrnamentIndex;
    s16 soundCooldown;
    s16 baseX;
    s16 baseY;
    s32 transitionStartValue;
    s32 displayedValue;
    s32 transitionDuration;
    s16 thresholdReminderTimer;
    s16 thresholdReminderCount;
} GamePhaseCurrencyHud;

typedef char GamePhaseCurrencyHudSizeCheck[
    sizeof(GamePhaseCurrencyHud) == 0xd0 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif
GamePhaseCurrencyHud *GamePhaseCurrencyHud_Init(GamePhaseCurrencyHud *self);
s32 GamePhaseCurrencyHud_GetCurrency(const GamePhaseCurrencyHud *self);
void GamePhaseCurrencyHud_SetCurrency(GamePhaseCurrencyHud *self, s32 value);
void GamePhaseCurrencyHud_AddCurrency(GamePhaseCurrencyHud *self, s32 delta,
                                      s32 forcedDuration);
void GamePhaseCurrencyHud_Update(GamePhaseCurrencyHud *self);
void GamePhaseCurrencyHud_UpdateDigits(GamePhaseCurrencyHud *self, s32 value);
void GamePhaseCurrencyHud_SetVisible(GamePhaseCurrencyHud *self, s32 visible);

extern GamePhaseCurrencyHud *gGamePhaseCurrencyHud;
extern const s32 gGamePhaseCurrencyHudReminderThresholds[14];
#ifdef __cplusplus
}
#endif

#endif

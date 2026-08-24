#include "tingle/game_phase_currency_hud.h"
#include "tingle/game_work.h"

/* Read and change the player's currency while preparing HUD count animations. */

#define CURRENCY_MAX 9999999

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern void *gSoundContext;
extern void Sound_Play(void *context, s32 bank, s32 soundId);
extern s32 SignedAbsoluteValueVariant(s32 value);
extern void GamePhaseCurrencyHud_UpdateDigits(GamePhaseCurrencyHud *self, s32 value);
#ifdef __cplusplus
}
#endif

/* Return the persistent currency value associated with this HUD. */
s32 GamePhaseCurrencyHud_GetCurrency(const GamePhaseCurrencyHud *self)
{
    (void)self;
    return gGameWork->currency;
}

/*
 * Unless active-actor flags at 0xd0 contain 0x100, clamp value to 9,999,999,
 * accumulate its signed difference in the corresponding increase/decrease
 * GameWork accumulator, store it as the persistent currency and in both HUD
 * value fields, clear the transition counter, and refresh all digits. Negative
 * input is not clamped by the recovered code.
 */
void GamePhaseCurrencyHud_SetCurrency(GamePhaseCurrencyHud *self, s32 value)
{
    u8 *actor = *(u8 **)((u8 *)gGamePhaseRuntime + 0x2ea4);
    s32 difference;
    if (*(u32 *)(actor + 0xd0) & 0x100)
        return;
    if (value > CURRENCY_MAX)
        value = CURRENCY_MAX;
    difference = value - gGameWork->currency;
    if (difference > 0)
        gGameWork->currencyIncreaseAccumulator += difference;
    else
        gGameWork->currencyDecreaseAccumulator += difference;
    gGameWork->currency = value;
    self->displayedValue = value;
    self->transitionStartValue = value;
    self->transitionTimer = 0;
    GamePhaseCurrencyHud_UpdateDigits(self, value);
}

/*
 * Apply delta to persistent currency with a 0..9,999,999 clamp, update the
 * signed increase/decrease accumulators, and prepare the HUD's gain/loss
 * animation. When hidden flag bit 0 is clear, marker/backdrop sprites
 * select direction-specific animations and sound 78/79 plays once. Magnitude
 * chooses flags 0x20, 0x40, or 0x80 unless forcedDuration supplies flag 0x100
 * and an explicit counter. Crossing the table threshold selected by GameWork
 * signed field 0x12e arms a 180-frame, type-3 notification and may play sound
 * 125. The active actor's 0xd0 flag 0x100 suppresses the operation.
 */
void GamePhaseCurrencyHud_AddCurrency(GamePhaseCurrencyHud *self, s32 delta,
                   s32 forcedDuration)
{
    u8 *actor;
    s32 oldValue;
    s32 newValue;
    s32 actualDelta;
    s32 display;
    s32 magnitudeClass;
    s32 thresholdIndex;
    s32 threshold;

    if (!delta)
        return;
    actor = *(u8 **)((u8 *)gGamePhaseRuntime + 0x2ea4);
    if (*(u32 *)(actor + 0xd0) & 0x100)
        return;
    oldValue = gGameWork->currency;
    newValue = oldValue + delta;
    if (newValue < 0)
        newValue = 0;
    else if (newValue > CURRENCY_MAX)
        newValue = CURRENCY_MAX;
    actualDelta = newValue - oldValue;
    if (actualDelta > 0)
        gGameWork->currencyIncreaseAccumulator += actualDelta;
    else
        gGameWork->currencyDecreaseAccumulator += actualDelta;

    thresholdIndex = *(s16 *)((u8 *)gGameWork + 0x12e);
    threshold = gGamePhaseCurrencyHudReminderThresholds[thresholdIndex];
    if (!(self->flags & 1) && newValue >= threshold) {
        self->thresholdReminderTimer = 180;
        self->thresholdReminderCount = 3;
        if (gGameWork->currency < threshold)
            Sound_Play(gSoundContext, 0, 125);
    }
    gGameWork->currency = newValue;
    self->transitionStartValue = self->displayedValue;
    if (newValue == self->displayedValue)
        return;
    if (self->flags & 1)
        return;

    self->transitionState = 1;
    self->transitionTimer = 20;
    if (newValue > self->transitionStartValue)
        self->flags |= 8;
    else if (newValue < self->transitionStartValue)
        self->flags |= 0x10;
    for (display = 0; display < 2; display++) {
        s32 increasing = newValue >= self->transitionStartValue;
        GraphicsSpriteState_SetAnimationIndex(self->marker[display], increasing ? 1 : 2);
        GraphicsSpriteState_SetAnimationIndex(self->backdrop[display], increasing ? 1 : 2);
        self->marker[display]->flags &= ~1;
    }
    if (self->soundCooldown == 0) {
        Sound_Play(gSoundContext, 0,
                   newValue < self->transitionStartValue ? 79 : 78);
        self->soundCooldown = 2;
    }
    magnitudeClass = SignedAbsoluteValueVariant(actualDelta);
    self->flags &= ~0x1e0;
    if (forcedDuration > 0) {
        self->flags |= 0x100;
        self->transitionDuration = forcedDuration;
        self->transitionTimer = (s16)forcedDuration;
    } else if (magnitudeClass < 20) {
        self->flags |= 0x20;
    } else if (magnitudeClass < 100) {
        self->flags |= 0x40;
    } else {
        self->flags |= 0x80;
    }
}

#include "tingle/game_phase_currency_hud.h"
#include "tingle/game_work.h"

/* Read and change the player's currency while preparing HUD count animations. */

#define CURRENCY_MAX 9999999

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern const s32 data_020c368c[];
extern void *gSoundContext;
extern void Sound_Play(void *context, s32 bank, s32 soundId);
extern s32 func_020be328(s32 value);
extern void func_020112f0(GamePhaseCurrencyHud *self, u32 value);
#ifdef __cplusplus
}
#endif

/* Return GameWork's value at offset 0x40, the amount displayed by this HUD. */
u32 func_02010b64(void)
{
    return gGameWork->unknown0040;
}

/*
 * Unless active-actor flags at 0xd0 contain 0x100, clamp value to 9,999,999,
 * accumulate its signed difference into GameWork offsets 0x44/0x48, store it
 * at offset 0x40 and both HUD value fields, clear the transition counter, and
 * refresh all digits. Negative input is not clamped by the recovered code.
 */
void func_02010b78(GamePhaseCurrencyHud *self, s32 value)
{
    u8 *actor = *(u8 **)((u8 *)data_021052fc + 0x2ea4);
    s32 difference;
    if (*(u32 *)(actor + 0xd0) & 0x100)
        return;
    if (value > CURRENCY_MAX)
        value = CURRENCY_MAX;
    difference = value - (s32)gGameWork->unknown0040;
    if (difference > 0)
        gGameWork->unknown0044 += difference;
    else
        gGameWork->unknown0048 += difference;
    gGameWork->unknown0040 = value;
    self->targetValue_c4 = value;
    self->displayedValue_c0 = value;
    self->field_b4 = 0;
    func_020112f0(self, value);
}

/*
 * Apply delta to GameWork offset 0x40 with a 0..9,999,999 clamp, update the
 * recovered positive/negative accumulators at 0x44/0x48, and prepare the HUD's
 * gain/loss animation. When enabled by field_b0 bit 0, marker/backdrop sprites
 * select direction-specific animations and sound 78/79 plays once. Magnitude
 * chooses flags 0x20, 0x40, or 0x80 unless forcedDuration supplies flag 0x100
 * and an explicit counter. Crossing the table threshold selected by GameWork
 * signed field 0x12e arms a 180-frame, type-3 notification and may play sound
 * 125. The active actor's 0xd0 flag 0x100 suppresses the operation.
 */
void func_02010c00(GamePhaseCurrencyHud *self, s32 delta,
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
    actor = *(u8 **)((u8 *)data_021052fc + 0x2ea4);
    if (*(u32 *)(actor + 0xd0) & 0x100)
        return;
    oldValue = (s32)gGameWork->unknown0040;
    newValue = oldValue + delta;
    if (newValue < 0)
        newValue = 0;
    else if (newValue > CURRENCY_MAX)
        newValue = CURRENCY_MAX;
    actualDelta = newValue - oldValue;
    if (actualDelta > 0)
        gGameWork->unknown0044 += actualDelta;
    else
        gGameWork->unknown0048 += actualDelta;

    thresholdIndex = *(s16 *)((u8 *)gGameWork + 0x12e);
    threshold = data_020c368c[thresholdIndex];
    if (!(self->field_b0 & 1) && newValue >= threshold) {
        self->field_cc = 180;
        self->field_ce = 3;
        if ((s32)gGameWork->unknown0040 < threshold)
            Sound_Play(gSoundContext, 0, 125);
    }
    gGameWork->unknown0040 = newValue;
    self->displayedValue_c0 = self->targetValue_c4;
    if (newValue == (s32)self->targetValue_c4)
        return;
    if (!(self->field_b0 & 1))
        return;

    self->field_b2 = 1;
    self->field_b4 = 20;
    if (newValue > (s32)self->displayedValue_c0)
        self->field_b0 |= 8;
    else if (newValue < (s32)self->displayedValue_c0)
        self->field_b0 |= 0x10;
    for (display = 0; display < 2; display++) {
        s32 increasing = newValue >= (s32)self->displayedValue_c0;
        func_02072b68(self->marker[display], increasing ? 1 : 2);
        func_02072b68(self->backdrop[display], increasing ? 1 : 2);
        self->marker[display]->flags &= ~1;
    }
    if ((s16)self->field_ba == 0) {
        Sound_Play(gSoundContext, 0,
                   newValue < (s32)self->displayedValue_c0 ? 79 : 78);
        self->field_ba = 2;
    }
    magnitudeClass = func_020be328(actualDelta);
    self->field_b0 &= ~0x1e0;
    if (forcedDuration > 0) {
        self->field_b0 |= 0x100;
        self->field_c8 = forcedDuration;
        self->field_b4 = (u16)forcedDuration;
    } else if (magnitudeClass < 20) {
        self->field_b0 |= 0x20;
    } else if (magnitudeClass < 100) {
        self->field_b0 |= 0x40;
    } else {
        self->field_b0 |= 0x80;
    }
}

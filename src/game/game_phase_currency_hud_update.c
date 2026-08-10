#include "tingle/game_phase_currency_hud.h"
#include "tingle/game_work.h"

/* Animate, position, and render the currency HUD once per frame. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern const s32 data_020c368c[];
extern void *gSoundContext;
extern void Sound_Play(void *context, s32 bank, s32 soundId);
extern u32 genrand_int32(void);
extern s32 func_02091a70(s32 target, s32 start, s32 duration,
                        s32 remaining);
extern void GamePhaseCurrencyHud_UpdateDigits(GamePhaseCurrencyHud *self, u32 value);
extern void GamePhaseCurrencyHud_SetVisible(GamePhaseCurrencyHud *self, s32 value);
#ifdef __cplusplus
}
#endif

static s32 randomBelow(s32 limit)
{
    return (s32)(genrand_int32() % (u32)limit);
}

/*
 * Synchronize or interpolate the displayed value toward persistent currency,
 * maintain threshold reminders, select the currently visible DS display from
 * POWCNT1 bit 15, update seven digits, animate gain/loss markers and four
 * randomized ornament sprites, optionally shake the active group, and submit
 * both sprite groups. Missing phase runtime/actor state hides the HUD through
 * GamePhaseCurrencyHud_SetVisible when flags bit 0 permits it. This routine
 * changes sprite-manager state, consumes the global RNG, may play sound 114, and reads the
 * display-swap hardware register at 0x04000304.
 */
void GamePhaseCurrencyHud_Update(GamePhaseCurrencyHud *self)
{
    u8 *actor = 0;
    u32 current;
    s32 threshold;
    s32 thresholdEvent = 0;
    s32 activeRow;
    GraphicsSpriteGroup *activeGroup;
    s32 i;

    if (data_021052fc)
        actor = *(u8 **)((u8 *)data_021052fc + 0x2ea4);
    if (!actor) {
        if (!(self->flags & 1))
            GamePhaseCurrencyHud_SetVisible(self, 0);
        return;
    }

    current = gGameWork->currency;
    if (self->flags & 1) {
        self->transitionStartValue = current;
        self->displayedValue = current;
        self->soundCooldown = 0;
        goto render;
    }

    if ((s16)self->soundCooldown > 0)
        self->soundCooldown--;
    threshold = data_020c368c[*(s16 *)((u8 *)gGameWork + 0x12e)];
    if ((s32)current < threshold) {
        if ((s16)self->thresholdReminderCount > 0) {
            if ((s16)self->thresholdReminderTimer == 0) {
                if (current && !GameWork_TestFlag(gGameWork, 0x3f5))
                    Sound_Play(gSoundContext, 0, 114);
                self->thresholdReminderTimer = 120;
                self->thresholdReminderCount--;
            } else {
                self->thresholdReminderTimer--;
            }
        }
        if (!(self->flags & 0x200))
            thresholdEvent = 1;
        self->flags |= 0x200;
    } else {
        self->flags &= ~0x200;
    }

    if ((*(volatile u16 *)0x04000304 & 0x8000) != 0) {
        func_02074110(self->groups[1]);
        activeGroup = self->groups[0];
        activeRow = 0;
    } else {
        func_02074110(self->groups[0]);
        activeGroup = self->groups[1];
        activeRow = 1;
    }
    activeGroup->field_20 = 1;

    if (self->transitionState == 1) {
        if ((s16)self->transitionTimer != 0) {
            self->transitionTimer--;
            if (self->flags & 0x100) {
                self->displayedValue = func_02091a70(
                    current, self->transitionStartValue,
                    self->transitionDuration, (s16)self->transitionTimer);
            } else if (self->flags & 0x20) {
                self->displayedValue = current;
            } else if (self->flags & 0x40) {
                s32 remaining = (s16)self->transitionTimer;
                if (remaining > 10)
                    remaining = 10;
                self->displayedValue = func_02091a70(
                    current, self->transitionStartValue, 10, remaining);
            } else {
                self->displayedValue = func_02091a70(
                    current, self->transitionStartValue, 20,
                    (s16)self->transitionTimer);
            }
        } else {
            self->flags &= ~0x1e0;
            self->transitionStartValue = current;
            self->transitionState = 2;
            self->transitionTimer = 30;
        }
    }
    if (self->transitionState == 2) {
        if ((s16)self->transitionTimer != 0)
            self->transitionTimer--;
        else
            self->transitionState = 0;
    }

    GamePhaseCurrencyHud_UpdateDigits(self, self->displayedValue);
    if ((s16)self->ornamentSpawnTimer == 0) {
        if (self->flags & 8) {
            s32 ornament = (s16)self->nextOrnamentIndex;
            GraphicsSpriteState *sprite =
                self->ornaments[activeRow][ornament];
            self->ornamentSpawnTimer = (u16)(randomBelow(4) + 2);
            sprite->flags &= ~5;
            func_02072b68(sprite, sprite->animationIndex);
            sprite->field_2c = (s16)-randomBelow(170);
            sprite->field_2e = (s16)-randomBelow(40);
            self->nextOrnamentIndex++;
            if ((s16)self->nextOrnamentIndex >= 4)
                self->nextOrnamentIndex = 0;
        }
    } else {
        self->ornamentSpawnTimer--;
    }
    for (i = 0; i < 4; i++) {
        GraphicsSpriteState *sprite = self->ornaments[activeRow][i];
        if (sprite->flags & 1)
            sprite->flags |= 4;
    }

    if (thresholdEvent || (self->marker[activeRow]->flags & 1)) {
        s32 markerAnimation;
        s32 backdropAnimation;
        if (thresholdEvent) {
            markerAnimation = 2;
            backdropAnimation = 0; /* Inferred from the surrounding selection states. */
        } else if (self->flags & 2) {
            markerAnimation = 0;
            backdropAnimation = 0;
        } else if (self->transitionState == 1) {
            if (self->displayedValue <= current) {
                markerAnimation = 1;
                backdropAnimation = 1;
            } else {
                markerAnimation = 2;
                backdropAnimation = 2;
            }
        } else {
            backdropAnimation = 0;
            markerAnimation = (s32)current >= threshold ? 0 : 3;
        }
        func_02072b68(self->marker[activeRow], markerAnimation);
        self->marker[activeRow]->flags &= ~1;
        func_02072b68(self->backdrop[activeRow], backdropAnimation);
    }

    if (!(self->flags & 0x10)) {
        activeGroup->field_18 = self->baseX;
        activeGroup->field_1c = self->baseY;
    } else {
        activeGroup->field_18 = self->baseX + (3 - randomBelow(8));
        activeGroup->field_1c = self->baseY - randomBelow(4);
    }

render:
    if (self->transitionState != 1)
        self->flags &= ~0x18;
    for (i = 0; i < 2; i++)
        func_020740a4(self->groups[i]);
}

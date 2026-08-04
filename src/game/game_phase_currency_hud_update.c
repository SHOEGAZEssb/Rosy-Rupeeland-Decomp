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
extern void func_020112f0(GamePhaseCurrencyHud *self, u32 value);
extern void func_0201140c(GamePhaseCurrencyHud *self, s32 value);
#ifdef __cplusplus
}
#endif

static s32 randomBelow(s32 limit)
{
    return (s32)(genrand_int32() % (u32)limit);
}

/*
 * Synchronize or interpolate the displayed value toward GameWork offset 0x40,
 * maintain threshold reminders, select the currently visible DS display from
 * POWCNT1 bit 15, update seven digits, animate gain/loss markers and four
 * randomized ornament sprites, optionally shake the active group, and submit
 * both sprite groups. Missing phase runtime/actor state hides the HUD through
 * func_0201140c when field_b0 bit 0 permits it. This routine changes sprite
 * manager state, consumes the global RNG, may play sound 114, and reads the
 * display-swap hardware register at 0x04000304.
 */
void func_02010e68(GamePhaseCurrencyHud *self)
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
        if (!(self->field_b0 & 1))
            func_0201140c(self, 0);
        return;
    }

    current = gGameWork->unknown0040;
    if (self->field_b0 & 1) {
        self->displayedValue_c0 = current;
        self->targetValue_c4 = current;
        self->field_ba = 0;
        goto render;
    }

    if ((s16)self->field_ba > 0)
        self->field_ba--;
    threshold = data_020c368c[*(s16 *)((u8 *)gGameWork + 0x12e)];
    if ((s32)current < threshold) {
        if ((s16)self->field_ce > 0) {
            if ((s16)self->field_cc == 0) {
                if (current && !GameWork_TestFlag(gGameWork, 0x3f5))
                    Sound_Play(gSoundContext, 0, 114);
                self->field_cc = 120;
                self->field_ce--;
            } else {
                self->field_cc--;
            }
        }
        if (!(self->field_b0 & 0x200))
            thresholdEvent = 1;
        self->field_b0 |= 0x200;
    } else {
        self->field_b0 &= ~0x200;
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

    if (self->field_b2 == 1) {
        if ((s16)self->field_b4 != 0) {
            self->field_b4--;
            if (self->field_b0 & 0x100) {
                self->targetValue_c4 = func_02091a70(
                    current, self->displayedValue_c0,
                    self->field_c8, (s16)self->field_b4);
            } else if (self->field_b0 & 0x20) {
                self->targetValue_c4 = current;
            } else if (self->field_b0 & 0x40) {
                s32 remaining = (s16)self->field_b4;
                if (remaining > 10)
                    remaining = 10;
                self->targetValue_c4 = func_02091a70(
                    current, self->displayedValue_c0, 10, remaining);
            } else {
                self->targetValue_c4 = func_02091a70(
                    current, self->displayedValue_c0, 20,
                    (s16)self->field_b4);
            }
        } else {
            self->field_b0 &= ~0x1e0;
            self->displayedValue_c0 = current;
            self->field_b2 = 2;
            self->field_b4 = 30;
        }
    }
    if (self->field_b2 == 2) {
        if ((s16)self->field_b4 != 0)
            self->field_b4--;
        else
            self->field_b2 = 0;
    }

    func_020112f0(self, self->targetValue_c4);
    if ((s16)self->field_b6 == 0) {
        if (self->field_b0 & 8) {
            s32 ornament = (s16)self->field_b8;
            GraphicsSpriteState *sprite =
                self->ornaments[activeRow][ornament];
            self->field_b6 = (u16)(randomBelow(4) + 2);
            sprite->flags &= ~5;
            func_02072b68(sprite, sprite->animationIndex);
            sprite->field_2c = (s16)-randomBelow(170);
            sprite->field_2e = (s16)-randomBelow(40);
            self->field_b8++;
            if ((s16)self->field_b8 >= 4)
                self->field_b8 = 0;
        }
    } else {
        self->field_b6--;
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
        } else if (self->field_b0 & 2) {
            markerAnimation = 0;
            backdropAnimation = 0;
        } else if (self->field_b2 == 1) {
            if (self->targetValue_c4 <= current) {
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

    if (!(self->field_b0 & 0x10)) {
        activeGroup->field_18 = self->width_bc;
        activeGroup->field_1c = self->height_be;
    } else {
        activeGroup->field_18 = self->width_bc + (3 - randomBelow(8));
        activeGroup->field_1c = self->height_be - randomBelow(4);
    }

render:
    if (self->field_b2 != 1)
        self->field_b0 &= ~0x18;
    for (i = 0; i < 2; i++)
        func_020740a4(self->groups[i]);
}

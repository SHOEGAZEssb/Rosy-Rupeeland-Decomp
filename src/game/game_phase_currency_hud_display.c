#include "tingle/game_phase_currency_hud.h"
#include "tingle/game_work.h"

/* Convert currency values to digit sprites and show or hide the HUD groups. */

#ifdef __cplusplus
extern "C" {
#endif
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

/*
 * Extract seven decimal digits from value, update both displays' corresponding
 * sprite animations, clear completion/hide flags 1 and 4, and randomize scaleZ
 * when a digit changes (usually 0xe0..0x2df, with a 1/16 chance of 0xc0).
 * Consumes the global RNG and changes sprite animation state; returns nothing.
 */
void func_020112f0(GamePhaseCurrencyHud *self, u32 value)
{
    s32 digit;
    s32 display;
    for (digit = 0; digit < 7; digit++) {
        u8 number = (u8)(value % 10);
        for (display = 0; display < 2; display++) {
            GraphicsSpriteState *sprite = self->digits[display][digit];
            if (!(sprite->flags & 1) || sprite->animationIndex != number) {
                u16 scale;
                func_02072b68(sprite, number);
                sprite->flags &= ~1;
                if (!(genrand_int32() & 0xf))
                    scale = 0xc0;
                else
                    scale = (u16)((genrand_int32() & 0x1ff) + 0xe0);
                sprite->scaleZ = (s16)scale;
            }
            sprite->flags &= ~4;
        }
        value /= 10;
    }
}

/*
 * Clear the value-transition state. A nonzero visible argument clears hidden
 * flag bit 0 and synchronizes the HUD to GameWork offset 0x40; zero sets the
 * bit, clears the threshold timer, and disables both sprite groups.
 */
void func_0201140c(GamePhaseCurrencyHud *self, s32 visible)
{
    s32 display;
    self->field_b2 = 0;
    if (visible) {
        self->field_b0 &= ~1;
        func_02010b78(self, gGameWork->unknown0040);
        return;
    }
    self->field_b0 |= 1;
    self->field_cc = 0;
    for (display = 0; display < 2; display++)
        func_02074110(self->groups[display]);
}

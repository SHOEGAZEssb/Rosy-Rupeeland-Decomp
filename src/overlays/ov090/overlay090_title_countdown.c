#include "tingle/types.h"

/* Countdown adjustment used by the overlay-90 boss-stage controller. */

typedef struct TitleCountdownState {
    u8 unknown_000[0x220];
    s16 countdown_220;
} TitleCountdownState;

/* Subtract `amount` from signed field +0x220 and clamp the result to zero. */
void func_ov090_0221a6b4(TitleCountdownState *self, s16 amount)
{
    self->countdown_220 -= amount;
    if (self->countdown_220 < 0)
        self->countdown_220 = 0;
}

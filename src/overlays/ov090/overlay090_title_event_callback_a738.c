#include "tingle/types.h"

/* Secondary event-code callback for the overlay-90 boss-stage controller. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*TitleVirtualMethodC4)(void *self, s32 value);

/*
 * Accept events only in state 0x0b while +0x247 is clear. Event code 120,
 * reached through +0x1f8, invokes virtual method +0xc4 with 150. Return one
 * for every accepted event, including accepted events with other codes.
 */
s32 func_ov090_0221a738(void *self, void *event)
{
    if (FIELD(u8, self, 0x1ec) != 0x0b)
        return 0;
    if (FIELD(u8, self, 0x247) != 0)
        return 0;

    if (**(s16 **)((u8 *)event + 0x1f8) == 0x78) {
        TitleVirtualMethodC4 method =
            (TitleVirtualMethodC4)(*(void ***)self)[0xc4 / 4];
        method(self, 150);
    }
    return 1;
}

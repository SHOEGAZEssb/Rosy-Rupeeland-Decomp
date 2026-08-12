#include "tingle/types.h"

/* Smooth facing update for the paired-sprite overlay-90 boss-stage effect. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern s32 func_020ae024(s32 y, s32 x);
extern void func_ov090_0221c728(void *resource, s32 angle);

/*
 * Turn the primary/secondary sprite pair toward `targetX,targetY`, limiting
 * each signed angular step to 0x400. An unchanged position has no effects.
 */
void func_ov090_0221c68c(void *self, s32 targetX, s32 targetY)
{
    s32 deltaX = FIELD(s32, FIELD(void *, self, 4), 0x18) - targetX;
    s32 deltaY = FIELD(s32, FIELD(void *, self, 4), 0x1c) - targetY;
    s32 desired;
    s32 difference;
    s16 current;

    if (deltaX == 0 && deltaY == 0)
        return;
    desired = (func_020ae024(-deltaY, deltaX) + 0xc000) % 0x10000;
    current = FIELD(s16, FIELD(void *, FIELD(void *, self, 4), 4), 0x30);
    if (desired < current)
        desired += 0x10000;
    difference = desired - current;
    if (difference < 0x8000) {
        if (difference > 0x400)
            difference = 0x400;
    } else {
        difference = 0x10000 - difference;
        if (difference > 0x400)
            difference = 0x400;
        difference *= -1;
    }
    func_ov090_0221c728(FIELD(void *, self, 4),
                        (s16)(u16)(current + difference));
}

#include "tingle/types.h"

/* Height-derived paired-sprite scaling for phase-90 title participants. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * Derive a signed 16-bit scale from the participant/target height delta,
 * clamp it to 0x20..0x200, and apply it to both owned sprite states.
 */
void func_ov090_0221bc0c(void *self, s32 targetHeight)
{
    s16 scale = (s16)((((FIELD(s32, self, 0x14) - targetHeight) >> 12) * 4) +
                      0x100);
    void *resource;
    void *sprite;

    if (scale < 0x20)
        scale = 0x20;
    else if (scale > 0x200)
        scale = 0x200;
    resource = FIELD(void *, self, 4);
    sprite = FIELD(void *, resource, 4);
    FIELD(s16, sprite, 0x32) = scale;
    FIELD(s16, sprite, 0x34) = scale;
    sprite = FIELD(void *, resource, 8);
    FIELD(s16, sprite, 0x32) = scale;
    FIELD(s16, sprite, 0x34) = scale;
}

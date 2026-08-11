#include "tingle/types.h"

/* Paired-sprite angle and update forwarding for the phase-90 title effect. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void func_ov090_0221c780(void *self, s32 x, s32 y, s32 targetX,
                                s32 targetY, s32 animation, u8 palette,
                                s32 frame);

/* Store the same angle halfword at sprite offset +0x30 in both resources. */
void func_ov090_0221c728(void *self, u16 angle)
{
    FIELD(u16, FIELD(void *, self, 4), 0x30) = angle;
    FIELD(u16, FIELD(void *, self, 8), 0x30) = angle;
}

/*
 * Update one effect from another effect's position and primary sprite state,
 * forwarding the caller's target coordinates and animation selector.
 */
void func_ov090_0221c73c(void *self, const void *source, s32 targetX,
                         s32 targetY, s32 animation)
{
    const void *primary = FIELD(const void *, source, 4);

    func_ov090_0221c780(self, FIELD(s32, source, 0x18),
                        FIELD(s32, source, 0x1c), targetX, targetY, animation,
                        FIELD(u8, primary, 0x3a), FIELD(s16, primary, 0x28));
}

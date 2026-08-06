#include "tingle/types.h"

/*
 * Implement the small motion-delta value embedded by the following sprite
 * controller.  It retains two endpoints, a transformed difference, a signed
 * scale/divisor field, and an active flag.
 */

typedef struct SpriteMotionDelta {
    s32 first00;
    s32 second04;
    s32 delta08;
    s16 scale0c;
    u16 active0e;
} SpriteMotionDelta;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 value, s32 scale);
#ifdef __cplusplus
}
#endif

/* Clear scale0c and active0e; the three word fields remain unchanged. */
void func_02020364(SpriteMotionDelta *self)
{
    self->scale0c = 0;
    self->active0e = 0;
}

/*
 * Store both endpoints and scale, transform first minus second through
 * func_020befec using the signed scale, set active0e to one, and return self.
 */
SpriteMotionDelta *func_02020374(SpriteMotionDelta *self, s32 first,
                                 s32 second, s32 scale)
{
    self->first00 = first;
    self->second04 = second;
    self->scale0c = (s16)scale;
    self->delta08 = func_020befec(first - second, self->scale0c);
    self->active0e = 1;
    return self;
}

/* Copy all recovered fields unless source and destination are identical. */
void func_020203b0(SpriteMotionDelta *self, const SpriteMotionDelta *source)
{
    if (self != source) {
        self->first00 = source->first00;
        self->second04 = source->second04;
        self->delta08 = source->delta08;
        self->scale0c = source->scale0c;
        self->active0e = source->active0e;
    }
}

#include "tingle/types.h"

/* Overlay 32 sprite-wrapper touch hit testing with feedback-sound selection. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0209286c(...);
extern s32 GraphicsSpriteState_TestTouchPoint(...);
extern void Sound_Play(...);
#ifdef __cplusplus
}
#endif

/*
 * Hit-tests `wrapper` against `point` and bounds/mode values `arg2`/`arg3`.
 * A null +0x0C field disables the wrapper. Nonnegative `arg2` selects SDK test
 * 0x0209286C; negative selects 0x02092910. On a hit, +0x2C selects sound 3
 * when negative or sound 11 otherwise. Returns the SDK test result.
 */
extern "C" s32 Overlay032SpriteWrapper_HitTest(void *wrapper, void *point, s32 arg2, s32 arg3)
{
    s32 hit = 0;
    if (FIELD(void *, wrapper, 0xc) != 0) {
        void *object = FIELD(void *, wrapper, 0);
        hit = arg2 >= 0 ? func_0209286c(object, point, arg2, arg3)
                        : GraphicsSpriteState_TestTouchPoint(object, point, arg2, arg3);
    }
    if (hit) Sound_Play(gSoundContext, 0, FIELD(s32, wrapper, 0x2c) < 0 ? 3 : 0xb);
    return hit;
}

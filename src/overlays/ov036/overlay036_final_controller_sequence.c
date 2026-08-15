#include "tingle/types.h"

/* Overlay 36 final six-state presentation sequence. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_022055d0[];
extern const u8 data_ov036_022050e4[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02059278(void *sound, s32 id, s32 value);
extern void func_0205929c(void *sound, s32 id, s32 value);
extern void Sound_Play(void *sound, s32 id, s32 mode);
extern void Presentation_SetScript(void *object, const void *data, s32 mode);
extern s32 Presentation_IsScriptSuspended(void *object);
extern s32 Presentation_IsScriptComplete(void *object);
extern void func_ov036_02201d60(void *object, s32 value);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern s32 func_ov036_021fd28c(void *object);
extern s32 Presentation_InterpolateScalar(void *object, s32 mode, s32 first, s32 second);
extern void func_020956fc(void *object);
extern void func_ov036_0220429c(void *controller);
#ifdef __cplusplus
}
#endif

/*
 * Advances the final six-state presentation at +0xA0. State 0 starts sound
 * 0xB3, applies data_ov036_022055d0 to +0xF0 and data_ov036_022050e4 to
 * +0xF8, then falls through. State 1 waits for +0xF8, plays sound 0x1B3 mode
 * one, clears +0xF8/+0x90, sets +0xF4's three recovered components to 0x1F,
 * and ramps its +0x6C from zero to 0x3000 over 15 frames. State 2 waits for
 * +0xF4; while incomplete it clears +0x98 bit zero. On completion it plays
 * 0x1B3 mode zero, clears +0xF0/+0x90, and starts a 30-frame interval.
 * State 3 sets +0xF4 flag bit zero and advances on completion; while active it
 * derives the three components from interpolation (1,0x1F,1), restarts child
 * +0xD8, and writes interpolation (1,1,0x1F) to resource byte +0x5B reached
 * through +0xD8/+0x9C. State 4 waits for +0xF0 completion, lowers sound 0xB3
 * to 0x10, and advances. State 5 reports completion. Every call services the
 * final-controller update. Returns one only in state 5; sound, animation,
 * interpolation, resource, flags, timing, and state may change.
 */
extern "C" s32 func_ov036_022042e0(void *controller)
{
    switch (FIELD(s32, controller, 0xa0)) {
    case 0:
        func_02059278(gSoundContext, 0xb3, 0x7f);
        Presentation_SetScript(FIELD(void *, controller, 0xf0),
                      data_ov036_022055d0, 1);
        Presentation_SetScript(FIELD(void *, controller, 0xf8),
                      data_ov036_022050e4, 1);
        ++FIELD(s32, controller, 0xa0);
        /* The recovered jump table intentionally continues into state 1. */
    case 1:
        if (Presentation_IsScriptSuspended(FIELD(void *, controller, 0xf8)) != 0) {
            Sound_Play(gSoundContext, 0x1b3, 1);
            FIELD(s32, FIELD(void *, controller, 0xf8), 0x90) = 0;
            void *object = FIELD(void *, controller, 0xf4);
            func_ov036_02201d60(object, 0x1f);
            PresentationScalar_SetImmediate((u8 *)object + 0x6c, 0);
            PresentationScalar_TransitionTo((u8 *)object + 0x6c, 1, 0x3000);
            FIELD(s32, object, 0x7c) = 0xf;
            FIELD(s32, object, 0x80) = 0;
            ++FIELD(s32, controller, 0xa0);
        }
        break;
    case 2: {
        void *object = FIELD(void *, controller, 0xf4);
        if (func_ov036_021fd28c(object) == 0) {
            FIELD(u16, object, 0x98) &= (u16)~1;
        } else {
            Sound_Play(gSoundContext, 0x1b3, 0);
            FIELD(s32, FIELD(void *, controller, 0xf0), 0x90) = 0;
            FIELD(s32, object, 0x7c) = 0x1e;
            FIELD(s32, object, 0x80) = 0;
            ++FIELD(s32, controller, 0xa0);
        }
        break;
    }
    case 3: {
        void *object = FIELD(void *, controller, 0xf4);
        if (func_ov036_021fd28c(object) != 0) {
            FIELD(u16, object, 0x98) |= 1;
            ++FIELD(s32, controller, 0xa0);
        } else {
            s32 value = Presentation_InterpolateScalar(object, 1, 0x1f, 1);
            func_ov036_02201d60(object, value);
            void *child = FIELD(void *, controller, 0xd8);
            func_020956fc(child);
            value = Presentation_InterpolateScalar(object, 1, 1, 0x1f);
            FIELD(u8, FIELD(void *, child, 0x9c), 0x5b) = (u8)value;
        }
        break;
    }
    case 4:
        if (Presentation_IsScriptComplete(FIELD(void *, controller, 0xf0)) != 0) {
            func_0205929c(gSoundContext, 0xb3, 0x10);
            ++FIELD(s32, controller, 0xa0);
        }
        break;
    case 5:
        func_ov036_0220429c(controller);
        return 1;
    }
    func_ov036_0220429c(controller);
    return 0;
}

#include "tingle/types.h"

/* Overlay 36 timed motion-primitive construction and three-stage update. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02206108[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Presentation_Init(void *object);
extern void func_ov036_021fd4b0(void *object, s16 duration);
extern s32 Presentation_AdvanceTransitions(void *object);
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
#ifdef __cplusplus
}
#endif

/* Applies the binary's signed truncating multiply by fixed coefficient 0xE66. */
static s32 decay_component(s32 value)
{
    s32 product = value * 0xe66;
    return (product + ((u32)(product >> 11) >> 20)) >> 12;
}

/*
 * Constructs a timed motion primitive. Explicit inputs type, secondDuration,
 * and colorA are stored as halfwords +0x9A/+0x9E/+0xB4. Stack inputs colorB,
 * firstDuration, and acceleration become +0xB6, signed +0xA0, and +0xB0.
 * State +0x9C, velocity +0xA4/+0xA8/+0xAC are cleared; hidden flag bit 0 and
 * active flag +0x88 are set. Returns object; common render and object state
 * change with no direct hardware access.
 */
extern "C" void *func_ov036_021fd2a4(void *object, s16 type,
                                      s16 secondDuration, u16 colorA,
                                      u16 colorB, s16 firstDuration,
                                      s32 acceleration)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov036_02206108;
    FIELD(s16, object, 0x9a) = type;
    FIELD(s16, object, 0x9c) = 0;
    FIELD(s16, object, 0x9e) = secondDuration;
    FIELD(s16, object, 0xa0) = firstDuration;
    FIELD(s32, object, 0xa4) = 0;
    FIELD(s32, object, 0xa8) = 0;
    FIELD(s32, object, 0xac) = 0;
    FIELD(s32, object, 0xb0) = acceleration;
    FIELD(u16, object, 0xb4) = colorA;
    FIELD(u16, object, 0xb6) = colorB;
    FIELD(u16, object, 0x98) |= 1;
    FIELD(s32, object, 0x88) = 1;
    return object;
}

/*
 * Advances the primitive's four-state sequence at signed halfword +0x9C.
 * State 0 starts firstDuration +0xA0 and falls through. State 1 waits for the
 * common timer, unhides the object, selects scale behavior from type +0x9A,
 * and starts secondDuration +0x9E. State 2 waits for completion while adding
 * Q15 velocity +0xA4/+0xA8/+0xAC to position, damping each component by 0xE66
 * in Q12, and adding acceleration +0xB0 to Y velocity. State 3 is terminal.
 * Returns 1 only in state 3, otherwise 0; transform, tween, timing, and velocity
 * state may change. Fixed-point operations are confirmed; semantic axis roles
 * follow the common transform layout.
 */
extern "C" s32 func_ov036_021fd31c(void *object)
{
    switch (FIELD(s16, object, 0x9c)) {
    case 0:
        func_ov036_021fd4b0(object, FIELD(s16, object, 0xa0));
        ++FIELD(s16, object, 0x9c);
        /* Fall through to poll the opening interval immediately. */
    case 1:
        if (Presentation_AdvanceTransitions(object) != 0) {
            FIELD(u16, object, 0x98) &= (u16)~1;
            s32 type = FIELD(s16, object, 0x9a);
            s32 scale = FIELD(s32, object, 0x70);
            if (type == 0) {
                PresentationScalar_TransitionTo((u8 *)object + 0x6c, 4, 0);
            } else if (type == 1 || type == 2) {
                PresentationScalar_SetImmediate((u8 *)object + 0x6c, 0);
                PresentationScalar_TransitionTo((u8 *)object + 0x6c, 3, scale);
            }
            func_ov036_021fd4b0(object, FIELD(s16, object, 0x9e));
            ++FIELD(s16, object, 0x9c);
        }
        break;
    case 2:
        if (Presentation_AdvanceTransitions(object) != 0) {
            ++FIELD(s16, object, 0x9c);
        } else {
            s32 vx = FIELD(s32, object, 0xa4);
            s32 vy = FIELD(s32, object, 0xa8);
            s32 vz = FIELD(s32, object, 0xac);
            Presentation_SetPosition(object,
                          FIELD(s32, object, 0x10) +
                              ((vx + ((u32)(vx >> 7) >> 24)) >> 8),
                          FIELD(s32, object, 0x20) +
                              ((vy + ((u32)(vy >> 7) >> 24)) >> 8),
                          FIELD(s32, object, 0x30) +
                              ((vz + ((u32)(vz >> 7) >> 24)) >> 8));
            FIELD(s32, object, 0xa4) = decay_component(vx);
            FIELD(s32, object, 0xa8) = decay_component(vy) +
                                      FIELD(s32, object, 0xb0);
            FIELD(s32, object, 0xac) = decay_component(vz);
        }
        break;
    case 3:
        return 1;
    }
    return 0;
}

/*
 * Starts an interval by sign-extending duration into +0x7C and clearing elapsed
 * counter +0x80. It has no return value or hardware effect.
 */
extern "C" void func_ov036_021fd4b0(void *object, s16 duration)
{
    FIELD(s32, object, 0x7c) = duration;
    FIELD(s32, object, 0x80) = 0;
}

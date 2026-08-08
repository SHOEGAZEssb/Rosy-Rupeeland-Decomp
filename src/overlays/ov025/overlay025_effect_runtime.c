#include "tingle/types.h"

/* Overlay 25 effect-controller timers, return transitions, and frame state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02072cd0(void *);
extern s32 func_0209189c(u32 *, s32, s32);
extern s32 func_020918f4(u32 *, s32);
extern void func_020740a4(void *);
extern void func_020948e4(void *, s32, s32);
extern void func_02094dd4(void *);
extern s32 func_02095224(void *);
extern void func_ov025_021fe174(void *, s32, s32, s32);
extern void func_ov025_021fe248(void *);
extern void func_ov025_021fe2c4(void *);
extern void func_ov025_021fe340(void *);
extern void func_ov025_021fe39c(void *);
extern void func_ov025_021fe3f8(void *);
extern void func_ov025_021fe444(void *);
extern void func_ov025_021fe4cc(void *, s32, s32);
extern void func_ov025_021fe91c(void *);
extern s32 func_ov025_021ff0b0(void *);
#ifdef __cplusplus
}
#endif

/*
 * Sets duration +0x7C from the signed low halfword of `duration` and clears
 * elapsed counter +0x80. No animation is started and there is no return value.
 */
extern "C" void func_ov025_021fe904(void *object, s32 duration)
{
    FIELD(s32, object, 0x7c) = (s16)duration;
    FIELD(s32, object, 0x80) = 0;
}

static void configure_side_return(void *object, s32 animation, s32 tween_type)
{
    if (FIELD(s32, object, 0xa4)) {
        func_ov025_021fe174(object, 1, animation, 2);
        func_020948e4((u8 *)object + 0xc, tween_type, -0x20000);
    } else {
        func_ov025_021fe174(object, 1, animation, 0x42);
        func_020948e4((u8 *)object + 0xc, tween_type, 0x120000);
    }
}

/*
 * Chooses a new random side +0xA4, hides the secondary sprites, and configures
 * the current mode's return phase. Modes 3/7/11 restore variant animation and
 * a 60/120-tick wait; modes 4/6 restore secondary-pair pose plus child offset
 * and 120 ticks; mode 1 uses animation/tween type 1 with 90 ticks. Other modes
 * only receive the new side and hidden sprites. RNG/graphics state changes.
 */
extern "C" void func_ov025_021fe91c(void *object)
{
    FIELD(s32, object, 0xa4) = func_020918f4((u32 *)object + 0x3e, 2);
    FIELD(u16, FIELD(void *, object, 0xec), 0x24) |= 4;
    FIELD(u16, FIELD(void *, object, 0xf4), 0x24) |= 4;
    s32 mode = FIELD(s32, object, 0x9c);
    if (mode == 3 || mode == 7 || mode == 11) {
        configure_side_return(object, FIELD(s32, object, 0xac), 2);
        s32 variant = FIELD(s32, object, 0xac);
        FIELD(s32, object, 0x7c) = (variant == 0 || variant == 3) ? 120 : 60;
        FIELD(s32, object, 0x80) = 0;
    } else if (mode == 4 || mode == 6) {
        if (FIELD(s32, object, 0xa4)) func_ov025_021fe248(object);
        else func_ov025_021fe2c4(object);
        func_020948e4((u8 *)object + 0xc, 2,
                      FIELD(s32, object, 0xa4) ? -0x20000 : 0x120000);
        func_020948e4((u8 *)object + 0x1c, 2, 0x40000);
        FIELD(s32, object, 0x7c) = 120;
        FIELD(s32, object, 0x80) = 0;
    } else if (mode == 1) {
        configure_side_return(object, 1, 1);
        func_020948e4((u8 *)object + 0x1c, 3, 0x40000);
        FIELD(s32, object, 0x7c) = 90;
        FIELD(s32, object, 0x80) = 0;
    }
}

/*
 * Switches the primary pair to resource 1 and `animation`, queries that
 * animation's duration, multiplies it by a random value in 5..9, and installs
 * the result as the next wait duration. Sprite/RNG/timer state change.
 */
extern "C" void func_ov025_021feb08(void *object, s32 animation)
{
    func_ov025_021fe174(object, 1, animation, 2);
    s32 frames = func_02072cd0(FIELD(void *, object, 0xe8));
    s32 repetitions = func_0209189c((u32 *)object + 0x3e, 5, 10);
    func_ov025_021fe904(object, frames * repetitions);
}

/* Returns one once elapsed counter +0x80 reaches duration +0x7C, else zero. */
extern "C" s32 func_ov025_021ff0b0(void *object)
{
    return FIELD(s32, object, 0x80) >= FIELD(s32, object, 0x7c);
}

static bool primary_animation_done(void *object)
{
    return (FIELD(u16, FIELD(void *, object, 0xe8), 0x24) & 1) != 0;
}

static void advance_phase(void *object)
{
    ++FIELD(s32, object, 0xa0);
}

static void finish_cycle(void *object)
{
    FIELD(s32, object, 0xa4) = 1 - FIELD(s32, object, 0xa4);
    func_ov025_021fe3f8(object);
}

/*
 * Per-frame effect state machine. It is inert until owner +0xE0 reports ready,
 * then advances the base animation and dispatches modes 0..11. Multi-phase
 * modes wait on duration +0x7C/+0x80 or primary-animation completion, schedule
 * recovered follow-up animations/tweens, toggle sides, and eventually choose a
 * new random mode. Both sprite owners are committed every active frame. It
 * always returns zero; animation, RNG, position, and sprite state may change.
 */
extern "C" s32 func_ov025_021feb4c(void *object)
{
    if (FIELD(s32, FIELD(void *, object, 0xe0), 0x20) == 0) return 0;
    func_02094dd4(object);
    s32 mode = FIELD(s32, object, 0x9c);
    s32 phase = FIELD(s32, object, 0xa0);

    if (mode == 0) {
        if (func_02095224(object)) func_ov025_021fe3f8(object);
    } else if (mode == 2 || mode == 5) {
        if (func_ov025_021ff0b0(object)) finish_cycle(object);
    } else if (mode == 3 || mode == 6) {
        if (func_ov025_021ff0b0(object)) {
            if (phase == 0) { func_ov025_021fe444(object); advance_phase(object); }
            else if (phase == 1) { func_ov025_021fe91c(object); advance_phase(object); }
            else if (phase == 2) finish_cycle(object);
        }
    } else if (mode == 4) {
        if (func_ov025_021ff0b0(object)) {
            if (phase == 0) {
                func_ov025_021fe340(object);
                func_020948e4((u8 *)object + 0x1c, 2, 0x60000);
                FIELD(s32, object, 0x7c) = 60;
                FIELD(s32, object, 0x80) = 0;
                advance_phase(object);
            } else if (phase == 1) {
                func_ov025_021fe91c(object);
                advance_phase(object);
            } else if (phase == 2) finish_cycle(object);
        }
    } else if (mode == 7) {
        if (phase == 0 && func_ov025_021ff0b0(object)) {
            func_ov025_021fe39c(object);
            func_020948e4((u8 *)object + 0x1c, 5, 0xa0000);
            FIELD(s32, object, 0x7c) = 30;
            FIELD(s32, object, 0x80) = 0;
            advance_phase(object);
        } else if (phase == 1 && func_ov025_021ff0b0(object)) {
            func_ov025_021fe174(object, 2, 20, 0);
            advance_phase(object);
        } else if (phase == 2 && primary_animation_done(object)) {
            func_ov025_021fe91c(object);
            advance_phase(object);
        } else if (phase == 3 && func_ov025_021ff0b0(object)) {
            finish_cycle(object);
        }
    } else if (mode == 8) {
        if (phase == 0 && func_ov025_021ff0b0(object)) {
            func_ov025_021fe340(object);
            func_020948e4((u8 *)object + 0x1c, 2, -0x120000);
            FIELD(s32, object, 0x7c) = 90;
            FIELD(s32, object, 0x80) = 0;
            advance_phase(object);
        } else if (phase == 1 && func_ov025_021ff0b0(object)) {
            FIELD(s32, object, 0xa4) = func_020918f4((u32 *)object + 0x3e, 2);
            func_ov025_021fe4cc(object, 10, 0);
        }
    } else if (mode == 10) {
        if (func_ov025_021ff0b0(object)) func_ov025_021fe4cc(object, 11, 0);
    } else if (mode == 11) {
        if (phase == 0 && func_ov025_021ff0b0(object)) {
            func_ov025_021fe174(object, 2, 20, 0);
            advance_phase(object);
        } else if (phase == 1 && primary_animation_done(object)) {
            func_ov025_021fe91c(object);
            advance_phase(object);
        } else if (phase == 2 && func_ov025_021ff0b0(object)) {
            finish_cycle(object);
        }
    } else if (mode == 1) {
        if (func_ov025_021ff0b0(object)) {
            if (phase == 0) { func_ov025_021fe91c(object); advance_phase(object); }
            else if (phase == 1) finish_cycle(object);
        }
    }

    func_020740a4(FIELD(void *, object, 0xe0));
    func_020740a4(FIELD(void *, object, 0xe4));
    return 0;
}

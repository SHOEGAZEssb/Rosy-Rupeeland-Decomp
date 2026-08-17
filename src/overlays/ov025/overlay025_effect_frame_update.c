#include "tingle/types.h"

/* Overlay 25 per-frame paired-effect mode and phase state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern s32 TitleRandom_NextBounded(u32 *, s32);
extern void PresentationScalar_TransitionTo(void *, s32, s32);
extern void Presentation_UpdateScript(void *);
extern s32 Presentation_IsScriptComplete(void *);
extern void func_ov025_021fe174(void *, s32, s32, s32);
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
 * When owner +0xE0 is ready, advance the base animation and execute the retail
 * mode 0..11 state machine. Duration and primary-animation gates advance
 * phases, schedule poses/tweens, toggle sides, and choose subsequent modes.
 * Commit both sprite owners every active frame. Always return zero; animation,
 * RNG, position, timer, and sprite state may change.
 */
extern "C" s32 func_ov025_021feb4c(void *object)
{
    if (FIELD(s32, FIELD(void *, object, 0xe0), 0x20) == 0) {
        return 0;
    }

    Presentation_UpdateScript(object);

    switch (FIELD(s32, object, 0x9c)) {
    case 0:
        if (Presentation_IsScriptComplete(object) != 0) {
            func_ov025_021fe3f8(object);
        }
        break;

    case 2:
    case 5:
        if (func_ov025_021ff0b0(object) != 0) {
            FIELD(s32, object, 0xa4) = 1 - FIELD(s32, object, 0xa4);
            func_ov025_021fe3f8(object);
        }
        break;

    case 3:
        switch (FIELD(s32, object, 0xa0)) {
        case 0:
            if (func_ov025_021ff0b0(object) != 0) {
                func_ov025_021fe444(object);
                ++FIELD(s32, object, 0xa0);
            }
            break;
        case 1:
            if (func_ov025_021ff0b0(object) != 0) {
                func_ov025_021fe91c(object);
                ++FIELD(s32, object, 0xa0);
            }
            break;
        case 2:
            if (func_ov025_021ff0b0(object) != 0) {
                FIELD(s32, object, 0xa4) = 1 - FIELD(s32, object, 0xa4);
                func_ov025_021fe3f8(object);
            }
            break;
        }
        break;

    case 4:
        switch (FIELD(s32, object, 0xa0)) {
        case 0:
            if (func_ov025_021ff0b0(object) != 0) {
                func_ov025_021fe340(object);
                PresentationScalar_TransitionTo((u8 *)object + 0x1c, 2, 0x60000);
                FIELD(s32, object, 0x7c) = 60;
                FIELD(s32, object, 0x80) = 0;
                ++FIELD(s32, object, 0xa0);
            }
            break;
        case 1:
            if (func_ov025_021ff0b0(object) != 0) {
                func_ov025_021fe91c(object);
                ++FIELD(s32, object, 0xa0);
            }
            break;
        case 2:
            if (func_ov025_021ff0b0(object) != 0) {
                FIELD(s32, object, 0xa4) = 1 - FIELD(s32, object, 0xa4);
                func_ov025_021fe3f8(object);
            }
            break;
        }
        break;

    case 6:
        switch (FIELD(s32, object, 0xa0)) {
        case 0:
            if (func_ov025_021ff0b0(object) != 0) {
                func_ov025_021fe444(object);
                ++FIELD(s32, object, 0xa0);
            }
            break;
        case 1:
            if (func_ov025_021ff0b0(object) != 0) {
                func_ov025_021fe91c(object);
                ++FIELD(s32, object, 0xa0);
            }
            break;
        case 2:
            if (func_ov025_021ff0b0(object) != 0) {
                FIELD(s32, object, 0xa4) = 1 - FIELD(s32, object, 0xa4);
                func_ov025_021fe3f8(object);
            }
            break;
        }
        break;

    case 7:
        switch (FIELD(s32, object, 0xa0)) {
        case 0:
            if (func_ov025_021ff0b0(object) != 0) {
                func_ov025_021fe39c(object);
                PresentationScalar_TransitionTo((u8 *)object + 0x1c, 5, 0xa0000);
                FIELD(s32, object, 0x7c) = 30;
                FIELD(s32, object, 0x80) = 0;
                ++FIELD(s32, object, 0xa0);
            }
            break;
        case 1:
            if (func_ov025_021ff0b0(object) != 0) {
                func_ov025_021fe174(object, 2, 20, 0);
                ++FIELD(s32, object, 0xa0);
            }
            break;
        case 2: {
            u16 finished = FIELD(u16, FIELD(void *, object, 0xe8), 0x24) & 1;
            if (finished != 0) {
                func_ov025_021fe91c(object);
                ++FIELD(s32, object, 0xa0);
            }
            break;
        }
        case 3:
            if (func_ov025_021ff0b0(object) != 0) {
                FIELD(s32, object, 0xa4) = 1 - FIELD(s32, object, 0xa4);
                func_ov025_021fe3f8(object);
            }
            break;
        }
        break;

    case 8:
        switch (FIELD(s32, object, 0xa0)) {
        case 0:
            if (func_ov025_021ff0b0(object) != 0) {
                func_ov025_021fe340(object);
                PresentationScalar_TransitionTo((u8 *)object + 0x1c, 2, -0x120000);
                FIELD(s32, object, 0x7c) = 90;
                FIELD(s32, object, 0x80) = 0;
                ++FIELD(s32, object, 0xa0);
            }
            break;
        case 1:
            if (func_ov025_021ff0b0(object) != 0) {
                FIELD(s32, object, 0xa4) =
                    TitleRandom_NextBounded((u32 *)object + 0x3e, 2);
                func_ov025_021fe4cc(object, 10, 0);
            }
            break;
        }
        break;

    case 10:
        if (func_ov025_021ff0b0(object) != 0) {
            func_ov025_021fe4cc(object, 11, 0);
        }
        break;

    case 11:
        switch (FIELD(s32, object, 0xa0)) {
        case 0:
            if (func_ov025_021ff0b0(object) != 0) {
                func_ov025_021fe174(object, 2, 20, 0);
                ++FIELD(s32, object, 0xa0);
            }
            break;
        case 1: {
            u16 finished = FIELD(u16, FIELD(void *, object, 0xe8), 0x24) & 1;
            if (finished != 0) {
                func_ov025_021fe91c(object);
                ++FIELD(s32, object, 0xa0);
            }
            break;
        }
        case 2:
            if (func_ov025_021ff0b0(object) != 0) {
                FIELD(s32, object, 0xa4) = 1 - FIELD(s32, object, 0xa4);
                func_ov025_021fe3f8(object);
            }
            break;
        }
        break;

    case 1:
        switch (FIELD(s32, object, 0xa0)) {
        case 0:
            if (func_ov025_021ff0b0(object) != 0) {
                func_ov025_021fe91c(object);
                ++FIELD(s32, object, 0xa0);
            }
            break;
        case 1:
            if (func_ov025_021ff0b0(object) != 0) {
                FIELD(s32, object, 0xa4) = 1 - FIELD(s32, object, 0xa4);
                func_ov025_021fe3f8(object);
            }
            break;
        }
        break;

    case 9:
    default:
        break;
    }

    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, object, 0xe0));
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, object, 0xe4));
    return 0;
}

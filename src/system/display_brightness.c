#include "tingle/display_brightness.h"

/*
 * Per-screen master-brightness transition state. The subsystem keeps signed
 * six-bit brightness endpoints in a packed control word, advances a 20.12
 * fixed-point current value, clamps it to the DS hardware range, and writes
 * the appropriate main or sub display master-brightness register.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern fx32 func_020befec(fx32 numerator, fx32 denominator);
extern void GXx_SetMasterBrightness_(volatile u32 *registerAddress,
                                     s32 brightness);

#ifdef __cplusplus
}
#endif

#define FX32_SHIFT 12
#define REG_MASTER_BRIGHT_MAIN ((volatile u32 *)0x0400006c)
#define REG_MASTER_BRIGHT_SUB  ((volatile u32 *)0x0400106c)

/*
 * Initialize one brightness state for screen 0 or 1. This sets the packed
 * bounds to -16 and 0, clears the current value and direction, and returns
 * nothing; no hardware register is touched until func_02002b3c runs.
 */
void func_020028f0(DisplayBrightness *state, u32 screen)
{
    state->screen = screen;
    state->lowerBrightness = -16;
    state->upperBrightness = 0;
    state->currentFx = 0;
    state->direction = 0;
    state->mode = 1;
}

/*
 * Copy all confirmed brightness configuration and transition fields from
 * source to destination. The packed bitfields are assigned individually,
 * preserving destination bits 27..31 whose purpose remains unknown.
 */
#ifndef MATCHING
void func_02002930(DisplayBrightness *destination,
                   const DisplayBrightness *source)
{
    destination->screen = source->screen;
    destination->mode = source->mode;
    destination->direction = source->direction;
    destination->lowerBrightness = source->lowerBrightness;
    destination->upperBrightness = source->upperBrightness;
    destination->startBrightness = source->startBrightness;
    destination->targetBrightness = source->targetBrightness;
    destination->transitionDivisor = source->transitionDivisor;
    destination->targetFx = source->targetFx;
    destination->currentFx = source->currentFx;
}
#else
/* Matching form of the documented field-by-field copy above. */
asm void func_02002930(DisplayBrightness *destination,
                       const DisplayBrightness *source)
{
    ldr r2, [r1, #0]
    ldr r3, [r0, #0]
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    bic r3, r3, #1
    and r2, r2, #1
    orr r3, r3, r2
    str r3, [r0, #0]
    ldr r2, [r1, #0]
    bic r3, r3, #6
    mov r2, r2, lsl #0x1d
    mov r2, r2, asr #0x1e
    mov r2, r2, lsl #0x1e
    orr r2, r3, r2, lsr #0x1d
    str r2, [r0, #0]
    ldr r2, [r1, #0x10]
    str r2, [r0, #0x10]
    ldr r2, [r1, #0]
    ldr r3, [r0, #0]
    mov r2, r2, lsl #0x17
    mov r2, r2, asr #0x1a
    bic r3, r3, #0x1f8
    mov r2, r2, lsl #0x1a
    orr r3, r3, r2, lsr #0x17
    str r3, [r0, #0]
    ldr r2, [r1, #0]
    bic r3, r3, #0x7e00
    mov r2, r2, lsl #0x11
    mov r2, r2, asr #0x1a
    mov r2, r2, lsl #0x1a
    orr r3, r3, r2, lsr #0x11
    str r3, [r0, #0]
    ldr r2, [r1, #0]
    bic r3, r3, #0x1f8000
    mov r2, r2, lsl #0xb
    mov r2, r2, asr #0x1a
    mov r2, r2, lsl #0x1a
    orr r3, r3, r2, lsr #0xb
    str r3, [r0, #0]
    ldr r2, [r1, #0]
    bic r3, r3, #0x7e00000
    mov r2, r2, lsl #5
    mov r2, r2, asr #0x1a
    mov r2, r2, lsl #0x1a
    orr r2, r3, r2, lsr #5
    str r2, [r0, #0]
    ldr r2, [r1, #4]
    str r2, [r0, #4]
    ldr r2, [r1, #8]
    str r2, [r0, #8]
    ldr r1, [r1, #0xc]
    str r1, [r0, #0xc]
    bx lr
}
#endif

/*
 * Start a transition toward the configured upper bound (direction 1) or
 * lower bound (direction 2), using transitionDivisor in the interpolation
 * helper. Other direction values only update the two scalar fields. There is
 * no return value and no immediate hardware write.
 */
void func_02002a04(DisplayBrightness *state, s32 direction,
                   fx32 transitionDivisor)
{
    state->direction = direction;
    state->transitionDivisor = transitionDivisor;

    if (state->direction == 1) {
        state->currentFx = state->lowerBrightness << FX32_SHIFT;
        state->startBrightness = state->lowerBrightness;
        state->targetBrightness = state->upperBrightness;
        state->mode = 1;
        return;
    }

    if (state->direction == 2) {
        state->currentFx = state->upperBrightness << FX32_SHIFT;
        state->startBrightness = state->upperBrightness;
        state->targetBrightness = state->lowerBrightness;
        state->mode = -1;
    }
}

/*
 * Configure a transition directly from startBrightness to targetBrightness.
 * Values are stored both as signed six-bit endpoints and as 20.12 fixed-point
 * scalars. Equal endpoints leave the existing direction/mode unchanged, as
 * observed in retail; otherwise the transition direction is selected.
 */
void func_02002ac0(DisplayBrightness *state, s32 startBrightness,
                   s32 targetBrightness, fx32 transitionDivisor)
{
    state->transitionDivisor = transitionDivisor;
    state->currentFx = startBrightness << FX32_SHIFT;
    state->targetFx = targetBrightness << FX32_SHIFT;
    state->startBrightness = startBrightness;
    state->targetBrightness = targetBrightness;

    if (startBrightness < targetBrightness) {
        state->direction = 1;
        state->mode = 1;
    } else if (startBrightness > targetBrightness) {
        state->direction = 2;
        state->mode = -1;
    }
}

/*
 * Advance an active transition by one step and write the resulting signed
 * brightness to the main or sub master-brightness register. Completion clears
 * direction and mode. The visible output is clamped to the hardware-supported
 * -16..16 range; the function has no return value.
 */
void func_02002b3c(DisplayBrightness *state)
{
    s32 target;

    if (state->direction == 1) {
        target = state->targetBrightness;
        if ((state->currentFx >> FX32_SHIFT) < target) {
            state->currentFx += func_020befec(
                (target - state->startBrightness) << FX32_SHIFT,
                state->transitionDivisor);
        } else {
            state->currentFx = target << FX32_SHIFT;
            state->mode = 0;
            state->direction = 0;
        }

        if ((state->currentFx >> FX32_SHIFT) > 16)
            state->currentFx = 16 << FX32_SHIFT;
        else if ((state->currentFx >> FX32_SHIFT) < -16)
            state->currentFx = -16 << FX32_SHIFT;

        if (state->screen == 0) {
            GXx_SetMasterBrightness_(REG_MASTER_BRIGHT_MAIN,
                                     state->currentFx >> FX32_SHIFT);
        } else {
            GXx_SetMasterBrightness_(REG_MASTER_BRIGHT_SUB,
                                     state->currentFx >> FX32_SHIFT);
        }
        return;
    } else if (state->direction == 2) {
        target = state->targetBrightness;
        if ((state->currentFx >> FX32_SHIFT) > target) {
            state->currentFx += func_020befec(
                (target - state->startBrightness) << FX32_SHIFT,
                state->transitionDivisor);
        } else {
            state->currentFx = target << FX32_SHIFT;
            state->mode = 0;
            state->direction = 0;
        }

        if ((state->currentFx >> FX32_SHIFT) > 16)
            state->currentFx = 16 << FX32_SHIFT;
        else if ((state->currentFx >> FX32_SHIFT) < -16)
            state->currentFx = -16 << FX32_SHIFT;

        if (state->screen == 0) {
            GXx_SetMasterBrightness_(REG_MASTER_BRIGHT_MAIN,
                                     state->currentFx >> FX32_SHIFT);
        } else {
            GXx_SetMasterBrightness_(REG_MASTER_BRIGHT_SUB,
                                     state->currentFx >> FX32_SHIFT);
        }
        return;
    }
}

/* Return the current signed brightness after converting from 20.12 fixed point. */
s32 func_02002cd0(const DisplayBrightness *state)
{
    return state->currentFx >> FX32_SHIFT;
}

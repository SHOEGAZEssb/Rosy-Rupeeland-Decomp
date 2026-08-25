#include "tingle/graphics_sprite_renderer.h"

/*
 * Integer-to-UTF-16 formatting helper used by sprite text. Rather than derive
 * a width, callers supply the highest decimal place (for example 1000); its
 * sign selects whether suppressed leading positions occupy output cells.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern s32 func_020befec(s32 dividend, s32 divisor);

#ifdef __cplusplus
}
#endif

/*
 * Format value modulo ten times abs(placeValue), walking decimal places down
 * to one and then append a zero terminator. A nonnegative placeValue emits all
 * positions: leading zero digits become spaces when zeroPad is zero, otherwise
 * they remain '0'. A negative placeValue omits leading positions entirely
 * until the first nonzero digit or the ones place. Returns no value and writes
 * destination only; capacity is the caller's responsibility. Retail negates
 * a negative placeValue directly and divides by it, so zero and INT_MIN are
 * outside the valid contract.
 */
#ifndef MATCHING
void GraphicsSpriteText_FormatDecimal(u16 *destination, s32 value,
                                      s32 placeValue, s32 zeroPad)
{
    s32 divisor = placeValue;
    s32 emit;
    s32 significant = zeroPad;

    if (divisor < 0) {
        divisor = -divisor;
    }
    emit = placeValue >= 0;
    value %= divisor * 10;
    while (divisor != 0) {
        s32 digit = value / divisor;

        if (digit > 0 || divisor == 1) {
            emit = 1;
            significant = 1;
        }
        if (emit) {
            if (significant == 0 && digit == 0) {
                *destination = ' ';
            } else {
                *destination = (u16)(digit + '0');
            }
            destination++;
        }
        value %= divisor;
        divisor /= 10;
    }
    *destination = 0;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsSpriteText_FormatDecimal(u16 *destination, s32 value,
                                          s32 placeValue, s32 zeroPad)
{
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    movs r8, r2
    mov r10, r0
    rsbmi r8, r8, #0
    mov r0, #0x0a
    mov r9, r1
    mul r1, r8, r0
    mov r6, #0
    mov r0, r9
    mov r7, r3
    movpl r6, #1
    bl func_020befec
    mov r9, r1
    mov r11, #1
    mov r5, #0x20
    mov r4, #0x0a
    b sprite_number_test
sprite_number_loop:
    mov r0, r9
    mov r1, r8
    bl func_020befec
    cmp r0, #0
    bgt sprite_number_significant
    cmp r8, #1
    bne sprite_number_emit_test
sprite_number_significant:
    mov r6, r11
    mov r7, r11
sprite_number_emit_test:
    cmp r6, #0
    beq sprite_number_remainder
    cmp r7, #0
    cmpeq r0, #0
    streqh r5, [r10]
    addne r0, r0, #0x30
    strneh r0, [r10]
    add r10, r10, #2
sprite_number_remainder:
    mov r0, r9
    mov r1, r8
    bl func_020befec
    mov r9, r1
    mov r0, r8
    mov r1, r4
    bl func_020befec
    mov r8, r0
sprite_number_test:
    cmp r8, #0
    DCD 0x1AFFFFE4
    mov r0, #0
    strh r0, [r10]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
}
#endif

/*
 * Format one integer into a stack-owned UTF-16 buffer and draw it at the
 * requested position. `placeValue` selects the highest decimal place,
 * `zeroPad` controls leading zeroes, and the remaining arguments are forwarded
 * as text color/mode and glyph advance. Returns the rendered width; only the
 * caller's renderer tile buffer changes.
 */
#ifndef MATCHING
s32 GraphicsSpriteRenderer_DrawDecimal(GraphicsSpriteRenderer *renderer, s32 value,
                  s32 placeValue, s32 destinationX, s32 destinationY,
                  u32 mode, s32 glyphAdvance, s32 zeroPad)
{
    u16 text[32];

    GraphicsSpriteText_FormatDecimal(text, value, placeValue, zeroPad);
    return GraphicsSpriteRenderer_DrawText(renderer, text, destinationX,
                                           destinationY, mode, glyphAdvance,
                                           0);
}
#endif

#include "tingle/graphics_sprite_renderer.h"

/*
 * UTF-16 sprite-font drawing and measurement helpers. Both routines support
 * fixed-width output when the requested advance is negative and otherwise use
 * each mapped glyph's byte-5 metric plus caller-supplied spacing.
 */

enum {
    GRAPHICS_SPRITE_TEXT_CONTROL_FIRST = 0xee00,
    GRAPHICS_SPRITE_TEXT_CONTROL_LAST = 0xefff
};

/*
 * Render the zero-terminated UTF-16 text at (destinationX, destinationY) and
 * return its accumulated horizontal advance. A negative glyphAdvance selects
 * fixed-width output using its absolute value. Otherwise a rendered glyph's
 * positive metric is used; a zero result falls back to glyphAdvance. The
 * renderer's tile buffer changes through func_020760c0. Return zero without
 * touching it when the renderer has no active font data.
 */
#ifndef MATCHING
s32 func_02076148(GraphicsSpriteRenderer *renderer, const u16 *text,
                  s32 destinationX, s32 destinationY, u32 mode,
                  s32 glyphAdvance, s32 spacing)
{
    s32 advance = 0;
    s32 proportional = 1;
    s32 fallbackAdvance;

    if (renderer->field_0c == 0 || renderer->field_18 == 0) {
        return 0;
    }

    if (glyphAdvance < 0) {
        glyphAdvance = -glyphAdvance;
        proportional = 0;
    }
    fallbackAdvance = glyphAdvance + spacing;

    while (*text != 0) {
        s32 glyphWidth = func_020760c0(renderer, *text,
                                      destinationX + advance,
                                      destinationY, mode);
        text++;

        if (!proportional) {
            advance += glyphAdvance;
        } else if (glyphWidth == 0) {
            advance += fallbackAdvance;
        } else if (glyphWidth > 0) {
            advance += glyphWidth + spacing;
        }
    }

    return advance;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm s32 func_02076148(GraphicsSpriteRenderer *renderer, const u16 *text,
                     s32 destinationX, s32 destinationY, u32 mode,
                     s32 glyphAdvance, s32 spacing)
{
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x0c
    mov r10, r0
    ldr r0, [r10, #0x0c]
    mov r9, r1
    cmp r0, #0
    ldrne r0, [r10, #0x18]
    str r2, [sp, #4]
    cmpne r0, #0
    str r3, [sp, #8]
    ldr r8, [sp, #0x30]
    ldr r7, [sp, #0x34]
    ldr r6, [sp, #0x38]
    mov r4, #0
    moveq r0, #0
    beq sprite_text_draw_return
    cmp r7, #0
    mov r11, #1
    rsblt r7, r7, #0
    movlt r11, r4
    add r5, r7, r6
    b sprite_text_draw_test
sprite_text_draw_loop:
    ldr r2, [sp, #4]
    ldr r3, [sp, #8]
    mov r0, r10
    add r2, r2, r4
    str r8, [sp]
    bl func_020760c0
    cmp r11, #0
    add r9, r9, #2
    beq sprite_text_draw_fixed
    cmp r0, #0
    addeq r4, r4, r5
    beq sprite_text_draw_test
    addgt r0, r0, r6
    addgt r4, r4, r0
    b sprite_text_draw_test
sprite_text_draw_fixed:
    add r4, r4, r7
sprite_text_draw_test:
    ldrh r1, [r9]
    cmp r1, #0
    bne sprite_text_draw_loop
    mov r0, r4
sprite_text_draw_return:
    add sp, sp, #0x0c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
}
#endif

/*
 * Measure a zero-terminated UTF-16 text stream and return its horizontal
 * advance without drawing. Values 0xee00 through 0xefff are treated as inline
 * controls and contribute no width. Of the confirmed 0xee00..0xee12 commands,
 * five terminate measurement and eleven consume a following u16 parameter;
 * unrecognized controls are skipped without a parameter. Ordinary characters
 * use the same fixed/proportional advance policy as func_02076148. Return zero
 * when the renderer has no active font data.
 */
#ifndef MATCHING
s32 func_020761f8(GraphicsSpriteRenderer *renderer, const u16 *text,
                  s32 glyphAdvance, s32 spacing)
{
    s32 advance = 0;
    s32 proportional = 1;
    s32 fallbackAdvance;

    if (renderer->field_0c == 0 || renderer->field_18 == 0) {
        return 0;
    }

    if (glyphAdvance < 0) {
        glyphAdvance = -glyphAdvance;
        proportional = 0;
    }
    fallbackAdvance = glyphAdvance + spacing;

    while (*text != 0) {
        u16 characterCode = *text++;

        if (characterCode >= GRAPHICS_SPRITE_TEXT_CONTROL_FIRST &&
            characterCode <= GRAPHICS_SPRITE_TEXT_CONTROL_LAST) {
            switch (characterCode) {
            case 0xee00:
            case 0xee01:
            case 0xee02:
            case 0xee03:
            case 0xee0b:
                return advance;
            case 0xee05:
            case 0xee06:
            case 0xee07:
            case 0xee08:
            case 0xee09:
            case 0xee0a:
            case 0xee0c:
            case 0xee0d:
            case 0xee0e:
            case 0xee0f:
            case 0xee12:
                text++;
                break;
            default:
                break;
            }
            continue;
        }

        {
            s32 glyphWidth = func_02076114(renderer, characterCode);

            if (!proportional) {
                advance += glyphAdvance;
            } else if (glyphWidth == 0) {
                advance += fallbackAdvance;
            } else if (glyphWidth > 0) {
                advance += glyphWidth + spacing;
            }
        }
    }

    return advance;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm s32 func_020761f8(GraphicsSpriteRenderer *renderer, const u16 *text,
                     s32 glyphAdvance, s32 spacing)
{
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r9, r0
    ldr r0, [r9, #0x0c]
    mov r8, r1
    cmp r0, #0
    ldrne r0, [r9, #0x18]
    mov r7, r2
    cmpne r0, #0
    mov r6, r3
    mov r4, #0
    moveq r0, #0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    cmp r7, #0
    mov r10, #1
    rsblt r7, r7, #0
    movlt r10, r4
    add r5, r7, r6
    ldr r11, =0xefff
    b sprite_text_measure_test
sprite_text_measure_loop:
    ldrh r1, [r8], #2
    cmp r1, #0xee00
    bcc sprite_text_measure_character
    cmp r1, r11
    bhi sprite_text_measure_character
    sub r0, r1, #0xee00
    cmp r0, #0x12
    addls pc, pc, r0, lsl #2
    b sprite_text_measure_test
    b sprite_text_measure_stop
    b sprite_text_measure_stop
    b sprite_text_measure_stop
    b sprite_text_measure_stop
    b sprite_text_measure_test
    b sprite_text_measure_parameter
    b sprite_text_measure_parameter
    b sprite_text_measure_parameter
    b sprite_text_measure_parameter
    b sprite_text_measure_parameter
    b sprite_text_measure_parameter
    b sprite_text_measure_stop
    b sprite_text_measure_parameter
    b sprite_text_measure_parameter
    b sprite_text_measure_parameter
    b sprite_text_measure_parameter
    b sprite_text_measure_test
    b sprite_text_measure_test
    b sprite_text_measure_parameter
sprite_text_measure_stop:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
sprite_text_measure_parameter:
    add r8, r8, #2
    b sprite_text_measure_test
sprite_text_measure_character:
    mov r0, r9
    bl func_02076114
    cmp r10, #0
    beq sprite_text_measure_fixed
    cmp r0, #0
    addeq r4, r4, r5
    beq sprite_text_measure_test
    addgt r0, r0, r6
    addgt r4, r4, r0
    b sprite_text_measure_test
sprite_text_measure_fixed:
    add r4, r4, r7
sprite_text_measure_test:
    ldrh r0, [r8]
    cmp r0, #0
    bne sprite_text_measure_loop
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
}
#endif

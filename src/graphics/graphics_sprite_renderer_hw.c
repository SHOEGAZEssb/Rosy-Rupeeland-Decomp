#include "tingle/graphics_sprite_renderer.h"

/*
 * Nintendo DS display-engine configuration selected by sprite-renderer mode
 * fields. Main and sub engines use distinct SDK entry points and DISPCNT
 * registers, so this is an explicit platform boundary for a native port.
 */

enum {
    REG_MAIN_DISPCNT = 0x04000000,
    REG_SUB_DISPCNT = 0x04001000,
    DISPCNT_SPRITE_MASK = 0xffcfffef,
    DISPCNT_SPRITE_BITS = 0x00200010
};

#ifdef __cplusplus
extern "C" {
#endif

extern void func_020af30c(u32 mode);
extern void func_020af140(u32 mode);
extern void func_020aeb08(u32 mode);
extern void func_020ae9f0(u32 mode);

#ifdef __cplusplus
}
#endif

/*
 * Configure sprite graphics for renderer->engine. Engine zero accepts
 * field_28 values 0/1 and field_2c values 0/1/2; engine one requires field_28
 * value 2 and accepts field_2c values 0/3. Invalid combinations return after
 * any earlier accepted stage. For a valid engine/mapping stage, preserve all
 * DISPCNT bits except mask 0x00300010, then set bits 0x00200010 before applying
 * the final object mode. Returns no value and performs direct ordered SDK and
 * volatile graphics-register writes.
 */
#ifndef MATCHING
void GraphicsSpriteRenderer_ConfigureObjectDisplay(GraphicsSpriteRenderer *renderer)
{
    volatile u32 *displayControl;
    u32 value;

    if (renderer->engine == 0) {
        if (renderer->field_28 == 0) {
            func_020af30c(1);
        } else if (renderer->field_28 == 1) {
            func_020af30c(2);
        } else {
            return;
        }
        displayControl = (volatile u32 *)REG_MAIN_DISPCNT;
        value = *displayControl;
        value &= DISPCNT_SPRITE_MASK;
        value |= DISPCNT_SPRITE_BITS;
        *displayControl = value;
        if (renderer->field_2c == 0) {
            func_020af140(0);
        } else if (renderer->field_2c == 1) {
            func_020af140(0x20);
        } else if (renderer->field_2c == 2) {
            func_020af140(0x40);
        }
        return;
    }
    if (renderer->engine != 1 || renderer->field_28 != 2) {
        return;
    }
    func_020aeb08(8);
    displayControl = (volatile u32 *)REG_SUB_DISPCNT;
    value = *displayControl;
    value &= DISPCNT_SPRITE_MASK;
    value |= DISPCNT_SPRITE_BITS;
    *displayControl = value;
    if (renderer->field_2c == 0) {
        func_020ae9f0(0);
    } else if (renderer->field_2c == 3) {
        func_020ae9f0(0x100);
    }
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsSpriteRenderer_ConfigureObjectDisplay(GraphicsSpriteRenderer *renderer)
{
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x24]
    cmp r0, #0
    beq renderer_hw_main
    cmp r0, #1
    beq renderer_hw_sub
    ldmia sp!, {r4, pc}
renderer_hw_main:
    ldr r0, [r4, #0x28]
    cmp r0, #0
    beq renderer_hw_main_mode0
    cmp r0, #1
    beq renderer_hw_main_mode1
    ldmia sp!, {r4, pc}
renderer_hw_main_mode0:
    mov r0, #1
    bl func_020af30c
    b renderer_hw_main_register
renderer_hw_main_mode1:
    mov r0, #2
    bl func_020af30c
renderer_hw_main_register:
    mov r2, #0x04000000
    ldr r1, [r2]
    ldr r0, =0xffcfffef
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2]
    ldr r0, [r4, #0x2c]
    cmp r0, #0
    beq renderer_hw_main_final0
    cmp r0, #1
    beq renderer_hw_main_final1
    cmp r0, #2
    beq renderer_hw_main_final2
    ldmia sp!, {r4, pc}
renderer_hw_main_final0:
    mov r0, #0
    bl func_020af140
    ldmia sp!, {r4, pc}
renderer_hw_main_final1:
    mov r0, #0x20
    bl func_020af140
    ldmia sp!, {r4, pc}
renderer_hw_main_final2:
    mov r0, #0x40
    bl func_020af140
    ldmia sp!, {r4, pc}
renderer_hw_sub:
    ldr r0, [r4, #0x28]
    cmp r0, #2
    ldmneia sp!, {r4, pc}
    mov r0, #8
    bl func_020aeb08
    ldr r2, =0x04001000
    ldr r0, =0xffcfffef
    ldr r1, [r2]
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2]
    ldr r0, [r4, #0x2c]
    cmp r0, #0
    beq renderer_hw_sub_final0
    cmp r0, #3
    beq renderer_hw_sub_final3
    ldmia sp!, {r4, pc}
renderer_hw_sub_final0:
    mov r0, #0
    bl func_020ae9f0
    ldmia sp!, {r4, pc}
renderer_hw_sub_final3:
    mov r0, #0x100
    bl func_020ae9f0
    ldmia sp!, {r4, pc}
}
#endif

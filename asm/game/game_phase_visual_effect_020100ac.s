; Matching retail form; see src/game/game_phase_visual_effect_controls.c.
.text
.extern func_020af958
.global func_020100ac
func_020100ac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, L_02010100
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x208
    orr r0, r0, #0x1800
    strh r0, [r1, #0x0]
    bl func_020af958
    str r0, [r4, #0x18]
    ldr r0, [r4, #0x94]
    orr r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r4, #0x94]
    ldmia sp!, {r4, pc}
L_02010100: .word 0x400000a
    .size func_020100ac, . - func_020100ac


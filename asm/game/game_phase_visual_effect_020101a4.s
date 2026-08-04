; Matching retail form; see src/game/game_phase_visual_effect_controls.c.
.text
.extern func_020100ac
.extern func_02010154
.global func_020101a4
func_020101a4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr ip, [r5, #0x94]
    ldr r4, [sp, #0x18]
    bic ip, ip, #0xf0
    mov r4, r4, lsl #0x1c
    orr r4, ip, r4, lsr #0x18
    str r4, [r5, #0x94]
    ldr r4, [sp, #0x1c]
    bl func_02010154
    mov r0, r5
    bl func_020100ac
    ldr r0, [r5, #0x94]
    ldr r1, [sp, #0x10]
    orr r0, r0, #0x8
    str r0, [r5, #0x94]
    ldr r0, [sp, #0x14]
    strh r1, [r5, #0x1c]
    strh r0, [r5, #0x1e]
    ldr r0, [r4, #0x0]
    str r0, [r5, #0x98]
    ldrsh r0, [r4, #0x4]
    strh r0, [r5, #0x9c]
    ldrsh r0, [r4, #0x6]
    strh r0, [r5, #0x9e]
    ldrsh r0, [r4, #0x8]
    strh r0, [r5, #0xa0]
    ldrsh r0, [r4, #0xa]
    strh r0, [r5, #0xa2]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_020101a4, . - func_020101a4


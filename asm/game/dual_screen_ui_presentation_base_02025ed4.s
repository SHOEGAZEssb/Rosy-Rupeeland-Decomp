; Matching retail form; see src/game/dual_screen_ui_presentation_base.c.
.text
.extern func_02072b68
.extern func_02073ffc

    .global func_02025ed4
    .type func_02025ed4, @function
func_02025ed4: ; 0x02025ed4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xa8]
    add r1, r4, #0xb8
    mov r2, #0x2
    bl func_02073ffc
    str r0, [r4, #0xb4]
    mov r1, #0x68
    strh r1, [r0, #0x2c]
    mov r1, #0x6b
    strh r1, [r0, #0x2e]
    ldr r0, [r4, #0xb4]
    mov r1, #0x1
    bl func_02072b68
    ldr r1, [r4, #0xb4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
    .size func_02025ed4, . - func_02025ed4

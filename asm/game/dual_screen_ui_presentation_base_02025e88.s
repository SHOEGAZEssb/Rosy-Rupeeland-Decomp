; Matching retail form; see src/game/dual_screen_ui_presentation_base.c.
.text
.extern func_02073ffc

    .global func_02025e88
    .type func_02025e88, @function
func_02025e88: ; 0x02025e88
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xa8]
    add r1, r4, #0xb8
    mov r2, #0x2
    bl func_02073ffc
    str r0, [r4, #0xb0]
    mov r1, #0x68
    strh r1, [r0, #0x2c]
    mov r1, #0xb2
    strh r1, [r0, #0x2e]
    ldr r0, [r4, #0xb0]
    mov r1, #0x3e8
    strh r1, [r0, #0x28]
    ldr r1, [r4, #0xb0]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
    .size func_02025e88, . - func_02025e88

; Matching retail form; see src/game/dual_screen_ui_standard_presentation.c.
.text
.extern DualScreenUiPresentationBase_ApplyVisibilityMask
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern gDebugFont

    .global func_02026044
    .type func_02026044, @function
func_02026044: ; 0x02026044
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r4, r2
    bl DualScreenUiPresentationBase_ApplyVisibilityMask
    cmp r5, #0x0
    beq .L_020260c4
    mov r0, #0x1
    str r0, [r6, #0xd0]
    tst r4, #0x8
    beq .L_02026094
    ldr r2, .L_02026134
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
.L_02026094:
    tst r4, #0x10
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r2, .L_02026134
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    ldmia sp!, {r4, r5, r6, pc}
.L_020260c4:
    mov r0, #0x0
    str r0, [r6, #0xd0]
    tst r4, #0x8
    beq .L_020260f8
    ldr r2, .L_02026134
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
.L_020260f8:
    tst r4, #0x10
    beq .L_02026124
    ldr r2, .L_02026134
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
.L_02026124:
    ldr r0, .L_02026138
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldmia sp!, {r4, r5, r6, pc}
.L_02026134: .word 0x4001000
.L_02026138: .word gDebugFont
    .size func_02026044, . - func_02026044

; Matching retail form; see src/game/dual_screen_ui_presentation_base.c.
.text
.extern func_02025cd0
.extern func_020269f8
.extern GraphicsSpriteGroup_AdvanceAnimations

    .global func_02025c20
    .type func_02025c20, @function
func_02025c20: ; 0x02025c20
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0xc4]
    mov r5, r1
    mov r0, r0, lsl #0x1f
    mov r4, r2
    movs r0, r0, asr #0x1f
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r5, #0x0
    cmpeq r4, #0x1f
    ldreq r1, [r6, #0xb0]
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    ldrne r1, [r6, #0xb0]
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    tst r4, #0x2
    beq .L_02025ca8
    cmp r5, #0x0
    beq .L_02025c98
    ldr r0, [r6, #0xc4]
    mov r0, r0, lsl #0x1e
    movs r0, r0, asr #0x1f
    ldreq r1, [r6, #0xb4]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    beq .L_02025ca8
.L_02025c98:
    ldr r1, [r6, #0xb4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
.L_02025ca8:
    ldr r0, [r6, #0xa8]
    bl GraphicsSpriteGroup_AdvanceAnimations
    tst r4, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, r5
    add r0, r6, #0x4
    bl func_02025cd0
    add r0, r6, #0x4
    bl func_020269f8
    ldmia sp!, {r4, r5, r6, pc}
    .size func_02025c20, . - func_02025c20

.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern gGamePhaseRuntime
.extern Fx32Vector2_Magnitude
.extern func_020adc90

.global func_ov095_0221c3ac
func_ov095_0221c3ac:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r1, [r8, #0x24]
    ldr r0, [r8, #0x1dc]
    cmp r1, r0
    ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, .L_0221c4a0
    ldr r2, [r8, #0x1c]
    ldr r0, [r0, #0x0]
    ldr r1, [r8, #0x20]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r3, [r0, #0x1c]
    ldr r0, [r0, #0x20]
    sub r4, r3, r2
    sub r5, r0, r1
    mov r0, r4
    mov r1, r5
    bl Fx32Vector2_Magnitude
    add r1, r8, #0x200
    ldrh r2, [r1, #0x2]
    mov r6, r0
    cmp r2, #0x0
    bne .L_0221c440
    ldr r0, .L_0221c4a0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r0, [r0, #0x278]
    cmp r0, #0x0
    beq .L_0221c440
    mov r0, #0x1
    strh r0, [r1, #0x2]
    mov r0, #0x14
    strb r0, [r8, #0x200]
    mov r0, #0x0
    strb r0, [r8, #0x201]
.L_0221c440:
    cmp r6, #0x1000
    ldmleia sp!, {r4, r5, r6, r7, r8, pc}
    add r0, r8, #0x200
    ldrh r0, [r0, #0x2]
    cmp r0, #0x0
    movne r7, #0x1800
    moveq r7, #0x1000
    smull r1, r0, r4, r7
    adds r1, r1, #0x800
    adc r2, r0, #0x0
    mov r0, r1, lsr #0xc
    mov r1, r6
    orr r0, r0, r2, lsl #0x14
    bl func_020adc90
    smull r2, r1, r5, r7
    adds r3, r2, #0x800
    str r0, [r8, #0x3c]
    adc r2, r1, #0x0
    mov r0, r3, lsr #0xc
    mov r1, r6
    orr r0, r0, r2, lsl #0x14
    bl func_020adc90
    str r0, [r8, #0x40]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0221c4a0: .word gGamePhaseRuntime
.size func_ov095_0221c3ac, . - func_ov095_0221c3ac

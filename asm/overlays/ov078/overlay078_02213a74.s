.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_021052fc
.extern func_02004fe0
.extern func_02005058
.extern func_02005070
.extern func_020050a4
.extern func_ov078_02213ba8

.global func_ov078_02213a74
func_ov078_02213a74:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x30
    mov r6, r0
    add r0, sp, #0x20
    mov r5, r1
    bl func_02004fe0
    ldrh r0, [r5, #0x1a]
    tst r0, #0x10
    mvnne r4, #0x80000000
    bne .L_02213adc
    ldr r1, .L_02213ba4
    add r0, sp, #0x10
    ldr r2, [r1, #0x0]
    add r1, r6, #0x18
    add r2, r2, #0x2000
    ldr r2, [r2, #0xea4]
    add r2, r2, #0x18
    bl func_ov078_02213ba8
    add r0, sp, #0x20
    add r1, sp, #0x10
    bl func_020050a4
    add r0, sp, #0x10
    bl func_02005058
    add r0, sp, #0x20
    bl func_02005070
    mov r4, r0
.L_02213adc:
    ldrh r0, [r5, #0x1a]
    tst r0, #0x20
    ldrne r0, .L_02213ba4
    ldrne r0, [r0, #0x0]
    addne r0, r0, #0x2000
    ldrne r2, [r0, #0xea8]
    cmpne r2, #0x0
    beq .L_02213b48
    ldr r0, [r2, #0x268]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_02213b48
    add r0, sp, #0x0
    add r1, r6, #0x18
    add r2, r2, #0x18
    bl func_ov078_02213ba8
    add r0, sp, #0x20
    add r1, sp, #0x0
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    add r0, sp, #0x20
    bl func_02005070
    add r1, r0, #0x18000
    b .L_02213b4c
.L_02213b48:
    mvn r1, #0x80000000
.L_02213b4c:
    cmp r4, r1
    bgt .L_02213b78
    mvn r0, #0x80000000
    cmp r4, r0
    beq .L_02213b78
    ldr r0, .L_02213ba4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    str r0, [r6, #0x228]
    b .L_02213b94
.L_02213b78:
    mvn r0, #0x80000000
    cmp r1, r0
    ldrne r0, .L_02213ba4
    ldrne r0, [r0, #0x0]
    addne r0, r0, #0x2000
    ldrne r0, [r0, #0xea8]
    strne r0, [r6, #0x228]
.L_02213b94:
    add r0, sp, #0x20
    bl func_02005058
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, pc}
.L_02213ba4: .word data_021052fc
.size func_ov078_02213a74, . - func_ov078_02213a74

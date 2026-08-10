.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern data_02105310
.extern func_0200500c
.extern func_02005058
.extern func_0200b04c
.extern func_02032a94
.extern ActorDerivedRuntime_HandlePairActive
.extern func_0204cfa4
.extern func_020593ac
.extern func_020adc90
.extern gSoundContext

.global func_ov088_02219a2c
func_ov088_02219a2c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x18
    mov r6, r0
    ldr r0, [r6, #0x10]
    mov r5, r1
    mov r4, r2
    tst r0, #0x1000000
    bne .L_02219a5c
    ldr r0, .L_02219bf8
    bl func_0200b04c
    cmp r0, #0x0
    beq .L_02219a70
.L_02219a5c:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl ActorDerivedRuntime_HandlePairActive
    b .L_02219bf0
.L_02219a70:
    add r0, r6, #0x200
    ldrsh r1, [r0, #0x30]
    cmp r1, #0x1
    cmpeq r4, #0x0
    bne .L_02219bc0
    ldr r2, [r5, #0x24]
    ldr r1, [r6, #0x24]
    subs r1, r2, r1
    bmi .L_02219bc0
    ldrsh r0, [r0, #0x36]
    cmp r0, #0x0
    ldr r0, [r6, #0x238]
    movgt r3, #0x20
    ldrh r2, [r0, #0x28]
    movle r3, #0x7f
    cmp r2, #0x0
    beq .L_02219ad4
    mov r1, #0x0
    str r1, [sp, #0x0]
    ldr r0, .L_02219bfc
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_020593ac
.L_02219ad4:
    add r0, r6, #0x200
    mov r1, #0xa
    strh r1, [r0, #0x36]
    ldr r3, [r6, #0x1c]
    ldr r2, [r5, #0x1c]
    ldr r1, [r6, #0x20]
    ldr r0, [r5, #0x20]
    sub r7, r3, r2
    sub r9, r1, r0
    mov r0, r7
    mov r1, r9
    bl func_0204cfa4
    mov r8, r0
    cmp r8, #0x1000
    ble .L_02219bc0
    mov r0, r7
    mov r1, r8
    bl func_020adc90
    mov r7, r0
    mov r0, r9
    mov r1, r8
    bl func_020adc90
    mov r2, r0
    add r0, sp, #0x8
    mov r1, r7
    mov r3, #0x0
    bl func_0200500c
    mov r0, r6
    ldr r3, [r0, #0x0]
    add r1, sp, #0x8
    ldr r3, [r3, #0xb8]
    mov r2, #0x0
    blx r3
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x7
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_02219b84
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02219bb8
.L_02219b84:
    ldr r2, [sp, #0xc]
    mvn r0, #0x0
    mul r3, r2, r0
    ldr r1, [sp, #0x10]
    str r3, [sp, #0xc]
    mul r2, r1, r0
    str r2, [sp, #0x10]
    mov r0, r5
    ldr r3, [r0, #0x0]
    add r1, sp, #0x8
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
.L_02219bb8:
    add r0, sp, #0x8
    bl func_02005058
.L_02219bc0:
    add r0, r6, #0x200
    ldrsh r1, [r0, #0x1e]
    cmp r1, #0x0
    bne .L_02219be0
    ldrsh r1, [r0, #0x1c]
    cmp r1, #0x0
    movgt r1, #0xf
    strgth r1, [r0, #0x1e]
.L_02219be0:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02032a94
.L_02219bf0:
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02219bf8: .word data_02105310
.L_02219bfc: .word gSoundContext
.size func_ov088_02219a2c, . - func_ov088_02219a2c

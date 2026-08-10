.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern func_02032a94
.extern ActorDerivedRuntime_HandlePairActive
.extern func_020adc40
.extern func_020adc90

.global func_ov089_02218954
func_ov089_02218954:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldr r3, [r8, #0x10]
    mov r7, r1
    mov r6, r2
    tst r3, #0x1000000
    beq .L_02218978
    bl ActorDerivedRuntime_HandlePairActive
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02218978:
    ldrb r0, [r7, #0x4d]
    cmp r0, #0x2
    cmpne r0, #0x3
    bne .L_02218a48
    ldr r3, [r7, #0x1c]
    ldr r2, [r8, #0x1c]
    ldr r1, [r7, #0x20]
    ldr r0, [r8, #0x20]
    sub r4, r3, r2
    sub r5, r1, r0
    smull r0, r2, r4, r4
    adds r3, r0, #0x800
    smull r1, r0, r5, r5
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    mov r9, r0
    cmp r9, #0x1000
    ble .L_02218a48
    mov r0, r4
    mov r1, r9
    bl func_020adc90
    mov r4, r0
    mov r0, r5
    mov r1, r9
    bl func_020adc90
    ldr r1, [r8, #0xd0]
    ldr r2, [r8, #0x9c]
    tst r1, #0x10
    addne r1, r4, r4, lsr #0x1f
    movne r4, r1, asr #0x1
    add r1, r4, r4, lsr #0x1f
    sub r1, r2, r1, asr #0x1
    addne r0, r0, r0, lsr #0x1f
    str r1, [r8, #0x9c]
    movne r0, r0, asr #0x1
    ldr r2, [r8, #0xa0]
    add r1, r0, r0, lsr #0x1f
    sub r1, r2, r1, asr #0x1
    str r1, [r8, #0xa0]
    ldr r1, [r7, #0x8c]
    add r1, r1, r4
    str r1, [r7, #0x8c]
    ldr r1, [r7, #0x90]
    add r0, r1, r0
    str r0, [r7, #0x90]
.L_02218a48:
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_02032a94
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.size func_ov089_02218954, . - func_ov089_02218954

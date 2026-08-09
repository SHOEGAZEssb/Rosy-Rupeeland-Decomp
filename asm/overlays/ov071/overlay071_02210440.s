.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.

.global func_ov071_02210440
func_ov071_02210440:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r6, [r1, #0x4]
    ldr r4, [r0, #0x98]
    rsb r5, r2, #0x0
    sub ip, r6, r4
    cmp ip, r5
    mov lr, #0x0
    ble .L_022104e8
    cmp ip, r2
    bge .L_022104e8
    ldr r4, [r1, #0x8]
    ldr r1, [r0, #0x9c]
    sub r1, r4, r1
    cmp r1, r5
    ble .L_022104e8
    cmp r1, r2
    bge .L_022104e8
    ldr r2, .L_02210510
    mov r4, lr
    umull r8, r7, ip, r2
    mla r7, ip, r4, r7
    umull r6, r5, r1, r2
    mla r5, r1, r4, r5
    mov ip, ip, asr #0x1f
    mov r1, r1, asr #0x1f
    mla r5, r1, r2, r5
    adds r8, r8, #0x800
    mla r7, ip, r2, r7
    adc r7, r7, #0x0
    mov r8, r8, lsr #0xc
    adds r6, r6, #0x800
    ldr r1, [r0, #0xa4]
    orr r8, r8, r7, lsl #0x14
    sub r1, r1, r8
    str r1, [r0, #0xa4]
    adc r1, r5, #0x0
    mov r2, r6, lsr #0xc
    ldr r4, [r0, #0xa8]
    orr r2, r2, r1, lsl #0x14
    sub r1, r4, r2
    str r1, [r0, #0xa8]
    add lr, lr, #0x1
.L_022104e8:
    ldr r1, [r0, #0xd4]
    cmp r3, #0x0
    add r1, r1, lr, lsl #0x2
    str r1, [r0, #0xd4]
    ldrne r1, [r0, #0xd4]
    cmpne r1, #0x0
    movne r1, #0x1
    strne r1, [r0, #0xd4]
    mov r0, lr
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02210510: .word 0x333
.size func_ov071_02210440, . - func_ov071_02210440

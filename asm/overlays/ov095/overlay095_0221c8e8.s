.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_020c9670
.extern data_021052fc
.extern Actor_TurnTowardVector
.extern func_0204cfa4

.global func_ov095_0221c8e8
func_ov095_0221c8e8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r1, [r4, #0x10]
    add r0, r4, #0x100
    bic r2, r1, #0x10000
    bic r1, r2, #0x80000
    bic r1, r1, #0x20000
    str r1, [r4, #0x10]
    mov r1, #0x1e
    strh r1, [r0, #0xf8]
    ldr r1, [r4, #0x24]
    ldr r0, [r4, #0x1dc]
    cmp r1, r0
    ldmgtia sp!, {r4, r5, r6, pc}
    ldr r0, .L_0221ca08
    ldr r2, [r4, #0x1c]
    ldr r0, [r0, #0x0]
    ldr r1, [r4, #0x20]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r3, [r0, #0x1c]
    ldr r0, [r0, #0x20]
    sub r5, r3, r2
    sub r6, r0, r1
    mov r0, r5
    mov r1, r6
    bl func_0204cfa4
    cmp r0, #0x1000
    ldmleia sp!, {r4, r5, r6, pc}
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, #0x80
    bl Actor_TurnTowardVector
    ldr r0, [r4, #0xc8]
    ldr r1, .L_0221ca0c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x4
    ldr r0, .L_0221ca10
    mov r2, r2, lsl #0x2
    ldrsh ip, [r0, r2]
    mvn r2, #0x0
    rsb r3, r1, #0x0
    umull r5, lr, ip, r1
    adds r5, r5, #0x800
    mla lr, ip, r2, lr
    mov r2, ip, asr #0x1f
    mla lr, r2, r1, lr
    adc r1, lr, #0x0
    mov r2, r5, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [r4, #0x3c]
    ldr r1, [r4, #0xc8]
    mov r2, #0x0
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    add r1, r1, #0x1
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    umull ip, r1, r0, r3
    adds ip, ip, #0x800
    mla r1, r0, r2, r1
    mov r0, r0, asr #0x1f
    mla r1, r0, r3, r1
    adc r0, r1, #0x0
    mov r1, ip, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r4, #0x40]
    ldmia sp!, {r4, r5, r6, pc}
.L_0221ca08: .word data_021052fc
.L_0221ca0c: .word 0xffffee66
.L_0221ca10: .word data_020c9670
.size func_ov095_0221c8e8, . - func_ov095_0221c8e8

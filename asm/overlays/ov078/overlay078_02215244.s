.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern func_020adae4
.extern func_ov078_02213c3c

.global func_ov078_02215244
func_ov078_02215244:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov078_02213c3c
    ldr r2, [r4, #0x3c]
    mov r0, #0x3000
    umull ip, r3, r2, r0
    mov r1, #0x0
    adds ip, ip, #0x800
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adc r0, r3, #0x0
    mov r1, ip, lsr #0xc
    ldr r2, [r4, #0x8c]
    orr r1, r1, r0, lsl #0x14
    mov r0, #0x18
    mla r0, r2, r0, r1
    mov r1, #0x19
    bl func_020adae4
    str r0, [r4, #0x8c]
    ldr r2, [r4, #0x40]
    mov r0, #0x3000
    umull ip, r3, r2, r0
    mov r1, #0x0
    adds ip, ip, #0x800
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adc r0, r3, #0x0
    mov r1, ip, lsr #0xc
    ldr r2, [r4, #0x90]
    orr r1, r1, r0, lsl #0x14
    mov r0, #0x18
    mla r0, r2, r0, r1
    mov r1, #0x19
    bl func_020adae4
    str r0, [r4, #0x90]
    ldr r3, [r4, #0x3c]
    ldr r0, .L_02215334
    mov r1, #0x0
    mov r2, r3, asr #0x1f
    umull lr, ip, r3, r0
    mla ip, r3, r1, ip
    mla ip, r2, r0, ip
    adds r3, lr, #0x800
    adc r2, ip, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r4, #0x3c]
    ldr r3, [r4, #0x40]
    mov r2, r3, asr #0x1f
    umull lr, ip, r3, r0
    mla ip, r3, r1, ip
    mla ip, r2, r0, ip
    adds r1, lr, #0x800
    adc r0, ip, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r4, #0x40]
    ldmia sp!, {r4, pc}
.L_02215334: .word 0x19a
.size func_ov078_02215244, . - func_ov078_02215244

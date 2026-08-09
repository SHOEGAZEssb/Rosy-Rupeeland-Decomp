.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern data_020c9770
.extern func_020ad2d8
.extern func_020ad2f4
.extern func_020adc90

.global func_ov071_02210354
func_ov071_02210354:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x30
    ldr r2, .L_02210438
    ldr r6, [r0, #0xe4]
    ldr r5, [r0, #0xe0]
    mov r4, r1
    mov r0, #0x1000
    ldrsh r1, [r2, #0x8c]
    mov r3, #0x80000
    ldrsh r2, [r2, #0x8e]
    add r6, r6, #0x60000
    rsb r0, r0, #0x0
    sub r5, r5, #0x80000
    and r6, r6, r0
    and r5, r5, r0
    add r0, sp, #0x0
    str r5, [sp, #0x24]
    str r6, [sp, #0x28]
    str r3, [sp, #0x2c]
    /* MWASMARM emits the required ARM-to-Thumb relocation from this spelling. */
    bl func_020ad2d8
    add r0, sp, #0x24
    add r1, sp, #0x0
    mov r2, r0
    bl func_020ad2f4
    ldr r0, [sp, #0x24]
    ldr r1, [sp, #0x2c]
    bl func_020adc90
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x28]
    ldr r1, [sp, #0x2c]
    bl func_020adc90
    ldr r1, .L_0221043c
    ldr ip, [sp, #0x24]
    mov r2, #0x0
    umull r6, lr, r0, r1
    mla lr, r0, r2, lr
    mov r5, r0, asr #0x1f
    mla lr, r5, r1, lr
    adds r5, r6, #0x800
    str r0, [sp, #0x28]
    adc r0, lr, #0x0
    mov r5, r5, lsr #0xc
    orr r5, r5, r0, lsl #0x14
    mov r0, r5, lsl #0x7
    umull r5, lr, ip, r1
    mla lr, ip, r2, lr
    mov r3, ip, asr #0x1f
    adds r2, r5, #0x800
    mla lr, r3, r1, lr
    adc r1, lr, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    mov r1, r2, lsl #0x7
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, pc}
.L_02210438: .word data_020c9770
.L_0221043c: .word 0x15a0
.size func_ov071_02210354, . - func_ov071_02210354

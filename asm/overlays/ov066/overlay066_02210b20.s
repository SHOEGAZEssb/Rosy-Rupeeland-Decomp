.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern Fx32Vector2_Magnitude
.extern func_020adc90
.extern func_ov066_02210e54
.extern func_ov066_02210e70

.global func_ov066_02210b20
func_ov066_02210b20:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    mov r7, r0
    add r0, sp, #0xc
    mov r6, r1
    mov r5, r2
    bl func_ov066_02210e54
    add r0, sp, #0x0
    mov r1, r5
    mov r2, r6
    bl func_ov066_02210e70
    add r1, sp, #0x0
    add r0, sp, #0xc
    cmp r1, r0
    ldrne r1, [sp, #0x4]
    ldrne r0, [sp, #0x8]
    strne r1, [sp, #0x10]
    strne r0, [sp, #0x14]
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0x14]
    bl Fx32Vector2_Magnitude
    ldr r2, [r6, #0x18]
    ldr r1, [r5, #0x18]
    mov r4, r0
    add r0, r2, r1
    cmp r4, r0
    bge .L_02210e4c
    cmp r4, #0x0
    ble .L_02210e4c
    ldr r0, [sp, #0x10]
    mov r1, r4
    bl func_020adc90
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x14]
    mov r1, r4
    bl func_020adc90
    str r0, [sp, #0x14]
    ldr lr, [r5, #0x10]
    ldr ip, [r6, #0x10]
    ldr r2, [r5, #0x14]
    ldr r1, [r6, #0x14]
    ldr r3, [sp, #0x10]
    sub ip, lr, ip
    sub r1, r2, r1
    smull r2, r3, ip, r3
    adds ip, r2, #0x800
    smull r2, r0, r1, r0
    adc r3, r3, #0x0
    adds r1, r2, #0x800
    mov r2, ip, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r2, r2, r3, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    adds lr, r2, r1
    mov r1, #0x0
    mov r0, #0x800
    bpl .L_02210d24
    ldr r2, [r7, #0x1b8]
    ldr r3, [r5, #0x1c]
    add r2, r2, #0x1000
    smull r2, ip, lr, r2
    adds r0, r2, r0
    ldr r2, [r6, #0x1c]
    adc r1, ip, r1
    mov r0, r0, lsr #0xc
    orr r0, r0, r1, lsl #0x14
    add r1, r3, r2
    bl func_020adc90
    ldr r2, [sp, #0x10]
    ldr r1, [r5, #0x1c]
    smull r3, r2, r0, r2
    adds r3, r3, #0x800
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    smull r2, r1, r3, r1
    adds r2, r2, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    ldr r3, [r6, #0x10]
    orr r2, r2, r1, lsl #0x14
    add r1, r3, r2
    str r1, [r6, #0x10]
    ldr r2, [sp, #0x14]
    ldr r1, [r5, #0x1c]
    smull r3, r2, r0, r2
    adds r3, r3, #0x800
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    smull r2, r1, r3, r1
    adds r2, r2, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    ldr r3, [r6, #0x14]
    orr r2, r2, r1, lsl #0x14
    add r1, r3, r2
    str r1, [r6, #0x14]
    ldr r2, [sp, #0x10]
    ldr r1, [r6, #0x1c]
    smull r3, r2, r0, r2
    adds r3, r3, #0x800
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    smull r2, r1, r3, r1
    adds r2, r2, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    ldr r3, [r5, #0x10]
    orr r2, r2, r1, lsl #0x14
    sub r1, r3, r2
    str r1, [r5, #0x10]
    ldr r2, [sp, #0x14]
    ldr r1, [r6, #0x1c]
    smull r3, r2, r0, r2
    adds r3, r3, #0x800
    adc r0, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    smull r1, r0, r2, r1
    adds r1, r1, #0x800
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    ldr r0, [r5, #0x14]
    sub r0, r0, r1
    str r0, [r5, #0x14]
.L_02210d24:
    ldr r1, [r5, #0x18]
    ldr r0, [r6, #0x18]
    sub r1, r4, r1
    ldr r2, [r7, #0x1b4]
    sub r0, r1, r0
    smull r1, r0, r2, r0
    adds r4, r1, #0x800
    ldr r2, [r6, #0x1c]
    ldr r1, [r5, #0x1c]
    adc r3, r0, #0x0
    mov r0, r4, lsr #0xc
    orr r0, r0, r3, lsl #0x14
    add r1, r2, r1
    bl func_020adc90
    ldr r2, [sp, #0x10]
    ldr r1, [r5, #0x1c]
    smull r3, r2, r0, r2
    adds r3, r3, #0x800
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    smull r2, r1, r3, r1
    adds r2, r2, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    ldr r3, [r6, #0x4]
    orr r2, r2, r1, lsl #0x14
    add r1, r3, r2
    str r1, [r6, #0x4]
    ldr r2, [sp, #0x14]
    ldr r1, [r5, #0x1c]
    smull r3, r2, r0, r2
    adds r3, r3, #0x800
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    smull r2, r1, r3, r1
    adds r2, r2, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    ldr r3, [r6, #0x8]
    orr r2, r2, r1, lsl #0x14
    add r1, r3, r2
    str r1, [r6, #0x8]
    ldr r2, [sp, #0x10]
    ldr r1, [r6, #0x1c]
    smull r3, r2, r0, r2
    adds r3, r3, #0x800
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    smull r2, r1, r3, r1
    adds r2, r2, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    ldr r3, [r5, #0x4]
    orr r2, r2, r1, lsl #0x14
    sub r1, r3, r2
    str r1, [r5, #0x4]
    ldr r2, [sp, #0x14]
    ldr r1, [r6, #0x1c]
    smull r3, r2, r0, r2
    adds r3, r3, #0x800
    adc r0, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    smull r1, r0, r2, r1
    adds r1, r1, #0x800
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    ldr r2, [r5, #0x8]
    orr r1, r1, r0, lsl #0x14
    sub r0, r2, r1
    str r0, [r5, #0x8]
.L_02210e4c:
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov066_02210b20, . - func_ov066_02210b20

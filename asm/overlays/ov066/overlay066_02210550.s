.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.

.global func_ov066_02210550
func_ov066_02210550:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, [r0, #0x14]
    mvn lr, #0x0
    add ip, r4, #0x33
    mul lr, r2, lr
    add r2, ip, #0x300
    str r2, [r0, #0x14]
    ldr r4, [r1, #0x0]
    ldr r2, [r0, #0x18]
    ldr r5, [r0, #0x4]
    add r4, r4, r2
    mov r2, lr
    cmp r5, r4
    bge .L_022105dc
    ldr r5, [r0, #0x10]
    cmp r5, #0x0
    bge .L_022105ac
    smull ip, r4, r5, lr
    adds ip, ip, #0x800
    adc r4, r4, #0x0
    mov ip, ip, lsr #0xc
    orr ip, ip, r4, lsl #0x14
    str ip, [r0, #0x10]
.L_022105ac:
    ldr ip, [r1, #0x0]
    ldr r4, [r0, #0x18]
    ldr lr, [r0, #0x4]
    add r4, ip, r4
    sub r4, r4, lr
    smull ip, r4, r3, r4
    adds ip, ip, #0x800
    adc r4, r4, #0x0
    mov ip, ip, lsr #0xc
    orr ip, ip, r4, lsl #0x14
    add r4, lr, ip
    str r4, [r0, #0x4]
.L_022105dc:
    ldr ip, [r1, #0x8]
    ldr r4, [r0, #0x18]
    ldr lr, [r0, #0x4]
    sub r4, ip, r4
    cmp lr, r4
    ble .L_02210648
    ldr lr, [r0, #0x10]
    cmp lr, #0x0
    ble .L_02210618
    smull ip, r4, lr, r2
    adds ip, ip, #0x800
    adc r4, r4, #0x0
    mov ip, ip, lsr #0xc
    orr ip, ip, r4, lsl #0x14
    str ip, [r0, #0x10]
.L_02210618:
    ldr ip, [r1, #0x8]
    ldr r4, [r0, #0x18]
    ldr lr, [r0, #0x4]
    sub r4, ip, r4
    sub r4, r4, lr
    smull ip, r4, r3, r4
    adds ip, ip, #0x800
    adc r4, r4, #0x0
    mov ip, ip, lsr #0xc
    orr ip, ip, r4, lsl #0x14
    add r4, lr, ip
    str r4, [r0, #0x4]
.L_02210648:
    ldr ip, [r1, #0x4]
    ldr r4, [r0, #0x18]
    ldr lr, [r0, #0x8]
    add r4, ip, r4
    cmp lr, r4
    bge .L_022106b4
    ldr lr, [r0, #0x14]
    cmp lr, #0x0
    bge .L_02210684
    smull ip, r4, lr, r2
    adds ip, ip, #0x800
    adc r4, r4, #0x0
    mov ip, ip, lsr #0xc
    orr ip, ip, r4, lsl #0x14
    str ip, [r0, #0x14]
.L_02210684:
    ldr ip, [r1, #0x4]
    ldr r4, [r0, #0x18]
    ldr lr, [r0, #0x8]
    add r4, ip, r4
    sub r4, r4, lr
    smull ip, r4, r3, r4
    adds ip, ip, #0x800
    adc r4, r4, #0x0
    mov ip, ip, lsr #0xc
    orr ip, ip, r4, lsl #0x14
    add r4, lr, ip
    str r4, [r0, #0x8]
.L_022106b4:
    ldr lr, [r1, #0xc]
    ldr ip, [r0, #0x18]
    ldr r4, [r0, #0x8]
    sub ip, lr, ip
    cmp r4, ip
    ble .L_02210720
    ldr lr, [r0, #0x14]
    cmp lr, #0x0
    ble .L_022106f0
    smull ip, r2, lr, r2
    adds ip, ip, #0x800
    adc r2, r2, #0x0
    mov ip, ip, lsr #0xc
    orr ip, ip, r2, lsl #0x14
    str ip, [r0, #0x14]
.L_022106f0:
    ldr r2, [r1, #0xc]
    ldr r1, [r0, #0x18]
    ldr ip, [r0, #0x8]
    sub r1, r2, r1
    sub r1, r1, ip
    smull r2, r1, r3, r1
    adds r2, r2, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r1, ip, r2
    str r1, [r0, #0x8]
.L_02210720:
    ldr r2, [r0, #0x4]
    ldr r1, [r0, #0x10]
    mvn r3, #0xf
    add r1, r2, r1
    str r1, [r0, #0x4]
    ldr r2, [r0, #0x8]
    ldr r1, [r0, #0x14]
    add r2, r2, r1
    str r2, [r0, #0x8]
    ldr r1, [r0, #0x4]
    mov r2, r2, lsl #0x4
    mov r1, r1, lsl #0x4
    cmp r3, r1, asr #0x10
    mov ip, r1, asr #0x10
    mov r2, r2, asr #0x10
    bgt .L_02210798
    cmp ip, #0x110
    bge .L_02210798
    cmp r2, r3
    blt .L_02210798
    cmp r2, #0xd0
    bge .L_02210798
    ldr r1, [r0, #0x20]
    strh ip, [r1, #0x2c]
    strh r2, [r1, #0x2e]
    ldr r1, [r0, #0x20]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x8
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
.L_02210798:
    ldr r1, [r0, #0x20]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x8
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov066_02210550, . - func_ov066_02210550

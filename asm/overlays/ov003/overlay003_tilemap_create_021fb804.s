    .text
    .extern data_ov003_021fbcd8
    .extern gHeapContext
    .extern func_02003e20
    .extern func_020b4554
    .global func_ov003_021fb804
func_ov003_021fb804: ; 0x021fb804
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r1, L_021fb8a4
    ldr r3, L_021fb8a8
    mov r0, #0x600
    mov r2, #0x4
    bl func_02003e20
    mov r4, r0
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, #0x400
    mov r1, #0x0
    mov ip, r0, lsl #0x1c
    rsb r2, r2, #0x0
L_021fb83c:
    mov r0, r1, lsl #0x1
    ldrh lr, [r4, r0]
    mov r3, r1, lsl #0x10
    mov r3, r3, lsr #0x10
    and lr, lr, r2
    and r3, r3, r2, lsr #0x16
    orr r3, lr, r3
    strh r3, [r4, r0]
    ldrh r3, [r4, r0]
    add r1, r1, #0x1
    cmp r1, #0x300
    bic r3, r3, #0x400
    strh r3, [r4, r0]
    ldrh r3, [r4, r0]
    bic r3, r3, #0x800
    strh r3, [r4, r0]
    ldrh r3, [r4, r0]
    bic r3, r3, #0xf000
    orr r3, r3, ip, lsr #0x10
    strh r3, [r4, r0]
    blt L_021fb83c
    mov r0, r4
    mov r1, #0x600
    bl func_020b4554
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fb8a4: .word data_ov003_021fbcd8
L_021fb8a8: .word gHeapContext
    .size func_ov003_021fb804, .-func_ov003_021fb804


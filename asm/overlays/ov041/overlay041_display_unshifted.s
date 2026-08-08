.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_display_setup.c. */
.extern GXS_SetGraphicsMode
.extern GX_SetBankForLCDC
.extern GX_SetGraphicsMode
.extern func_020ae90c
.extern func_020aeb08
.extern func_ov041_021fe2c4
.extern func_ov041_021fe2e0

    .global func_ov041_021fe31c
func_ov041_021fe31c: ; 0x021fe31c
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    mov r0, #0x0
    bl func_ov041_021fe2c4
    ldr r0, [r4, #0x1f4]
    cmp r0, #0x0
    cmpne r0, #0x2
    bne .L_021fe378
    ldr r0, .L_021fe484
    ldr r1, [r4, #0x190]
    ldr ip, .L_021fe488
    and r1, r0, r1, asr #0xf
    str r1, [ip, #0x0]
    ldr r1, [r4, #0x194]
    ldr r3, [r4, #0x190]
    mov r2, r1, asr #0xe
    mov r1, r0, lsl #0x10
    and r3, r0, r3, asr #0xd
    and r0, r1, r2, lsl #0x10
    orr r0, r3, r0
    str r0, [ip, #0x4]
    b .L_021fe398
.L_021fe378:
    ldr r2, .L_021fe488
    mov r0, #0x0
    str r0, [r2, #0x0]
    ldr r1, [r4, #0x194]
    ldr r0, .L_021fe48c
    mov r1, r1, asr #0xe
    and r0, r0, r1, lsl #0x10
    str r0, [r2, #0x4]
.L_021fe398:
    ldr r0, .L_021fe490
    ldr r1, .L_021fe484
    ldrh r3, [r0, #0x0]
    mov r2, r1, lsl #0x10
    bic r3, r3, #0x3
    orr r3, r3, #0x2
    strh r3, [r0, #0x0]
    ldrh r3, [r0, #0x2]
    bic r3, r3, #0x3
    orr r3, r3, #0x1
    strh r3, [r0, #0x2]
    ldrh r3, [r0, #0x4]
    bic r3, r3, #0x3
    strh r3, [r0, #0x4]
    ldr ip, [r4, #0x190]
    ldr r3, [r4, #0x194]
    mov ip, ip, asr #0xc
    add ip, ip, #0x80
    mov r3, r3, asr #0xc
    and ip, ip, r1
    and r1, r2, r3, lsl #0x10
    orr r1, ip, r1
    str r1, [r0, #0x12]
    bl func_020ae90c
    mov r0, #0x8
    bl func_020aeb08
    mov r0, #0x4
    bl GX_SetBankForLCDC
    mov r1, #0x0
    mov r0, #0x2
    str r0, [sp, #0x0]
    mov r0, #0x10
    stmib sp, {r0, r1}
    mov r0, #0x3
    mov r2, r1
    mov r3, r1
    bl func_ov041_021fe2e0
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    bl GX_SetGraphicsMode
    mov r3, #0x4000000
    ldr r2, [r3, #0x0]
    ldr r1, [r4, #0x44]
    bic r2, r2, #0x1f00
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    ldrh r1, [r3, #0x8]
    mov r0, #0x5
    bic r1, r1, #0x3
    strh r1, [r3, #0x8]
    bl GXS_SetGraphicsMode
    ldr r1, .L_021fe494
    ldr r0, [r1, #0x0]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1000
    str r0, [r1, #0x0]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_021fe484: .word 0x1ff
.L_021fe488: .word 0x4000014
.L_021fe48c: .word 0x1ff0000
.L_021fe490: .word 0x400000a
.L_021fe494: .word 0x4001000
    .size func_ov041_021fe31c, . - func_ov041_021fe31c


.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_display_setup.c. */
.extern GXS_SetGraphicsMode
.extern GX_SetBankForLCDC
.extern GX_SetBankForSubBG
.extern GX_SetGraphicsMode
.extern func_020ae8f8
.extern func_ov041_021fe2c4
.extern func_ov041_021fe2e0

    .global func_ov041_021fe110
func_ov041_021fe110: ; 0x021fe110
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    mov r0, #0x1
    bl func_ov041_021fe2c4
    ldr r0, [r4, #0x1f4]
    cmp r0, #0x0
    cmpne r0, #0x2
    bne .L_021fe170
    ldr r0, .L_021fe2b0
    ldr r1, [r4, #0x190]
    ldr ip, .L_021fe2b4
    and r1, r0, r1, asr #0xf
    str r1, [ip, #0x0]
    ldr r1, [r4, #0x194]
    ldr r3, [r4, #0x190]
    mov r1, r1, asr #0xe
    sub r2, r1, #0xc0
    mov r1, r0, lsl #0x10
    and r3, r0, r3, asr #0xd
    and r0, r1, r2, lsl #0x10
    orr r0, r3, r0
    str r0, [ip, #0x4]
    b .L_021fe194
.L_021fe170:
    ldr r2, .L_021fe2b4
    mov r0, #0x0
    str r0, [r2, #0x0]
    ldr r1, [r4, #0x194]
    ldr r0, .L_021fe2b8
    mov r1, r1, asr #0xe
    sub r1, r1, #0xc0
    and r0, r0, r1, lsl #0x10
    str r0, [r2, #0x4]
.L_021fe194:
    ldr r0, .L_021fe2bc
    ldr r1, .L_021fe2b0
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
    mov r3, r3, asr #0xc
    add ip, ip, #0x80
    sub r3, r3, #0xc0
    and ip, ip, r1
    and r1, r2, r3, lsl #0x10
    orr r1, ip, r1
    str r1, [r0, #0x12]
    bl func_020ae8f8
    mov r0, #0x4
    bl GX_SetBankForSubBG
    mov r0, #0x8
    bl GX_SetBankForLCDC
    mov r1, #0x0
    mov r0, #0x3
    str r0, [sp, #0x0]
    mov r2, #0x10
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    bl func_ov041_021fe2e0
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    bl GX_SetGraphicsMode
    ldr r1, [r4, #0x44]
    mov r3, #0x4000000
    ldr r2, [r3, #0x0]
    mov r0, #0x5
    bic r2, r2, #0x1f00
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    ldrh r1, [r3, #0x8]
    bic r1, r1, #0x3
    strh r1, [r3, #0x8]
    bl GXS_SetGraphicsMode
    ldr r1, .L_021fe2c0
    ldr r0, [r1, #0x0]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x400
    str r0, [r1, #0x0]
    ldrh r0, [r1, #0xc]
    and r0, r0, #0x43
    orr r0, r0, #0x84
    orr r0, r0, #0x4000
    strh r0, [r1, #0xc]
    ldrh r0, [r1, #0xc]
    bic r0, r0, #0x3
    strh r0, [r1, #0xc]
    ldrh r0, [r1, #0xc]
    bic r0, r0, #0x40
    strh r0, [r1, #0xc]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_021fe2b0: .word 0x1ff
.L_021fe2b4: .word 0x4000014
.L_021fe2b8: .word 0x1ff0000
.L_021fe2bc: .word 0x400000a
.L_021fe2c0: .word 0x4001000
    .size func_ov041_021fe110, . - func_ov041_021fe110


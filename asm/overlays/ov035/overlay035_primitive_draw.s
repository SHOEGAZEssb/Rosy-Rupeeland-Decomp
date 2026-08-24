.text

/* Exact fallback; see src/overlays/ov035/overlay035_primitive.c for documented portable C. */

    .extern func_020b0808
    .extern gFx32CosSinTable


    .global func_ov035_021fd30c
func_ov035_021fd30c: 
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr lr, [r4, #0x60]
    ldr ip, L_021fd448
    mov r0, #0x0
    str r0, [ip, #0x0]
    ldr r3, [r4, #0x30]
    ldr r2, [r4, #0x20]
    ldr r1, [r4, #0x10]
    mov r0, #0x10000
    str r1, [ip, #0x2c]
    str r2, [ip, #0x2c]
    str r3, [ip, #0x2c]
    str r0, [ip, #0x28]
    str r0, [ip, #0x28]
    str r0, [ip, #0x28]
    ldr r1, [r4, #0x9c]
    mov r0, lr, lsl #0x10
    cmp r1, #0x0
    mov r0, r0, lsr #0x10
    beq L_021fd36c
    cmp r1, #0x1
    beq L_021fd3c4
    b L_021fd430
L_021fd36c:
    ldrsh r0, [r4, #0xa4]
    ldrsh r1, [r4, #0xa6]
    bl func_020b0808
    ldr r2, L_021fd44c
    mov ip, #0x0
    str ip, [r2, #0x0]
    ldrh r0, [r4, #0xa0]
    sub r3, r2, #0x80
    ldr r1, L_021fd450
    str r0, [r3, #0x0]
    sub r0, r2, #0x74
    str r1, [r0, #0x0]
    str ip, [r0, #0x0]
    ldrh r1, [r4, #0xa2]
    mov r0, #0xf8000000
    str r1, [r3, #0x0]
    str r0, [r2, #-0x68]!
    ldrh r1, [r4, #0xa0]
    mov r0, #0x8
    str r1, [r3, #0x0]
    str r0, [r2, #0x0]
    b L_021fd430
L_021fd3c4:
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r3, r1, lsl #0x1
    ldr r2, L_021fd454
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0808
    ldr r2, L_021fd44c
    mov ip, #0x0
    str ip, [r2, #0x0]
    ldrh r0, [r4, #0xa0]
    sub r3, r2, #0x80
    ldr r1, L_021fd458
    str r0, [r3, #0x0]
    sub r0, r2, #0x74
    str r1, [r0, #0x0]
    str ip, [r0, #0x0]
    ldrh r1, [r4, #0xa2]
    sub r0, ip, #0x1800000
    str r1, [r3, #0x0]
    str r0, [r2, #-0x6c]!
    ldrh r1, [r4, #0xa0]
    mov r0, #0x2
    str r1, [r3, #0x0]
    str r0, [r2, #0x0]
L_021fd430:
    ldr r1, L_021fd45c
    mov r0, #0x0
    str r0, [r1, #0x0]
    mov r0, #0x1
    str r0, [r1, #-0xbc]
    ldmia sp!, {r4, pc}
L_021fd448: .word 0x4000444
L_021fd44c: .word 0x4000500
L_021fd450: .word 0xfff8
L_021fd454: .word gFx32CosSinTable
L_021fd458: .word 0xfffe
L_021fd45c: .word 0x4000504
.size func_ov035_021fd30c, .-func_ov035_021fd30c


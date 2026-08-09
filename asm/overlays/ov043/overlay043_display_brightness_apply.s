.text

    .global func_ov043_0220b9bc
func_ov043_0220b9bc:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq .L_0220ba20
    ldr r1, [r0, #0x2f4]
    cmp r1, #0x0
    beq .L_0220b9f0
    mov r0, r1
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    b .L_0220ba20
.L_0220b9f0:
    mov r3, #0x4000000
    ldr r2, [r3, #0x0]
    ldr r1, [r0, #0x48]
    bic r2, r2, #0x1f00
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    add r2, r3, #0x1000
    ldr r1, [r2, #0x0]
    ldr r0, [r0, #0x4c]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
.L_0220ba20:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov043_0220b9bc, . - func_ov043_0220b9bc


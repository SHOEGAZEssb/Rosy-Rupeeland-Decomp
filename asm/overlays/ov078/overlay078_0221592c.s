.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_020c9670
.extern data_ov078_02215c88
.extern func_0200500c
.extern func_02005058
.extern func_020ae024
.extern func_ov078_02213ba8

.global func_ov078_0221592c
func_ov078_0221592c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x20
    mov r6, r0
    ldr r2, [r6, #0x260]
    add r0, r6, #0x200
    orr r2, r2, #0x2b
    str r2, [r6, #0x260]
    ldrsh r2, [r0, #0x98]
    mov r5, r1
    cmp r2, #0x0
    ble .L_02215a4c
    sub r1, r2, #0x1
    strh r1, [r0, #0x98]
    ldr r4, [r6, #0x228]
    add r0, sp, #0x10
    add r1, r4, #0x18
    add r2, r6, #0x18
    bl func_ov078_02213ba8
    ldrsh r2, [r5, #0x12]
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x14]
    add r2, r2, #0x20
    mov r5, r2, lsl #0xc
    bl func_020ae024
    add r1, r6, #0x200
    ldrsh r1, [r1, #0xa2]
    cmp r1, #0x0
    addgt r0, r0, #0x2000
    suble r0, r0, #0x2000
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    mov r2, r0, lsl #0x1
    ldr r1, .L_02215a78
    mov r0, r3, lsl #0x1
    ldrsh r2, [r1, r2]
    ldrsh r0, [r1, r0]
    ldr r1, [r4, #0x1c]
    smull r3, ip, r2, r5
    adds lr, r3, #0x800
    smull r3, r2, r0, r5
    adc r0, ip, #0x0
    mov r5, lr, lsr #0xc
    orr r5, r5, r0, lsl #0x14
    adds r3, r3, #0x800
    adc r0, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    ldr r4, [r4, #0x20]
    ldr r3, [r6, #0x24]
    add r0, sp, #0x0
    sub r1, r1, r5
    sub r2, r4, r2
    bl func_0200500c
    mov r0, r6
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xd0]
    blx r2
    ldr r1, [r6, #0x3c]
    add r0, sp, #0x0
    add r1, r1, r1, lsl #0x1
    str r1, [r6, #0x3c]
    ldr r1, [r6, #0x40]
    add r1, r1, r1, lsl #0x1
    str r1, [r6, #0x40]
    bl func_02005058
    add r0, sp, #0x10
    bl func_02005058
    b .L_02215a68
.L_02215a4c:
    mov r2, #0x0
    ldr r1, .L_02215a7c
    strh r2, [r0, #0xb0]
    ldr r2, [r1, #0x28]
    ldr r0, [r1, #0x2c]
    str r2, [r6, #0x2a4]
    str r0, [r6, #0x2a8]
.L_02215a68:
    mov r0, #0xd
    strh r0, [r6, #0xd6]
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
.L_02215a78: .word data_020c9670
.L_02215a7c: .word data_ov078_02215c88
.size func_ov078_0221592c, . - func_ov078_0221592c

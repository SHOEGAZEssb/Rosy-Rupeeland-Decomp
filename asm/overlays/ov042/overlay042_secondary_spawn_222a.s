.text
.extern func_020a1794
.extern func_0209a0d8
.extern func_02072b68
.global func_ov042_021fdf70
func_ov042_021fdf70:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    add r2, r4, #0x1000
    ldr r0, [r2, #0x648]
    cmp r0, #0x0
    blt .L_021fe08c
    add r0, r4, r0, lsl #0x2
    add r0, r0, #0x1000
    mov r3, #0x0
    str r3, [r0, #0x4c8]
    ldr r0, [r2, #0x648]
    add r0, r4, r0, lsl #0x1
    add r0, r0, #0x1400
    strh r3, [r0, #0x68]
    ldr r2, [r2, #0x648]
    ldr r0, [r4, #0x48]
    add r2, r4, r2, lsl #0x2
    ldr r2, [r2, #0xf28]
    add r2, r2, #0x2c
    bl func_020a1794
    ldr r0, [r4, #0x48]
    mov r2, #0x1
    ldr r3, [r0, #0x0]
    add r0, r4, #0x1000
    ldr r1, .L_021fe094
    str r3, [sp, #0x0]
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x648]
    add r2, r1, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf28]
    add r3, r1, #0x2
    bl func_0209a0d8
    add r0, r4, #0x1000
    ldr r0, [r0, #0x648]
    mov r1, #0x0
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf28]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    add r1, r4, #0x1000
    ldr r0, [r1, #0x648]
    mvn r3, #0x63
    add r0, r4, r0, lsl #0x2
    ldr r2, [r0, #0xf28]
    mov r0, #0x100
    str r3, [r2, #0x44]
    ldr r2, [r1, #0x648]
    add r2, r4, r2, lsl #0x2
    ldr r2, [r2, #0xf28]
    ldr r3, [r2, #0xc]
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x2
    strh r2, [r3, #0x24]
    ldr r2, [r1, #0x648]
    add r2, r4, r2, lsl #0x2
    ldr r3, [r2, #0xf28]
    ldrh r2, [r3, #0x42]
    bic r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r2, [r1, #0x648]
    add r2, r4, r2, lsl #0x2
    ldr r2, [r2, #0xf28]
    strh r0, [r2, #0x3c]
    strh r0, [r2, #0x3e]
    ldr r0, [r1, #0x648]
    add r0, r4, r0, lsl #0x2
    add r0, r0, #0x1000
    ldr r0, [r0, #0x588]
    str r0, [r1, #0x648]
.L_021fe08c:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_021fe094: .word 0x222a
.size func_ov042_021fdf70, . - func_ov042_021fdf70

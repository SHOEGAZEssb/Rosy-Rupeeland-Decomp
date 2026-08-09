.text
.extern func_0209a07c
.extern func_0209a0d8
.extern func_0209a120
.extern func_0209a2a4
.extern func_02072b68
.global func_ov042_02200658
func_ov042_02200658:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    cmp r1, #0x4
    bne .L_02200830
    ldr r0, [r4, #0x4c]
    bl func_0209a07c
    ldr r0, [r4, #0x54]
    bl func_0209a07c
    ldr r0, [r4, #0x50]
    bl func_0209a07c
    ldr r0, [r4, #0x58]
    bl func_0209a07c
    ldr r1, [r4, #0x48]
    mov r0, #0x2
    ldr r2, [r1, #0x0]
    ldr r1, .L_022008e4
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x4c]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r0, [r4, #0x4c]
    mov r1, #0x9
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r1, [r4, #0x4c]
    mov r0, #0x2
    ldr lr, [r1, #0xc]
    ldr r1, .L_022008e8
    ldrh ip, [lr, #0x24]
    add r2, r1, #0x1
    add r3, r1, #0x2
    orr ip, ip, #0x2
    strh ip, [lr, #0x24]
    ldr ip, [r4, #0x48]
    ldr ip, [ip, #0x0]
    str ip, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x54]
    bl func_0209a0d8
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    ldr r2, [r0, #0xc]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x54]
    bl func_0209a2a4
    mov r2, #0x3c
    ldr r1, [r4, #0x54]
    mov r0, #0x2
    str r2, [r1, #0x44]
    ldr r2, [r4, #0x48]
    ldr r1, .L_022008ec
    ldr r3, [r2, #0x0]
    add r2, r1, #0x1
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x50]
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r0, [r4, #0x50]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r4, #0x50]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x50]
    mov r1, #0x100
    strh r1, [r0, #0x3c]
    strh r1, [r0, #0x3e]
    ldr r0, [r4, #0x50]
    sub r1, r1, #0x13c
    str r1, [r0, #0x44]
    ldr r0, [r4, #0x50]
    mov r1, #0x0
    bl func_0209a2a4
    ldr r1, [r4, #0x4c]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r4, #0x4c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r4, #0x54]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x50]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r4, #0x50]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x58]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    b .L_022008dc
.L_02200830:
    cmp r1, #0x3
    bne .L_02200864
    ldr r0, [r4, #0x48]
    ldr r1, .L_022008f0
    ldr r2, [r0, #0x0]
    mov r0, #0x1
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x50]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a0d8
    b .L_022008b8
.L_02200864:
    cmp r1, #0x2
    bne .L_02200890
    ldr r0, [r4, #0x48]
    ldr r1, .L_022008f4
    ldr r0, [r0, #0x0]
    add r2, r1, #0x4
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x50]
    add r3, r1, #0x2
    bl func_0209a120
    b .L_022008b8
.L_02200890:
    cmp r1, #0x1
    bne .L_022008b8
    ldr r0, [r4, #0x48]
    ldr r1, .L_022008f4
    ldr r0, [r0, #0x0]
    add r2, r1, #0x3
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x50]
    add r3, r1, #0x2
    bl func_0209a120
.L_022008b8:
    ldr r0, [r4, #0x50]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r4, #0x50]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_022008dc:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_022008e4: .word 0x12fa
.L_022008e8: .word 0x1670
.L_022008ec: .word 0x2227
.L_022008f0: .word 0x12eb
.L_022008f4: .word 0x12e3
.size func_ov042_02200658, . - func_ov042_02200658

.text
.extern func_ov042_021fd66c
.extern func_ov042_021fcf80
.extern func_0209a208
.extern func_02072b68
.extern data_ov042_0220b62c
.global func_ov042_02208ffc
func_ov042_02208ffc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r5, r0
    mov r7, r1
    mov r6, r2
    mov r4, r3
    bl func_ov042_021fd66c
    ldr r1, .L_0220911c
    add r0, r5, #0x50
    str r1, [r5, #0x0]
    bl func_ov042_021fcf80
    add r0, r5, #0x5c
    bl func_ov042_021fcf80
    add r0, r5, #0x68
    bl func_ov042_021fcf80
    str r7, [r5, #0x48]
    cmp r4, #0x0
    bne .L_02209068
    ldr r1, .L_02209120
    str r6, [sp, #0x0]
    mov r2, #0x2
    str r2, [sp, #0x4]
    mov r0, r5
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    b .L_02209088
.L_02209068:
    ldr r1, .L_02209124
    mov r0, r5
    str r6, [sp, #0x0]
    mov ip, #0x2
    add r2, r1, #0x1
    add r3, r1, #0x2
    str ip, [sp, #0x4]
    bl func_0209a208
.L_02209088:
    str r0, [r5, #0x4c]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r5
    ldr ip, [r0, #0x0]
    mov r2, #0x80000
    ldr r1, [r5, #0x4c]
    ldr ip, [ip, #0x0]
    sub r3, r2, #0xd0000
    blx ip
    ldr r2, [r5, #0x4c]
    mov r1, #0x0
    ldrh r0, [r2, #0x42]
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r5, #0x4c]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r5, #0x4c]
    mvn r2, #0x1d
    str r2, [r0, #0x44]
    mov r1, #0x0
    str r1, [r5, #0x58]
    str r1, [r5, #0x54]
    mov r0, #0x65
    str r0, [r5, #0x78]
    str r1, [r5, #0x7c]
    str r1, [r5, #0x80]
    strb r1, [r5, #0x8f]
    str r1, [r5, #0x84]
    str r1, [r5, #0x88]
    strh r1, [r5, #0x8c]
    mov r0, r5
    strb r4, [r5, #0x8e]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220911c: .word data_ov042_0220b62c
.L_02209120: .word 0x12ee
.L_02209124: .word 0x12f1
.size func_ov042_02208ffc, . - func_ov042_02208ffc

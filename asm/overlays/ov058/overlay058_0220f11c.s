.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern GraphicsResourceSet_Load
.extern data_020f4e18
.extern data_ov058_0220f524
.extern func_02070f34
.extern func_020b44e8

.global func_ov058_0220f11c
func_ov058_0220f11c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x1c
    ldr r3, .L_0220f220
    add r2, sp, #0x4
    mov r4, r0
    mov r1, #0xc
.L_0220f134:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_0220f134
    mov r5, #0x0
    mov r6, r5
.L_0220f14c:
    mov r0, #0x6
    mul r2, r6, r0
    add r3, sp, #0x4
    mov r0, #0xc
    add r9, r3, r2
    ldrh r1, [r9, #0x4]
    mul r7, r6, r0
    str r1, [sp, #0x0]
    ldr r0, .L_0220f224
    ldrh r2, [r3, r2]
    ldrh r3, [r9, #0x2]
    add r8, r4, #0x18
    ldr r1, [r0, #0x0]
    add r0, r8, r7
    bl GraphicsResourceSet_Load
    add r3, r4, r7
    ldr r1, [r3, #0x20]
    mov r0, r5, asr #0x4
    mov ip, #0x400
    ldr r2, [r1, #0x24]
    add lr, r5, r0, lsr #0x1b
    mov r1, #0x0
    rsb ip, ip, #0x0
    b .L_0220f1d8
.L_0220f1ac:
    mov r0, r1, lsl #0x1
    ldrh r8, [r2, r0]
    add r1, r1, #0x1
    and r7, r8, ip, lsr #0x16
    mov r7, r7, lsl #0x10
    and r9, r8, ip
    mov r8, r7, lsr #0x10
    mov r7, r9, lsl #0x10
    add r8, r8, lr, asr #0x5
    orr r7, r8, r7, lsr #0x10
    strh r7, [r2, r0]
.L_0220f1d8:
    ldr r0, [r3, #0x20]
    ldr r7, [r0, #0x20]
    ldr r8, [r7, #0xc]
    ldr r7, [r7, #0x10]
    mul r7, r8, r7
    mov r7, r7, lsl #0x1
    add r7, r7, r7, lsr #0x1f
    cmp r1, r7, asr #0x1
    blt .L_0220f1ac
    rsb r1, r6, #0xf
    bl func_02070f34
    bl func_020b44e8
    add r6, r6, #0x1
    cmp r6, #0x4
    add r5, r5, #0x2000
    blt .L_0220f14c
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_0220f220: .word data_ov058_0220f524
.L_0220f224: .word data_020f4e18
.size func_ov058_0220f11c, . - func_ov058_0220f11c

.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.

.global func_ov058_0220e6b0
func_ov058_0220e6b0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r11, #0x0
    mov ip, #0x1900
    ldr r1, [r0, #0x0]
    mov r2, #0x5
.L_0220e6c4:
    mov r3, #0x4
.L_0220e6c8:
    mov r4, #0x7
.L_0220e6cc:
    mov r5, #0x8
.L_0220e6d0:
    ldr r6, [r1, #0x4]
    str r6, [r1, #0x0]
    ldr r6, [r1, #0x8]
    str r6, [r1, #0x4]
    ldr r6, [r1, #0xc]
    str r6, [r1, #0x8]
    ldr r6, [r1, #0x10]
    str r6, [r1, #0xc]
    ldr r6, [r1, #0x14]
    str r6, [r1, #0x10]
    ldr r6, [r1, #0x18]
    str r6, [r1, #0x14]
    ldr r6, [r1, #0x1c]
    str r6, [r1, #0x18]
    ldr r6, [r1, #0x100]
    str r6, [r1, #0x1c]
    add r1, r1, #0x20
    subs r5, r5, #0x1
    bne .L_0220e6d0
    subs r4, r4, #0x1
    bne .L_0220e6cc
    mov r5, #0x8
.L_0220e728:
    ldr r6, [r1, #0x4]
    str r6, [r1, #0x0]
    ldr r6, [r1, #0x8]
    str r6, [r1, #0x4]
    ldr r6, [r1, #0xc]
    str r6, [r1, #0x8]
    ldr r6, [r1, #0x10]
    str r6, [r1, #0xc]
    ldr r6, [r1, #0x14]
    str r6, [r1, #0x10]
    ldr r6, [r1, #0x18]
    str r6, [r1, #0x14]
    ldr r6, [r1, #0x1c]
    str r6, [r1, #0x18]
    ldr r6, [r1, ip]
    str r6, [r1, #0x1c]
    add r1, r1, #0x20
    subs r5, r5, #0x1
    bne .L_0220e728
    subs r3, r3, #0x1
    bne .L_0220e6c8
    subs r2, r2, #0x1
    bne .L_0220e6c4
    mov r3, #0x4
.L_0220e788:
    mov r4, #0x7
.L_0220e78c:
    mov r5, #0x8
.L_0220e790:
    ldr r6, [r1, #0x4]
    str r6, [r1, #0x0]
    ldr r6, [r1, #0x8]
    str r6, [r1, #0x4]
    ldr r6, [r1, #0xc]
    str r6, [r1, #0x8]
    ldr r6, [r1, #0x10]
    str r6, [r1, #0xc]
    ldr r6, [r1, #0x14]
    str r6, [r1, #0x10]
    ldr r6, [r1, #0x18]
    str r6, [r1, #0x14]
    ldr r6, [r1, #0x1c]
    str r6, [r1, #0x18]
    ldr r6, [r1, #0x100]
    str r6, [r1, #0x1c]
    add r1, r1, #0x20
    subs r5, r5, #0x1
    bne .L_0220e790
    subs r4, r4, #0x1
    bne .L_0220e78c
    mov r5, #0x8
.L_0220e7e8:
    ldr r6, [r1, #0x4]
    str r6, [r1, #0x0]
    ldr r6, [r1, #0x8]
    str r6, [r1, #0x4]
    ldr r6, [r1, #0xc]
    str r6, [r1, #0x8]
    ldr r6, [r1, #0x10]
    str r6, [r1, #0xc]
    ldr r6, [r1, #0x14]
    str r6, [r1, #0x10]
    ldr r6, [r1, #0x18]
    str r6, [r1, #0x14]
    ldr r6, [r1, #0x1c]
    str r6, [r1, #0x18]
    str r11, [r1, #0x1c]
    add r1, r1, #0x20
    subs r5, r5, #0x1
    bne .L_0220e7e8
    subs r3, r3, #0x1
    bne .L_0220e788
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    bx lr
.size func_ov058_0220e6b0, . - func_ov058_0220e6b0

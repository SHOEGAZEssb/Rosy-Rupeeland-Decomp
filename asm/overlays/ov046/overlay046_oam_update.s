.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_graphics_recovery.c.
.extern data_020f4e14
.extern data_ov046_0220cdf0
.extern gSystemState

.global func_ov046_0220c1d8
func_ov046_0220c1d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, .L_0220c3a0
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x0]
    cmp r2, r1
    bne .L_0220c22c
    mov r5, #0x4000000
    ldr r2, [r5, #0x0]
    ldr r1, [r0, #0xc0]
    bic r2, r2, #0x1f00
    orr r3, r2, r1, lsl #0x8
    ldr r1, .L_0220c3a4
    ldr r2, .L_0220c3a8
    str r3, [r5, #0x0]
    ldr r4, [r2, #0x64]
    mov r2, r1, lsl #0x10
    and r3, r4, r1
    and r1, r2, r4, lsl #0x10
    orr r1, r3, r1
    str r1, [r5, #0x1c]
    b .L_0220c264
.L_0220c22c:
    ldr r5, .L_0220c3ac
    ldr r1, .L_0220c3a4
    ldr r3, [r5, #0x0]
    ldr r2, [r0, #0xc0]
    bic r3, r3, #0x1f00
    orr r3, r3, r2, lsl #0x8
    ldr r2, .L_0220c3a8
    str r3, [r5, #0x0]
    ldr r4, [r2, #0x64]
    mov r2, r1, lsl #0x10
    and r3, r4, r1
    and r1, r2, r4, lsl #0x10
    orr r1, r3, r1
    str r1, [r5, #0x1c]
.L_0220c264:
    ldr r2, .L_0220c3b0
    ldr r4, .L_0220c3b4
    ldr r9, .L_0220c3b8
    ldr r1, .L_0220c3a4
    mov r10, #0x0
    sub r3, r2, #0x4
    sub ip, r2, #0x8
    sub lr, r2, #0x1000
    sub r5, r4, #0x4
.L_0220c288:
    add r6, r0, r10, lsl #0x2
    ldr r7, [r6, #0xc8]
    cmp r7, #0x0
    blt .L_0220c390
    mov r6, #0x28
    mla r6, r7, r6, r9
    ldr r8, [r0, #0x10c]
    ldr r11, [r0, #0x110]
    ldr r7, [r6, #0x18]
    sub r8, r8, #0x80
    sub r8, r8, r7
    ldr r7, [r6, #0x1c]
    sub r11, r11, #0x60
    sub r7, r11, r7
    ldr r11, .L_0220c3a0
    ldr r6, [r0, #0x0]
    ldr r11, [r11, #0x0]
    cmp r6, r11
    bne .L_0220c338
    cmp r10, #0x0
    beq .L_0220c2f0
    cmp r10, #0x1
    beq .L_0220c308
    cmp r10, #0x2
    beq .L_0220c320
    b .L_0220c390
.L_0220c2f0:
    and r8, r8, r1
    mov r6, r7, lsl #0x10
    and r6, r6, r1, lsl #0x10
    orr r6, r8, r6
    str r6, [r5, #0x0]
    b .L_0220c390
.L_0220c308:
    and r8, r8, r1
    mov r6, r7, lsl #0x10
    and r6, r6, r1, lsl #0x10
    orr r6, r8, r6
    str r6, [r4, #0x0]
    b .L_0220c390
.L_0220c320:
    and r8, r8, r1
    mov r6, r7, lsl #0x10
    and r6, r6, r1, lsl #0x10
    orr r6, r8, r6
    str r6, [lr, #0x0]
    b .L_0220c390
.L_0220c338:
    cmp r10, #0x0
    beq .L_0220c364
    cmp r10, #0x1
    beq .L_0220c37c
    cmp r10, #0x2
    moveq r6, r7, lsl #0x10
    andeq r8, r8, r1
    andeq r6, r6, r1, lsl #0x10
    orreq r6, r8, r6
    streq r6, [r2, #0x0]
    b .L_0220c390
.L_0220c364:
    and r8, r8, r1
    mov r6, r7, lsl #0x10
    and r6, r6, r1, lsl #0x10
    orr r6, r8, r6
    str r6, [ip, #0x0]
    b .L_0220c390
.L_0220c37c:
    mov r6, r7, lsl #0x10
    and r8, r8, r1
    and r6, r6, r1, lsl #0x10
    orr r6, r8, r6
    str r6, [r3, #0x0]
.L_0220c390:
    add r10, r10, #0x1
    cmp r10, #0x3
    blt .L_0220c288
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220c3a0: .word data_020f4e14
.L_0220c3a4: .word 0x1ff
.L_0220c3a8: .word gSystemState
.L_0220c3ac: .word 0x4001000
.L_0220c3b0: .word 0x4001018
.L_0220c3b4: .word 0x4000014
.L_0220c3b8: .word data_ov046_0220cdf0
.size func_ov046_0220c1d8, . - func_ov046_0220c1d8

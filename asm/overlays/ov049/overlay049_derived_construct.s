.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_object_recovery.c.
.extern data_ov049_0220d364
.extern func_02004fe0
.extern func_0209a208
.extern func_ov049_0220b740

.global func_ov049_0220b780
func_ov049_0220b780:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    mov r5, r1
    mov r9, r2
    mov r4, r3
    bl func_ov049_0220b740
    ldr r1, .L_0220ba88
    add r0, r10, #0x8c
    str r1, [r10, #0x0]
    bl func_02004fe0
    add r0, r10, #0x9c
    bl func_02004fe0
    cmp r4, #0x0
    str r5, [r10, #0x48]
    mov r0, #0x7
    str r0, [r10, #0x88]
    cmpne r4, #0x2
    moveq r0, #0x3
    streq r0, [r10, #0x88]
    ldr r0, .L_0220ba8c
    ldr r7, [r10, #0x88]
    sub r5, r0, #0x15
    mov r6, #0x2
    mov r11, #0x0
    b .L_0220ba08
.L_0220b7e8:
    cmp r7, #0x3
    str r9, [sp, #0x0]
    bge .L_0220b8e8
    ldr r1, .L_0220ba90
    mov r0, r10
    mov r2, r1
    mov r3, r1
    add r2, r2, #0x1
    add r3, r3, #0x2
    str r6, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x4c]
    str r11, [sp, #0x0]
    str r11, [sp, #0x4]
    sub r2, r7, #0x1
    mov r0, #0x82000
    mul r4, r2, r0
    mov r0, r10
    ldr r8, [r0, #0x0]
    ldr r1, [r1, #0x4c]
    ldr r8, [r8, #0x0]
    add r2, r4, #0x200000
    mov r3, #0x258000
    blx r8
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x4c]
    mov r1, #0x1
    ldr r3, [r0, #0xc]
    add r2, r10, r7, lsl #0x1
    strb r1, [r3, #0x3a]
    mov r1, #0x0
    strh r1, [r2, #0xac]
    str r9, [sp, #0x0]
    mov r1, #0x2
    str r1, [sp, #0x4]
    ldr r1, .L_0220ba8c
    mov r0, r10
    mov r3, r1
    mov r2, r5
    add r3, r3, #0x1
    bl func_0209a208
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x68]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r10
    add r2, r4, #0x200000
    ldr r4, [r0, #0x0]
    ldr r1, [r1, #0x68]
    ldr r3, .L_0220ba94
    ldr r4, [r4, #0x0]
    blx r4
    add r2, r10, r7, lsl #0x2
    ldr r0, [r2, #0x68]
    ldr r1, [r0, #0xc]
    mov r0, #0x0
    strb r0, [r1, #0x3a]
    ldr r1, [r2, #0x68]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    b .L_0220ba08
.L_0220b8e8:
    mov r0, #0x2
    str r0, [sp, #0x4]
    add r0, r7, r7, lsr #0x1f
    mov r1, r0, asr #0x1
    mov r0, #0x6e
    mul r0, r1, r0
    ldr r1, .L_0220ba90
    mov r0, r0, lsl #0xc
    mov r2, r1
    mov r3, r1
    add r8, r0, #0x96000
    mov r0, r10
    add r2, r2, #0x1
    add r3, r3, #0x2
    bl func_0209a208
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x4c]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r2, r7, lsr #0x1f
    rsb r0, r2, r7, lsl #0x1f
    add r0, r2, r0, ror #0x1f
    mov r0, r0, lsl #0x1
    sub r2, r0, #0x1
    mov r0, #0x9b000
    mul r4, r2, r0
    mov r0, r10
    ldr ip, [r0, #0x0]
    ldr r1, [r1, #0x4c]
    ldr ip, [ip, #0x0]
    add r2, r4, #0x200000
    mov r3, r8
    blx ip
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x4c]
    mov r1, #0x1
    ldr r3, [r0, #0xc]
    add r2, r10, r7, lsl #0x1
    strb r1, [r3, #0x3a]
    mov r1, #0x0
    strh r1, [r2, #0xac]
    str r9, [sp, #0x0]
    mov r1, #0x2
    str r1, [sp, #0x4]
    ldr r1, .L_0220ba8c
    mov r0, r10
    mov r3, r1
    mov r2, r5
    add r3, r3, #0x1
    bl func_0209a208
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x68]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r10
    add r2, r4, #0x200000
    ldr r4, [r0, #0x0]
    ldr r1, [r1, #0x68]
    ldr r4, [r4, #0x0]
    sub r3, r8, #0x1e000
    blx r4
    add r2, r10, r7, lsl #0x2
    ldr r0, [r2, #0x68]
    ldr r1, [r0, #0xc]
    mov r0, #0x0
    strb r0, [r1, #0x3a]
    ldr r1, [r2, #0x68]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
.L_0220ba08:
    subs r7, r7, #0x1
    bpl .L_0220b7e8
    ldr r1, .L_0220ba90
    str r9, [sp, #0x0]
    mov r2, #0x2
    mov r0, r10
    str r2, [sp, #0x4]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0x84]
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r0, #0x3
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    ldr r1, [r10, #0x84]
    ldr r4, [r4, #0x0]
    mov r3, r2
    blx r4
    ldr r0, [r10, #0x84]
    mov r2, #0x0
    ldr r1, [r0, #0xc]
    mov r0, r10
    strb r2, [r1, #0x3a]
    ldr r2, [r10, #0x84]
    ldrh r1, [r2, #0x42]
    orr r1, r1, #0x4
    strh r1, [r2, #0x42]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220ba88: .word data_ov049_0220d364
.L_0220ba8c: .word 0x32ae
.L_0220ba90: .word 0x16a3
.L_0220ba94: .word 0x23a000
.size func_ov049_0220b780, . - func_ov049_0220b780

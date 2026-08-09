.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern data_021052fc
.extern func_0200500c
.extern func_02005058
.extern func_0201e0ec
.extern func_0209c430

.global func_ov069_02211274
func_ov069_02211274:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x194
    mov r1, #0x1000
    mov r4, r0
    add r0, sp, #0x24
    mov r2, r1
    mov r3, r1
    bl func_0200500c
    mvn r6, #0x7
    add r2, sp, #0x114
    add ip, sp, #0x124
    add r11, sp, #0x134
    add r9, sp, #0x144
    mov r0, #0x8
    add r1, sp, #0xec
    add r5, sp, #0x12c
    add r7, sp, #0x11c
    add r10, sp, #0x13c
    add r8, sp, #0x14c
    mov r3, #0x14
    str r0, [r1, #0x0]
    str r0, [r1, #0x4]
    add r1, sp, #0xfc
    str r6, [r2, #0x0]
    str r6, [r2, #0x4]
    mov r2, #0xc
    str r3, [r1, #0x0]
    str r3, [r1, #0x4]
    add r1, sp, #0x10c
    sub r3, r3, #0x20
    str r2, [r1, #0x0]
    str r2, [r1, #0x4]
    add r1, sp, #0x104
    str r6, [ip, #0x0]
    str r6, [ip, #0x4]
    add ip, sp, #0xf4
    str r0, [r5, #0x0]
    str r0, [r5, #0x4]
    sub r5, r0, #0x1c
    str r6, [sp, #0xe4]
    str r6, [sp, #0xe8]
    str r0, [r7, #0x0]
    str r0, [r7, #0x4]
    add r7, sp, #0x154
    str r3, [r1, #0x0]
    str r3, [r1, #0x4]
    sub r1, r2, #0x1c
    str r5, [ip, #0x0]
    str r5, [ip, #0x4]
    str r6, [r11, #0x0]
    str r6, [r11, #0x4]
    str r0, [r10, #0x0]
    str r0, [r10, #0x4]
    str r6, [r9, #0x0]
    str r6, [r9, #0x4]
    str r0, [r8, #0x0]
    str r0, [r8, #0x4]
    stmia r7, {r1, r3}
    add r5, sp, #0x15c
    mov r0, #0x10
    stmia r5, {r0, r2}
    add lr, sp, #0x164
    add ip, sp, #0x16c
    mov r5, #0x58000
    str r3, [lr, #0x0]
    add r9, sp, #0x17c
    add r8, sp, #0x184
    add r10, sp, #0x174
    add r7, sp, #0x18c
    str r3, [lr, #0x4]
    add lr, sp, #0x6c
    str r2, [ip, #0x0]
    str r2, [ip, #0x4]
    mov ip, #0x20000
    stmia lr, {r5, ip}
    mov r11, #0x0
    add r6, sp, #0x44
    str r11, [sp, #0x34]
    str r11, [sp, #0x38]
    stmia r6, {r5, r11}
    mov ip, #0x10000
    add r6, sp, #0x3c
    str r2, [r9, #0x0]
    str r2, [r9, #0x4]
    str r1, [r8, #0x0]
    str r1, [r8, #0x4]
    mov r1, #0x28000
    add r8, sp, #0x4c
    mov r9, #0x80000
    str r3, [r10, #0x0]
    str r3, [r10, #0x4]
    add r3, sp, #0x54
    mov r2, #0x30000
    str ip, [r6, #0x0]
    str ip, [r6, #0x4]
    str r9, [r8, #0x0]
    str r1, [r8, #0x4]
    stmia r3, {r2, ip}
    add r10, sp, #0x64
    str r0, [r7, #0x0]
    str r0, [r7, #0x4]
    mov r7, #0x48000
    stmia r10, {r7, ip}
    add lr, sp, #0x74
    add r0, sp, #0x5c
    mov r6, #0x40000
    mov r8, #0x38000
    str r7, [r0, #0x0]
    str r1, [r0, #0x4]
    str r2, [lr, #0x0]
    str r1, [lr, #0x4]
    add r0, sp, #0x7c
    stmia r0, {r6, r8}
    add r11, sp, #0x84
    mov r3, #0x60000
    ldr r0, .L_0221158c
    str r3, [r11, #0x0]
    str r1, [r11, #0x4]
    add r11, sp, #0xb4
    stmia r11, {r2, r6}
    add ip, sp, #0x9c
    add r10, sp, #0xa4
    ldr r0, [r0, #0x0]
    add lr, sp, #0xac
    add r0, r0, #0x37c
    str r9, [ip, #0x0]
    str r8, [ip, #0x4]
    str r6, [r10, #0x0]
    str r1, [r10, #0x4]
    stmia lr, {r3, r6}
    add ip, sp, #0xbc
    add r2, sp, #0xc4
    str r7, [ip, #0x0]
    str r5, [ip, #0x4]
    add ip, sp, #0x8c
    str r7, [r2, #0x0]
    add r7, sp, #0x94
    str r8, [ip, #0x4]
    mov r8, #0x70000
    str r1, [r7, #0x4]
    str r8, [ip, #0x0]
    str r8, [r7, #0x0]
    str r6, [r2, #0x4]
    add r1, sp, #0xcc
    stmia r1, {r3, r5}
    add r11, sp, #0xd4
    stmia r11, {r3, r6}
    add r10, sp, #0xdc
    add r0, r0, #0x2c00
    str r9, [r10, #0x0]
    str r5, [r10, #0x4]
    bl func_0201e0ec
    mov r1, #0x5a
    mov r9, r0
    sub r10, r1, #0x1
    ldr r5, .L_02211590
    add r8, sp, #0xe4
    mov r7, #0x0
    add r6, sp, #0x34
    mov r11, #0x14
.L_022114f4:
    add r0, r4, r10, lsl #0x2
    ldr r0, [r0, #0x7c0]
    cmp r0, #0x1
    blt .L_02211574
    add ip, r4, r10, lsl #0x4
    ldr r1, [ip, #0xa9c]
    ldr r0, [ip, #0xa98]
    rsb r3, r1, #0x0
    add r2, r0, r1
    ldr r1, [ip, #0xa94]
    add r0, sp, #0x14
    mov r3, r3, asr #0xc
    bl func_0200500c
    add r0, r4, r10, lsl #0x2
    ldr r1, [r0, #0x7c0]
    add r3, r4, r10, lsl #0x1
    mov r2, r1, lsl #0x1
    add r1, r8, r2, lsl #0x3
    str r1, [sp, #0x0]
    add r1, r6, r2, lsl #0x3
    str r7, [sp, #0x4]
    str r1, [sp, #0x8]
    str r5, [sp, #0xc]
    str r11, [sp, #0x10]
    add r3, r3, #0x500
    ldrh r3, [r3, #0xa4]
    mov r0, r9
    add r1, sp, #0x14
    add r2, sp, #0x24
    bl func_0209c430
    add r0, sp, #0x14
    bl func_02005058
.L_02211574:
    subs r10, r10, #0x1
    bpl .L_022114f4
    add r0, sp, #0x24
    bl func_02005058
    add sp, sp, #0x194
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221158c: .word data_021052fc
.L_02211590: .word 0x7fff
.size func_ov069_02211274, . - func_ov069_02211274

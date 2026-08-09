.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern __construct_array
.extern data_ov070_02212a94
.extern func_02004fe0
.extern func_02072b68
.extern func_0209a208
.extern func_ov070_0220fd20
.extern func_ov070_02210218
.extern func_ov070_02210234

.global func_ov070_0220fd60
func_ov070_0220fd60:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    mov r4, r1
    mov r9, r2
    bl func_ov070_0220fd20
    ldr r1, .L_022101f8
    add r0, r10, #0x4c
    str r1, [r10, #0x0]
    bl func_02004fe0
    add r0, r10, #0x5c
    bl func_02004fe0
    ldr r1, .L_022101fc
    add r0, r10, #0xd0
    str r1, [sp, #0x0]
    mov r1, #0x2
    mov r2, #0xc
    ldr r3, .L_02210200
    bl __construct_array
    add r0, r10, #0xe8
    bl func_ov070_02210218
    add r0, r10, #0x104
    bl func_ov070_02210218
    ldr r1, .L_022101fc
    add r0, r10, #0x148
    str r1, [sp, #0x0]
    mov r1, #0x10
    mov r2, #0xc
    ldr r3, .L_02210200
    bl __construct_array
    str r4, [r10, #0x48]
    str r9, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r1, .L_02210204
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0x6c]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r1, [r10, #0x6c]
    mov r2, #0x40000
    mov r3, #0x64000
    ldr r4, [r0, #0x0]
    ldr r4, [r4, #0x0]
    blx r4
    ldr r2, [r10, #0x6c]
    mov r1, #0x1
    ldrh r0, [r2, #0x42]
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r10, #0x6c]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    str r9, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r1, .L_02210208
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0x74]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    mov r2, #0xe000
    ldr r1, [r10, #0x74]
    ldr r4, [r4, #0x0]
    sub r3, r2, #0xbe000
    blx r4
    ldr r0, [r10, #0x74]
    mov r2, #0x0
    ldr r0, [r0, #0xc]
    mov r1, #0x14
    strb r2, [r0, #0x3a]
    ldr r0, [r10, #0x74]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r1, [r10, #0x74]
    mov r4, #0xb0000
    ldrh r0, [r1, #0x42]
    mov r5, #0x0
    mvn r7, #0x7f
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r10, #0x74]
    mov r8, #0x1
    str r7, [r0, #0x44]
    rsb r4, r4, #0x0
    mov r6, #0x2
    mov r11, r5
.L_0220fee8:
    ldr r1, .L_02210208
    str r9, [sp, #0x0]
    mov r2, r1
    mov r3, r1
    mov r0, r10
    add r2, r2, #0x1
    add r3, r3, #0x2
    str r6, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x74]
    str r5, [sp, #0x0]
    str r5, [sp, #0x4]
    mov r0, r10
    ldr ip, [r0, #0x0]
    sub r3, r8, #0x1
    mov r2, #0xc
    mul r2, r3, r2
    add r2, r2, #0x1f
    ldr r1, [r1, #0x74]
    ldr ip, [ip, #0x0]
    mov r2, r2, lsl #0xc
    mov r3, r4
    blx ip
    add r2, r10, r8, lsl #0x2
    ldr r0, [r2, #0x74]
    mov r1, r11
    ldr r0, [r0, #0xc]
    strb r11, [r0, #0x3a]
    ldr r0, [r2, #0x74]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    add r2, r10, r8, lsl #0x2
    ldr r0, [r2, #0x74]
    cmp r8, #0x1
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r2, #0x74]
    ldreqh r0, [r1, #0x42]
    biceq r0, r0, #0x4
    ldrneh r0, [r1, #0x42]
    orrne r0, r0, #0x4
    strh r0, [r1, #0x42]
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0x74]
    add r8, r8, #0x1
    str r7, [r0, #0x44]
    cmp r8, #0x5
    blt .L_0220fee8
    mov r0, #0x2
    mov r11, #0x0
    ldr r6, .L_0221020c
    sub r8, r0, #0x1
    mov r7, r0
    mov r5, r11
    mvn r4, #0x7f
.L_0220ffd0:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r6
    add r2, r6, #0x1
    add r3, r6, #0x2
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0xc8]
    str r11, [sp, #0x0]
    str r11, [sp, #0x4]
    mov r0, r10
    ldr r1, [r1, #0xc8]
    mov r2, r11
    mov r3, r11
    ldr ip, [r0, #0x0]
    ldr ip, [ip, #0x0]
    blx ip
    add r2, r10, r8, lsl #0x2
    ldr r0, [r2, #0xc8]
    mov r1, r5
    ldr r0, [r0, #0xc]
    strb r5, [r0, #0x3a]
    ldr r0, [r2, #0xc8]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    add r0, r10, r8, lsl #0x2
    ldr r1, [r0, #0xc8]
    subs r8, r8, #0x1
    ldr r2, [r1, #0xc]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    strh r1, [r2, #0x24]
    ldr r2, [r0, #0xc8]
    ldrh r1, [r2, #0x42]
    orr r1, r1, #0x4
    strh r1, [r2, #0x42]
    ldr r0, [r0, #0xc8]
    str r4, [r0, #0x44]
    bpl .L_0220ffd0
    mov r0, #0x10
    mov r5, #0xb0000
    sub r8, r0, #0x1
    rsb r5, r5, #0x0
    mov r7, #0x2
    mov r6, #0x0
    mov r11, #0x1
    mvn r4, #0x7f
.L_02210090:
    ldr r1, .L_0221020c
    str r9, [sp, #0x0]
    mov r2, r1
    mov r3, r1
    mov r0, r10
    add r2, r2, #0x1
    add r3, r3, #0x2
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x88]
    str r6, [sp, #0x0]
    str r6, [sp, #0x4]
    mov r0, r10
    ldr ip, [r0, #0x0]
    sub r3, r8, #0x1
    mov r2, #0xc
    mul r2, r3, r2
    add r2, r2, #0x1f
    ldr r1, [r1, #0x88]
    ldr ip, [ip, #0x0]
    mov r2, r2, lsl #0xc
    mov r3, r5
    blx ip
    add r2, r10, r8, lsl #0x2
    ldr r0, [r2, #0x88]
    mov r1, #0x11
    ldr r0, [r0, #0xc]
    strb r11, [r0, #0x3a]
    ldr r0, [r2, #0x88]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    add r0, r10, r8, lsl #0x2
    ldr r1, [r0, #0x88]
    subs r8, r8, #0x1
    ldr r2, [r1, #0xc]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    strh r1, [r2, #0x24]
    ldr r2, [r0, #0x88]
    ldrh r1, [r2, #0x42]
    orr r1, r1, #0x4
    strh r1, [r2, #0x42]
    ldr r0, [r0, #0x88]
    str r4, [r0, #0x44]
    bpl .L_02210090
    mov r1, #0x80000
    str r1, [r10, #0x30]
    mov r0, #0xa000
    str r0, [r10, #0x34]
    mov r2, #0x0
    str r2, [r10, #0x38]
    mov r0, #0x100
    strh r0, [r10, #0x3c]
    strh r0, [r10, #0x3e]
    ldr r0, .L_02210210
    strh r2, [r10, #0x40]
    str r2, [r0, #0x0]
    str r2, [r0, #0x8]
    str r2, [r10, #0xd4]
    str r2, [r10, #0xd8]
    str r1, [r10, #0xe0]
    mov r1, #0x2a000
    str r1, [r10, #0xe4]
    mov r0, #0x1
    str r2, [r10, #0x118]
    str r0, [r10, #0x11c]
    sub r0, r0, #0x2
    str r0, [r10, #0x120]
    mov r0, #0x7b
    str r0, [r10, #0xf4]
    mov r1, #0x50000
    ldr r0, .L_02210214
    str r1, [r10, #0xf8]
    str r0, [r10, #0xfc]
    mov r0, #0x1000
    str r0, [r10, #0x100]
    str r2, [r10, #0x130]
    str r2, [r10, #0x12c]
    str r2, [r10, #0x128]
    str r2, [r10, #0x124]
    str r2, [r10, #0x138]
    str r2, [r10, #0x134]
    add r0, r10, #0x100
    strh r2, [r0, #0x40]
    str r2, [r10, #0x144]
    mov r0, r10
    str r2, [r10, #0x13c]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022101f8: .word data_ov070_02212a94
.L_022101fc: .word func_ov070_02210234
.L_02210200: .word func_ov070_02210218
.L_02210204: .word 0x10a3
.L_02210208: .word 0x1381
.L_0221020c: .word 0x23a5
.L_02210210: .word 0x4000014
.L_02210214: .word 0x666
.size func_ov070_0220fd60, . - func_ov070_0220fd60

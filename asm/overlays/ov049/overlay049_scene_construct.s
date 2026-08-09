.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_scene_recovery.c.
.extern data_020c9670
.extern data_021052fc
.extern data_ov049_0220d31a
.extern func_02004fe0
.extern func_0200500c
.extern func_02005058
.extern func_0201e0ec
.extern func_0209b7ec
.extern func_0209b880
.extern func_0209c3b4
.extern func_0209c430
.extern func_ov049_0220c21c
.extern func_ov049_0220c23c

.global func_ov049_0220cf94
func_ov049_0220cf94:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x144
    ldr r3, .L_0220d2f4
    add r2, sp, #0x98
    mov r10, r0
    mov r1, #0x6
.L_0220cfac:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_0220cfac
    ldr r0, .L_0220d2f8
    mov r11, #0x50000
    add r9, sp, #0xfc
    mov r8, #0x30000
    add r3, sp, #0x11c
    mov ip, #0x10000
    add r4, sp, #0x114
    add r7, sp, #0x104
    add r2, sp, #0x124
    add r5, sp, #0x10c
    mov r6, #0x40000
    ldr r0, [r0, #0x0]
    str r11, [r9, #0x4]
    str r8, [r9, #0x0]
    mov r9, #0x20000
    str r11, [sp, #0xf8]
    add r0, r0, #0x37c
    str ip, [sp, #0xf4]
    add r11, sp, #0x12c
    str ip, [r7, #0x0]
    str r6, [r7, #0x4]
    str r8, [r5, #0x0]
    str r6, [r5, #0x4]
    str ip, [r4, #0x0]
    str r8, [r4, #0x4]
    str r8, [r3, #0x0]
    str r8, [r3, #0x4]
    str ip, [r2, #0x0]
    str r9, [r2, #0x4]
    stmia r11, {r8, r9}
    add lr, sp, #0x134
    add r1, sp, #0x13c
    add r0, r0, #0x2c00
    str ip, [lr, #0x0]
    str ip, [lr, #0x4]
    stmia r1, {r8, ip}
    bl func_0201e0ec
    mov r1, #0x0
    mov r5, r0
    bl func_0209b7ec
    mov r0, #0xa
    sub r9, r0, #0x1
.L_0220d064:
    add r0, r10, r9, lsl #0x1
    add r0, r0, #0x600
    ldrsh r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_0220d190
    add r0, sp, #0x48
    bl func_ov049_0220c21c
    add r0, sp, #0x54
    bl func_ov049_0220c21c
    add r0, sp, #0x60
    bl func_ov049_0220c21c
    add r0, sp, #0x6c
    bl func_ov049_0220c21c
    add r0, sp, #0x78
    bl func_ov049_0220c21c
    add r1, r10, #0x4
    mov r0, #0x3c
    mla r7, r9, r0, r1
    add r4, r10, r9, lsl #0x1
    add r0, r4, #0x600
    mov r6, #0x0
    str r0, [sp, #0x14]
    mvn r11, #0x13
.L_0220d0c0:
    mov r0, #0xc
    mul r2, r6, r0
    mov r1, #0xc000
    add r0, sp, #0x84
    str r1, [r0, r6, lsl #0x2]
    add r0, sp, #0x48
    add r8, r0, r2
    add r1, r7, r2
    mov r0, r8
    bl func_ov049_0220c23c
    ldr r1, [sp, #0x14]
    ldr r0, [r8, #0x8]
    ldrh r1, [r1, #0x58]
    add r6, r6, #0x1
    mov r1, r1, asr #0x4
    mov r2, r1, lsl #0x2
    ldr r1, .L_0220d2fc
    ldrsh r1, [r1, r2]
    smlabb r0, r1, r11, r0
    str r0, [r8, #0x8]
    cmp r6, #0x5
    blt .L_0220d0c0
    add r0, r4, #0x600
    ldrsh r2, [r0, #0x94]
    mov r1, r9, lsr #0x1f
    rsb r0, r1, r9, lsl #0x1e
    add r3, r1, r0, ror #0x1e
    add r0, r10, r9, lsl #0x1
    add r0, r0, #0x600
    add r2, r2, r2, lsr #0x1f
    mov r2, r2, asr #0x1
    tst r2, #0x1
    ldrsh r0, [r0, #0x6c]
    movne r3, #0x5
    mov r2, #0x5
    cmp r0, #0x0
    rsb r0, r9, #0x1000
    rsb r0, r0, #0x0
    mov r4, r0, lsl #0x10
    movgt r3, #0x4
    str r2, [sp, #0x0]
    mov r0, r3, lsl #0x1
    add r1, sp, #0x98
    ldrh r6, [r1, r0]
    add r1, sp, #0x48
    add r2, sp, #0x84
    add r3, sp, #0xf4
    mov r0, r5
    str r6, [sp, #0x4]
    mov r4, r4, asr #0x10
    str r4, [sp, #0x8]
    bl func_0209b880
.L_0220d190:
    subs r9, r9, #0x1
    bpl .L_0220d064
    mov r1, #0x1000
    add r0, sp, #0x38
    mov r2, r1
    mov r3, r1
    bl func_0200500c
    mov r11, #0x0
    add r0, sp, #0xb4
    mvn r3, #0x14
    mov r9, #0x20000
    add ip, sp, #0xbc
    add r2, sp, #0xac
    str r11, [r0, #0x0]
    str r11, [r0, #0x4]
    add r0, sp, #0xec
    str r9, [ip, #0x0]
    str r9, [ip, #0x4]
    mov ip, #0x80000
    str ip, [r0, #0x0]
    str r9, [r0, #0x4]
    add r8, sp, #0xc4
    str r11, [sp, #0xa4]
    str r11, [sp, #0xa8]
    str r9, [r2, #0x0]
    str r9, [r2, #0x4]
    stmia r8, {r9, r11}
    add r7, sp, #0xcc
    mov r6, #0x40000
    stmia r7, {r6, r9}
    add r4, sp, #0xd4
    stmia r4, {r6, r11}
    str r3, [sp, #0x28]
    str r3, [sp, #0x2c]
    add r3, sp, #0xdc
    mov r2, #0x60000
    add ip, sp, #0x30
    mov r0, #0x15
    stmia r3, {r2, r9}
    add r1, sp, #0xe4
    str r0, [ip, #0x0]
    str r0, [ip, #0x4]
    mov r0, r5
    stmia r1, {r2, r11}
    bl func_0209c3b4
    mov r0, #0xa
    mov r8, r11
    ldr r11, .L_0220d300
    sub r9, r0, #0x1
    add r7, sp, #0x28
    mov r6, #0x1b
    add r4, sp, #0xa4
.L_0220d260:
    add r0, r10, r9, lsl #0x1
    add r0, r0, #0x600
    ldrsh r0, [r0, #0x44]
    cmp r0, #0x0
    ble .L_0220d2dc
    add r0, sp, #0x18
    bl func_02004fe0
    mov r0, #0x3c
    mla r2, r9, r0, r10
    ldr r1, [r2, #0x20]
    add r0, r10, r9, lsl #0x1
    str r1, [sp, #0x1c]
    ldr r1, [r2, #0x24]
    add r3, r0, #0x600
    str r1, [sp, #0x20]
    str r8, [sp, #0x24]
    str r7, [sp, #0x0]
    str r6, [sp, #0x4]
    ldrsh r2, [r3, #0x44]
    mov r0, r5
    add r1, sp, #0x18
    add r2, r4, r2, lsl #0x4
    str r2, [sp, #0x8]
    str r11, [sp, #0xc]
    mov r2, #0x14
    str r2, [sp, #0x10]
    ldrh r3, [r3, #0x94]
    add r2, sp, #0x38
    bl func_0209c430
    add r0, sp, #0x18
    bl func_02005058
.L_0220d2dc:
    subs r9, r9, #0x1
    bpl .L_0220d260
    add r0, sp, #0x38
    bl func_02005058
    add sp, sp, #0x144
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220d2f4: .word data_ov049_0220d31a
.L_0220d2f8: .word data_021052fc
.L_0220d2fc: .word data_020c9670
.L_0220d300: .word 0x7fff
.size func_ov049_0220cf94, . - func_ov049_0220cf94

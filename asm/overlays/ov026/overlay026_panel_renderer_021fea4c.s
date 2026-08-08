.text

/* Exact fallback; see src/overlays/ov026/overlay026_panel_renderer.c. */
.extern func_02070454
.extern func_02070464
.extern func_02077d4c
.extern func_02077d5c
.extern func_02077d6c
.extern func_ov026_021fd900
.extern func_ov026_021fd940
.extern func_ov026_021fd964
.extern func_ov026_021fd990


    .global func_ov026_021fea4c
func_ov026_021fea4c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c
    ldr r3, L_021fec24
    mov r1, #0x0
    mov r10, r0
    str r1, [r3, #0x0]
    ldr r2, [r10, #0x30]
    ldr r1, [r10, #0x20]
    ldr r0, [r10, #0x10]
    str r0, [r3, #0x2c]
    str r1, [r3, #0x2c]
    str r2, [r3, #0x2c]
    ldr r6, [r10, #0x9c]
    mov r0, r6
    bl func_02077d4c
    mov r5, r0
    ldr r0, [r10, #0x9c]
    bl func_02077d5c
    mov r4, r0
    mov r0, r6
    bl func_02077d6c
    mov r1, #0x3
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r2, r4
    ldr r4, [r6, #0x10]
    mov r3, r0
    ldr r4, [r4, #0xc]
    mov r0, r5
    mov r1, #0x1
    str r4, [sp, #0xc]
    bl func_ov026_021fd900
    ldr r0, [r10, #0x9c]
    ldr r1, [r0, #0x14]
    ldr r4, [r1, #0xc]
    bl func_02077d4c
    mov r1, r0
    mov r0, r4
    bl func_ov026_021fd940
    ldr r0, [r10, #0x9c]
    ldr r0, [r0, #0x4]
    bl func_02070454
    mov r6, r0, lsl #0xc
    ldr r0, [r10, #0x9c]
    ldr r0, [r0, #0x4]
    bl func_02070464
    mov r7, r0, lsl #0xc
    ldr r0, L_021fec28
    mov r8, #0x0
    sub r11, r0, #0x80
    sub r0, r0, #0x78
    str r0, [sp, #0x10]
    ldr r0, L_021fec28
    sub r5, r0, #0x74
    sub r4, r0, #0x68
    ldr r0, L_021fec2c
    sub r0, r0, #0x20000000
    str r0, [sp, #0x14]
    ldr r0, L_021fec2c
    rsb r0, r0, #0x10000
    str r0, [sp, #0x18]
    b L_021fec04
L_021feb4c:
    ldr r1, [r10, #0xa4]
    ldrh r0, [r10, #0xaa]
    mul r1, r8, r1
    str r0, [sp, #0x0]
    mov r0, r1, lsl #0x10
    mov r9, r0, asr #0x10
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x3
    add r3, r8, #0x4
    str r0, [sp, #0x4]
    bl func_ov026_021fd964
    mov r0, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    orr r2, r0, #0xf000
    ldr r0, L_021fec28
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldrh r3, [r10, #0xa8]
    mov r1, #0x0
    mov r9, r1
    str r3, [r11, #0x0]
    ldr r3, [sp, #0x10]
    mov r0, r6
    str r9, [r3, #0x0]
    str r2, [r5, #0x0]
    mov r2, #0x1000
    str r2, [r5, #0x0]
    bl func_ov026_021fd990
    ldr r0, L_021fec2c
    mov r1, r7
    str r0, [r4, #0x0]
    mov r0, r6
    bl func_ov026_021fd990
    ldr r0, [sp, #0x14]
    mov r1, r7
    str r0, [r4, #0x0]
    mov r0, r9
    bl func_ov026_021fd990
    ldr r0, [sp, #0x18]
    mov r1, r9
    str r0, [r4, #0x0]
    ldr r0, L_021fec28
    add r8, r8, #0x1
    str r1, [r0, #0x4]
L_021fec04:
    ldr r0, [r10, #0xa0]
    cmp r8, r0
    blt L_021feb4c
    ldr r0, L_021fec30
    mov r1, #0x1
    str r1, [r0, #0x0]
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fec24: .word 0x4000444
L_021fec28: .word 0x4000500
L_021fec2c: .word 0x10001000
L_021fec30: .word 0x4000448
.size func_ov026_021fea4c, .-func_ov026_021fea4c


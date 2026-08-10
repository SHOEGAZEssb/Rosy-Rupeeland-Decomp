    .text
    .extern GraphicsSpriteCanvas_FillRect
    .extern func_02075598
    .extern func_ov000_021fc834
    .extern func_02062ba4
    .extern func_ov000_021fb6e0
    .global func_ov000_021fc714
func_ov000_021fc714:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r10, r0
    ldr r2, [r10, #0x264]
    mov r0, #0x0
    rsb r1, r2, #0xa9
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r10, #0x4]
    rsb r2, r2, #0x3d
    mov r1, #0x3b
    mov r3, #0xef
    bl GraphicsSpriteCanvas_FillRect
    ldr r0, [r10, #0x4]
    ldr r1, [r10, #0x228]
    bl func_02075598
    mov r4, #0x0
L_021fc758:
    ldr r1, [r10, #0x26c]
    mov r0, #0x24
    ldr r1, [r1, #0xc]
    mul r8, r4, r0
    add r0, r4, r1
    add r0, r0, r0, lsl #0x2
    str r0, [sp, #0xc]
    mov r5, #0x0
    b L_021fc818
L_021fc77c:
    ldr r0, [sp, #0xc]
    ldr r1, [r10, #0x254]
    add r9, r0, r5
    cmp r9, r1
    bge L_021fc820
    ldr r0, [r10, #0x250]
    add r0, r0, r9, lsl #0x5
    ldr r1, [r0, #0xc]
    cmp r1, #0x0
    beq L_021fc814
    mov r1, #0x1
    bl func_ov000_021fc834
    cmp r0, #0x0
    bne L_021fc814
    ldr r0, [r10, #0x250]
    ldr r2, [r10, #0x264]
    add r1, r0, r9, lsl #0x5
    ldr r7, [r1, #0x1c]
    mov r1, #0x24
    mul r11, r5, r1
    add r0, r0, r9, lsl #0x5
    mov r1, #0xd
    ldr r0, [r0, #0xc]
    cmp r7, #0x63
    str r1, [sp, #0x8]
    movge r1, #0x7
    sub r6, r8, r2
    strge r1, [sp, #0x8]
    bl func_02062ba4
    cmp r0, #0x0
    beq L_021fc814
    ldr r0, [sp, #0x8]
    mov r1, r7
    str r0, [sp, #0x0]
    ldr r0, [r10, #0x4]
    add r2, r11, #0x3b
    add r3, r6, #0x3d
    bl func_ov000_021fb6e0
L_021fc814:
    add r5, r5, #0x1
L_021fc818:
    cmp r5, #0x5
    blt L_021fc77c
L_021fc820:
    add r4, r4, #0x1
    cmp r4, #0x3
    blt L_021fc758
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size func_ov000_021fc714, .-func_ov000_021fc714

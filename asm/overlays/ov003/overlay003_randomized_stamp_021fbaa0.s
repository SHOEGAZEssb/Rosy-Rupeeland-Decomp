    .text
    .extern data_ov003_021fbce0
    .extern data_ov003_021fbb40
    .global func_ov003_021fbaa0
L_ov003_center_pixel = func_ov003_021fbaa0 - 0x140
L_ov003_neighbor_pixel = func_ov003_021fbaa0 - 0xf4
func_ov003_021fbaa0: ; 0x021fbaa0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    mov r8, #0xf
    ldr r3, L_021fbb2c
    ldr r4, [r3, #0x0]
    add r4, r4, #0x1
    cmp r4, #0x32
    movge r4, #0x0
    str r4, [r3, #0x0]
    ldr r3, L_021fbb30
    mov r4, r4, lsl #0x3
    ldr r5, [r3, r4]
    add r4, r4, #0x4
    ldr r4, [r3, r4]
    add r11, r1, r5
    add ip, r2, r4
    bl L_ov003_center_pixel
    sub r5, r5, #0x1
    add r11, r1, r5
    add ip, r2, r4
    bl L_ov003_neighbor_pixel
    add r5, r5, #0x2
    add r11, r1, r5
    add ip, r2, r4
    bl L_ov003_neighbor_pixel
    sub r5, r5, #0x1
    sub r4, r4, #0x1
    add r11, r1, r5
    add ip, r2, r4
    bl L_ov003_neighbor_pixel
    add r4, r4, #0x2
    add r11, r1, r5
    add ip, r2, r4
    bl L_ov003_neighbor_pixel
    ldmia sp!, {r3, r4, r5, r6, r7, r8, lr}
    bx lr
L_021fbb2c: .word data_ov003_021fbce0
L_021fbb30: .word data_ov003_021fbb40
    .size func_ov003_021fbaa0, .-func_ov003_021fbaa0

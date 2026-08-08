.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_display_setup.c. */
.extern data_ov041_022059e4
.extern func_020b1e5c
.extern func_020b44e8
.extern func_020b4554

    .global func_ov041_021fe498
func_ov041_021fe498: ; 0x021fe498
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r1, .L_021fe560
    mov lr, #0x0
    ldr r0, [r1, #0x0]
    mov r2, lr
    bic r0, r0, #0x60
    orr r0, r0, #0x20
    str r0, [r1, #0x0]
    ldr r1, .L_021fe564
    mov ip, lr
.L_021fe4c0:
    str ip, [r1, r2, lsl #0x3]
    add r0, r1, r2, lsl #0x3
    add r2, r2, #0x1
    str ip, [r0, #0x4]
    cmp r2, #0x80
    blt .L_021fe4c0
    ldr r0, .L_021fe564
    ldr r6, .L_021fe568
    mov r2, #0x0
.L_021fe4e4:
    mov r1, ip, asr #0x2
    and r4, ip, #0xff
    add r1, ip, r1, lsr #0x1d
    mov r3, r2
    orr r4, r4, r6
    mov r1, r1, asr #0x3
.L_021fe4fc:
    mov r5, r3, asr #0x2
    add r5, r3, r5, lsr #0x1d
    mov r7, r3, lsl #0x17
    mov r5, r5, asr #0x3
    orr r8, r4, r7, lsr #0x7
    add r7, r5, r1, lsl #0x5
    add r3, r3, #0x40
    str r8, [r0, lr, lsl #0x3]
    add r5, r0, lr, lsl #0x3
    orr r7, r7, #0xf000
    strh r7, [r5, #0x4]
    cmp r3, #0x100
    add lr, lr, #0x1
    blt .L_021fe4fc
    add ip, ip, #0x40
    cmp ip, #0xc0
    blt .L_021fe4e4
    mov r1, #0x400
    bl func_020b4554
    bl func_020b44e8
    ldr r0, .L_021fe564
    mov r1, #0x0
    mov r2, #0x400
    bl func_020b1e5c
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_021fe560: .word 0x4001000
.L_021fe564: .word data_ov041_022059e4
.L_021fe568: .word 0xc0000c00
    .size func_ov041_021fe498, . - func_ov041_021fe498


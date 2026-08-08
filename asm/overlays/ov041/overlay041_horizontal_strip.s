.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_capture_update.c. */
.extern data_ov041_02205870
.extern data_ov041_02205890
.extern func_020b1ac4
.extern func_020befec

    .global func_ov041_021fe6e4
func_ov041_021fe6e4: ; 0x021fe6e4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r0, [r4, #0x1f4]
    cmp r0, #0x2
    ldreq r5, .L_021fe78c
    ldr r0, [r4, #0x1ec]
    ldrne r5, .L_021fe790
    cmp r0, #0x0
    moveq r2, #0xc
    ldr r0, [r4, #0x178]
    movne r2, #0x0
    sub r0, r0, r2
    add r6, r1, r0
    mov r0, r6
    mov r1, #0x6
    bl func_020befec
    ldr r1, [r4, #0x174]
    bl func_020befec
    mov r2, r6, lsl #0x1c
    ldrb r1, [r5, r1]
    mov r0, #0xc
    mov r7, r2, lsr #0x15
    smulbb r5, r1, r0
    mov r0, r6
    add r6, r4, #0xf8
    mov r1, #0x6
    bl func_020befec
    ldr r0, [r6, r5]
    mov r4, r1, lsl #0x6
    ldr r0, [r0, #0x24]
    mov r1, r7
    add r0, r0, r4, lsl #0x1
    mov r2, #0x80
    bl func_020b1ac4
    ldr r0, [r6, r5]
    add r1, r7, #0x800
    ldr r0, [r0, #0x24]
    mov r2, #0x80
    add r0, r0, r4, lsl #0x1
    add r0, r0, #0x800
    bl func_020b1ac4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021fe78c: .word data_ov041_02205870
.L_021fe790: .word data_ov041_02205890
    .size func_ov041_021fe6e4, . - func_ov041_021fe6e4


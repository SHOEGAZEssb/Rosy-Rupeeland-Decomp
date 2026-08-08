.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_capture_update.c. */
.extern data_ov041_02205870
.extern data_ov041_02205890
.extern func_020b1b94
.extern func_020befec

    .global func_ov041_021fe794
func_ov041_021fe794: ; 0x021fe794
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r0, [r4, #0x1f4]
    cmp r0, #0x2
    ldreq r6, .L_021fe81c
    ldr r0, [r4, #0x1ec]
    ldrne r6, .L_021fe820
    cmp r0, #0x0
    moveq r2, #0xc
    ldr r0, [r4, #0x178]
    movne r2, #0x0
    rsb r0, r2, r0, asr #0x2
    add r5, r1, r0
    add r0, r5, #0x20
    mov r1, #0x6
    bl func_020befec
    ldr r1, [r4, #0x174]
    bl func_020befec
    mov r7, r1
    add r0, r5, #0x20
    mov r1, #0x6
    bl func_020befec
    add r2, r5, #0x20
    mov r3, r2, lsl #0x1c
    ldrb ip, [r6, r7]
    mov r0, #0xc
    mov r2, #0x80
    mla r0, ip, r0, r4
    ldr r0, [r0, #0x98]
    ldr r0, [r0, #0x24]
    add r0, r0, r1, lsl #0x7
    mov r1, r3, lsr #0x15
    bl func_020b1b94
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021fe81c: .word data_ov041_02205870
.L_021fe820: .word data_ov041_02205890
    .size func_ov041_021fe794, . - func_ov041_021fe794


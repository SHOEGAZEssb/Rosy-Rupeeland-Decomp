.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_touch_helpers.c. */
.extern data_ov041_02205870
.extern data_ov041_02205890
.extern func_020befec

    .global func_ov041_021feb54
func_ov041_021feb54: ; 0x021feb54
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, [r7, #0x1f4]
    mov r6, r1
    cmp r0, #0x2
    ldreq r4, .L_021febc8
    mov r5, r2, asr #0x3
    ldrne r4, .L_021febcc
    mov r0, r5
    mov r1, #0xc
    bl func_020befec
    ldrb r3, [r4, r0]
    mov r1, #0xc
    mov r0, r5
    mla r2, r3, r1, r7
    ldr r2, [r2, #0xf8]
    ldr r4, [r2, #0x24]
    bl func_020befec
    mov r0, r6, asr #0x3
    and r2, r6, #0xf00
    and r0, r0, #0x1f
    mov r5, r1
    add r0, r0, r2, lsl #0x2
    add r0, r0, r5, lsl #0x5
    mov r0, r0, lsl #0x1
    ldrh r1, [r4, r0]
    ldr r0, .L_021febd0
    and r0, r1, r0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021febc8: .word data_ov041_02205870
.L_021febcc: .word data_ov041_02205890
.L_021febd0: .word 0x3ff
    .size func_ov041_021feb54, . - func_ov041_021feb54


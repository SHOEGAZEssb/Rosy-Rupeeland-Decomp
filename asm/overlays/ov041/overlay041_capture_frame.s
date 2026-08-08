.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_capture_update.c. */
.extern data_027e0000
.extern data_ov041_022059e0
.extern func_020b1784
.extern func_020befec
.extern func_ov041_021fdd38
.extern func_ov041_021fe110
.extern func_ov041_021fe31c
.extern func_ov041_021fe824
.extern func_ov041_021fe8b8

    .global func_ov041_021fe594
func_ov041_021fe594: ; 0x021fe594
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x1f0]
    cmp r0, #0x0
    beq .L_021fe6bc
    ldr r0, .L_021fe6d4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    tst r0, #0x8000000
    ldreq r0, .L_021fe6d8
    ldreqh r0, [r0, #0x0]
    mov r0, #0x5000000
    strh r1, [r0, #0x0]
    add r0, r0, #0x400
    strh r1, [r0, #0x0]
    ldr r0, [r4, #0x1f8]
    cmp r0, #0x0
    bne .L_021fe660
    ldr r1, [r4, #0x194]
    mov r0, r4
    mov r1, r1, asr #0x10
    str r1, [r4, #0x178]
    bl func_ov041_021fe824
    ldr r0, [r4, #0x1f4]
    cmp r0, #0x0
    cmpne r0, #0x2
    bne .L_021fe658
    ldr ip, .L_021fe6dc
    mov r1, #0x0
    ldr r0, [ip, #0x0]
    mov r3, r1
    add lr, r0, #0x1
    mov r0, #0x1
    mov r2, #0x1e
    str lr, [ip, #0x0]
    bl func_ov041_021fdd38
    ldr r0, .L_021fe6dc
    mov r1, #0x5
    ldr r0, [r0, #0x0]
    bl func_020befec
    mov r1, #0x3
    bl func_020befec
    add r0, r4, r1, lsl #0x2
    ldr r0, [r0, #0x168]
    mov r1, #0x1000
    add r0, r0, #0x24
    mov r2, r1
    add r0, r0, #0x1000
    bl func_020b1784
.L_021fe658:
    mov r0, r4
    bl func_ov041_021fe8b8
.L_021fe660:
    ldr r0, [r4, #0x1ec]
    cmp r0, #0x0
    mov r0, r4
    beq .L_021fe678
    bl func_ov041_021fe31c
    b .L_021fe67c
.L_021fe678:
    bl func_ov041_021fe110
.L_021fe67c:
    mov r1, #0x0
    str r1, [r4, #0x1f0]
    ldr r0, [r4, #0x1ec]
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, .L_021fe6d8
    str r1, [r4, #0x1ec]
    ldrh r0, [r0, #0x0]
    tst r0, #0x1
    beq .L_021fe6bc
    ldr r1, .L_021fe6d4
.L_021fe6a8:
    ldr r0, [r1, #0x0]
    tst r0, #0x8000000
    bne .L_021fe6a8
    ldr r0, .L_021fe6d8
    ldrh r0, [r0, #0x0]
.L_021fe6bc:
    ldr r0, .L_021fe6e0
    add r0, r0, #0x3000
    ldr r1, [r0, #0xff8]
    orr r1, r1, #0x1
    str r1, [r0, #0xff8]
    ldmia sp!, {r4, pc}
.L_021fe6d4: .word 0x4000600
.L_021fe6d8: .word 0x4000004
.L_021fe6dc: .word data_ov041_022059e0
.L_021fe6e0: .word data_027e0000
    .size func_ov041_021fe594, . - func_ov041_021fe594


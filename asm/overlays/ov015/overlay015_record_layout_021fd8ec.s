    .text
    .extern data_ov015_021feb84
    .extern data_ov015_021feb88
    .extern func_02095820
    .extern func_02095928

/* Exact fallback for record layout; see src/overlays/ov015/overlay015_record_layout.c. */
    .global func_ov015_021fd8ec

func_ov015_021fd8ec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r7, r0
    ldr r0, [r7, #0x300]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    cmp r0, #0x1
    beq L_021fd920
    cmp r0, #0x2
    beq L_021fd944
    cmp r0, #0x3
    beq L_021fd994
    b L_021fd9e0
L_021fd920:
    ldr r3, [r7, #0x198]
    mov r1, #0x80
    add r0, r7, #0xfc
    mov r2, #0xaa
    strh r1, [r3, #0x2c]
    bl func_02095820
    add r0, r7, #0xfc
    bl func_02095928
    b L_021fd9e0
L_021fd944:
    ldr r4, L_021fd9e8
    mov r6, #0x0
    add r10, r7, #0xfc
    mov r9, #0xaa
    mov r8, #0xac
L_021fd958:
    mul r5, r6, r8
    mov r1, r6, lsl #0x1
    add r0, r7, r5
    ldrsh r1, [r4, r1]
    ldr r3, [r0, #0x198]
    mov r2, r9
    add r0, r10, r5
    strh r1, [r3, #0x2c]
    bl func_02095820
    add r0, r10, r5
    bl func_02095928
    add r6, r6, #0x1
    cmp r6, #0x2
    blt L_021fd958
    b L_021fd9e0
L_021fd994:
    ldr r4, L_021fd9ec
    mov r6, #0x0
    add r10, r7, #0xfc
    mov r9, #0xaa
    mov r8, #0xac
L_021fd9a8:
    mul r5, r6, r8
    mov r1, r6, lsl #0x1
    add r0, r7, r5
    ldrsh r1, [r4, r1]
    ldr r3, [r0, #0x198]
    mov r2, r9
    add r0, r10, r5
    strh r1, [r3, #0x2c]
    bl func_02095820
    add r0, r10, r5
    bl func_02095928
    add r6, r6, #0x1
    cmp r6, #0x3
    blt L_021fd9a8
L_021fd9e0:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021fd9e8: .word data_ov015_021feb84
L_021fd9ec: .word data_ov015_021feb88

    .size func_ov015_021fd8ec, . - func_ov015_021fd8ec

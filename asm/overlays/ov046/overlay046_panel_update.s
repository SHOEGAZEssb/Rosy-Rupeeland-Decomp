.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_panel_update.c.
.extern data_020d780c
.extern data_020d7838
.extern data_021052fc
.extern data_ov046_0220cd14
.extern data_ov046_0220cd18
.extern data_ov046_0220cd1c
.extern data_ov046_0220ce08
.extern data_ov046_0220ce0c
.extern func_0200eb0c
.extern func_020befec
.extern gGameWork

.global func_ov046_0220c4a0
func_ov046_0220c4a0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r2, [r10, #0x38]
    ldr r0, .L_0220c78c
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl func_0200eb0c
    ldr r1, .L_0220c78c
    ldr r7, [r0, #0x0]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x24
    bl func_0200eb0c
    ldrsb r9, [r0, #0x4d]
    ldr r1, .L_0220c78c
    mov r0, #0x14
    ldr r1, [r1, #0x0]
    smulbb r3, r9, r0
    ldr r2, .L_0220c790
    add r0, r1, #0x2000
    cmp r9, #0x63
    ldr r1, [r2, r3]
    ldr r6, [r0, #0xea4]
    bne .L_0220c5dc
    ldr r1, .L_0220c794
    mov r0, #0x0
    ldr r1, [r1, #0x0]
    ldr r3, .L_0220c798
    add r1, r1, #0x100
    ldrsh r4, [r1, #0xe0]
    mov r1, #0x34
    b .L_0220c5d0
.L_0220c528:
    mla r2, r0, r1, r3
    ldr r5, [r2, #0x30]
    b .L_0220c5c0
.L_0220c534:
    cmp r2, r4
    bne .L_0220c5bc
    add r1, r10, r0, lsl #0x2
    ldr r1, [r1, #0xe0]
    ldr r7, .L_0220c79c
    cmp r1, #0x2
    ldreq r2, [r10, #0x38]
    ldreqh r1, [r2, #0x24]
    biceq r1, r1, #0x4
    streqh r1, [r2, #0x24]
    mov r1, #0x14
    mul r4, r0, r1
    ldr r2, .L_0220c790
    mov r1, #0x28
    ldr r6, [r2, r4]
    ldr r2, .L_0220c7a0
    mul r3, r6, r1
    ldr r1, .L_0220c7a4
    ldr r2, [r2, r4]
    ldr r8, [r1, r3]
    mov r1, #0x30
    mla r1, r2, r1, r8
    ldrsh r2, [r5, #0x4]
    ldrsh r8, [r5, #0x2]
    ldr r6, .L_0220c7a8
    ldr r5, [r7, r3]
    ldr r3, [r6, r4]
    ldr r4, [r10, #0x38]
    add r3, r5, r3, lsl #0x6
    add r3, r8, r3
    strh r3, [r4, #0x2c]
    add r1, r2, r1
    strh r1, [r4, #0x2e]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220c5bc:
    add r5, r5, #0x8
.L_0220c5c0:
    ldrh r2, [r5, #0x0]
    cmp r2, #0x0
    bne .L_0220c534
    add r0, r0, #0x1
.L_0220c5d0:
    cmp r0, #0xb
    blt .L_0220c528
    b .L_0220c784
.L_0220c5dc:
    cmp r9, #0x0
    blt .L_0220c784
    mov r0, #0x34
    mul ip, r9, r0
    ldr r0, .L_0220c798
    mov r4, #0x0
    add r2, r0, ip
    ldrh r3, [r2, #0x6]
    ldrh r8, [r2, #0x4]
    mov r11, r4
    b .L_0220c6dc
.L_0220c608:
    mla r0, r4, r8, r2
    mov r5, r11
    b .L_0220c6d0
.L_0220c614:
    add lr, r5, r0
    ldrb lr, [lr, #0x8]
    cmp r7, lr
    bne .L_0220c6cc
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0xe0]
    cmp r0, #0x2
    ldreq r2, [r10, #0x38]
    ldreqh r0, [r2, #0x24]
    biceq r0, r0, #0x4
    streqh r0, [r2, #0x24]
    ldr r0, [r6, #0x20]
    mov r2, #0x14
    mov r3, r0, asr #0xc
    mov r0, #0x30
    mul r0, r3, r0
    mov r3, #0x28
    mul r8, r1, r3
    mul r7, r9, r2
    mov r1, #0x300
    bl func_020befec
    ldr r1, .L_0220c7a0
    ldr r11, .L_0220c7a4
    ldr r3, [r1, r7]
    ldr r1, [r6, #0x1c]
    add r4, r4, r3
    ldr r2, .L_0220c79c
    ldr r11, [r11, r8]
    mov r3, #0x30
    mla r3, r4, r3, r11
    ldr ip, .L_0220c7a8
    mov r6, r1, asr #0xc
    ldr r1, [ip, r7]
    mov r7, r6, lsl #0x6
    add r3, r3, r0
    ldr r2, [r2, r8]
    add r0, r5, r1
    add r1, r2, r0, lsl #0x6
    mov r6, r7, asr #0x9
    add r0, r7, r6, lsr #0x16
    ldr r2, [r10, #0x38]
    add r0, r1, r0, asr #0xa
    strh r0, [r2, #0x2c]
    mov r0, r9
    strh r3, [r2, #0x2e]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220c6cc:
    add r5, r5, #0x1
.L_0220c6d0:
    cmp r5, r8
    blt .L_0220c614
    add r4, r4, #0x1
.L_0220c6dc:
    cmp r4, r3
    blt .L_0220c608
    ldr r0, .L_0220c7ac
    ldr r4, [r0, ip]
    b .L_0220c778
.L_0220c6f0:
    cmp r0, r7
    bne .L_0220c774
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0xe0]
    ldr r5, .L_0220c7a8
    cmp r0, #0x2
    ldreq r2, [r10, #0x38]
    ldr r6, .L_0220c79c
    ldreqh r0, [r2, #0x24]
    biceq r0, r0, #0x4
    streqh r0, [r2, #0x24]
    mov r0, #0x14
    mov r2, #0x28
    mul r3, r9, r0
    mul r2, r1, r2
    ldr r1, .L_0220c7a4
    ldr r0, .L_0220c7a0
    ldr r7, [r1, r2]
    ldr r1, [r0, r3]
    mov r0, #0x30
    mla r0, r1, r0, r7
    ldrsh r1, [r4, #0x4]
    ldrsh r7, [r4, #0x2]
    ldr r4, [r6, r2]
    ldr r2, [r5, r3]
    add r1, r1, r0
    add r2, r4, r2, lsl #0x6
    ldr r3, [r10, #0x38]
    add r2, r7, r2
    strh r2, [r3, #0x2c]
    mov r0, r9
    strh r1, [r3, #0x2e]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220c774:
    add r4, r4, #0x8
.L_0220c778:
    ldrh r0, [r4, #0x0]
    cmp r0, #0x0
    bne .L_0220c6f0
.L_0220c784:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220c78c: .word data_021052fc
.L_0220c790: .word data_ov046_0220cd14
.L_0220c794: .word gGameWork
.L_0220c798: .word data_020d780c
.L_0220c79c: .word data_ov046_0220ce08
.L_0220c7a0: .word data_ov046_0220cd1c
.L_0220c7a4: .word data_ov046_0220ce0c
.L_0220c7a8: .word data_ov046_0220cd18
.L_0220c7ac: .word data_020d7838
.size func_ov046_0220c4a0, . - func_ov046_0220c4a0

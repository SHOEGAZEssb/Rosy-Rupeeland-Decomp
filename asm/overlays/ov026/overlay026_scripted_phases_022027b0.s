.text

/* Exact fallback; see src/overlays/ov026/overlay026_scripted_phases.c. */
.extern data_ov026_022045a8
.extern data_ov026_022045b8
.extern data_ov026_022045c8
.extern data_ov026_022045e8
.extern data_ov026_02204648
.extern data_ov026_02204728
.extern func_020befec
.extern func_ov026_0220035c
.extern func_ov026_022013c0
.extern func_ov026_02201400


    .global func_ov026_022027b0
func_ov026_022027b0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b L_02202ae8
L_022027c8: ; jump table
    b L_022027e4 ; case 0
    b L_02202838 ; case 1
    b L_022028bc ; case 2
    b L_02202940 ; case 3
    b L_022029c4 ; case 4
    b L_02202a48 ; case 5
    b L_02202ac0 ; case 6
L_022027e4:
    mov r1, #0x400
    sub r2, r1, #0x5400
    bl func_ov026_022013c0
    mov r0, r4
    bl func_ov026_02201400
    ldr r5, [r4, #0x60]
    ldr r0, [r4, #0x5c]
    mov r1, #0x6
    bl func_020befec
    add r0, r5, r0
    str r0, [sp, #0x0]
    mov r3, r5
    mov r0, r4
    ldr r1, L_02202af0
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02202838:
    add r1, r4, #0x394
    ldr r0, [r1, #0x404]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r1, #0x400]
    ldrne r1, [r2, r1]
    ldreq r1, [r1, #0x400]
    blx r1
    cmp r0, #0x0
    beq L_02202ae8
    ldr r6, [r4, #0x5c]
    ldr r7, [r4, #0x60]
    mov r0, r6
    mov r1, #0x6
    bl func_020befec
    mov r5, r0
    mov r0, r6, lsl #0x1
    mov r1, #0x6
    bl func_020befec
    add r0, r7, r0
    ldr r1, L_02202af4
    str r0, [sp, #0x0]
    mov r0, r4
    add r3, r7, r5
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202ae8
L_022028bc:
    add r1, r4, #0x394
    ldr r0, [r1, #0x404]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r1, #0x400]
    ldrne r1, [r2, r1]
    ldreq r1, [r1, #0x400]
    blx r1
    cmp r0, #0x0
    beq L_02202ae8
    ldr r6, [r4, #0x5c]
    ldr r7, [r4, #0x60]
    mov r0, r6, lsl #0x1
    mov r1, #0x6
    bl func_020befec
    mov r5, r0
    add r0, r6, r6, lsl #0x1
    mov r1, #0x6
    bl func_020befec
    add r0, r7, r0
    ldr r1, L_02202af8
    str r0, [sp, #0x0]
    mov r0, r4
    add r3, r7, r5
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202ae8
L_02202940:
    add r1, r4, #0x394
    ldr r0, [r1, #0x404]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r1, #0x400]
    ldrne r1, [r2, r1]
    ldreq r1, [r1, #0x400]
    blx r1
    cmp r0, #0x0
    beq L_02202ae8
    ldr r6, [r4, #0x5c]
    ldr r7, [r4, #0x60]
    add r0, r6, r6, lsl #0x1
    mov r1, #0x6
    bl func_020befec
    mov r5, r0
    mov r0, r6, lsl #0x2
    mov r1, #0x6
    bl func_020befec
    add r0, r7, r0
    ldr r1, L_02202afc
    str r0, [sp, #0x0]
    mov r0, r4
    add r3, r7, r5
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202ae8
L_022029c4:
    add r1, r4, #0x394
    ldr r0, [r1, #0x404]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r1, #0x400]
    ldrne r1, [r2, r1]
    ldreq r1, [r1, #0x400]
    blx r1
    cmp r0, #0x0
    beq L_02202ae8
    ldr r6, [r4, #0x5c]
    ldr r7, [r4, #0x60]
    mov r0, r6, lsl #0x2
    mov r1, #0x6
    bl func_020befec
    mov r5, r0
    add r0, r6, r6, lsl #0x2
    mov r1, #0x6
    bl func_020befec
    add r0, r7, r0
    ldr r1, L_02202b00
    str r0, [sp, #0x0]
    mov r0, r4
    add r3, r7, r5
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202ae8
L_02202a48:
    add r1, r4, #0x394
    ldr r0, [r1, #0x404]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r1, #0x400]
    ldrne r1, [r2, r1]
    ldreq r1, [r1, #0x400]
    blx r1
    cmp r0, #0x0
    beq L_02202ae8
    ldr r0, [r4, #0x5c]
    mov r1, #0x6
    add r0, r0, r0, lsl #0x2
    bl func_020befec
    ldr r1, [r4, #0x64]
    mov r3, r0
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x60]
    ldr r2, L_02202b04
    mov r0, r4
    add r3, r1, r3
    ldmia r2, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202ae8
L_02202ac0:
    add r1, r4, #0x394
    ldr r0, [r1, #0x404]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r1, #0x400]
    ldrne r1, [r2, r1]
    ldreq r1, [r1, #0x400]
    blx r1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_02202ae8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_02202af0: .word data_ov026_02204648
L_02202af4: .word data_ov026_022045e8
L_02202af8: .word data_ov026_022045b8
L_02202afc: .word data_ov026_02204728
L_02202b00: .word data_ov026_022045c8
L_02202b04: .word data_ov026_022045a8
.size func_ov026_022027b0, .-func_ov026_022027b0


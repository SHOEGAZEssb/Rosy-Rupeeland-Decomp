.text

/* Exact fallback; see src/overlays/ov026/overlay026_scripted_phases.c. */
.extern data_ov026_022045c0
.extern data_ov026_022045d0
.extern data_ov026_022045f0
.extern data_ov026_02204658
.extern data_ov026_022046a0
.extern func_020befec
.extern func_ov026_0220035c
.extern func_ov026_022013c0


    .global func_ov026_02202220
func_ov026_02202220:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b L_022024c8
L_02202238: ; jump table
    b L_02202250 ; case 0
    b L_0220229c ; case 1
    b L_02202320 ; case 2
    b L_022023a4 ; case 3
    b L_02202428 ; case 4
    b L_022024a0 ; case 5
L_02202250:
    mov r1, #0x400
    sub r2, r1, #0x5400
    bl func_ov026_022013c0
    ldr r5, [r4, #0x60]
    ldr r0, [r4, #0x5c]
    mov r1, #0x5
    bl func_020befec
    add r0, r5, r0
    ldr r1, L_022024d0
    str r0, [sp, #0x0]
    mov r0, r4
    mov r3, r5
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_0220229c:
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
    beq L_022024c8
    ldr r6, [r4, #0x5c]
    ldr r7, [r4, #0x60]
    mov r0, r6
    mov r1, #0x5
    bl func_020befec
    mov r5, r0
    mov r0, r6, lsl #0x1
    mov r1, #0x5
    bl func_020befec
    add r0, r7, r0
    ldr r1, L_022024d4
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
    b L_022024c8
L_02202320:
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
    beq L_022024c8
    ldr r6, [r4, #0x5c]
    ldr r7, [r4, #0x60]
    mov r0, r6, lsl #0x1
    mov r1, #0x5
    bl func_020befec
    mov r5, r0
    add r0, r6, r6, lsl #0x1
    mov r1, #0x5
    bl func_020befec
    add r0, r7, r0
    ldr r1, L_022024d8
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
    b L_022024c8
L_022023a4:
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
    beq L_022024c8
    ldr r6, [r4, #0x5c]
    ldr r7, [r4, #0x60]
    add r0, r6, r6, lsl #0x1
    mov r1, #0x5
    bl func_020befec
    mov r5, r0
    mov r0, r6, lsl #0x2
    mov r1, #0x5
    bl func_020befec
    add r0, r7, r0
    ldr r1, L_022024dc
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
    b L_022024c8
L_02202428:
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
    beq L_022024c8
    ldr r0, [r4, #0x5c]
    mov r1, #0x5
    mov r0, r0, lsl #0x2
    bl func_020befec
    ldr r1, [r4, #0x64]
    mov r3, r0
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x60]
    ldr r2, L_022024e0
    mov r0, r4
    add r3, r1, r3
    ldmia r2, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022024c8
L_022024a0:
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
L_022024c8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_022024d0: .word data_ov026_022045d0
L_022024d4: .word data_ov026_02204658
L_022024d8: .word data_ov026_022045f0
L_022024dc: .word data_ov026_022046a0
L_022024e0: .word data_ov026_022045c0
.size func_ov026_02202220, .-func_ov026_02202220


.text

/* Exact fallback; see src/overlays/ov026/overlay026_scripted_phases.c. */
.extern data_ov026_022045d8
.extern data_ov026_02204600
.extern data_ov026_02204610
.extern data_ov026_02204618
.extern data_ov026_02204690
.extern func_020befec
.extern func_ov026_0220035c
.extern func_ov026_022013c0
.extern func_ov026_02201400


    .global func_ov026_022024e4
func_ov026_022024e4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b L_02202794
L_022024fc: ; jump table
    b L_02202514 ; case 0
    b L_02202568 ; case 1
    b L_022025ec ; case 2
    b L_02202670 ; case 3
    b L_022026f4 ; case 4
    b L_0220276c ; case 5
L_02202514:
    mov r1, #0x400
    sub r2, r1, #0x5400
    bl func_ov026_022013c0
    mov r0, r4
    bl func_ov026_02201400
    ldr r5, [r4, #0x60]
    ldr r0, [r4, #0x5c]
    mov r1, #0x5
    bl func_020befec
    add r0, r5, r0
    str r0, [sp, #0x0]
    mov r3, r5
    mov r0, r4
    ldr r1, L_0220279c
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02202568:
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
    beq L_02202794
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
    ldr r1, L_022027a0
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
    b L_02202794
L_022025ec:
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
    beq L_02202794
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
    ldr r1, L_022027a4
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
    b L_02202794
L_02202670:
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
    beq L_02202794
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
    ldr r1, L_022027a8
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
    b L_02202794
L_022026f4:
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
    beq L_02202794
    ldr r0, [r4, #0x5c]
    mov r1, #0x5
    mov r0, r0, lsl #0x2
    bl func_020befec
    ldr r1, [r4, #0x64]
    mov r3, r0
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x60]
    ldr r2, L_022027ac
    mov r0, r4
    add r3, r1, r3
    ldmia r2, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202794
L_0220276c:
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
L_02202794:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0220279c: .word data_ov026_02204600
L_022027a0: .word data_ov026_02204618
L_022027a4: .word data_ov026_02204610
L_022027a8: .word data_ov026_022045d8
L_022027ac: .word data_ov026_02204690
.size func_ov026_022024e4, .-func_ov026_022024e4


.text

/* Exact fallback; see src/overlays/ov026/overlay026_scripted_phases.c. */
.extern data_ov026_022045e0
.extern data_ov026_02204608
.extern data_ov026_02204638
.extern data_ov026_02204688
.extern func_ov026_0220035c
.extern func_ov026_022013c0


    .global func_ov026_02201d30
func_ov026_02201d30:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b L_02201f40
L_02201d4c: ; jump table
    b L_02201d60 ; case 0
    b L_02201da8 ; case 1
    b L_02201e24 ; case 2
    b L_02201ea4 ; case 3
    b L_02201f18 ; case 4
L_02201d60:
    mov r1, #0x400
    sub r2, r1, #0x5400
    bl func_ov026_022013c0
    ldr r1, [r4, #0x5c]
    ldr r3, [r4, #0x60]
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    add r0, r3, r0, asr #0x2
    ldr r1, L_02201f4c
    str r0, [sp, #0x0]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02201da8:
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
    beq L_02201f40
    ldr r2, [r4, #0x5c]
    ldr r3, [r4, #0x60]
    mov r1, r2, lsl #0x1
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    mov r1, r2, asr #0x1
    add r0, r3, r0, asr #0x2
    add r1, r2, r1, lsr #0x1e
    ldr r2, L_02201f50
    str r0, [sp, #0x0]
    mov r0, r4
    add r3, r3, r1, asr #0x2
    ldmia r2, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201f40
L_02201e24:
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
    beq L_02201f40
    ldr r2, [r4, #0x5c]
    ldr r3, [r4, #0x60]
    add r1, r2, r2, lsl #0x1
    mov r0, r1, asr #0x1
    mov r2, r2, lsl #0x1
    add r0, r1, r0, lsr #0x1e
    mov r1, r2, asr #0x1
    add r0, r3, r0, asr #0x2
    add r1, r2, r1, lsr #0x1e
    ldr r2, L_02201f54
    str r0, [sp, #0x0]
    mov r0, r4
    add r3, r3, r1, asr #0x2
    ldmia r2, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201f40
L_02201ea4:
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
    beq L_02201f40
    ldr r0, [r4, #0x64]
    ldr ip, L_02201f58
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x5c]
    ldr r2, [r4, #0x60]
    add r1, r0, r0, lsl #0x1
    mov r0, r1, asr #0x1
    add r1, r1, r0, lsr #0x1e
    mov r0, r4
    add r3, r2, r1, asr #0x2
    ldmia ip, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201f40
L_02201f18:
    add r1, r4, #0x394
    ldr r0, [r1, #0x404]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r1, #0x400]
    ldrne r1, [r2, r1]
    ldreq r1, [r1, #0x400]
    blx r1
    b L_02201f44
L_02201f40:
    mov r0, #0x0
L_02201f44:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_02201f4c: .word data_ov026_02204638
L_02201f50: .word data_ov026_022045e0
L_02201f54: .word data_ov026_02204688
L_02201f58: .word data_ov026_02204608
.size func_ov026_02201d30, .-func_ov026_02201d30


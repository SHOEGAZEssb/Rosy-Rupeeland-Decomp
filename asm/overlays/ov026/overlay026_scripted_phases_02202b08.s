.text

/* Exact fallback; see src/overlays/ov026/overlay026_scripted_phases.c. */
.extern data_ov026_02204758
.extern data_ov026_02204760
.extern data_ov026_02204768
.extern data_ov026_02204770
.extern data_ov026_02204778
.extern func_ov026_0220035c


    .global func_ov026_02202b08
func_ov026_02202b08:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b L_02202cfc
L_02202b24: ; jump table
    b L_02202b3c ; case 0
    b L_02202b64 ; case 1
    b L_02202bc0 ; case 2
    b L_02202c1c ; case 3
    b L_02202c78 ; case 4
    b L_02202cd4 ; case 5
L_02202b3c:
    mov r3, #0x0
    ldr r1, L_02202d08
    str r3, [sp, #0x0]
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02202b64:
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
    beq L_02202cfc
    mov r3, #0x0
    ldr r1, L_02202d0c
    str r3, [sp, #0x0]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202cfc
L_02202bc0:
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
    beq L_02202cfc
    mov r3, #0x0
    ldr r1, L_02202d10
    str r3, [sp, #0x0]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202cfc
L_02202c1c:
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
    beq L_02202cfc
    mov r3, #0x0
    ldr r1, L_02202d14
    str r3, [sp, #0x0]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202cfc
L_02202c78:
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
    beq L_02202cfc
    mov r3, #0x0
    ldr r1, L_02202d18
    str r3, [sp, #0x0]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202cfc
L_02202cd4:
    add r1, r4, #0x394
    ldr r0, [r1, #0x404]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r1, #0x400]
    ldrne r1, [r2, r1]
    ldreq r1, [r1, #0x400]
    blx r1
    b L_02202d00
L_02202cfc:
    mov r0, #0x0
L_02202d00:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_02202d08: .word data_ov026_02204778
L_02202d0c: .word data_ov026_02204770
L_02202d10: .word data_ov026_02204768
L_02202d14: .word data_ov026_02204760
L_02202d18: .word data_ov026_02204758
.size func_ov026_02202b08, .-func_ov026_02202b08


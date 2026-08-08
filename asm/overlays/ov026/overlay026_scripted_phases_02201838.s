.text

/* Exact fallback; see src/overlays/ov026/overlay026_scripted_phases.c. */
.extern data_ov026_022046e0
.extern data_ov026_022046f0
.extern func_ov026_0220035c
.extern func_ov026_022013c0


    .global func_ov026_02201838
func_ov026_02201838:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_02201864
    cmp r1, #0x1
    beq L_022018a8
    cmp r1, #0x2
    beq L_02201914
    b L_0220193c
L_02201864:
    ldr r2, L_02201948
    mov r1, #0xc00
    bl func_ov026_022013c0
    ldr r0, [r4, #0x5c]
    ldr r3, [r4, #0x60]
    add r0, r0, r0, lsr #0x1f
    add r0, r3, r0, asr #0x1
    ldr r1, L_0220194c
    str r0, [sp, #0x0]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_022018a8:
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
    beq L_0220193c
    ldr r0, [r4, #0x64]
    ldr ip, L_02201950
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x5c]
    ldr r2, [r4, #0x60]
    add r1, r0, r0, lsr #0x1f
    mov r0, r4
    add r3, r2, r1, asr #0x1
    ldmia ip, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_0220193c
L_02201914:
    add r1, r4, #0x394
    ldr r0, [r1, #0x404]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r1, #0x400]
    ldrne r1, [r2, r1]
    ldreq r1, [r1, #0x400]
    blx r1
    b L_02201940
L_0220193c:
    mov r0, #0x0
L_02201940:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_02201948: .word 0xffffe99a
L_0220194c: .word data_ov026_022046f0
L_02201950: .word data_ov026_022046e0
.size func_ov026_02201838, .-func_ov026_02201838


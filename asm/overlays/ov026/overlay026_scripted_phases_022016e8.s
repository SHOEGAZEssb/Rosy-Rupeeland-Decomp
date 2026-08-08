.text

/* Exact fallback; see src/overlays/ov026/overlay026_scripted_phases.c. */
.extern data_ov026_022040ec
.extern data_ov026_022046a8
.extern func_ov026_0220035c
.extern func_ov026_022013c0


    .global func_ov026_022016e8
func_ov026_022016e8:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_0220170c
    cmp r1, #0x1
    beq L_02201750
    b L_02201778
L_0220170c:
    ldr r2, L_02201784
    mov r1, #0x8
    bl func_ov026_022013c0
    ldr r0, L_02201788
    ldr r1, L_0220178c
    str r0, [r4, #0x368]
    ldr r2, [r4, #0x64]
    mov r0, r4
    str r2, [sp, #0x0]
    ldr r3, [r4, #0x60]
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02201750:
    add r1, r4, #0x394
    ldr r0, [r1, #0x404]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r1, #0x400]
    ldrne r1, [r2, r1]
    ldreq r1, [r1, #0x400]
    blx r1
    b L_0220177c
L_02201778:
    mov r0, #0x0
L_0220177c:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_02201784: .word 0xffffe99a
L_02201788: .word data_ov026_022040ec
L_0220178c: .word data_ov026_022046a8
.size func_ov026_022016e8, .-func_ov026_022016e8


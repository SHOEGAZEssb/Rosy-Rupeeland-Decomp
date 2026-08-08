.text

/* Exact fallback; see src/overlays/ov026/overlay026_scripted_phases.c. */
.extern data_ov026_02204110
.extern data_ov026_022046d8
.extern func_ov026_0220035c
.extern func_ov026_022013c0


    .global func_ov026_02201790
func_ov026_02201790:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_022017b4
    cmp r1, #0x1
    beq L_022017f8
    b L_02201820
L_022017b4:
    ldr r2, L_0220182c
    mov r1, #0x400
    bl func_ov026_022013c0
    ldr r0, L_02201830
    ldr r1, L_02201834
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
L_022017f8:
    add r1, r4, #0x394
    ldr r0, [r1, #0x404]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r1, #0x400]
    ldrne r1, [r2, r1]
    ldreq r1, [r1, #0x400]
    blx r1
    b L_02201824
L_02201820:
    mov r0, #0x0
L_02201824:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_0220182c: .word 0xffffe99a
L_02201830: .word data_ov026_02204110
L_02201834: .word data_ov026_022046d8
.size func_ov026_02201790, .-func_ov026_02201790


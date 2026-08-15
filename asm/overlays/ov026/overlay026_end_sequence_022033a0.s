.text

/* Exact fallback; see src/overlays/ov026/overlay026_end_sequence.c. */
.extern data_ov026_022041ec
.extern PresentationScalar_SetImmediate
.extern Presentation_SetPosition
.extern Presentation_SetScript
.extern Presentation_InterpolateScalar
.extern Presentation_IsScriptComplete
.extern PresentationList_DeleteAll
.extern func_ov026_021fe8fc
.extern func_ov026_021fec34
.extern func_ov026_022009dc
.extern func_ov026_02203580


    .global func_ov026_022033a0
func_ov026_022033a0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x50
    ldr r5, L_02203570
    add lr, sp, #0x10
    mov r4, r0
    mov ip, #0x4
L_022033b8:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne L_022033b8
    ldr r0, [r4, #0x79c]
    cmp r0, #0x0
    beq L_022033e0
    cmp r0, #0x1
    beq L_022034ec
    b L_0220355c
L_022033e0:
    add r0, r4, #0x304
    bl PresentationList_DeleteAll
    add r0, r4, #0x1c0
    bl func_ov026_02203580
    ldr r0, [r4, #0x2e8]
    mov r2, #0x1800
    sub r3, r2, #0x3800
    ldr r5, [r0, #0x20]
    mov r1, #0x0
    bl Presentation_SetPosition
    mov r1, #0x0
    ldr r0, [r4, #0x2ec]
    mov r2, r5
    mov r3, r1
    bl Presentation_SetPosition
    ldr r0, [r4, #0x160]
    add r1, sp, #0x10
    mov r2, #0x0
    bl Presentation_SetScript
    ldr r5, [r4, #0x164]
    mov r1, #0x0
    add r0, r5, #0x1c
    bl PresentationScalar_SetImmediate
    add r0, r5, #0x6c
    mov r1, #0x4000
    bl PresentationScalar_SetImmediate
    mov r0, #0x8000
    str r0, [r5, #0xb8]
    sub r0, r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x170]
    ldr r3, L_02203574
    mov r1, #0x8
    mov r2, #0x1000
    bl func_ov026_021fec34
    ldr r1, L_02203578
    mvn r0, #0xcc
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r0, [r4, #0x16c]
    ldr r1, L_0220357c
    mov r2, #0x10
    mov r3, #0x400
    bl func_ov026_021fe8fc
    ldr r0, [r4, #0x17c]
    mov r1, #0x0
    mov r2, #0x3000
    mov r3, #0x8000
    bl Presentation_SetPosition
    ldr r0, [r4, #0x17c]
    mov r1, #0x7000
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x17c]
    mov r1, #0x0
    add r0, r0, #0x3c
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x17c]
    mov r1, #0x0
    str r1, [r0, #0xa0]
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
L_022034ec:
    ldr r0, [r4, #0x160]
    mov r1, #0x1
    mov r2, #0x1800
    mov r3, #0x5800
    bl Presentation_InterpolateScalar
    ldr r2, [r4, #0x2e8]
    mov r1, r0
    add r0, r2, #0x1c
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x2e8]
    ldr r2, [r4, #0x2ec]
    ldr r1, [r0, #0x20]
    add r0, r2, #0x1c
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x2e8]
    ldr r2, [r4, #0x16c]
    ldr r1, [r0, #0x20]
    add r0, r2, #0x1c
    add r1, r1, #0x800
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x160]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    beq L_0220355c
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x1
    b L_02203568
L_0220355c:
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x0
L_02203568:
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, pc}
L_02203570: .word data_ov026_022041ec
L_02203574: .word 0xccd
L_02203578: .word 0x666
L_0220357c: .word 0x2108
.size func_ov026_022033a0, .-func_ov026_022033a0


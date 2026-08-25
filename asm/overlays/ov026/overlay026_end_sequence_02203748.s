.text

/* Exact fallback; see src/overlays/ov026/overlay026_end_sequence.c. */
.extern data_ov026_022044b0
.extern func_02091b98
.extern func_02091c7c
.extern SceneSound_PlayPackedEffect
.extern PresentationScalar_SetImmediate
.extern Presentation_SetPosition
.extern Presentation_SetScript
.extern Presentation_IsScriptComplete
.extern Presentation_IsScriptSuspended
.extern func_ov026_021fe8fc
.extern func_ov026_022009dc
.extern func_ov026_02200d20
.extern func_ov026_02200dd8
.extern func_ov026_022013c0
.extern func_ov026_02203580


    .global func_ov026_02203748
func_ov026_02203748:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0xf8
    ldr r5, L_022038e8
    add lr, sp, #0x10
    mov r4, r0
    mov ip, #0xe
L_02203760:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne L_02203760
    ldmia r5, {r0, r1}
    stmia lr, {r0, r1}
    ldr r0, [r4, #0x79c]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_022038d4
L_02203788: ; jump table
    b L_02203798 ; case 0
    b L_02203838 ; case 1
    b L_02203874 ; case 2
    b L_022038a8 ; case 3
L_02203798:
    add r0, r4, #0x1c0
    bl func_ov026_02203580
    mov r0, r4
    mov r1, #0x8000
    mov r2, #0x2000
    mov r3, #0x0
    bl func_ov026_02200d20
    ldr r0, [r4, #0x2e8]
    mov r1, #0x1000
    add r0, r0, #0x1c
    bl PresentationScalar_SetImmediate
    ldr r2, L_022038ec
    mov r0, r4
    mov r1, #0x13800
    bl func_ov026_022013c0
    ldr r0, [r4, #0x160]
    add r1, sp, #0x10
    mov r2, #0x0
    bl Presentation_SetScript
    mov r1, #0x0
    ldr r0, [r4, #0x16c]
    mov r2, r1
    mov r3, r1
    bl Presentation_SetPosition
    ldr r1, L_022038f0
    mov r0, #0x1000
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r1, lsr #0x1
    str r0, [sp, #0x8]
    mov r0, #0x52
    str r0, [sp, #0xc]
    ldr r0, [r4, #0x16c]
    ldr r3, L_022038f4
    mov r1, #0x0
    mov r2, #0x10
    bl func_ov026_021fe8fc
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
L_02203838:
    ldr r0, [r4, #0x160]
    bl Presentation_IsScriptSuspended
    cmp r0, #0x0
    beq L_022038d4
    ldr r1, [r4, #0x160]
    add r0, r4, #0x3a8
    mov r2, #0x0
    str r2, [r1, #0x90]
    add r0, r0, #0x400
    mov r1, #0x3c
    bl func_02091b98
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
    b L_022038d4
L_02203874:
    add r0, r4, #0x3a8
    add r0, r0, #0x400
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_022038d4
    ldr r1, L_022038f8
    mov r0, r4
    bl SceneSound_PlayPackedEffect
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
    b L_022038d4
L_022038a8:
    mov r0, r4
    mov r1, #0x8
    bl func_ov026_02200dd8
    ldr r0, [r4, #0x160]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    beq L_022038d4
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x1
    b L_022038e0
L_022038d4:
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x0
L_022038e0:
    add sp, sp, #0xf8
    ldmia sp!, {r3, r4, r5, pc}
L_022038e8: .word data_ov026_022044b0
L_022038ec: .word 0xffffe99a
L_022038f0: .word 0x666
L_022038f4: .word 0x385
L_022038f8: .word 0x7b80
.size func_ov026_02203748, .-func_ov026_02203748


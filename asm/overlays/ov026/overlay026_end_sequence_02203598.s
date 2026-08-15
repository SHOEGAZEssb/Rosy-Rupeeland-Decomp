.text

/* Exact fallback; see src/overlays/ov026/overlay026_end_sequence.c. */
.extern data_ov026_0220422c
.extern PresentationScalar_SetImmediate
.extern PresentationScalar_TransitionTo
.extern Presentation_SetPosition
.extern Presentation_SetScript
.extern Presentation_IsScriptComplete
.extern PresentationList_DeleteAll
.extern func_ov026_022009dc
.extern func_ov026_02203168


    .global func_ov026_02203598
func_ov026_02203598:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x40
    ldr r5, L_02203734
    add lr, sp, #0x0
    mov r4, r0
    mov ip, #0x4
L_022035b0:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne L_022035b0
    ldr r0, [r4, #0x79c]
    cmp r0, #0x0
    beq L_022035d8
    cmp r0, #0x1
    beq L_02203700
    b L_02203720
L_022035d8:
    add r0, r4, #0x304
    bl PresentationList_DeleteAll
    add r0, r4, #0x1c0
    mvn r1, #0x164
    mov r2, #0xff0
    mov r3, #0x0
    bl func_ov026_02203168
    ldr r0, [r4, #0x2e8]
    ldr r3, L_02203738
    mov r1, #0x148
    mov r2, #0x0
    bl Presentation_SetPosition
    ldr r0, [r4, #0x2ec]
    ldr r2, L_0220373c
    mov r1, #0x148
    mov r3, #0x0
    bl Presentation_SetPosition
    ldr r0, [r4, #0x160]
    add r1, sp, #0x0
    mov r2, #0x0
    bl Presentation_SetScript
    ldr r5, [r4, #0x164]
    mov r1, #0x1800
    add r0, r5, #0x1c
    bl PresentationScalar_SetImmediate
    add r0, r5, #0x6c
    mov r1, #0x4000
    bl PresentationScalar_SetImmediate
    mov r0, #0x10000
    str r0, [r5, #0xb8]
    ldr r2, [r4, #0x74]
    mov r1, #0x0
    str r1, [r2, #0x18]
    mov r0, #0x2000
    str r0, [r2, #0x1c]
    str r1, [r2, #0x20]
    ldr r5, [r4, #0x168]
    mov r1, #0x1800
    add r0, r5, #0x1c
    bl PresentationScalar_SetImmediate
    add r0, r5, #0x6c
    mov r1, #0x4000
    bl PresentationScalar_SetImmediate
    mov r0, #0x8000
    str r0, [r5, #0xb4]
    ldr r0, [r4, #0x17c]
    ldr r1, L_02203740
    ldr r3, L_02203744
    mov r2, #0x20000
    bl Presentation_SetPosition
    ldr r0, [r4, #0x17c]
    mov r1, #0xc000
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x17c]
    mov r1, #0x4000
    add r0, r0, #0x3c
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x17c]
    mov r2, #0x0
    str r2, [r0, #0xa0]
    ldr r0, [r4, #0x17c]
    mov r1, #0x1
    mov r2, #0x10000
    add r0, r0, #0x6c
    bl PresentationScalar_TransitionTo
    ldr r1, [r4, #0x17c]
    mov r0, #0xb4
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
L_02203700:
    ldr r0, [r4, #0x160]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    beq L_02203720
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x1
    b L_0220372c
L_02203720:
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x0
L_0220372c:
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, pc}
L_02203734: .word data_ov026_0220422c
L_02203738: .word 0xfffff333
L_0220373c: .word 0x1a66
L_02203740: .word 0xfffffcf6
L_02203744: .word 0xb3d7
.size func_ov026_02203598, .-func_ov026_02203598


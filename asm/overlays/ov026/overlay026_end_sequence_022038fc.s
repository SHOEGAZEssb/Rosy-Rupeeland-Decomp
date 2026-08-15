.text

/* Exact fallback; see src/overlays/ov026/overlay026_end_sequence.c. */
.extern data_ov026_022040b0
.extern PresentationScalar_SetImmediate
.extern Presentation_SetPosition
.extern Presentation_SetScript
.extern Presentation_InterpolateScalar
.extern PresentationList_DeleteAll
.extern func_020b0300
.extern func_ov026_021fef70
.extern func_ov026_022009dc
.extern func_ov026_02200d08
.extern func_ov026_02200d20
.extern func_ov026_02200d38
.extern func_ov026_02203580


    .global func_ov026_022038fc
func_ov026_022038fc:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    ldr lr, L_02203af8
    add ip, sp, #0x4
    mov r4, r0
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1, r2}
    stmia ip, {r0, r1, r2}
    ldr r0, [r4, #0x79c]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_02203ae4
L_02203930: ; jump table
    b L_02203940 ; case 0
    b L_02203a60 ; case 1
    b L_02203ab8 ; case 2
    b L_02203ad4 ; case 3
L_02203940:
    add r0, r4, #0x304
    bl PresentationList_DeleteAll
    add r0, r4, #0x314
    bl PresentationList_DeleteAll
    mov r0, #0x0
    ldr r2, L_02203afc
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_020b0300
    ldr r0, L_02203b00
    mov r1, #0x0
    str r1, [r0, #0x0]
    add r0, r4, #0x1c0
    bl func_ov026_02203580
    mov r1, #0x0
    ldr r0, [r4, #0x2e8]
    ldr r3, L_02203b04
    mov r2, r1
    bl Presentation_SetPosition
    mov r1, #0x0
    ldr r0, [r4, #0x2ec]
    ldr r2, L_02203b08
    mov r3, r1
    bl Presentation_SetPosition
    ldr r2, L_02203b04
    mov r0, r4
    mov r1, #0xe900
    mov r3, #0x0
    bl func_ov026_02200d20
    mov r0, r4
    bl func_ov026_02200d38
    ldr r0, [r4, #0x160]
    add r1, sp, #0x4
    mov r2, #0x0
    bl Presentation_SetScript
    ldr r5, [r4, #0x168]
    mov r1, #0x0
    add r0, r5, #0x1c
    bl PresentationScalar_SetImmediate
    add r0, r5, #0x6c
    mov r1, #0x1000
    bl PresentationScalar_SetImmediate
    mov r0, #0x800
    str r0, [r5, #0xb4]
    ldr r0, [r4, #0x174]
    ldr r1, L_02203b0c
    bl func_ov026_021fef70
    mov r2, #0x3000
    ldr r1, [r4, #0x174]
    mov r0, #0x1e
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    sub r1, r0, #0x4000
    ldr r0, [r4, #0x17c]
    sub r3, r2, #0xb000
    bl Presentation_SetPosition
    ldr r0, [r4, #0x17c]
    mov r1, #0x4000
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x17c]
    mov r1, #0x0
    add r0, r0, #0x3c
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x17c]
    mov r1, #0x1
    str r1, [r0, #0xa0]
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
L_02203a60:
    ldr r0, [r4, #0x174]
    bl func_ov026_02200d08
    cmp r0, #0x0
    beq L_02203a94
    ldr r1, [r4, #0x174]
    mov r0, #0x1e
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
    b L_02203ae4
L_02203a94:
    mov r1, #0x5
    ldr r0, [r4, #0x174]
    ldr r2, L_02203b0c
    sub r3, r1, #0xd2
    bl Presentation_InterpolateScalar
    mov r1, r0
    ldr r0, [r4, #0x174]
    bl func_ov026_021fef70
    b L_02203ae4
L_02203ab8:
    ldr r0, [r4, #0x174]
    bl func_ov026_02200d08
    cmp r0, #0x0
    ldrne r0, [r4, #0x79c]
    addne r0, r0, #0x1
    strne r0, [r4, #0x79c]
    b L_02203ae4
L_02203ad4:
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x1
    b L_02203af0
L_02203ae4:
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x0
L_02203af0:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
L_02203af8: .word data_ov026_022040b0
L_02203afc: .word 0x7fff
L_02203b00: .word 0x4000358
L_02203b04: .word 0x1f33
L_02203b08: .word 0x47b
L_02203b0c: .word 0x4f6
.size func_ov026_022038fc, .-func_ov026_022038fc


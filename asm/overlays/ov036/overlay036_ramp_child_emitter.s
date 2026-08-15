.text

/* Exact fallback; see src/overlays/ov036/overlay036_ramp_controller_lifecycle.c for documented portable C. */

    .extern func_02091c7c
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern func_ov036_021ff050
    .extern Heap_Alloc
    .extern func_020955d8
    .extern Presentation_SetPosition
    .extern func_020956a4
    .extern PresentationScalar_TransitionTo
    .extern PresentationList_Append
    .extern func_02091b98
    .extern data_ov036_02206160
    .extern gHeapContext

    .global func_ov036_02201470
func_ov036_02201470:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r5, r0
    add r0, r5, #0x184
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02201570
    ldr r0, [r5, #0x118]
    add r1, r5, #0xdc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r1, #0x2
    mov r3, r2
    str r1, [sp, #0x4]
    mov r4, #0x42
    mov r6, r0
    str r4, [sp, #0x8]
    bl func_ov036_021ff050
    ldr r1, L_02201578
    ldr r3, L_0220157c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_022014e8
    mov r1, r6
    bl func_020955d8
    mov r4, r0
L_022014e8:
    ldr r0, [r5, #0x1a0]
    mov r3, #0x0
    cmp r0, #0x0
    beq L_02201510
    mov r0, r4
    sub r1, r3, #0x700
    sub r2, r3, #0x800
    str r3, [r5, #0x1a0]
    bl Presentation_SetPosition
    b L_02201528
L_02201510:
    mov r1, #0x700
    mov ip, #0x1
    mov r0, r4
    sub r2, r1, #0xf00
    str ip, [r5, #0x1a0]
    bl Presentation_SetPosition
L_02201528:
    mov r0, r4
    bl func_020956a4
    add r0, r4, #0x1c
    mov r1, #0x1
    mov r2, #0x1200
    bl PresentationScalar_TransitionTo
    mov r0, #0x78
    str r0, [r4, #0x7c]
    mov r0, #0x0
    mov r1, r4
    str r0, [r4, #0x80]
    mov r2, #0x1
    add r0, r5, #0x148
    str r2, [r4, #0x88]
    bl PresentationList_Append
    add r0, r5, #0x184
    mov r1, #0x1e
    bl func_02091b98
L_02201570:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_02201578: .word data_ov036_02206160
L_0220157c: .word gHeapContext
    .size func_ov036_02201470, .-func_ov036_02201470


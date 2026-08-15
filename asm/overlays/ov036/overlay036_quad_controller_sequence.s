.text

/* Exact fallback; see src/overlays/ov036/overlay036_quad_controller_sequence.c for documented portable C. */

    .extern func_02059278
    .extern func_02091c7c
    .extern func_ov036_02202628
    .extern func_02091b98
    .extern func_0205929c
    .extern PresentationList_UpdateAndDeleteCompleted
    .extern gSoundContext
    .extern data_ov036_022054e0

    .global func_ov036_02202790
func_ov036_02202790:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xa0]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b L_0220291c
L_022027a8: ; jump table
    b L_022027c0 ; case 0
    b L_022027e0 ; case 1
    b L_02202838 ; case 2
    b L_02202870 ; case 3
    b L_022028cc ; case 4
    b L_02202904 ; case 5
L_022027c0:
    ldr r0, L_02202934
    mov r1, #0xb1
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_022027e0:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_0220291c
    mov r0, r4
    bl func_ov036_02202628
    ldr r1, [r4, #0x15c]
    ldr r0, L_02202938
    ldr r0, [r0, r1, lsl #0x4]
    cmp r0, #0x0
    add r0, r4, #0xa4
    bne L_0220282c
    mov r1, #0x5a
    bl func_02091b98
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_0220291c
L_0220282c:
    mov r1, #0x1e
    bl func_02091b98
    b L_0220291c
L_02202838:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_0220291c
    mov r0, r4
    bl func_ov036_02202628
    add r0, r4, #0xa4
    mov r1, #0x3c
    bl func_02091b98
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_0220291c
L_02202870:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_0220291c
    mov r0, r4
    bl func_ov036_02202628
    add r0, r4, #0xa4
    mov r1, #0x1e
    bl func_02091b98
    ldr r0, [r4, #0x15c]
    cmp r0, #0xf
    add r0, r4, #0xa4
    blo L_022028c0
    mov r1, #0x3c
    bl func_02091b98
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_0220291c
L_022028c0:
    mov r1, #0x1e
    bl func_02091b98
    b L_0220291c
L_022028cc:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_0220291c
    ldr r0, L_02202934
    mov r1, #0xb1
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl func_0205929c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_0220291c
L_02202904:
    add r0, r4, #0xfc
    bl PresentationList_UpdateAndDeleteCompleted
    add r0, r4, #0x10c
    bl PresentationList_UpdateAndDeleteCompleted
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_0220291c:
    add r0, r4, #0xfc
    bl PresentationList_UpdateAndDeleteCompleted
    add r0, r4, #0x10c
    bl PresentationList_UpdateAndDeleteCompleted
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02202934: .word gSoundContext
L_02202938: .word data_ov036_022054e0
    .size func_ov036_02202790, .-func_ov036_02202790


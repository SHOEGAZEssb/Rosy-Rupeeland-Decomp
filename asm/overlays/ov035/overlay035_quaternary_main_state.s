.text

/* Exact fallback; see src/overlays/ov035/overlay035_quaternary_main_state.c for documented portable C. */

    .extern func_02059278
    .extern func_0205929c
    .extern Sound_Play
    .extern func_02094cf0
    .extern func_02095248
    .extern func_02095224
    .extern func_020948e4
    .extern func_02094bbc
    .extern GraphicsAnimationInstanceManager_RebindInstance
    .extern func_ov035_02200574
    .extern gSoundContext
    .extern data_ov035_02202eb8
    .extern data_ov035_02202f14
    .extern data_ov035_0220352c
    .extern data_ov035_02202e60

    .global func_ov035_022005b0
func_ov035_022005b0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xa0]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b L_022007c4
L_022005c8: ; jump table
    b L_022005dc ; case 0
    b L_0220064c ; case 1
    b L_02200730 ; case 2
    b L_02200784 ; case 3
    b L_022007b8 ; case 4
L_022005dc:
    ldr r0, L_022007d4
    mov r1, #0xb7
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    ldr r0, [r4, #0x114]
    ldr r1, L_022007d8
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0x118]
    ldr r1, L_022007d8
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0x11c]
    ldr r1, L_022007dc
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0x108]
    ldr r1, L_022007e0
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0xd8]
    ldr r1, L_022007e4
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_0220064c:
    ldr r0, [r4, #0x108]
    bl func_02095248
    cmp r0, #0x0
    beq L_022007c4
    ldr r0, [r4, #0x108]
    mov r2, #0x0
    str r2, [r0, #0x90]
    ldr r1, [r4, #0x114]
    ldr r0, L_022007d4
    str r2, [r1, #0x90]
    ldr r0, [r0, #0x0]
    ldr r1, L_022007e8
    bl Sound_Play
    mov r1, #0x0
    ldr r0, [r4, #0x114]
    mov r2, r1
    bl func_02094cf0
    ldr r0, [r4, #0x114]
    mov r1, #0x2
    add r0, r0, #0x1c
    mov r2, #0x0
    bl func_020948e4
    mov r1, #0x0
    ldr r2, [r4, #0x114]
    mov r0, #0xa
    str r0, [r2, #0x7c]
    str r1, [r2, #0x80]
    ldr r0, [r4, #0x118]
    mov r2, r1
    bl func_02094cf0
    ldr r0, [r4, #0x118]
    mov r1, #0x2
    add r0, r0, #0x1c
    mov r2, #0x0
    bl func_020948e4
    ldr r2, [r4, #0x118]
    mov r0, #0xa
    str r0, [r2, #0x7c]
    mov r1, #0x0
    str r1, [r2, #0x80]
    ldr r0, [r4, #0x11c]
    mov r2, r1
    bl func_02094cf0
    ldr r0, [r4, #0x11c]
    mov r1, #0x2
    add r0, r0, #0x1c
    mov r2, #0x0
    bl func_020948e4
    ldr r1, [r4, #0x11c]
    mov r0, #0xa
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_022007c4
L_02200730:
    ldr r0, [r4, #0x108]
    bl func_02095248
    cmp r0, #0x0
    beq L_022007c4
    ldr r0, [r4, #0x108]
    mov r3, #0x400
    ldr r1, [r0, #0x10]
    ldr r2, [r0, #0x20]
    bl func_02094bbc
    ldr r1, [r4, #0x108]
    ldr r0, [r4, #0x104]
    ldr r1, [r1, #0x9c]
    add r2, r4, #0xe8
    bl GraphicsAnimationInstanceManager_RebindInstance
    ldr r0, [r4, #0x108]
    mov r1, #0x0
    str r1, [r0, #0x90]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_022007c4
L_02200784:
    ldr r0, [r4, #0x108]
    bl func_02095224
    cmp r0, #0x0
    beq L_022007c4
    ldr r0, L_022007d4
    mov r1, #0xb7
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl func_0205929c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_022007c4
L_022007b8:
    bl func_ov035_02200574
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_022007c4:
    mov r0, r4
    bl func_ov035_02200574
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_022007d4: .word gSoundContext
L_022007d8: .word data_ov035_02202eb8
L_022007dc: .word data_ov035_02202f14
L_022007e0: .word data_ov035_0220352c
L_022007e4: .word data_ov035_02202e60
L_022007e8: .word 0x1c9
    .size func_ov035_022005b0, .-func_ov035_022005b0


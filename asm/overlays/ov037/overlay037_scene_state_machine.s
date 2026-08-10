.text

/* Exact fallback; see src/overlays/ov037/overlay037_scene_state_machine.c for documented portable C. */

    .extern func_02094cf0
    .extern func_02095248
    .extern func_ov037_021fdd08
    .extern func_ov037_021fd1b4
    .extern func_02092c8c
    .extern func_ov037_021fe1f0
    .extern func_ov037_021fdf68
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern func_02095360
    .extern GraphicsAnimationInstanceManager_Update
    .extern data_ov037_021febb0
    .extern data_ov037_021feb5c
    .extern data_ov037_021feac8
    .extern data_ov037_021feb08
    .extern data_ov037_021feab0

    .global func_ov037_021fe284
func_ov037_021fe284:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x9c]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b L_021fe40c
L_021fe29c: ; jump table
    b L_021fe2b4 ; case 0
    b L_021fe310 ; case 1
    b L_021fe33c ; case 2
    b L_021fe374 ; case 3
    b L_021fe3bc ; case 4
    b L_021fe3e8 ; case 5
L_021fe2b4:
    ldr r0, [r4, #0x118]
    ldr r1, L_021fe42c
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0x11c]
    ldr r1, L_021fe430
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0x124]
    ldr r1, L_021fe434
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0x120]
    ldr r1, L_021fe438
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0x128]
    ldr r1, L_021fe43c
    mov r2, #0x0
    bl func_02094cf0
    ldr r0, [r4, #0x9c]
    add r0, r0, #0x1
    str r0, [r4, #0x9c]
L_021fe310:
    ldr r0, [r4, #0x118]
    bl func_02095248
    cmp r0, #0x0
    beq L_021fe40c
    ldr r0, [r4, #0x118]
    mov r1, #0x0
    str r1, [r0, #0x90]
    ldr r0, [r4, #0x9c]
    add r0, r0, #0x1
    str r0, [r4, #0x9c]
    b L_021fe40c
L_021fe33c:
    ldr r0, [r4, #0x118]
    bl func_02095248
    cmp r0, #0x0
    beq L_021fe368
    ldr r0, [r4, #0x118]
    mov r1, #0x0
    str r1, [r0, #0x90]
    ldr r0, [r4, #0x9c]
    add r0, r0, #0x1
    str r0, [r4, #0x9c]
    b L_021fe40c
L_021fe368:
    mov r0, r4
    bl func_ov037_021fdd08
    b L_021fe40c
L_021fe374:
    ldr r0, [r4, #0x120]
    bl func_ov037_021fd1b4
    cmp r0, #0x0
    beq L_021fe3a0
    mov r0, #0x3
    mov r1, #0x10
    bl func_02092c8c
    ldr r0, [r4, #0x9c]
    add r0, r0, #0x1
    str r0, [r4, #0x9c]
    b L_021fe40c
L_021fe3a0:
    mov r0, r4
    bl func_ov037_021fe1f0
    mov r0, r4
    bl func_ov037_021fdf68
    mov r0, r4
    bl func_ov037_021fdd08
    b L_021fe40c
L_021fe3bc:
    bl func_ov037_021fe1f0
    mov r0, r4
    bl func_ov037_021fdf68
    mov r0, r4
    bl func_ov037_021fdd08
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    ldrne r0, [r4, #0x9c]
    addne r0, r0, #0x1
    strne r0, [r4, #0x9c]
    b L_021fe40c
L_021fe3e8:
    bl func_ov037_021fe1f0
    add r0, r4, #0x12c
    bl func_02095360
    add r0, r4, #0x13c
    bl func_02095360
    ldr r0, [r4, #0x114]
    bl GraphicsAnimationInstanceManager_Update
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fe40c:
    add r0, r4, #0x12c
    bl func_02095360
    add r0, r4, #0x13c
    bl func_02095360
    ldr r0, [r4, #0x114]
    bl GraphicsAnimationInstanceManager_Update
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe42c: .word data_ov037_021febb0
L_021fe430: .word data_ov037_021feb5c
L_021fe434: .word data_ov037_021feac8
L_021fe438: .word data_ov037_021feb08
L_021fe43c: .word data_ov037_021feab0
    .size func_ov037_021fe284, .-func_ov037_021fe284

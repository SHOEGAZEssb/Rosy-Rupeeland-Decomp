.text

/* Exact fallback; see src/overlays/ov036/overlay036_input_controller.c for documented portable C. */

    .extern Graphics3DSceneState_Init
    .extern TitleInterpolatedValue_Init
    .extern GraphicsResourceSetVariant_Init
    .extern data_ov036_02206098
    .extern gTouchPanelManager
    .extern gPadStates

    .global func_ov036_021fce00
func_ov036_021fce00:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, L_021fce58
    add r0, r5, #0xc
    mov r4, r1
    str r2, [r5, #0x0]
    bl Graphics3DSceneState_Init
    add r0, r5, #0xa4
    bl TitleInterpolatedValue_Init
    mov r0, #0x0
    str r0, [r5, #0xc0]
    add r0, r5, #0xcc
    bl GraphicsResourceSetVariant_Init
    str r4, [r5, #0x4]
    mov r0, #0x2
    str r0, [r5, #0xc]
    mov r1, #0x0
    str r1, [r5, #0xa0]
    str r1, [r5, #0xc8]
    mov r0, r5
    str r1, [r5, #0xc4]
    ldmia sp!, {r3, r4, r5, pc}
L_021fce58: .word data_ov036_02206098
    .size func_ov036_021fce00, .-func_ov036_021fce00

    .global func_ov036_021fce5c
func_ov036_021fce5c:
    stmdb sp!, {r3, lr}
    mov r2, #0x0
    ldr r1, L_021fcebc
    str r2, [r0, #0xc8]
    ldr r1, [r1, #0x0]
    ldrh r1, [r1, #0x44]
    cmp r1, #0x1
    moveq r2, #0x1
    cmp r2, #0x0
    beq L_021fce9c
    ldr r1, [r0, #0xc4]
    cmp r1, #0x0
    moveq r1, #0x1
    streq r1, [r0, #0xc8]
    mov r1, #0x1
    b L_021fcea0
L_021fce9c:
    mov r1, #0x0
L_021fcea0:
    str r1, [r0, #0xc4]
    ldr r1, L_021fcec0
    str r1, [r0, #0x8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldmia sp!, {r3, pc}
L_021fcebc: .word gTouchPanelManager
L_021fcec0: .word gPadStates
    .size func_ov036_021fce5c, .-func_ov036_021fce5c


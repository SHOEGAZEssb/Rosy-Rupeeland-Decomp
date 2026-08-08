.text

/* Exact fallback; see src/overlays/ov037/overlay037_input_controller.c for documented portable C. */

    .extern func_02077ae8
    .extern func_02091b6c
    .extern data_ov037_021fee40
    .extern gTouchPanelManager
    .extern gPadStates

    .global func_ov037_021fce00
func_ov037_021fce00:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_021fce44
    add r0, r4, #0x8
    str r1, [r4, #0x0]
    bl func_02077ae8
    add r0, r4, #0xa0
    bl func_02091b6c
    mov r1, #0x0
    str r1, [r4, #0xbc]
    mov r0, #0x2
    str r0, [r4, #0x8]
    str r1, [r4, #0x9c]
    str r1, [r4, #0xc4]
    mov r0, r4
    str r1, [r4, #0xc0]
    ldmia sp!, {r4, pc}
L_021fce44: .word data_ov037_021fee40
    .size func_ov037_021fce00, .-func_ov037_021fce00

    .global func_ov037_021fce48
func_ov037_021fce48:
    stmdb sp!, {r3, lr}
    mov r2, #0x0
    ldr r1, L_021fcea8
    str r2, [r0, #0xc4]
    ldr r1, [r1, #0x0]
    ldrh r1, [r1, #0x44]
    cmp r1, #0x1
    moveq r2, #0x1
    cmp r2, #0x0
    beq L_021fce88
    ldr r1, [r0, #0xc0]
    cmp r1, #0x0
    moveq r1, #0x1
    streq r1, [r0, #0xc4]
    mov r1, #0x1
    b L_021fce8c
L_021fce88:
    mov r1, #0x0
L_021fce8c:
    str r1, [r0, #0xc0]
    ldr r1, L_021fceac
    str r1, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldmia sp!, {r3, pc}
L_021fcea8: .word gTouchPanelManager
L_021fceac: .word gPadStates
    .size func_ov037_021fce48, .-func_ov037_021fce48

.text

/* Exact fallback; see src/overlays/ov036/overlay036_ramp_sequence.c for documented portable C. */

    .extern func_02059278
    .extern func_02094cf0
    .extern func_02095248
    .extern GraphicsAnimationInstanceManager_RebindInstance
    .extern Sound_Play
    .extern func_ov036_022018a8
    .extern func_ov036_021fd28c
    .extern func_0205929c
    .extern func_ov036_02201a78
    .extern gSoundContext
    .extern data_ov036_02205340
    .extern data_ov036_02204f30

    .global func_ov036_02201acc
func_ov036_02201acc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xa0]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b L_02201c60
L_02201ae4: ; jump table
    b L_02201afc ; case 0
    b L_02201b3c ; case 1
    b L_02201b7c ; case 2
    b L_02201be0 ; case 3
    b L_02201c20 ; case 4
    b L_02201c54 ; case 5
L_02201afc:
    ldr r0, L_02201c70
    mov r1, #0xb0
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    ldr r0, [r4, #0x11c]
    ldr r1, L_02201c74
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0xd8]
    ldr r1, L_02201c78
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_02201b3c:
    ldr r0, [r4, #0x11c]
    bl func_02095248
    cmp r0, #0x0
    beq L_02201c60
    ldr r1, [r4, #0x11c]
    ldr r0, [r4, #0x118]
    ldr r1, [r1, #0x9c]
    add r2, r4, #0xf4
    bl GraphicsAnimationInstanceManager_RebindInstance
    ldr r0, [r4, #0x11c]
    mov r1, #0x0
    str r1, [r0, #0x90]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_02201c60
L_02201b7c:
    ldr r0, [r4, #0x11c]
    bl func_02095248
    cmp r0, #0x0
    beq L_02201c60
    ldr r0, L_02201c70
    mov r1, #0x1b0
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r1, [r4, #0x11c]
    ldr r0, [r4, #0x118]
    ldr r1, [r1, #0x9c]
    add r2, r4, #0x100
    bl GraphicsAnimationInstanceManager_RebindInstance
    mov r0, r4
    bl func_ov036_022018a8
    ldr r0, [r4, #0x11c]
    mov r1, #0x0
    str r1, [r0, #0x90]
    ldr r0, [r4, #0xd8]
    str r1, [r0, #0x90]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_02201c60
L_02201be0:
    ldr r0, [r4, #0x11c]
    bl func_02095248
    cmp r0, #0x0
    beq L_02201c60
    ldr r0, L_02201c70
    mov r1, #0x1b0
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    ldr r0, [r4, #0x11c]
    mov r1, #0x0
    str r1, [r0, #0x90]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_02201c60
L_02201c20:
    ldr r0, [r4, #0x11c]
    bl func_ov036_021fd28c
    cmp r0, #0x0
    beq L_02201c60
    ldr r0, L_02201c70
    mov r1, #0xb0
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl func_0205929c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_02201c60
L_02201c54:
    bl func_ov036_02201a78
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_02201c60:
    mov r0, r4
    bl func_ov036_02201a78
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02201c70: .word gSoundContext
L_02201c74: .word data_ov036_02205340
L_02201c78: .word data_ov036_02204f30
    .size func_ov036_02201acc, .-func_ov036_02201acc


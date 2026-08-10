.text

/* Exact fallback; see src/overlays/ov036/overlay036_effect_controller_runtime.c for documented portable C. */

    .extern func_02091b98
    .extern func_02091c7c
    .extern func_ov036_021fef6c
    .extern func_02095360
    .extern GraphicsAnimationInstanceManager_Update
    .extern data_ov036_02205ce0

    .global func_ov036_021ff098
func_ov036_021ff098:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xa0]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_021ff160
L_021ff0b0: ; jump table
    b L_021ff0c0 ; case 0
    b L_021ff0d8 ; case 1
    b L_021ff12c ; case 2
    b L_021ff140 ; case 3
L_021ff0c0:
    add r0, r4, #0xa4
    mov r1, #0x14
    bl func_02091b98
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_021ff0d8:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021ff160
    ldr r1, [r4, #0x118]
    mov r0, r4
    bl func_ov036_021fef6c
    ldr r2, [r4, #0x118]
    ldr r1, L_021ff180
    add r0, r4, #0xa4
    ldr r1, [r1, r2, lsl #0x5]
    bl func_02091b98
    ldr r0, [r4, #0x118]
    add r0, r0, #0x1
    str r0, [r4, #0x118]
    cmp r0, #0x8
    ldrhs r0, [r4, #0xa0]
    addhs r0, r0, #0x1
    strhs r0, [r4, #0xa0]
    b L_021ff160
L_021ff12c:
    ldr r0, [r4, #0x114]
    cmp r0, #0x0
    addeq r0, r1, #0x1
    streq r0, [r4, #0xa0]
    b L_021ff160
L_021ff140:
    add r0, r4, #0xf8
    bl func_02095360
    add r0, r4, #0x108
    bl func_02095360
    ldr r0, [r4, #0xdc]
    bl GraphicsAnimationInstanceManager_Update
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021ff160:
    add r0, r4, #0xf8
    bl func_02095360
    add r0, r4, #0x108
    bl func_02095360
    ldr r0, [r4, #0xdc]
    bl GraphicsAnimationInstanceManager_Update
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021ff180: .word data_ov036_02205ce0
    .size func_ov036_021ff098, .-func_ov036_021ff098


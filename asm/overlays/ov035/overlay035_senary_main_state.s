.text

/* Exact fallback; see src/overlays/ov035/overlay035_senary_main_state.c for documented portable C. */

    .extern func_02059278
    .extern func_0205929c
    .extern func_02095224
    .extern func_020948e4
    .extern func_02094cf0
    .extern func_ov035_02201fe4
    .extern func_02091c7c
    .extern func_02091b98
    .extern func_ov035_02201df8
    .extern func_02091dac
    .extern func_02095360
    .extern GraphicsAnimationInstanceManager_Update
    .extern gSoundContext
    .extern data_ov035_02203120

    .global func_ov035_02202148
func_ov035_02202148:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xa0]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b L_022022bc
L_02202160: ; jump table
    b L_02202174 ; case 0
    b L_02202194 ; case 1
    b L_022021fc ; case 2
    b L_02202264 ; case 3
    b L_0220229c ; case 4
L_02202174:
    ldr r0, L_022022dc
    mov r1, #0xb9
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_02202194:
    ldr r0, [r4, #0xd8]
    bl func_02095224
    cmp r0, #0x0
    beq L_022022bc
    ldr r3, [r4, #0x104]
    mov r2, #0x2000
    ldrh r0, [r3, #0x98]
    rsb r2, r2, #0x0
    mov r1, #0x4
    bic r0, r0, #0x1
    strh r0, [r3, #0x98]
    ldr r0, [r4, #0x104]
    add r0, r0, #0x2c
    bl func_020948e4
    ldr r1, [r4, #0x104]
    mov r0, #0x10
    str r0, [r1, #0x7c]
    mov r2, #0x0
    str r2, [r1, #0x80]
    ldr r0, [r4, #0x108]
    ldr r1, L_022022e0
    bl func_02094cf0
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_022022bc
L_022021fc:
    bl func_ov035_02201fe4
    add r0, r4, #0x12c
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_022022bc
    add r0, r4, #0x12c
    mov r1, #0x7
    bl func_02091b98
    ldr r1, [r4, #0x148]
    mov r0, r4
    bl func_ov035_02201df8
    add r0, r4, #0x148
    bl func_02091dac
    ldr r0, [r4, #0x164]
    add r0, r0, #0x1
    str r0, [r4, #0x164]
    cmp r0, #0x2b
    ble L_022022bc
    add r0, r4, #0xa4
    mov r1, #0x5a
    bl func_02091b98
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_022022bc
L_02202264:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_022022bc
    ldr r0, L_022022dc
    mov r1, #0xb9
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl func_0205929c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_022022bc
L_0220229c:
    add r0, r4, #0x10c
    bl func_02095360
    add r0, r4, #0x11c
    bl func_02095360
    ldr r0, [r4, #0xf4]
    bl GraphicsAnimationInstanceManager_Update
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_022022bc:
    add r0, r4, #0x10c
    bl func_02095360
    add r0, r4, #0x11c
    bl func_02095360
    ldr r0, [r4, #0xf4]
    bl GraphicsAnimationInstanceManager_Update
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_022022dc: .word gSoundContext
L_022022e0: .word data_ov035_02203120
    .size func_ov035_02202148, .-func_ov035_02202148


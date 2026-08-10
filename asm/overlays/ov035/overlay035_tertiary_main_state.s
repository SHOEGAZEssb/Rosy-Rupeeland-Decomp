.text

/* Exact fallback; see src/overlays/ov035/overlay035_tertiary_main_state.c for documented portable C. */

    .extern func_02059278
    .extern func_02094cf0
    .extern func_02095248
    .extern GraphicsAnimationInstance_SetAnimation
    .extern Sound_Play
    .extern func_02091c7c
    .extern func_02091dac
    .extern func_ov035_021ffb74
    .extern func_02091b98
    .extern func_02095224
    .extern func_0205929c
    .extern func_02095360
    .extern GraphicsAnimationInstanceManager_Update
    .extern gSoundContext
    .extern data_ov035_02202f70
    .extern data_ov035_02203770
    .extern data_ov035_02202bfc
    .extern data_ov035_02202ba8
    .extern data_ov035_02202ce4
    .extern data_ov035_02202d2c
    .extern data_ov035_022031c8


    .global func_ov035_021ffc60
func_ov035_021ffc60: 
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xa0]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_021ffe00
L_021ffc78: ; jump table
    b L_021ffc88 ; case 0
    b L_021ffd18 ; case 1
    b L_021ffdac ; case 2
    b L_021ffde0 ; case 3
L_021ffc88:
    ldr r0, L_021ffe20
    mov r1, #0xb6
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    ldr r0, [r4, #0x128]
    ldr r1, L_021ffe24
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0x12c]
    ldr r1, L_021ffe28
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0x130]
    ldr r1, L_021ffe2c
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0x134]
    ldr r1, L_021ffe30
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0x138]
    ldr r1, L_021ffe34
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0x13c]
    ldr r1, L_021ffe38
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0xd8]
    ldr r1, L_021ffe3c
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_021ffd18:
    ldr r0, [r4, #0x12c]
    bl func_02095248
    cmp r0, #0x0
    beq L_021ffd74
    ldr r0, [r4, #0x130]
    mov r1, #0x0
    str r1, [r0, #0x90]
    ldr r0, [r4, #0x134]
    mov r1, #0x2
    ldr r0, [r0, #0x9c]
    bl GraphicsAnimationInstance_SetAnimation
    ldr r0, L_021ffe20
    ldr r1, L_021ffe40
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, [r4, #0x12c]
    mov r1, #0x0
    str r1, [r0, #0x90]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ffe00
L_021ffd74:
    add r0, r4, #0x140
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021ffe00
    add r0, r4, #0x15c
    bl func_02091dac
    ldr r1, [r4, #0x15c]
    mov r0, r4
    bl func_ov035_021ffb74
    add r0, r4, #0x140
    mov r1, #0xa
    bl func_02091b98
    b L_021ffe00
L_021ffdac:
    ldr r0, [r4, #0x12c]
    bl func_02095224
    cmp r0, #0x0
    beq L_021ffe00
    ldr r0, L_021ffe20
    mov r1, #0xb6
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl func_0205929c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ffe00
L_021ffde0:
    add r0, r4, #0x174
    bl func_02095360
    add r0, r4, #0x184
    bl func_02095360
    ldr r0, [r4, #0x124]
    bl GraphicsAnimationInstanceManager_Update
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021ffe00:
    add r0, r4, #0x174
    bl func_02095360
    add r0, r4, #0x184
    bl func_02095360
    ldr r0, [r4, #0x124]
    bl GraphicsAnimationInstanceManager_Update
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021ffe20: .word gSoundContext
L_021ffe24: .word data_ov035_02202f70
L_021ffe28: .word data_ov035_02203770
L_021ffe2c: .word data_ov035_02202bfc
L_021ffe30: .word data_ov035_02202ba8
L_021ffe34: .word data_ov035_02202ce4
L_021ffe38: .word data_ov035_02202d2c
L_021ffe3c: .word data_ov035_022031c8
L_021ffe40: .word 0x1b6
.size func_ov035_021ffc60, .-func_ov035_021ffc60


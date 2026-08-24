.text

/* Exact fallback; see src/overlays/ov036/overlay036_oscillating_object_update.c for documented portable C. */

    .extern PresentationScalar_SetImmediate
    .extern func_ov036_021fe978
    .extern func_02091b98
    .extern func_02091c7c
    .extern GraphicsAnimationInstance_SetAnimation
    .extern Sound_Play
    .extern func_02091bac
    .extern func_ov036_02201d60
    .extern func_02091bd0
    .extern func_02091cf0
    .extern gFx32CosSinTable
    .extern gSoundContext

    .global func_ov036_02201e50
func_ov036_02201e50:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0xf4]
    add r0, r0, #0x200
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r4, #0xf4]
    ldr r0, [r4, #0xd0]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_0220211c
L_02201e80: ; jump table
    b L_02201e94 ; case 0
    b L_02201ea8 ; case 1
    b L_02202000 ; case 2
    b L_02202070 ; case 3
    b L_022020e0 ; case 4
L_02201e94:
    ldr r0, [r4, #0x10]
    str r0, [r4, #0xc4]
    ldr r0, [r4, #0xd0]
    add r0, r0, #0x1
    str r0, [r4, #0xd0]
L_02201ea8:
    ldr r0, [r4, #0xcc]
    cmp r0, #0x0
    beq L_02201ec0
    cmp r0, #0x1
    beq L_02201f40
    b L_0220211c
L_02201ec0:
    ldr r1, [r4, #0xf4]
    ldr r0, L_02202128
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    mov r0, #0x6
    ldr r2, [r4, #0xc4]
    smulbb r1, r1, r0
    mov r0, r1, asr #0x7
    add r1, r1, r0, lsr #0x18
    add r0, r4, #0xc
    add r1, r2, r1, asr #0x8
    bl PresentationScalar_SetImmediate
    ldr r1, [r4, #0x20]
    add r0, r4, #0x1c
    add r1, r1, #0x18
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0xd4]
    ldr r1, [r4, #0x10]
    ldr r2, [r4, #0x20]
    ldr r3, [r4, #0x30]
    bl func_ov036_021fe978
    ldr r0, [r4, #0x20]
    cmp r0, #0xc00
    ble L_0220211c
    add r0, r4, #0xd8
    mov r1, #0x1e
    bl func_02091b98
    ldr r0, [r4, #0xd0]
    add r0, r0, #0x1
    str r0, [r4, #0xd0]
    b L_0220211c
L_02201f40:
    ldr r1, [r4, #0xf4]
    ldr r0, L_02202128
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    mov r0, #0x6
    ldr r2, [r4, #0xc4]
    smulbb r1, r1, r0
    mov r0, r1, asr #0x7
    add r1, r1, r0, lsr #0x18
    add r0, r4, #0xc
    add r1, r2, r1, asr #0x8
    bl PresentationScalar_SetImmediate
    ldr r1, [r4, #0x20]
    add r0, r4, #0x1c
    add r1, r1, #0x18
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0xd4]
    ldr r1, [r4, #0x10]
    ldr r2, [r4, #0x20]
    ldr r3, [r4, #0x30]
    bl func_ov036_021fe978
    add r0, r4, #0xd8
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02201fec
    add r0, r4, #0xd8
    mov r1, #0xa
    bl func_02091b98
    ldr r0, [r4, #0xd4]
    ldr r2, [r4, #0xc8]
    ldrb r1, [r0, #0x54]
    add r1, r2, r1
    and r1, r1, #0x7
    bl GraphicsAnimationInstance_SetAnimation
    ldr r1, [r4, #0xc8]
    ldr r0, L_0220212c
    ldr r3, [r4, #0x50]
    mul r2, r1, r0
    add r0, r4, #0x4c
    sub r1, r3, r2
    bl PresentationScalar_SetImmediate
L_02201fec:
    ldr r0, [r4, #0x20]
    cmp r0, #0x1600
    ble L_0220211c
    mov r0, #0x1
    b L_02202120
L_02202000:
    add r0, r4, #0xd8
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_0220211c
    ldr r0, L_02202130
    ldr r1, L_02202134
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, [r4, #0xd4]
    mov r1, #0x1
    bl GraphicsAnimationInstance_SetAnimation
    mov r2, #0x1
    add r0, r4, #0x6c
    mov r1, #0x400
    str r2, [r4, #0xa0]
    bl PresentationScalar_SetImmediate
    mov r2, #0x10
    str r2, [sp, #0x0]
    add r0, r4, #0xd8
    mov r1, #0x1
    mov r3, r1
    bl func_02091bac
    ldr r0, [r4, #0xd0]
    add r0, r0, #0x1
    str r0, [r4, #0xd0]
    b L_0220211c
L_02202070:
    add r0, r4, #0xd8
    mov r1, #0x1
    bl func_02091c7c
    mov r1, r0
    mov r0, r4
    bl func_ov036_02201d60
    ldr r3, L_02202138
    add r0, r4, #0xd8
    mov r1, #0x1
    mov r2, #0x400
    bl func_02091bd0
    mov r1, r0
    add r0, r4, #0x6c
    bl PresentationScalar_SetImmediate
    add r0, r4, #0xd8
    bl func_02091cf0
    cmp r0, #0x0
    beq L_0220211c
    ldrh r0, [r4, #0x98]
    mov r1, #0x2
    orr r0, r0, #0x1
    strh r0, [r4, #0x98]
    ldr r0, [r4, #0xd4]
    bl GraphicsAnimationInstance_SetAnimation
    ldr r0, [r4, #0xd0]
    add r0, r0, #0x1
    str r0, [r4, #0xd0]
    b L_0220211c
L_022020e0:
    ldr r1, [r4, #0x20]
    add r0, r4, #0x1c
    sub r1, r1, #0x80
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0xd4]
    ldr r1, [r4, #0x10]
    ldr r2, [r4, #0x20]
    ldr r3, [r4, #0x30]
    bl func_ov036_021fe978
    mov r0, #0xa00
    ldr r1, [r4, #0x20]
    rsb r0, r0, #0x0
    cmp r1, r0
    movlt r0, #0x1
    blt L_02202120
L_0220211c:
    mov r0, #0x0
L_02202120:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_02202128: .word gFx32CosSinTable
L_0220212c: .word 0x333
L_02202130: .word gSoundContext
L_02202134: .word 0x1b1
L_02202138: .word 0x666
    .size func_ov036_02201e50, .-func_ov036_02201e50


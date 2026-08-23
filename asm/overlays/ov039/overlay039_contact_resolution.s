.text
/* Exact fallback; see overlay039_proximity_resolution.c for portable C. */
    .extern func_ov049_0220c2dc
    .extern func_ov039_021feda0
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_ov039_021fdb78
    .extern func_ov049_0220c67c
    .extern func_020a63d0
    .extern Sound_StopDirectSequence
    .extern func_020594ec
    .extern Sound_StopEffect
    .extern Sound_Play
    .extern gSoundContext

    .global func_ov039_021fee00
func_ov039_021fee00:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r0, r4, #0x54
    add r0, r0, #0x400
    mov r2, #0x0
    mov r5, r1
    bl func_ov049_0220c2dc
    add r0, r4, #0x1c00
    ldrh r1, [r0, #0xb8]
    cmp r1, #0x1
    bhi L_021fee38
    ldrh r0, [r0, #0xb2]
    cmp r0, #0x2
    beq L_021fefe4
L_021fee38:
    mov r0, r4
    mov r1, r5
    bl func_ov039_021feda0
    cmp r0, #0x0
    beq L_021fefe4
    ldr r0, [r4, #0x98]
    mov r1, #0x7
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r4, #0x9c]
    mov r1, #0x1
    ldrh r0, [r2, #0x42]
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r4, #0x4c]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x5c]
    mov r1, #0x1
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    add r1, r4, #0x1c00
    mov r0, #0x1e
    strh r0, [r1, #0xaa]
    mov r0, #0x1000
    strh r0, [r1, #0xa0]
    ldrsh r3, [r1, #0xa8]
    mov r2, #0x0
    add r0, r4, #0x1000
    sub r3, r3, #0xa
    strh r3, [r1, #0xa8]
    str r2, [r4, #0x448]
    str r2, [r0, #0xd98]
    str r2, [r0, #0xd94]
    ldrsh r0, [r1, #0xa8]
    cmp r0, #0x0
    ble L_021feee4
    ldr r1, [r4, #0x48]
    mov r0, #0x14
    str r0, [r1, #0x44]
    mov r0, #0x6
    str r0, [r1, #0x48]
    b L_021fef80
L_021feee4:
    strh r2, [r1, #0xa8]
    mov r0, #0x5a0
    strh r0, [r1, #0xac]
    mov r0, r4
    strh r2, [r1, #0xae]
    bl func_ov039_021fdb78
    add r0, r4, #0x54
    add r0, r0, #0x400
    bl func_ov049_0220c67c
    ldr r0, [r4, #0x98]
    mov r1, #0x7
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x48]
    mov r1, #0x17
    str r1, [r0, #0x74]
    add r0, r4, #0x1c00
    ldrh r0, [r0, #0xb2]
    cmp r0, #0x0
    bne L_021fef48
    ldr r0, [r4, #0x48]
    mov r1, #0x1
    ldr r0, [r0, #0xc4]
    ldr r0, [r0, #0x34]
    bl func_020a63d0
L_021fef48:
    ldr r2, [r4, #0x48]
    mov r0, #0x1e
    str r0, [r2, #0x44]
    mov r1, #0x5
    ldr r0, L_021fefec
    str r1, [r2, #0x48]
    ldr r0, [r0, #0x0]
    mov r1, #0x60
    mov r2, #0x0
    bl Sound_StopDirectSequence
    ldr r0, L_021fefec
    mov r1, #0x8
    ldr r0, [r0, #0x0]
    bl func_020594ec
L_021fef80:
    add r0, r4, #0x1c00
    mov r2, #0x0
    strh r2, [r0, #0xb4]
    mov r1, #0x5
    strh r1, [r0, #0xb8]
    strh r2, [r0, #0xb6]
    add r0, r4, #0x1d00
    strh r2, [r0, #0x9c]
    ldr r1, L_021fefec
    mov r2, #0x7
    ldr r0, [r1, #0x0]
    mov r1, #0x63
    bl Sound_StopEffect
    ldr r0, L_021fefec
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    bl Sound_StopEffect
    ldr r0, L_021fefec
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    bl Sound_Play
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_021fefe4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fefec: .word gSoundContext
    .size func_ov039_021fee00, .-func_ov039_021fee00


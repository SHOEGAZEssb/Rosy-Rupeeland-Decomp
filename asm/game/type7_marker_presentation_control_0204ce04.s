; Matching retail form; see src/game/type7_marker_presentation_control.c.
.extern func_020ae024
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_02071e60
.extern func_02071e70
.extern func_02071e80
.extern func_020740c8
.extern data_020f4e18
.text
    .global Type7MarkerPresentation_UpdatePosition
Type7MarkerPresentation_UpdatePosition: ; 0x0204ce04
    stmdb sp!, {r4, r5, r6, lr}
    ldr r5, [r2, #0x4]
    ldr r4, [r1, #0x4]
    ldr lr, [r2, #0xc]
    sub r6, r5, r4
    mvn ip, #0x1f
    ldr r5, [r2, #0x8]
    ldr r1, [r1, #0x8]
    mov r4, r0
    cmp ip, r6, asr #0xc
    mov r6, r6, asr #0xc
    sub r1, r5, r1
    mov r0, lr, asr #0xc
    bgt .L_0204ce84
    cmp r6, #0x120
    bge .L_0204ce84
    rsb lr, r0, r1, asr #0xc
    cmp lr, ip
    blt .L_0204ce84
    cmp lr, #0x100
    bge .L_0204ce84
    ldr r0, [r4, #0x4]
    mov r1, #0x100
    strh r6, [r0, #0x2c]
    strh lr, [r0, #0x2e]
    ldr r0, [r4, #0x4]
    strh r1, [r0, #0x28]
    ldr r1, [r4, #0x4]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x8
    strh r0, [r1, #0x24]
    b .L_0204ce94
.L_0204ce84:
    ldr r1, [r4, #0x4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x8
    strh r0, [r1, #0x24]
.L_0204ce94:
    cmp r3, #0x0
    moveq r1, #0x0
    beq .L_0204cecc
    ldr r1, [r4, #0x8]
    ldr ip, [r2, #0x8]
    ldr r0, [r1, #0x20]
    ldr r3, [r1, #0x1c]
    ldr r1, [r2, #0x4]
    sub r0, ip, r0
    sub r1, r3, r1
    bl func_020ae024
    sub r0, r0, #0x4000
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
.L_0204cecc:
    ldr r0, [r4, #0x4]
    strh r1, [r0, #0x30]
    ldmia sp!, {r4, r5, r6, pc}
.size Type7MarkerPresentation_UpdatePosition, . - Type7MarkerPresentation_UpdatePosition

    .global Type7MarkerPresentation_SelectAnimation
Type7MarkerPresentation_SelectAnimation: ; 0x0204ced8
    stmdb sp!, {r4, lr}
    mvn r2, #0x0
    mov r4, r0
    cmp r1, r2
    ldreq r1, [r4, #0x4]
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    and r1, r1, #0xff
    ldrb r2, [r0, #0x38]
    cmp r1, r2
    beq .L_0204cf14
    bl GraphicsSpriteState_SetAnimationIndex
.L_0204cf14:
    ldr r1, [r4, #0x4]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.size Type7MarkerPresentation_SelectAnimation, . - Type7MarkerPresentation_SelectAnimation

    .global Type7MarkerPresentation_ReloadResources
Type7MarkerPresentation_ReloadResources: ; 0x0204cf28
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0204cf94
    mov r6, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_0204cf98
    bl func_02071e60
    ldr r1, .L_0204cf94
    mov r5, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_0204cf9c
    bl func_02071e70
    ldr r1, .L_0204cf94
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_0204cfa0
    bl func_02071e80
    mov r2, r5
    mov r3, r4
    ldr r1, [r6, #0x4]
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x0]
    bl func_020740c8
    mov r0, #0x0
    strh r0, [r6, #0xe]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0204cf94: .word data_020f4e18
.L_0204cf98: .word 0x138a
.L_0204cf9c: .word 0x1078
.L_0204cfa0: .word 0x138b
.size Type7MarkerPresentation_ReloadResources, . - Type7MarkerPresentation_ReloadResources


.text
; Matching fallback for the portable implementation in src/game/modal_sprite_node.c.
.extern GraphicsSpriteState_AdvanceAnimation
.extern GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins
.extern RectS16_Assign
.extern RectS16_InitComponents
.extern VecFx32Object_Add
.extern VecFx32Object_Assign

.global func_0209a2ac
func_0209a2ac:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x2c
    mov r5, r0
    mov r4, r1
    add r0, r5, #0x1c
    add r1, r5, #0x2c
    mov r6, r2
    bl VecFx32Object_Assign
    ldr r1, [r5, #0x8]
    cmp r1, #0x0
    beq .L_0209a2e4
    add r0, r5, #0x1c
    add r1, r1, #0x1c
    bl VecFx32Object_Add
.L_0209a2e4:
    ldr r1, [r5, #0xc]
    cmp r1, #0x0
    beq .L_0209a448
    ldrh r0, [r5, #0x42]
    tst r0, #0x4
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    bne .L_0209a42c
    cmp r6, #0x2
    bne .L_0209a33c
    mov ip, #0x60
    add r0, sp, #0x1c
    sub r1, ip, #0xe0
    sub r2, ip, #0xc0
    mov r3, #0x80
    str ip, [sp, #0x0]
    bl RectS16_InitComponents
    add r0, sp, #0x24
    add r1, sp, #0x1c
    bl RectS16_Assign
    b .L_0209a398
.L_0209a33c:
    cmp r6, #0x1
    bne .L_0209a370
    mov ip, #0x48
    add r0, sp, #0x14
    sub r1, ip, #0x68
    sub r2, ip, #0x6c
    mov r3, #0x40
    str ip, [sp, #0x0]
    bl RectS16_InitComponents
    add r0, sp, #0x24
    add r1, sp, #0x14
    bl RectS16_Assign
    b .L_0209a398
.L_0209a370:
    mov ip, #0x19
    add r0, sp, #0xc
    sub r1, ip, #0x39
    sub r2, ip, #0x32
    mov r3, #0x20
    str ip, [sp, #0x0]
    bl RectS16_InitComponents
    add r0, sp, #0x24
    add r1, sp, #0xc
    bl RectS16_Assign
.L_0209a398:
    ldr r1, [r5, #0x24]
    mov r0, #0x8
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x28]
    add r2, sp, #0x24
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r5, #0xc]
    ldr r3, [r5, #0x20]
    mov r1, r4
    bl GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins
    ldr r2, [r5, #0xc]
    ldrh r0, [r5, #0x42]
    ldrh r1, [r2, #0x24]
    orr r0, r1, r0
    strh r0, [r2, #0x24]
    ldr r1, [r5, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    beq .L_0209a418
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_0209a42c
    ldrh r2, [r0, #0x28]
    ldr r1, [r5, #0x44]
    ldr r0, [r5, #0xc]
    add r1, r2, r1
    strh r1, [r0, #0x28]
    b .L_0209a42c
.L_0209a418:
    ldr r2, [r5, #0xc]
    ldr r0, [r5, #0x44]
    ldrh r1, [r2, #0x28]
    add r0, r1, r0
    strh r0, [r2, #0x28]
.L_0209a42c:
    ldrsh r2, [r5, #0x3e]
    ldrsh r0, [r5, #0x3c]
    ldr r1, [r5, #0xc]
    strh r0, [r1, #0x32]
    strh r2, [r1, #0x34]
    ldr r0, [r5, #0xc]
    bl GraphicsSpriteState_AdvanceAnimation
.L_0209a448:
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, pc}
.size func_0209a2ac, . - func_0209a2ac

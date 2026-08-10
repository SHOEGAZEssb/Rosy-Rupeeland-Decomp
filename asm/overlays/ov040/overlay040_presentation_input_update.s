    .text
/* Exact fallback; see overlay040_state_setup.c for portable C. */
    .extern Sound_Play
    .extern func_02005030
    .extern func_02005058
    .extern func_02059278
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_0209a07c
    .extern func_0209a0d8
    .extern func_020be4e4
    .extern func_ov040_021ff630
    .extern func_ov040_02200108
    .extern func_ov040_02200118
    .extern gSoundContext
    .extern gSystemState
    .global func_ov040_021ff900
func_ov040_021ff900: ; 0x021ff900
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x68
    mov r4, r0
    ldr r1, [r4, #0xb7c]
    cmp r1, #0x0
    bne .L_021ffcd0
    ldr r0, [r4, #0xb94]
    cmp r0, #0x0
    bne .L_021ffbd4
    cmp r1, #0x0
    bne .L_021ff9c0
    ldr r0, .L_022000ec
    ldrh r0, [r0, #0x1a]
    tst r0, #0x30
    cmpeq r0, #0x40
    bne .L_021ff9c0
    ldr r0, [r4, #0xb44]
    bl func_0209a07c
    ldr r2, [r4, #0x48]
    mov r0, #0x1
    ldr r1, .L_022000f0
    ldr r3, [r2, #0x0]
    sub r2, r1, #0x12
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0xb44]
    add r3, r1, #0x1
    bl func_0209a0d8
    ldr r0, [r4, #0xb44]
    mov r1, #0x20
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0xb44]
    mov r2, #0x8
    ldr lr, [r0, #0xc]
    mov r3, #0x1
    ldrh ip, [lr, #0x24]
    sub r1, r2, #0x1a
    ldr r0, .L_022000f4
    bic ip, ip, #0x2
    strh ip, [lr, #0x24]
    str r3, [r4, #0xb7c]
    str r2, [r4, #0xb84]
    str r1, [r4, #0xb78]
    ldr r0, [r0, #0x0]
    mov r1, #0x12c
    mov r2, #0x10
    bl Sound_Play
.L_021ff9c0:
    ldr r0, [r4, #0xb7c]
    cmp r0, #0x0
    bne .L_021ffcd0
    ldr r0, .L_022000ec
    mov r5, #0x0
    ldrh r0, [r0, #0x1a]
    tst r0, #0x20
    beq .L_021ffa54
    ldr r0, [r4, #0xb84]
    cmp r0, #0x2
    beq .L_021ffa40
    ldr r0, [r4, #0xb44]
    bl func_0209a07c
    ldr r2, [r4, #0x48]
    mov r0, #0x1
    ldr r1, .L_022000f8
    ldr r3, [r2, #0x0]
    sub r2, r1, #0x16
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0xb44]
    add r3, r1, #0x1
    bl func_0209a0d8
    ldr r0, [r4, #0xb44]
    mov r1, #0x2
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0xb44]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_021ffa40:
    mov r0, #0x2
    mov r5, #0x2000
    str r0, [r4, #0xb84]
    rsb r5, r5, #0x0
    b .L_021ffac8
.L_021ffa54:
    tst r0, #0x10
    beq .L_021ffac8
    ldr r0, [r4, #0xb84]
    cmp r0, #0x1
    beq .L_021ffabc
    ldr r0, [r4, #0xb44]
    bl func_0209a07c
    ldr r2, [r4, #0x48]
    mov r0, #0x1
    ldr r1, .L_022000f8
    ldr r3, [r2, #0x0]
    sub r2, r1, #0x16
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0xb44]
    add r3, r1, #0x1
    bl func_0209a0d8
    ldr r0, [r4, #0xb44]
    mov r1, #0x6
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0xb44]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_021ffabc:
    mov r0, #0x1
    str r0, [r4, #0xb84]
    mov r5, #0x2000
.L_021ffac8:
    cmp r5, #0x0
    beq .L_021ffb30
    ldr r1, [r4, #0xb44]
    add r0, sp, #0x58
    bl func_ov040_02200108
    ldr r0, [sp, #0x5c]
    add r0, r0, r5
    str r0, [sp, #0x5c]
    cmp r0, #0xf0000
    movgt r0, #0xf0000
    strgt r0, [sp, #0x5c]
    bgt .L_021ffb04
    cmp r0, #0x10000
    movlt r0, #0x10000
    strlt r0, [sp, #0x5c]
.L_021ffb04:
    add r0, sp, #0x28
    add r1, sp, #0x58
    bl func_02005030
    ldr r0, [r4, #0xb44]
    add r1, sp, #0x28
    bl func_ov040_02200118
    add r0, sp, #0x28
    bl func_02005058
    add r0, sp, #0x58
    bl func_02005058
    b .L_021ffb98
.L_021ffb30:
    ldr r0, [r4, #0xb84]
    cmp r0, #0x0
    beq .L_021ffb98
    ldr r0, [r4, #0xb44]
    bl func_0209a07c
    ldr r2, [r4, #0x48]
    mov r0, #0x1
    ldr r1, .L_022000fc
    ldr r3, [r2, #0x0]
    sub r2, r1, #0xe
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0xb44]
    add r3, r1, #0x1
    bl func_0209a0d8
    ldr r0, [r4, #0xb44]
    mov r1, #0x1d
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0xb44]
    mov r0, #0x0
    ldr r2, [r1, #0xc]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    strh r1, [r2, #0x24]
    str r0, [r4, #0xb84]
.L_021ffb98:
    ldr r0, [r4, #0x48]
    mov r1, #0x0
    str r1, [r0, #0x18]
    ldr r0, [r4, #0xb88]
    cmp r0, #0x0
    ble .L_021ffcd0
    cmp r0, #0x1
    bne .L_021ffcd0
    ldr r0, [r4, #0xb8c]
    add r0, r0, #0x1
    str r0, [r4, #0xb8c]
    cmp r0, #0x3c
    strgt r1, [r4, #0xb8c]
    strgt r1, [r4, #0xb88]
    b .L_021ffcd0
.L_021ffbd4:
    ldr r1, [r4, #0xb44]
    add r0, sp, #0x48
    bl func_ov040_02200108
    ldr r0, [r4, #0xb90]
    cmp r0, #0x0
    bne .L_021ffc9c
    ldr r2, [r4, #0xb78]
    add r0, r2, #0x1
    str r0, [r4, #0xb78]
    ldr r1, [sp, #0x50]
    mov r0, r2, asr #0x1
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x50]
    cmp r0, #0xc0000
    ble .L_021ffca8
    mov r0, #0xc0000
    str r0, [sp, #0x50]
    mvn r0, #0x5
    str r0, [r4, #0xb78]
    ldr r0, [r4, #0xb94]
    add r0, r0, #0x1
    str r0, [r4, #0xb94]
    cmp r0, #0x3
    blt .L_021ffca8
    mov r0, #0x0
    str r0, [r4, #0xb94]
    ldr r0, [r4, #0xb44]
    bl func_0209a07c
    ldr r2, [r4, #0x48]
    mov r0, #0x2
    ldr r1, .L_022000fc
    ldr r3, [r2, #0x0]
    sub r2, r1, #0xe
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0xb44]
    add r3, r1, #0x1
    bl func_0209a0d8
    ldr r0, [r4, #0xb44]
    mov r1, #0x1d
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0xb44]
    mov r0, #0x50
    ldr r2, [r1, #0xc]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    strh r1, [r2, #0x24]
    str r0, [r4, #0xb9c]
    b .L_021ffca8
.L_021ffc9c:
    add r1, sp, #0x48
    mov r0, r4
    bl func_ov040_021ff630
.L_021ffca8:
    add r0, sp, #0x18
    add r1, sp, #0x48
    bl func_02005030
    ldr r0, [r4, #0xb44]
    add r1, sp, #0x18
    bl func_ov040_02200118
    add r0, sp, #0x18
    bl func_02005058
    add r0, sp, #0x48
    bl func_02005058
.L_021ffcd0:
    ldr r0, [r4, #0xb7c]
    cmp r0, #0x0
    ble .L_022000b0
    ldr r1, [r4, #0xb44]
    add r0, sp, #0x38
    bl func_ov040_02200108
    ldr r0, [r4, #0xb7c]
    cmp r0, #0x1
    bne .L_021ffd50
    ldr r0, [r4, #0xb78]
    adds r0, r0, #0x1
    str r0, [r4, #0xb78]
    bne .L_021ffd38
    ldr r0, [r4, #0xb44]
    mov r1, #0xd
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0xb44]
    mov r1, #0x2
    ldr r3, [r0, #0xc]
    mov r0, #0x0
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x2
    strh r2, [r3, #0x24]
    str r1, [r4, #0xb7c]
    str r0, [r4, #0xb80]
.L_021ffd38:
    ldr r0, [r4, #0xb78]
    ldr r1, [sp, #0x40]
    mov r0, r0, asr #0x1
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x40]
    b .L_02200088
.L_021ffd50:
    cmp r0, #0x2
    bne .L_021ffd9c
    ldr r0, [r4, #0xb80]
    add r0, r0, #0x1
    str r0, [r4, #0xb80]
    ldr r0, [r4, #0xb88]
    cmp r0, #0x0
    movne r0, #0x10
    strne r0, [r4, #0xb80]
    bne .L_02200088
    ldr r0, [r4, #0xb80]
    cmp r0, #0x11
    blt .L_02200088
    ldr r1, [r4, #0xb7c]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0xb7c]
    str r0, [r4, #0xb80]
    b .L_02200088
.L_021ffd9c:
    cmp r0, #0x3
    bne .L_021ffed4
    ldr r0, [r4, #0xb78]
    add r0, r0, #0x1
    str r0, [r4, #0xb78]
    ldr r1, [sp, #0x40]
    mov r0, r0, asr #0x1
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x40]
    cmp r0, #0xc0000
    ble .L_02200088
    mov r0, #0xc0000
    str r0, [sp, #0x40]
    ldr r1, [r4, #0xb7c]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0xb7c]
    str r0, [r4, #0xb80]
    ldr r2, [r4, #0xb44]
    ldr r0, [r2, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x26
    bne .L_021ffe54
    mov r1, #0x27
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0xb44]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    bl func_020be4e4
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    mov r1, #0x12c
    bne .L_021ffe40
    ldr r0, .L_022000f4
    mov r2, #0x0
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b .L_021ffec4
.L_021ffe40:
    ldr r0, .L_022000f4
    mov r2, #0x4
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b .L_021ffec4
.L_021ffe54:
    mov r0, r2
    bl func_0209a07c
    ldr r2, [r4, #0x48]
    mov r0, #0x1
    ldr r1, .L_02200100
    ldr r3, [r2, #0x0]
    sub r2, r1, #0x8
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0xb44]
    add r3, r1, #0x1
    bl func_0209a0d8
    ldr r0, [r4, #0xb44]
    mov r1, #0x18
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0xb44]
    ldr r0, .L_022000f4
    ldr ip, [r1, #0xc]
    mov r1, #0x0
    ldrh r3, [ip, #0x24]
    mov r2, #0x57
    bic r3, r3, #0x2
    strh r3, [ip, #0x24]
    ldr r0, [r0, #0x0]
    bl Sound_Play
    mov r0, #0x28
    str r0, [r4, #0xb80]
.L_021ffec4:
    ldr r0, [r4, #0x48]
    mov r1, #0x0
    str r1, [r0, #0x1c]
    b .L_02200088
.L_021ffed4:
    cmp r0, #0x4
    bne .L_021fff74
    ldr r0, [r4, #0xb80]
    add r0, r0, #0x1
    str r0, [r4, #0xb80]
    cmp r0, #0x32
    blt .L_02200088
    ldr r0, [r4, #0xb44]
    bl func_0209a07c
    ldr r2, [r4, #0x48]
    mov r0, #0x1
    ldr r1, .L_022000fc
    ldr r3, [r2, #0x0]
    sub r2, r1, #0xe
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0xb44]
    add r3, r1, #0x1
    bl func_0209a0d8
    ldr r0, [r4, #0xb44]
    mov r1, #0x1d
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0xb44]
    mov r0, #0x0
    ldr r2, [r1, #0xc]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    strh r1, [r2, #0x24]
    str r0, [r4, #0xb7c]
    ldr r0, [r4, #0xb30]
    cmp r0, #0x0
    beq .L_021fff68
    ldr r0, [r4, #0xb98]
    cmp r0, #0x0
    moveq r0, #0x5
    streq r0, [r4, #0xb7c]
.L_021fff68:
    mov r0, #0x0
    str r0, [r4, #0xb80]
    b .L_02200088
.L_021fff74:
    cmp r0, #0x5
    bne .L_02200064
    mov r0, #0x1
    str r0, [r4, #0xb98]
    ldr r0, [r4, #0xb80]
    add r0, r0, #0x1
    str r0, [r4, #0xb80]
    cmp r0, #0x78
    bne .L_02200014
    ldr r0, [r4, #0xb44]
    bl func_0209a07c
    ldr r2, [r4, #0x48]
    mov r0, #0x1
    ldr r1, .L_02200104
    ldr r3, [r2, #0x0]
    add r2, r1, #0x1
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0xb44]
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r0, [r4, #0xb44]
    mov r1, #0x4
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0xb44]
    mov ip, #0x7
    ldr lr, [r0, #0xc]
    ldr r0, .L_022000f4
    ldrh r3, [lr, #0x24]
    mov r1, #0x32
    mov r2, #0x7f
    bic r3, r3, #0x2
    strh r3, [lr, #0x24]
    ldr r3, [r4, #0x48]
    ldr r3, [r3, #0xc]
    str ip, [r3, #0x78]
    ldr r0, [r0, #0x0]
    bl func_02059278
    b .L_02200088
.L_02200014:
    ble .L_02200088
    ldr r0, [r4, #0xb44]
    ldr r0, [r0, #0xc]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_02200088
    mov r1, #0x5
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0xb44]
    mov r1, #0x6
    ldr r3, [r0, #0xc]
    mov r0, #0x0
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x2
    strh r2, [r3, #0x24]
    str r1, [r4, #0xb7c]
    str r0, [r4, #0xb80]
    b .L_02200088
.L_02200064:
    cmp r0, #0x6
    bne .L_02200088
    ldr r0, [r4, #0xb80]
    add r0, r0, #0x1
    str r0, [r4, #0xb80]
    cmp r0, #0x28
    movge r0, #0x0
    strge r0, [r4, #0xb7c]
    strge r0, [r4, #0xb80]
.L_02200088:
    add r0, sp, #0x8
    add r1, sp, #0x38
    bl func_02005030
    ldr r0, [r4, #0xb44]
    add r1, sp, #0x8
    bl func_ov040_02200118
    add r0, sp, #0x8
    bl func_02005058
    add r0, sp, #0x38
    bl func_02005058
.L_022000b0:
    ldr r0, [r4, #0xb9c]
    cmp r0, #0x0
    ble .L_022000e4
    sub r0, r0, #0x1
    str r0, [r4, #0xb9c]
    ldr r1, [r4, #0xb44]
    tst r0, #0x2
    ldreqh r0, [r1, #0x42]
    biceq r0, r0, #0x4
    streqh r0, [r1, #0x42]
    ldrneh r0, [r1, #0x42]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x42]
.L_022000e4:
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, pc}
.L_022000ec: .word gSystemState
.L_022000f0: .word 0x1013
.L_022000f4: .word gSoundContext
.L_022000f8: .word 0x1017
.L_022000fc: .word 0x100f
.L_02200100: .word 0x1009
.L_02200104: .word 0x103b
    .size func_ov040_021ff900, . - func_ov040_021ff900


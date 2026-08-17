; Matching retail form; see src/game/game_phase_currency_hud_values.c.
.text
.extern Sound_Play
.extern data_020c368c
.extern data_021052fc
.extern GraphicsSpriteState_SetAnimationIndex
.extern SignedAbsoluteValueVariant
.extern gGameWork
.extern gSoundContext

    .global GamePhaseCurrencyHud_AddCurrency
GamePhaseCurrencyHud_AddCurrency: ; 0x02010c00
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    movs r9, r1
    mov r10, r0
    mov r8, r2
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, L_02010e54
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r0, [r0, #0xd0]
    tst r0, #0x100
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, L_02010e58
    ldr r1, [r0, #0x0]
    ldr r2, [r1, #0x40]
    adds r6, r9, r2
    movmi r6, #0x0
    bmi L_02010c54
    ldr r0, L_02010e5c
    cmp r6, r0
    movgt r6, r0
L_02010c54:
    sub r9, r6, r2
    cmp r9, #0x0
    ldrgt r0, [r1, #0x44]
    ldr r2, L_02010e60
    addgt r0, r0, r9
    strgt r0, [r1, #0x44]
    ldrle r0, [r1, #0x48]
    addle r0, r0, r9
    strle r0, [r1, #0x48]
    ldr r0, L_02010e58
    ldrh r1, [r10, #0xb0]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x100
    ldrsh r0, [r0, #0x2e]
    tst r1, #0x1
    ldr r2, [r2, r0, lsl #0x2]
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq L_02010ce4
    cmp r6, r2
    blt L_02010ce4
    mov r0, #0xb4
    strh r0, [r10, #0xcc]
    mov r1, #0x3
    ldr r0, L_02010e58
    strh r1, [r10, #0xce]
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x40]
    cmp r0, r2
    bge L_02010ce4
    ldr r0, L_02010e64
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x7d
    bl Sound_Play
L_02010ce4:
    ldr r0, L_02010e58
    ldr r0, [r0, #0x0]
    str r6, [r0, #0x40]
    ldr r0, [r10, #0xc4]
    str r0, [r10, #0xc0]
    cmp r6, r0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldrh r0, [r10, #0xb0]
    tst r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r0, #0x1
    strh r0, [r10, #0xb2]
    mov r0, #0x14
    strh r0, [r10, #0xb4]
    ldr r0, [r10, #0xc0]
    cmp r6, r0
    ldrgth r0, [r10, #0xb0]
    orrgt r0, r0, #0x8
    strgth r0, [r10, #0xb0]
    bgt L_02010d4c
    ldrlth r0, [r10, #0xb0]
    orrlt r0, r0, #0x10
    strlth r0, [r10, #0xb0]
L_02010d4c:
    mov r5, #0x2
    mov r7, #0x0
    mov r4, #0x1
    mov r11, r5
L_02010d5c:
    ldr r0, [r10, #0xc0]
    cmp r6, r0
    add r0, r10, r7, lsl #0x2
    movlt r1, r5
    ldr r0, [r0, #0x80]
    movge r1, r4
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r10, #0xc0]
    cmp r6, r0
    movlt r1, r11
    add r0, r10, r7, lsl #0x2
    movge r1, #0x1
    ldr r0, [r0, #0x88]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r10, r7, lsl #0x2
    ldr r1, [r0, #0x80]
    add r7, r7, #0x1
    ldrh r0, [r1, #0x24]
    cmp r7, #0x2
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    blt L_02010d5c
    ldrsh r0, [r10, #0xba]
    cmp r0, #0x0
    bne L_02010df0
    ldr r0, [r10, #0xc0]
    cmp r6, r0
    ldr r0, L_02010e64
    movlt r2, #0x4f
    movge r2, #0x4e
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl Sound_Play
    mov r0, #0x2
    strh r0, [r10, #0xba]
L_02010df0:
    mov r0, r9
    bl SignedAbsoluteValueVariant
    ldrh r1, [r10, #0xb0]
    cmp r8, #0x0
    bic r1, r1, #0x1e0
    strh r1, [r10, #0xb0]
    ble L_02010e24
    ldrh r0, [r10, #0xb0]
    orr r0, r0, #0x100
    strh r0, [r10, #0xb0]
    str r8, [r10, #0xc8]
    strh r8, [r10, #0xb4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02010e24:
    cmp r0, #0x14
    ldrlth r0, [r10, #0xb0]
    orrlt r0, r0, #0x20
    strlth r0, [r10, #0xb0]
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    cmp r0, #0x64
    ldrh r0, [r10, #0xb0]
    orrlt r0, r0, #0x40
    strlth r0, [r10, #0xb0]
    orrge r0, r0, #0x80
    strgeh r0, [r10, #0xb0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02010e54: .word data_021052fc
L_02010e58: .word gGameWork
L_02010e5c: .word 0x98967f
L_02010e60: .word data_020c368c
L_02010e64: .word gSoundContext
    .size GamePhaseCurrencyHud_AddCurrency, . - GamePhaseCurrencyHud_AddCurrency


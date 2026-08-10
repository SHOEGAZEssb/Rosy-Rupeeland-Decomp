; Matching retail form; see src/game/game_phase_currency_hud_update.c.
.text
.extern GameWork_TestFlag
.extern Sound_Play
.extern data_020c368c
.extern data_021052fc
.extern GamePhaseCurrencyHud_UpdateDigits
.extern GamePhaseCurrencyHud_SetVisible
.extern func_02072b68
.extern func_020740a4
.extern func_02074110
.extern func_02091a70
.extern func_020bf1f8
.extern gGameWork
.extern gSoundContext
.extern genrand_int32

    .global GamePhaseCurrencyHud_Update
GamePhaseCurrencyHud_Update: ; 0x02010e68
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, L_020112d8
    mov r10, r0
    ldr r0, [r1, #0x0]
    cmp r0, #0x0
    addne r0, r0, #0x2000
    ldrne r0, [r0, #0xea4]
    cmpne r0, #0x0
    bne L_02010eb4
    ldrh r0, [r10, #0xb0]
    tst r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r0, r10
    mov r1, #0x0
    bl GamePhaseCurrencyHud_SetVisible
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02010eb4:
    ldr r0, L_020112dc
    ldrh r1, [r10, #0xb0]
    ldr r0, [r0, #0x0]
    ldr r7, [r0, #0x40]
    tst r1, #0x1
    strne r7, [r10, #0xc0]
    strne r7, [r10, #0xc4]
    movne r0, #0x0
    strneh r0, [r10, #0xba]
    bne L_020112a8
    ldrsh r0, [r10, #0xba]
    ldr r2, L_020112e0
    mov r4, #0x0
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgth r0, [r10, #0xba]
    ldr r0, L_020112dc
    ldr r0, [r0, #0x0]
    add r1, r0, #0x100
    ldrsh r1, [r1, #0x2e]
    ldr r11, [r2, r1, lsl #0x2]
    cmp r7, r11
    bge L_02010f90
    ldrsh r1, [r10, #0xce]
    cmp r1, #0x0
    ble L_02010f74
    ldrsh r1, [r10, #0xcc]
    cmp r1, #0x0
    bne L_02010f6c
    cmp r7, #0x0
    beq L_02010f54
    ldr r1, L_020112e4
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_02010f54
    ldr r0, L_020112e8
    mov r1, r4
    ldr r0, [r0, #0x0]
    mov r2, #0x72
    bl Sound_Play
L_02010f54:
    mov r0, #0x78
    strh r0, [r10, #0xcc]
    ldrsh r0, [r10, #0xce]
    sub r0, r0, #0x1
    strh r0, [r10, #0xce]
    b L_02010f74
L_02010f6c:
    sub r0, r1, #0x1
    strh r0, [r10, #0xcc]
L_02010f74:
    ldrh r0, [r10, #0xb0]
    tst r0, #0x200
    ldrh r0, [r10, #0xb0]
    moveq r4, #0x1
    orr r0, r0, #0x200
    strh r0, [r10, #0xb0]
    b L_02010f9c
L_02010f90:
    ldrh r0, [r10, #0xb0]
    bic r0, r0, #0x200
    strh r0, [r10, #0xb0]
L_02010f9c:
    ldr r0, L_020112ec
    ldrh r0, [r0, #0x0]
    and r0, r0, #0x8000
    mov r0, r0, asr #0xf
    cmp r0, #0x1
    bne L_02010fc8
    ldr r0, [r10, #0x4]
    ldr r5, [r10, #0x0]
    mov r9, #0x0
    bl func_02074110
    b L_02010fd4
L_02010fc8:
    ldmia r10, {r0, r5}
    mov r9, #0x1
    bl func_02074110
L_02010fd4:
    mov r0, #0x1
    str r0, [r5, #0x20]
    ldrh r0, [r10, #0xb2]
    cmp r0, #0x0
    beq L_020110c0
    cmp r0, #0x1
    beq L_02010ffc
    cmp r0, #0x2
    beq L_020110a8
    b L_020110c0
L_02010ffc:
    ldrsh r0, [r10, #0xb4]
    cmp r0, #0x0
    beq L_02011088
    sub r0, r0, #0x1
    strh r0, [r10, #0xb4]
    ldrh r0, [r10, #0xb0]
    tst r0, #0x100
    beq L_02011038
    ldrsh r3, [r10, #0xb4]
    ldr r1, [r10, #0xc0]
    ldr r2, [r10, #0xc8]
    mov r0, r7
    bl func_02091a70
    str r0, [r10, #0xc4]
    b L_020110c0
L_02011038:
    tst r0, #0x20
    strne r7, [r10, #0xc4]
    bne L_020110c0
    tst r0, #0x40
    ldrsh r3, [r10, #0xb4]
    beq L_02011070
    ldr r1, [r10, #0xc0]
    cmp r3, #0xa
    movgt r3, #0xa
    mov r0, r7
    mov r2, #0xa
    bl func_02091a70
    str r0, [r10, #0xc4]
    b L_020110c0
L_02011070:
    ldr r1, [r10, #0xc0]
    mov r0, r7
    mov r2, #0x14
    bl func_02091a70
    str r0, [r10, #0xc4]
    b L_020110c0
L_02011088:
    ldrh r2, [r10, #0xb0]
    mov r1, #0x2
    mov r0, #0x1e
    bic r2, r2, #0x1e0
    strh r2, [r10, #0xb0]
    str r7, [r10, #0xc0]
    strh r1, [r10, #0xb2]
    strh r0, [r10, #0xb4]
L_020110a8:
    ldrsh r0, [r10, #0xb4]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneh r0, [r10, #0xb4]
    moveq r0, #0x0
    streqh r0, [r10, #0xb2]
L_020110c0:
    ldr r1, [r10, #0xc4]
    mov r0, r10
    bl GamePhaseCurrencyHud_UpdateDigits
    ldrsh r0, [r10, #0xb6]
    cmp r0, #0x0
    bne L_0201117c
    ldrh r0, [r10, #0xb0]
    tst r0, #0x8
    beq L_02011184
    bl genrand_int32
    and r0, r0, #0x3
    add r0, r0, #0x2
    strh r0, [r10, #0xb6]
    ldrsh r8, [r10, #0xb8]
    add r0, r10, r9, lsl #0x4
    add r2, r0, r8, lsl #0x2
    ldr r1, [r2, #0x90]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x5
    strh r0, [r1, #0x24]
    ldr r0, [r2, #0x90]
    ldrb r1, [r0, #0x38]
    bl func_02072b68
    bl genrand_int32
    mov r1, #0xaa
    bl func_020bf1f8
    add r0, r10, r9, lsl #0x4
    add r0, r0, r8, lsl #0x2
    ldr r0, [r0, #0x90]
    rsb r1, r1, #0x0
    strh r1, [r0, #0x2c]
    bl genrand_int32
    mov r1, #0x28
    bl func_020bf1f8
    add r0, r10, r9, lsl #0x4
    add r0, r0, r8, lsl #0x2
    ldr r0, [r0, #0x90]
    rsb r1, r1, #0x0
    strh r1, [r0, #0x2e]
    ldrsh r0, [r10, #0xb8]
    add r0, r0, #0x1
    strh r0, [r10, #0xb8]
    ldrsh r0, [r10, #0xb8]
    cmp r0, #0x4
    movge r0, #0x0
    strgeh r0, [r10, #0xb8]
    b L_02011184
L_0201117c:
    sub r0, r0, #0x1
    strh r0, [r10, #0xb6]
L_02011184:
    mov r2, #0x0
    add r1, r10, r9, lsl #0x4
L_0201118c:
    add r0, r1, r2, lsl #0x2
    ldr r0, [r0, #0x90]
    add r2, r2, #0x1
    ldrh r8, [r0, #0x24]
    and r3, r8, #0x1
    mov r3, r3, lsl #0x10
    movs r3, r3, lsr #0x10
    orrne r3, r8, #0x4
    strneh r3, [r0, #0x24]
    cmp r2, #0x4
    blt L_0201118c
    cmp r4, #0x0
    bne L_020111dc
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x80]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq L_02011260
L_020111dc:
    cmp r4, #0x0
    movne r1, #0x2
    bne L_02011234
    ldrh r0, [r10, #0xb0]
    tst r0, #0x2
    movne r1, #0x0
    movne r6, r1
    bne L_02011234
    ldrh r0, [r10, #0xb2]
    cmp r0, #0x1
    bne L_02011224
    ldr r0, [r10, #0xc4]
    cmp r0, r7
    movle r1, #0x1
    movle r6, r1
    movgt r1, #0x2
    movgt r6, r1
    b L_02011234
L_02011224:
    mov r6, #0x0
    cmp r7, r11
    movge r1, r6
    movlt r1, #0x3
L_02011234:
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x80]
    bl func_02072b68
    add r3, r10, r9, lsl #0x2
    ldr r2, [r3, #0x80]
    mov r1, r6
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r0, [r3, #0x88]
    bl func_02072b68
L_02011260:
    ldrh r0, [r10, #0xb0]
    tst r0, #0x10
    ldreqsh r1, [r10, #0xbe]
    ldreqsh r0, [r10, #0xbc]
    streq r0, [r5, #0x18]
    streq r1, [r5, #0x1c]
    beq L_020112a8
    bl genrand_int32
    ldrsh r1, [r10, #0xbe]
    and r0, r0, #0x3
    sub r4, r1, r0
    bl genrand_int32
    rsb r0, r0, #0x3
    ldrsh r1, [r10, #0xbc]
    and r0, r0, #0x7
    add r0, r1, r0
    str r0, [r5, #0x18]
    str r4, [r5, #0x1c]
L_020112a8:
    ldrh r0, [r10, #0xb2]
    mov r4, #0x0
    cmp r0, #0x1
    ldrneh r0, [r10, #0xb0]
    bicne r0, r0, #0x18
    strneh r0, [r10, #0xb0]
L_020112c0:
    ldr r0, [r10, r4, lsl #0x2]
    bl func_020740a4
    add r4, r4, #0x1
    cmp r4, #0x2
    blt L_020112c0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_020112d8: .word data_021052fc
L_020112dc: .word gGameWork
L_020112e0: .word data_020c368c
L_020112e4: .word 0x3f5
L_020112e8: .word gSoundContext
L_020112ec: .word 0x4000304
    .size GamePhaseCurrencyHud_Update, . - GamePhaseCurrencyHud_Update


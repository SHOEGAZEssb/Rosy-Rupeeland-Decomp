; Matching retail form; see src/game/game_phase_currency_hud_display.c.
.text
.extern func_02072b68
.extern func_020befec
.extern genrand_int32

    .global GamePhaseCurrencyHud_UpdateDigits
GamePhaseCurrencyHud_UpdateDigits: ; 0x020112f0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    mov r9, r1
    mov r6, #0x0
L_02011300:
    mov r0, r9
    mov r1, #0xa
    mov r7, #0x0
    bl func_020befec
    and r4, r1, #0xff
    add r5, r10, r6, lsl #0x2
    mov r11, #0x1c
L_0201131c:
    mla r8, r7, r11, r5
    ldr r0, [r8, #0x48]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    ldrneb r1, [r0, #0x38]
    cmpne r4, r1
    beq L_02011388
    mov r1, r4
    bl func_02072b68
    ldr r1, [r8, #0x48]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    bl genrand_int32
    tst r0, #0xf
    moveq r1, #0xc0
    beq L_02011380
    bl genrand_int32
    ldr r1, L_02011408
    and r0, r0, r1
    add r0, r0, #0xe0
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
L_02011380:
    ldr r0, [r8, #0x48]
    strh r1, [r0, #0x36]
L_02011388:
    ldr r1, [r8, #0x48]
    add r7, r7, #0x1
    ldrh r0, [r1, #0x24]
    cmp r7, #0x2
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    blt L_0201131c
    mov r0, r9
    add r6, r6, #0x1
    mov r1, #0xa
    bl func_020befec
    mov r9, r0
    cmp r6, #0x7
    blt L_02011300
    mov r4, r6
    mov r0, #0x1c
    b L_020113fc
L_020113cc:
    mov r5, r6
    add r3, r10, r4, lsl #0x2
    b L_020113f0
L_020113d8:
    mla r1, r5, r0, r3
    ldr r2, [r1, #0x48]
    add r5, r5, #0x1
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
L_020113f0:
    cmp r5, #0x7
    blt L_020113d8
    add r4, r4, #0x1
L_020113fc:
    cmp r4, #0x7
    blt L_020113cc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02011408: .word 0x1ff
    .size GamePhaseCurrencyHud_UpdateDigits, . - GamePhaseCurrencyHud_UpdateDigits


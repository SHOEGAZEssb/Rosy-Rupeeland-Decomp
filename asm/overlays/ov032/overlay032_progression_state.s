.text

/* Exact fallback; see src/overlays/ov032/overlay032_progression_state.c for documented portable C. */
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern data_021f5f18
.extern data_ov032_02202220
.extern DisplayBrightness_StartMainTransition
.extern DisplayBrightness_IsMainTransitionComplete
.extern func_02072b68
.extern func_02098348
.extern func_ov032_021fe0e8
.extern func_ov032_021fe134
.extern func_ov032_021fe23c
.extern func_ov032_021fe2bc
.extern func_ov032_021fe2f0
.extern func_ov032_021fe440
.extern func_ov032_021fe55c
.extern func_ov032_021fe6b0
.extern func_ov032_021fe7d0
.extern func_ov032_021fe848
.extern func_ov032_021fe8a0
.extern func_ov032_021fe8d8
.extern func_ov032_021fe92c
.extern func_ov032_021fe9e8
.extern func_ov032_021fead4
.extern func_ov032_021ff288
.extern func_ov032_02200180
.extern func_ov032_022001a0
.extern func_ov032_022001c0
.extern func_ov032_02200284
.extern func_ov032_022003e4
.extern gGameWork

    .global func_ov032_021ff6e0
func_ov032_021ff6e0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r2, [r4, #0xb64]
    cmp r2, #0x28
    bgt L_021ff76c
    bge L_021ffa84
    cmp r2, #0x15
    bgt L_021ff750
    bge L_021ffa24
    cmp r2, #0xa
    bgt L_021ff744
    cmp r2, #0x0
    addge pc, pc, r2, lsl #0x2
    b L_0220016c
L_021ff718: ; jump table
    b L_021ff828 ; case 0
    b L_021ff84c ; case 1
    b L_021ff88c ; case 2
    b L_021ff954 ; case 3
    b L_021ff970 ; case 4
    b L_0220016c ; case 5
    b L_0220016c ; case 6
    b L_0220016c ; case 7
    b L_0220016c ; case 8
    b L_0220016c ; case 9
    b L_021ff984 ; case 10
L_021ff744:
    cmp r2, #0x14
    beq L_021ffa08
    b L_0220016c
L_021ff750:
    cmp r2, #0x1e
    bgt L_021ff760
    beq L_021ffa48
    b L_0220016c
L_021ff760:
    cmp r2, #0x1f
    beq L_021ffa60
    b L_0220016c
L_021ff76c:
    cmp r2, #0x3e
    bgt L_021ff794
    bge L_021ffc38
    cmp r2, #0x3c
    bgt L_021ff788
    beq L_021ffb54
    b L_0220016c
L_021ff788:
    cmp r2, #0x3d
    beq L_021ffbb8
    b L_0220016c
L_021ff794:
    cmp r2, #0x47
    bgt L_021ff7d4
    subs r1, r2, #0x40
    addpl pc, pc, r1, lsl #0x2
    b L_021ff7c8
    b L_021ffc78
    b L_021ffca4
    b L_021ffcd8
    b L_021ffd14
    b L_021ffd48
    b L_021ffe04
    b L_021ffeac
    b L_021fff50
L_021ff7c8:
    cmp r2, #0x3f
    beq L_021ffc54
    b L_0220016c
L_021ff7d4:
    sub r1, r2, #0x50
    cmp r1, #0x10
    addls pc, pc, r1, lsl #0x2
    b L_0220016c
L_021ff7e4: ; jump table
    b L_021fff5c ; case 0
    b L_021fffc0 ; case 1
    b L_0220016c ; case 2
    b L_0220016c ; case 3
    b L_0220016c ; case 4
    b L_0220016c ; case 5
    b L_0220016c ; case 6
    b L_0220016c ; case 7
    b L_0220016c ; case 8
    b L_0220016c ; case 9
    b L_021fffe8 ; case 10
    b L_02200004 ; case 11
    b L_0220001c ; case 12
    b L_022000f8 ; case 13
    b L_02200110 ; case 14
    b L_02200128 ; case 15
    b L_02200140 ; case 16
L_021ff828:
    ldr r1, [r4, #0xc1c]
    mov r0, #0x2
    str r1, [r4, #0xc24]
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ff84c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_0220016c
    ldr r1, [r4, #0xc24]
    ldr r0, L_02200174
    add r1, r4, r1, lsl #0x2
    ldr r0, [r0, #0x0]
    ldr r1, [r1, #0xe60]
    bl GameWork_TestFlag
    cmp r0, #0x0
    moveq r0, #0x3c
    streq r0, [r4, #0xb64]
    ldrne r0, [r4, #0xb64]
    addne r0, r0, #0x1
    strne r0, [r4, #0xb64]
    b L_0220016c
L_021ff88c:
    bl func_ov032_021fe55c
    mov r0, r4
    bl func_ov032_021fe6b0
    mov r0, r4
    bl func_ov032_021fe2f0
    mov r0, r4
    bl func_ov032_021fe440
    mov r0, r4
    mov r1, #0x0
    bl func_ov032_021fe848
    ldr r0, [r4, #0xc1c]
    cmp r0, #0x3
    blt L_021ff8d0
    ldr r0, [r4, #0x304]
    mov r1, #0x2
    bl func_02072b68
    b L_021ff8e0
L_021ff8d0:
    sub r1, r0, #0x1
    ldr r0, [r4, #0x304]
    and r1, r1, #0xff
    bl func_02072b68
L_021ff8e0:
    ldr r2, [r4, #0x304]
    add r0, r4, #0x2a4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r2, [r4, #0x154]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r2, [r4, #0x274]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r2, [r4, #0x2a4]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_ov032_02200180
    ldr r0, [r4, #0xc24]
    cmp r0, #0x1
    add r0, r4, #0x274
    ble L_021ff940
    bl func_ov032_022001a0
    b L_021ff944
L_021ff940:
    bl func_ov032_02200180
L_021ff944:
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ff954:
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ff970:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    movne r0, #0xa
    strne r0, [r4, #0xb64]
    b L_0220016c
L_021ff984:
    ldr r0, [r4, #0xb84]
    cmp r0, #0x0
    beq L_0220016c
    add r1, r4, #0x354
    mvn r2, #0x0
    mov r3, r2
    add r0, r4, #0x154
    add r1, r1, #0x800
    bl func_ov032_021ff288
    cmp r0, #0x0
    movne r0, #0x5a
    strne r0, [r4, #0xb64]
    bne L_0220016c
    add r1, r4, #0x354
    mov r2, #0x14
    mov r3, r2
    add r0, r4, #0x274
    add r1, r1, #0x800
    bl func_ov032_021ff288
    cmp r0, #0x0
    movne r0, #0x1e
    strne r0, [r4, #0xb64]
    bne L_0220016c
    add r1, r4, #0x354
    mov r2, #0x14
    mov r3, r2
    add r0, r4, #0x2a4
    add r1, r1, #0x800
    bl func_ov032_021ff288
    cmp r0, #0x0
    movne r0, #0x14
    strne r0, [r4, #0xb64]
    b L_0220016c
L_021ffa08:
    mov r0, r4
    mvn r1, #0x0
    bl func_ov032_021fe8d8
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ffa24:
    bl func_ov032_021fe92c
    cmp r0, #0x0
    beq L_0220016c
    ldr r1, [r4, #0xc24]
    mov r0, #0x28
    add r1, r1, #0x1
    str r1, [r4, #0xc24]
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ffa48:
    mov r1, #0x1
    bl func_ov032_021fe8d8
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ffa60:
    bl func_ov032_021fe92c
    cmp r0, #0x0
    beq L_0220016c
    ldr r1, [r4, #0xc24]
    mov r0, #0x28
    sub r1, r1, #0x1
    str r1, [r4, #0xc24]
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ffa84:
    bl func_ov032_021fe440
    mov r0, r4
    mov r1, #0x0
    bl func_ov032_021fe848
    ldr r1, [r4, #0xc24]
    ldr r0, [r4, #0xc1c]
    cmp r1, r0
    add r0, r4, #0x2a4
    bge L_021ffab0
    bl func_ov032_022001a0
    b L_021ffab4
L_021ffab0:
    bl func_ov032_02200180
L_021ffab4:
    ldr r0, [r4, #0xc24]
    cmp r0, #0x1
    add r0, r4, #0x274
    ble L_021ffacc
    bl func_ov032_022001a0
    b L_021ffad0
L_021ffacc:
    bl func_ov032_02200180
L_021ffad0:
    ldr r0, [r4, #0xb80]
    cmp r0, #0x0
    ldrne r0, [r4, #0x280]
    cmpne r0, #0x0
    beq L_021ffb0c
    add r1, r4, #0x354
    mov r2, #0x14
    mov r3, r2
    add r0, r4, #0x274
    add r1, r1, #0x800
    bl func_ov032_021ff288
    cmp r0, #0x0
    movne r0, #0x1e
    strne r0, [r4, #0xb64]
    bne L_0220016c
L_021ffb0c:
    ldr r0, [r4, #0xb80]
    cmp r0, #0x0
    ldrne r0, [r4, #0x2b0]
    cmpne r0, #0x0
    beq L_021ffb48
    add r1, r4, #0x354
    mov r2, #0x14
    mov r3, r2
    add r0, r4, #0x2a4
    add r1, r1, #0x800
    bl func_ov032_021ff288
    cmp r0, #0x0
    movne r0, #0x14
    strne r0, [r4, #0xb64]
    bne L_0220016c
L_021ffb48:
    mov r0, #0xa
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ffb54:
    ldr r6, [r4, #0xc24]
    ldr r5, L_02200174
    b L_021ffb74
L_021ffb60:
    add r1, r4, r6, lsl #0x2
    ldr r0, [r5, #0x0]
    ldr r1, [r1, #0xe60]
    bl GameWork_SetFlag
    sub r6, r6, #0x1
L_021ffb74:
    cmp r6, #0x0
    bgt L_021ffb60
    ldr r0, [r4, #0xc24]
    cmp r0, #0x1
    movle r0, #0x50
    strle r0, [r4, #0xb64]
    ble L_0220016c
    ldr r0, [r4, #0xc1c]
    sub r0, r0, #0x1
    str r0, [r4, #0xc1c]
    ldr r0, [r4, #0xc24]
    sub r0, r0, #0x1
    str r0, [r4, #0xc24]
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ffbb8:
    ldr r0, [r4, #0xc1c]
    cmp r0, #0x0
    ble L_021ffbfc
    cmp r0, #0x3
    blt L_021ffbdc
    ldr r0, [r4, #0x304]
    mov r1, #0x2
    bl func_02072b68
    b L_021ffbec
L_021ffbdc:
    sub r1, r0, #0x1
    ldr r0, [r4, #0x304]
    and r1, r1, #0xff
    bl func_02072b68
L_021ffbec:
    ldr r1, [r4, #0x304]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
L_021ffbfc:
    mov r0, r4
    bl func_ov032_021fe55c
    mov r0, r4
    bl func_ov032_021fe6b0
    mov r0, r4
    bl func_ov032_021fe2f0
    mov r0, r4
    bl func_ov032_021fe440
    mov r0, r4
    mov r1, #0x0
    bl func_ov032_021fe848
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ffc38:
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ffc54:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_0220016c
    mov r0, #0x78
    str r0, [r4, #0xb7c]
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ffc78:
    ldr r1, [r4, #0xb7c]
    sub r1, r1, #0x1
    str r1, [r4, #0xb7c]
    cmp r1, #0x0
    bgt L_0220016c
    mvn r1, #0x0
    bl func_ov032_021fe9e8
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ffca4:
    bl func_ov032_021fead4
    cmp r0, #0x0
    beq L_0220016c
    ldr r0, [r4, #0xc1c]
    add r0, r0, #0x1
    str r0, [r4, #0xc1c]
    ldr r0, [r4, #0xc24]
    add r0, r0, #0x1
    str r0, [r4, #0xc24]
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ffcd8:
    bl func_ov032_021fe6b0
    mov r0, r4
    bl func_ov032_021fe2f0
    mov r0, r4
    bl func_ov032_021fe440
    mov r0, r4
    mov r1, #0x1
    bl func_ov032_021fe848
    mov r0, r4
    mov r1, #0x1
    bl func_ov032_021fe9e8
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ffd14:
    bl func_ov032_021fead4
    cmp r0, #0x0
    beq L_0220016c
    mov r0, r4
    bl func_ov032_021fe55c
    mov r0, r4
    bl func_ov032_022001c0
    mov r0, #0xc8
    str r0, [r4, #0xb7c]
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ffd48:
    bl func_ov032_02200284
    ldr r0, [r4, #0xb7c]
    sub r0, r0, #0x1
    str r0, [r4, #0xb7c]
    cmp r0, #0x0
    bgt L_021ffd84
    mov r0, r4
    mov r1, #0x0
    bl func_ov032_021fe848
    mov r0, #0x1e
    str r0, [r4, #0xb7c]
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021ffd84:
    ldr r2, [r4, #0xc1c]
    cmp r2, #0x1
    bne L_021ffdc0
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    ldr r1, [r4, #0x304]
    cmp r0, #0x4
    ldrlth r0, [r1, #0x24]
    orrlt r0, r0, #0x4
    strlth r0, [r1, #0x24]
    ldrgeh r0, [r1, #0x24]
    bicge r0, r0, #0x4
    strgeh r0, [r1, #0x24]
    b L_0220016c
L_021ffdc0:
    cmp r2, #0x3
    bgt L_0220016c
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    cmp r0, #0x4
    bge L_021ffdf0
    sub r1, r2, #0x2
    ldr r0, [r4, #0x304]
    and r1, r1, #0xff
    bl func_02072b68
    b L_0220016c
L_021ffdf0:
    sub r1, r2, #0x1
    ldr r0, [r4, #0x304]
    and r1, r1, #0xff
    bl func_02072b68
    b L_0220016c
L_021ffe04:
    bl func_ov032_02200284
    ldr r0, [r4, #0xb7c]
    sub r0, r0, #0x1
    str r0, [r4, #0xb7c]
    cmp r0, #0x0
    ldrle r0, [r4, #0xb64]
    addle r0, r0, #0x1
    strle r0, [r4, #0xb64]
    ldr r2, [r4, #0xc1c]
    cmp r2, #0x1
    bne L_021ffe64
    ldr r0, [r4, #0xb7c]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    ldr r1, [r4, #0x304]
    cmp r0, #0x4
    ldrlth r0, [r1, #0x24]
    orrlt r0, r0, #0x4
    strlth r0, [r1, #0x24]
    ldrgeh r0, [r1, #0x24]
    bicge r0, r0, #0x4
    strgeh r0, [r1, #0x24]
    b L_0220016c
L_021ffe64:
    cmp r2, #0x3
    bgt L_0220016c
    ldr r0, [r4, #0xb7c]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    cmp r0, #0x4
    bge L_021ffe98
    sub r1, r2, #0x2
    ldr r0, [r4, #0x304]
    and r1, r1, #0xff
    bl func_02072b68
    b L_0220016c
L_021ffe98:
    sub r1, r2, #0x1
    ldr r0, [r4, #0x304]
    and r1, r1, #0xff
    bl func_02072b68
    b L_0220016c
L_021ffeac:
    bl func_ov032_022003e4
    ldr r1, [r4, #0xc1c]
    ldr r0, [r4, #0x304]
    sub r1, r1, #0x1
    and r1, r1, #0xff
    bl func_02072b68
    ldr r1, [r4, #0x304]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x154]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x274]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x2a4]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0xc24]
    ldr r0, [r4, #0xc1c]
    cmp r1, r0
    add r0, r4, #0x2a4
    bge L_021fff20
    bl func_ov032_022001a0
    b L_021fff24
L_021fff20:
    bl func_ov032_02200180
L_021fff24:
    ldr r0, [r4, #0xc24]
    cmp r0, #0x1
    add r0, r4, #0x274
    ble L_021fff3c
    bl func_ov032_022001a0
    b L_021fff40
L_021fff3c:
    bl func_ov032_02200180
L_021fff40:
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021fff50:
    mov r0, #0xa
    str r0, [r4, #0xb64]
    b L_0220016c
L_021fff5c:
    ldr r0, [r4, #0x304]
    mov r1, #0x0
    bl func_02072b68
    ldr r2, [r4, #0x304]
    mov r0, r4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_ov032_021fe55c
    mov r0, r4
    bl func_ov032_021fe6b0
    mov r0, r4
    bl func_ov032_021fe2f0
    mov r0, r4
    bl func_ov032_021fe440
    mov r0, r4
    mov r1, #0x1
    bl func_ov032_021fe848
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_021fffc0:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_0220016c
    mov r0, r4
    bl func_ov032_022001c0
    mov r0, #0xc8
    str r0, [r4, #0xb7c]
    mov r0, #0x44
    str r0, [r4, #0xb64]
    b L_0220016c
L_021fffe8:
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_02200004:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    ldrne r0, [r4, #0xb64]
    addne r0, r0, #0x1
    strne r0, [r4, #0xb64]
    b L_0220016c
L_0220001c:
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1300
    str r1, [r2, #0x0]
    bl func_ov032_021fe7d0
    mov r0, r4
    bl func_ov032_021fe8a0
    ldr r2, [r4, #0x304]
    ldr r0, L_02200178
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r2, [r4, #0x274]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r2, [r4, #0x2a4]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r1, [r0, #0x460]
    cmp r1, #0x0
    ble L_022000b0
    ldr r2, [r4, #0x184]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_02098348
    cmp r0, #0x0
    beq L_022000b0
    ldr r2, [r4, #0x1b4]
    add r0, r4, #0x1b4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_ov032_021fe0e8
L_022000b0:
    ldr r1, [r4, #0xf4]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x154]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0xc1c]
    cmp r0, #0x0
    ldrgt r1, [r4, #0x124]
    ldrgth r0, [r1, #0x24]
    bicgt r0, r0, #0x4
    strgth r0, [r1, #0x24]
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_022000f8:
    mov r1, #0x1
    bl func_ov032_021fe23c
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_02200110:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    ldrne r0, [r4, #0xb64]
    addne r0, r0, #0x1
    strne r0, [r4, #0xb64]
    b L_0220016c
L_02200128:
    mov r1, #0x23
    bl func_ov032_021fe2bc
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_0220016c
L_02200140:
    mov r1, #0x0
    bl func_ov032_021fe134
    cmp r0, #0x0
    beq L_0220016c
    ldr r0, L_0220017c
    mov r1, #0xa
    ldr r2, [r0, #0x80]
    ldr r0, [r0, #0x84]
    str r2, [r4, #0xb6c]
    str r0, [r4, #0xb70]
    str r1, [r4, #0xb64]
L_0220016c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_02200174: .word gGameWork
L_02200178: .word data_021f5f18
L_0220017c: .word data_ov032_02202220
.size func_ov032_021ff6e0, .-func_ov032_021ff6e0


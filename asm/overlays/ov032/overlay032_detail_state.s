.text

/* Exact fallback; see src/overlays/ov032/overlay032_detail_state.c for documented portable C. */
.extern GameWork_TestFlag
.extern data_021f5f18
.extern data_021f6288
.extern data_ov032_02202220
.extern DisplayBrightness_StartMainTransition
.extern DisplayBrightness_IsMainTransitionComplete
.extern func_02092e9c
.extern func_02097f18
.extern func_02098348
.extern func_ov032_021fe0e8
.extern func_ov032_021fe134
.extern func_ov032_021fe23c
.extern func_ov032_021fe2bc
.extern func_ov032_021fe4a8
.extern func_ov032_0220173c
.extern func_ov032_022018ac
.extern func_ov032_02201960
.extern gGameWork

    .global func_ov032_021ff308
func_ov032_021ff308:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xb64]
    cmp r1, #0x5a
    bgt L_021ff380
    bge L_021ff534
    cmp r1, #0x14
    bgt L_021ff364
    bge L_021ff4c4
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b L_021ff6c8
L_021ff338: ; jump table
    b L_021ff3d8 ; case 0
    b L_021ff3f4 ; case 1
    b L_021ff40c ; case 2
    b L_021ff464 ; case 3
    b L_021ff480 ; case 4
    b L_021ff6c8 ; case 5
    b L_021ff6c8 ; case 6
    b L_021ff6c8 ; case 7
    b L_021ff6c8 ; case 8
    b L_021ff6c8 ; case 9
    b L_021ff494 ; case 10
L_021ff364:
    cmp r1, #0x15
    bgt L_021ff374
    beq L_021ff4fc
    b L_021ff6c8
L_021ff374:
    cmp r1, #0x16
    beq L_021ff51c
    b L_021ff6c8
L_021ff380:
    cmp r1, #0x5d
    bgt L_021ff3a8
    bge L_021ff654
    cmp r1, #0x5b
    bgt L_021ff39c
    beq L_021ff550
    b L_021ff6c8
L_021ff39c:
    cmp r1, #0x5c
    beq L_021ff568
    b L_021ff6c8
L_021ff3a8:
    cmp r1, #0x5e
    bgt L_021ff3b8
    beq L_021ff66c
    b L_021ff6c8
L_021ff3b8:
    cmp r1, #0x60
    bgt L_021ff6c8
    cmp r1, #0x5f
    blt L_021ff6c8
    beq L_021ff684
    cmp r1, #0x60
    beq L_021ff69c
    b L_021ff6c8
L_021ff3d8:
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff3f4:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    ldrne r0, [r4, #0xb64]
    addne r0, r0, #0x1
    strne r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff40c:
    bl func_ov032_021fe4a8
    ldr ip, [r4, #0x154]
    add r0, r4, #0x2c4
    ldrh r1, [ip, #0x24]
    mov r3, #0x80
    mov r2, #0xa0
    bic r1, r1, #0x4
    strh r1, [ip, #0x24]
    ldr ip, [r4, #0xb14]
    mov r1, r4
    strh r3, [ip, #0x2c]
    strh r2, [ip, #0x2e]
    ldr r3, [r4, #0xb14]
    add r0, r0, #0xc00
    ldrh r2, [r3, #0x24]
    bic r2, r2, #0x4
    strh r2, [r3, #0x24]
    bl func_ov032_0220173c
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff464:
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff480:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    movne r0, #0xa
    strne r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff494:
    add r0, r4, #0x2c4
    add r0, r0, #0xc00
    bl func_ov032_02201960
    cmp r0, #0x0
    beq L_021ff6c8
    ldr r0, [r4, #0xf14]
    cmp r0, #0x0
    movlt r0, #0x5a
    strlt r0, [r4, #0xb64]
    movge r0, #0x14
    strge r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff4c4:
    mov r1, #0x1
    bl func_ov032_021fe23c
    ldr r0, [r4, #0xf14]
    ldr r1, L_021ff6d0
    add r0, r1, r0, lsl #0x3
    bl func_02097f18
    mov r1, r0
    ldr r0, [r4, #0x10]
    mov r2, #0x0
    bl func_02092e9c
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff4fc:
    mov r0, r4
    mov r1, #0x1
    bl func_ov032_021fe134
    cmp r0, #0x0
    ldrne r0, [r4, #0xb64]
    addne r0, r0, #0x1
    strne r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff51c:
    mov r0, r4
    mov r1, #0x0
    bl func_ov032_021fe23c
    mov r0, #0xa
    str r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff534:
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff550:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    ldrne r0, [r4, #0xb64]
    addne r0, r0, #0x1
    strne r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff568:
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    add r0, r4, #0x2c4
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1300
    str r1, [r2, #0x0]
    add r0, r0, #0xc00
    bl func_ov032_022018ac
    ldr r2, [r4, #0xb14]
    ldr r0, L_021ff6d4
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r2, [r4, #0x184]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_02098348
    cmp r0, #0x0
    beq L_021ff5d0
    ldr r2, [r4, #0x1b4]
    add r0, r4, #0x1b4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_ov032_021fe0e8
L_021ff5d0:
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
    ble L_021ff644
    ldr r2, [r4, #0x124]
    ldr r0, L_021ff6d8
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r1, [r4, #0xc1c]
    ldr r0, [r0, #0x0]
    add r1, r4, r1, lsl #0x2
    ldr r1, [r1, #0xe60]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_021ff644
    ldr r2, [r4, #0x1e4]
    add r0, r4, #0x1e4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_ov032_021fe0e8
L_021ff644:
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff654:
    mov r1, #0x1
    bl func_ov032_021fe23c
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff66c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    ldrne r0, [r4, #0xb64]
    addne r0, r0, #0x1
    strne r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff684:
    mov r1, #0x23
    bl func_ov032_021fe2bc
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_021ff6c8
L_021ff69c:
    mov r1, #0x0
    bl func_ov032_021fe134
    cmp r0, #0x0
    beq L_021ff6c8
    ldr r0, L_021ff6dc
    mov r1, #0xa
    ldr r2, [r0, #0x88]
    ldr r0, [r0, #0x8c]
    str r2, [r4, #0xb6c]
    str r0, [r4, #0xb70]
    str r1, [r4, #0xb64]
L_021ff6c8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021ff6d0: .word data_021f6288
L_021ff6d4: .word data_021f5f18
L_021ff6d8: .word gGameWork
L_021ff6dc: .word data_ov032_02202220
.size func_ov032_021ff308, .-func_ov032_021ff308


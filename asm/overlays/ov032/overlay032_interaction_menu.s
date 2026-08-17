.text

/* Exact fallback; see src/overlays/ov032/overlay032_interaction_menu.c for documented portable C. */
.extern GameWork_TestFlag
.extern Sound_Play
.extern data_021f5f18
.extern data_ov032_02202220
.extern RetailSelectionManager_HasInactiveSpecialRecord
.extern func_ov032_021fe0e8
.extern func_ov032_021fe10c
.extern func_ov032_021fe134
.extern func_ov032_021fe23c
.extern func_ov032_021fe2bc
.extern Overlay032SpriteWrapper_HitTest
.extern gGameWork
.extern gSoundContext

    .global func_ov032_021feea0
func_ov032_021feea0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0xb64]
    cmp r1, #0x14
    bgt L_021feef4
    bge L_021ff21c
    cmp r1, #0xb
    addls pc, pc, r1, lsl #0x2
    b L_021ff270
L_021feec4: ; jump table
    b L_021fef00 ; case 0
    b L_021fefd0 ; case 1
    b L_021fefec ; case 2
    b L_021ff008 ; case 3
    b L_021ff270 ; case 4
    b L_021ff01c ; case 5
    b L_021ff270 ; case 6
    b L_021ff270 ; case 7
    b L_021ff270 ; case 8
    b L_021ff270 ; case 9
    b L_021ff038 ; case 10
    b L_021ff050 ; case 11
L_021feef4:
    cmp r1, #0x15
    beq L_021ff240
    b L_021ff270
L_021fef00:
    mov r1, #0x1
    bl func_ov032_021fe23c
    ldr r0, L_021ff278
    ldr r1, [r0, #0x460]
    cmp r1, #0x0
    ble L_021fef4c
    ldr r2, [r5, #0x184]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl RetailSelectionManager_HasInactiveSpecialRecord
    cmp r0, #0x0
    beq L_021fef4c
    ldr r2, [r5, #0x1b4]
    add r0, r5, #0x1b4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_ov032_021fe0e8
L_021fef4c:
    ldr r1, [r5, #0x154]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0xf4]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0xc1c]
    cmp r0, #0x0
    ble L_021fefc0
    ldr r2, [r5, #0x124]
    ldr r0, L_021ff27c
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r1, [r5, #0xc1c]
    ldr r0, [r0, #0x0]
    add r1, r5, r1, lsl #0x2
    ldr r1, [r1, #0xe60]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_021fefc0
    ldr r2, [r5, #0x1e4]
    add r0, r5, #0x1e4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_ov032_021fe0e8
L_021fefc0:
    ldr r0, [r5, #0xb64]
    add r0, r0, #0x1
    str r0, [r5, #0xb64]
    b L_021ff270
L_021fefd0:
    ldr r1, L_021ff27c
    ldr r1, [r1, #0x0]
    ldrsh r1, [r1, #0xf8]
    bl func_ov032_021fe2bc
    mov r0, #0x5
    str r0, [r5, #0xb64]
    b L_021ff270
L_021fefec:
    mov r1, #0x1
    bl func_ov032_021fe134
    cmp r0, #0x0
    ldrne r0, [r5, #0xb64]
    addne r0, r0, #0x1
    strne r0, [r5, #0xb64]
    b L_021ff270
L_021ff008:
    mov r1, #0x1
    bl func_ov032_021fe134
    cmp r0, #0x0
    movne r0, #0xa
    strne r0, [r5, #0xb64]
L_021ff01c:
    mov r0, r5
    mov r1, #0x0
    bl func_ov032_021fe134
    cmp r0, #0x0
    movne r0, #0xa
    strne r0, [r5, #0xb64]
    b L_021ff270
L_021ff038:
    mov r1, #0x0
    bl func_ov032_021fe23c
    ldr r0, [r5, #0xb64]
    add r0, r0, #0x1
    str r0, [r5, #0xb64]
    b L_021ff270
L_021ff050:
    ldr r0, [r5, #0xb84]
    cmp r0, #0x0
    beq L_021ff270
    mov r4, #0x0
    add r1, r5, #0x354
    sub r2, r4, #0x1
    mov r3, r2
    add r0, r5, #0x154
    add r1, r1, #0x800
    bl Overlay032SpriteWrapper_HitTest
    cmp r0, #0x0
    beq L_021ff0a4
    ldr r0, L_021ff280
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    bl Sound_Play
    mov r0, #0x14
    str r0, [r5, #0xb64]
    mov r4, #0x1
    b L_021ff1a8
L_021ff0a4:
    add r1, r5, #0x354
    mvn r2, #0x0
    mov r3, r2
    add r0, r5, #0xf4
    add r1, r1, #0x800
    bl Overlay032SpriteWrapper_HitTest
    cmp r0, #0x0
    beq L_021ff0fc
    ldr r0, L_021ff280
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
    ldr r0, L_021ff284
    mov r1, r4
    ldr r2, [r0, #0x10]
    ldr r0, [r0, #0x14]
    mov r4, #0x1
    str r2, [r5, #0xb6c]
    str r0, [r5, #0xb70]
    str r1, [r5, #0xb64]
    b L_021ff1a8
L_021ff0fc:
    add r1, r5, #0x354
    mvn r2, #0x0
    mov r3, r2
    add r0, r5, #0x124
    add r1, r1, #0x800
    bl Overlay032SpriteWrapper_HitTest
    cmp r0, #0x0
    beq L_021ff154
    ldr r0, L_021ff280
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl Sound_Play
    ldr r0, L_021ff284
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r0, [r0, #0x4]
    mov r4, #0x1
    str r2, [r5, #0xb6c]
    str r0, [r5, #0xb70]
    str r1, [r5, #0xb64]
    b L_021ff1a8
L_021ff154:
    add r1, r5, #0x354
    mvn r2, #0x0
    mov r3, r2
    add r0, r5, #0x184
    add r1, r1, #0x800
    bl Overlay032SpriteWrapper_HitTest
    cmp r0, #0x0
    beq L_021ff1a8
    ldr r0, L_021ff280
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl Sound_Play
    ldr r0, L_021ff284
    mov r1, r4
    ldr r2, [r0, #0x8]
    ldr r0, [r0, #0xc]
    mov r4, #0x1
    str r2, [r5, #0xb6c]
    str r0, [r5, #0xb70]
    str r1, [r5, #0xb64]
L_021ff1a8:
    cmp r4, #0x0
    beq L_021ff270
    mov r0, r5
    bl func_ov032_021fe10c
    ldr r1, [r5, #0xf4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x124]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x154]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x184]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x1b4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x1e4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    b L_021ff270
L_021ff21c:
    mov r1, #0x1
    bl func_ov032_021fe23c
    mov r0, r5
    mov r1, #0x19
    bl func_ov032_021fe2bc
    ldr r0, [r5, #0xb64]
    add r0, r0, #0x1
    str r0, [r5, #0xb64]
    b L_021ff270
L_021ff240:
    mov r0, r5
    mov r1, #0x1
    bl func_ov032_021fe134
    cmp r0, #0x0
    beq L_021ff270
    ldr r0, L_021ff284
    mov r1, #0x0
    ldr r2, [r0, #0x90]
    ldr r0, [r0, #0x94]
    str r2, [r5, #0xb6c]
    str r0, [r5, #0xb70]
    str r1, [r5, #0xb64]
L_021ff270:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021ff278: .word data_021f5f18
L_021ff27c: .word gGameWork
L_021ff280: .word gSoundContext
L_021ff284: .word data_ov032_02202220
.size func_ov032_021feea0, .-func_ov032_021feea0


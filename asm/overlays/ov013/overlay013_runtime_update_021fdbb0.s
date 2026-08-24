    .text
    .extern data_ov013_021feb40
    .extern data_ov013_021feb58
    .extern data_ov013_021febb4
    .extern GamePhaseCurrencyHud_Update
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern GraphicsSpriteGroup_AdvanceAnimations
    .extern func_02092260
    .extern Presentation_SetScript
    .extern Presentation_IsScriptComplete
    .extern Presentation_IsScriptSuspended
    .extern func_02095860
    .extern func_020958d8
    .extern SpriteMotionController_PublishCoordinates
    .extern func_02095988
    .extern func_ov013_021fdfbc
    .extern gGamePhaseCurrencyHud

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov013/overlay013_runtime_update.c. */
    .global func_ov013_021fdbb0
    .global func_ov013_021fdd8c
    .global func_ov013_021fde18
    .global func_ov013_021fdee4
    .global func_ov013_021fdf38
func_ov013_021fdbb0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldr r0, [r6, #0x84]
    cmp r0, #0x0
    beq L_021fdd64
    ldr r0, [r6, #0x984]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b L_021fdc60
L_021fdbd4: ; jump table
    b L_021fdbec ; case 0
    b L_021fdc60 ; case 1
    b L_021fdc14 ; case 2
    b L_021fdc2c ; case 3
    b L_021fdc48 ; case 4
    b L_021fdc60 ; case 5
L_021fdbec:
    ldr r0, [r6, #0x948]
    bl Presentation_IsScriptSuspended
    cmp r0, #0x0
    beq L_021fdc60
    ldr r0, [r6, #0x948]
    mov r1, #0x0
    str r1, [r0, #0x90]
    mov r0, #0x1
    str r0, [r6, #0x984]
    b L_021fdc60
L_021fdc14:
    ldr r0, [r6, #0x948]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    movne r0, #0x3
    strne r0, [r6, #0x984]
    b L_021fdc60
L_021fdc2c:
    ldr r0, [r6, #0x948]
    ldr r1, L_021fdd80
    mov r2, #0x0
    bl Presentation_SetScript
    mov r0, #0x0
    str r0, [r6, #0x984]
    b L_021fdc60
L_021fdc48:
    ldr r0, [r6, #0x948]
    ldr r1, L_021fdd84
    mov r2, #0x0
    bl Presentation_SetScript
    mov r0, #0x5
    str r0, [r6, #0x984]
L_021fdc60:
    ldr r0, [r6, #0x948]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r6, #0x974]
    cmp r0, #0x0
    beq L_021fdcb4
    mov r8, #0x0
    add r7, r6, #0x8c
    mov r4, #0xac
L_021fdc88:
    mul r5, r8, r4
    add r0, r7, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r7, r5
    bl SpriteMotionController_PublishCoordinates
    add r8, r8, #0x1
    cmp r8, #0x7
    blt L_021fdc88
    b L_021fdd00
L_021fdcb4:
    mov r5, #0x0
    add r4, r6, #0x8c
    mov r7, #0xac
L_021fdcc0:
    mul r8, r5, r7
    add r0, r4, r8
    bl func_020958d8
    add r2, r6, r5, lsl #0x2
    add r3, r6, r8
    ldr r1, [r3, #0x128]
    ldr r0, [r2, #0x950]
    ldrsh r1, [r1, #0x2c]
    add r5, r5, #0x1
    cmp r5, #0x7
    strh r1, [r0, #0x2c]
    ldr r1, [r3, #0x128]
    ldr r0, [r2, #0x950]
    ldrsh r1, [r1, #0x2e]
    strh r1, [r0, #0x2e]
    blt L_021fdcc0
L_021fdd00:
    mov r8, #0x0
    add r7, r6, #0x540
    mov r4, #0xac
L_021fdd0c:
    mul r5, r8, r4
    add r0, r7, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r7, r5
    bl SpriteMotionController_PublishCoordinates
    add r8, r8, #0x1
    cmp r8, #0x5
    blt L_021fdd0c
    add r0, r6, #0x9c
    add r0, r0, #0x800
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r6, #0x9c
    add r0, r0, #0x800
    bl SpriteMotionController_PublishCoordinates
    ldr r0, [r6, #0x84]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r6, #0x88]
    bl GraphicsSpriteGroup_AdvanceAnimations
L_021fdd64:
    ldr r0, [r6, #0x97c]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, L_021fdd88
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_Update
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fdd80: .word data_ov013_021feb58
L_021fdd84: .word data_ov013_021feb40
L_021fdd88: .word gGamePhaseCurrencyHud

    .size func_ov013_021fdbb0, . - func_ov013_021fdbb0
func_ov013_021fdd8c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r5, r0
    mvn r0, #0x0
    mov r4, #0x0
    str r0, [r5, #0x96c]
    add r9, r5, #0x8c
    mov r8, r4
    mov r7, #0x4
    mov r6, #0xac
    b L_021fde08
L_021fddb4:
    mul r10, r4, r6
    mov r2, r8
    mov r3, r7
    add r0, r9, r10
    add r1, r5, #0x30
    bl func_02095860
    cmp r0, #0x0
    beq L_021fde04
    add r0, r5, r10
    add r0, r0, #0x100
    ldrh r0, [r0, #0x24]
    tst r0, #0x2
    streq r4, [r5, #0x96c]
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    mov r0, r5
    mov r1, #0x9
    bl func_02092260
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021fde04:
    add r4, r4, #0x1
L_021fde08:
    cmp r4, #0x7
    blt L_021fddb4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}

    .size func_ov013_021fdd8c, . - func_ov013_021fdd8c
func_ov013_021fde18:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    mvn r0, #0x0
    mov r5, #0x0
    str r0, [r7, #0x970]
    add r4, r7, #0x540
    mov r9, r5
    mov r8, #0xac
    b L_021fded0
L_021fde3c:
    mul r6, r5, r8
    mov r2, r9
    mov r3, r9
    add r0, r4, r6
    add r1, r7, #0x30
    bl func_02095860
    cmp r0, #0x0
    beq L_021fdecc
    add r0, r7, r6
    add r0, r0, #0x500
    ldrh r0, [r0, #0xd8]
    tst r0, #0x2
    beq L_021fde84
    mov r0, r7
    mov r1, #0x9
    bl func_02092260
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fde84:
    mov r0, #0x14
    mul r2, r5, r0
    ldr r1, L_021fdee0
    add r0, r4, r6
    ldr r1, [r1, r2]
    add r1, r1, #0x1
    bl func_02095988
    add r1, r5, #0xf
    ldr r0, [r7, #0x94c]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r7, #0x94c]
    mov r0, #0x1
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    str r5, [r7, #0x970]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fdecc:
    add r5, r5, #0x1
L_021fded0:
    cmp r5, #0x5
    blt L_021fde3c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fdee0: .word data_ov013_021febb4

    .size func_ov013_021fde18, . - func_ov013_021fde18
func_ov013_021fdee4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x9c
    mov r2, #0x0
    mov r3, r2
    add r0, r0, #0x800
    add r1, r4, #0x30
    bl func_02095860
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r0, r4, #0x9c
    add r0, r0, #0x800
    mov r1, #0x1
    bl func_02095988
    ldr r2, [r4, #0x94c]
    mov r0, #0x1
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldmia sp!, {r4, pc}

    .size func_ov013_021fdee4, . - func_ov013_021fdee4
func_ov013_021fdf38:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, #0x0
    add r5, r7, #0x8c
    mov r4, #0xac
    b L_021fdf68
L_021fdf50:
    mla r0, r6, r4, r5
    bl func_ov013_021fdfbc
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    add r6, r6, #0x1
L_021fdf68:
    cmp r6, #0x7
    blt L_021fdf50
    mov r6, #0x0
    add r5, r7, #0x540
    mov r4, #0xac
    b L_021fdf98
L_021fdf80:
    mla r0, r6, r4, r5
    bl func_ov013_021fdfbc
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    add r6, r6, #0x1
L_021fdf98:
    cmp r6, #0x5
    blt L_021fdf80
    add r0, r7, #0x9c
    add r0, r0, #0x800
    bl func_ov013_021fdfbc
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}

    .size func_ov013_021fdf38, . - func_ov013_021fdf38

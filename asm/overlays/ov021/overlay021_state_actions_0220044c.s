    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_actions.c. */
    .extern GameWork_SetFlag
    .extern GameWork_TestFlag
    .extern data_021f5128
    .extern data_ov021_02202ec8
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern RecordCategory_PublishById
    .extern RecordDescriptor_GetMessage
    .extern func_02092c8c
    .extern TitleDialog_ClearTextRect
    .extern func_ov021_021fd7c0
    .extern func_ov021_021feea4
    .extern func_ov021_021ff1d0
    .extern func_ov021_021ff274
    .extern func_ov021_021ffa10
    .extern func_ov045_0220c028
    .extern gGameWork

.global func_ov021_0220044c
func_ov021_0220044c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_02200474
    cmp r1, #0x1
    beq L_02200484
    cmp r1, #0x2
    beq L_022004c8
    b L_02200604
L_02200474:
    add r0, r1, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
L_02200484:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02200604
    ldr r0, [r4, #0x2bc]
    ldr r1, [r4, #0x3dc]
    bl RecordDescriptor_GetMessage
    mov r1, r0
    mov r0, r4
    bl func_ov021_021ff1d0
    ldr r0, [r4, #0x38c]
    bl func_ov045_0220c028
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200604
L_022004c8:
    bl func_ov021_021ff274
    cmp r0, #0x0
    beq L_02200604
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    ldr r0, L_02200614
    ldr r1, L_02200618
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_0220055c
    ldr r0, L_02200614
    ldr r1, L_02200618
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_02200614
    ldr r1, L_0220061c
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_02200614
    ldr r1, L_02200620
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_02200614
    ldr r1, L_02200624
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_02200614
    ldr r2, [r4, #0x54]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    add r0, r0, #0x200
    strh r2, [r0, #0x4]
    str r1, [r4, #0x3d8]
L_0220055c:
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021ffa10
    cmp r0, #0x0
    bne L_022005cc
    ldr r1, [r4, #0x2bc]
    ldr r0, [r1, #0x4]
    ldr r2, [r0, #0xc]
    tst r2, #0x80000000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_022005d4
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_022005c0
    and r0, r2, #0xf000
    mov r0, r0, lsr #0xc
    ldr r1, [r1, #0xc]
    sub r0, r0, #0x1
    cmp r1, r0
    movge r0, #0x1
    bge L_022005c4
L_022005c0:
    mov r0, #0x0
L_022005c4:
    cmp r0, #0x0
    beq L_022005d4
L_022005cc:
    mov r0, #0x1
    str r0, [r4, #0x3d8]
L_022005d4:
    ldr r1, [r4, #0x2bc]
    ldr r0, L_02200628
    ldr r1, [r1, #0x4]
    ldr r2, [r0, #0x0]
    ldr r0, [r4, #0x54]
    ldrh r1, [r1, #0x0]
    ldr r0, [r2, r0, lsl #0x2]
    bl RecordCategory_PublishById
    ldr r1, L_0220062c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
L_02200604:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02200614: .word gGameWork
L_02200618: .word 0x39a
L_0220061c: .word 0x3b7
L_02200620: .word 0x389
L_02200624: .word 0x3b2
L_02200628: .word data_021f5128
L_0220062c: .word data_ov021_02202ec8
    .size func_ov021_0220044c, . - func_ov021_0220044c


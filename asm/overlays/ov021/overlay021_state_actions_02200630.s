    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_actions.c. */
    .extern data_020f4e14
    .extern data_ov021_02202ea0
    .extern data_ov021_02202ea8
    .extern data_ov021_02202eb0
    .extern data_ov021_02202eb8
    .extern data_ov021_02202ec0
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern func_02092850
    .extern func_02092c8c
    .extern func_ov021_021fd1cc
    .extern func_ov021_021fd39c
    .extern func_ov021_021fd490
    .extern func_ov021_021fd7c0
    .extern func_ov021_021fe144
    .extern func_ov021_021fe520
    .extern func_ov021_021fe63c
    .extern func_ov021_021fe84c
    .extern func_ov021_021fee54
    .extern func_ov021_021feea4

.global func_ov021_02200630
func_ov021_02200630:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_02200818
L_02200648: ; jump table
    b L_02200658 ; case 0
    b L_02200668 ; case 1
    b L_022006a0 ; case 2
    b L_022007fc ; case 3
L_02200658:
    add r0, r1, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
L_02200668:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02200818
    ldr r0, L_02200828
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, r4
    bl func_ov021_021fe63c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200818
L_022006a0:
    bl func_ov021_021fe520
    mov r0, r4
    bl func_ov021_021fe84c
    ldr r0, [r4, #0x3d8]
    cmp r0, #0x0
    beq L_022006d8
    mov r0, #0x0
    str r0, [r4, #0x48]
    bl func_02092850
    ldr r1, L_0220082c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02200818
L_022006d8:
    ldr r0, [r4, #0x2c4]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x2a4]
    cmp r0, #0x0
    ldr r0, [r4, #0x37c]
    bne L_02200760
    cmp r0, #0x0
    ldreq r0, [r4, #0x380]
    cmpeq r0, #0x0
    beq L_02200714
    mov r0, r4
    bl func_ov021_021fe144
    mov r0, #0x0
    str r0, [r4, #0x37c]
    str r0, [r4, #0x380]
L_02200714:
    ldr r1, [r4, #0x48]
    mov r0, #0x1
    bic r1, r1, #0x2
    str r1, [r4, #0x48]
    ldr r3, [r4, #0x98]
    mov r1, #0x0
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r3, [r4, #0x9c]
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x4
    strh r2, [r3, #0x24]
    bl func_02092c8c
    ldr r1, L_02200830
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02200818
L_02200760:
    cmp r0, #0x0
    beq L_02200784
    mov r0, #0x0
    ldr r1, L_02200834
    str r0, [r4, #0x37c]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02200818
L_02200784:
    ldr r0, [r4, #0x380]
    cmp r0, #0x0
    beq L_022007ac
    mov r0, #0x0
    ldr r1, L_02200838
    str r0, [r4, #0x380]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02200818
L_022007ac:
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    ldr r0, [r4, #0x2c4]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x2a4]
    str r0, [r4, #0x2c0]
    bl func_ov021_021fd1cc
    ldr r0, [r4, #0x2c0]
    bl func_ov021_021fd39c
    ldr r0, [r4, #0x2c0]
    bl func_ov021_021fd490
    mov r0, r4
    bl func_ov021_021fee54
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200818
L_022007fc:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02200818
    ldr r1, L_0220083c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
L_02200818:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02200828: .word data_020f4e14
L_0220082c: .word data_ov021_02202ec0
L_02200830: .word data_ov021_02202eb8
L_02200834: .word data_ov021_02202eb0
L_02200838: .word data_ov021_02202ea8
L_0220083c: .word data_ov021_02202ea0
    .size func_ov021_02200630, . - func_ov021_02200630


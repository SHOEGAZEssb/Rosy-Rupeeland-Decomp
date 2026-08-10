    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_secondary.c. */
    .extern data_020f4e14
    .extern data_ov021_02202d78
    .extern data_ov021_02202d80
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern func_020755bc
    .extern func_02092c8c
    .extern func_ov021_021fd7c0
    .extern func_ov021_021fe390
    .extern func_ov021_021fe458
    .extern func_ov021_021fe8e8
    .extern func_ov021_021fea68
    .extern func_ov021_021feb60
    .extern func_ov021_021fecd0
    .extern func_ov021_021feea4
    .extern func_ov021_021ff0e0
    .extern func_ov021_021ff274

.global func_ov021_022022a4
func_ov021_022022a4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov021_021ff274
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_022023d4
L_022022c0: ; jump table
    b L_022022d0 ; case 0
    b L_022022f0 ; case 1
    b L_0220234c ; case 2
    b L_02202398 ; case 3
L_022022d0:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_022022f0:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_022023d4
    ldr r0, L_022023e4
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, [r4, #0x354]
    cmp r0, #0x0
    mov r0, r4
    beq L_02202328
    bl func_ov021_021fea68
    mov r0, r4
    bl func_ov021_021feb60
    b L_02202334
L_02202328:
    bl func_ov021_021fecd0
    mov r0, r4
    bl func_ov021_021fe8e8
L_02202334:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022023d4
L_0220234c:
    ldr r0, [r4, #0x354]
    cmp r0, #0x0
    mov r0, r4
    beq L_02202364
    bl func_ov021_021fe390
    b L_02202368
L_02202364:
    bl func_ov021_021fe458
L_02202368:
    mov r0, r4
    mov r1, #0x2
    bl func_ov021_021ff0e0
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022023d4
L_02202398:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_022023d4
    ldr r0, [r4, #0x354]
    cmp r0, #0x0
    beq L_022023c4
    ldr r1, L_022023e8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_022023d4
L_022023c4:
    ldr r1, L_022023ec
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
L_022023d4:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_022023e4: .word data_020f4e14
L_022023e8: .word data_ov021_02202d80
L_022023ec: .word data_ov021_02202d78
.size func_ov021_022022a4, . - func_ov021_022022a4

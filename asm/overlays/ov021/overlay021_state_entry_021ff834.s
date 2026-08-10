    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_entry.c. */
    .extern data_020f4e14
    .extern data_021f5128
    .extern data_021f5ed0
    .extern data_ov021_02202f30
    .extern data_ov021_02202f38
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern func_020755bc
    .extern func_0207ab48
    .extern func_0207c4cc
    .extern func_02092850
    .extern func_02092c8c
    .extern func_02093360
    .extern func_020939d8
    .extern func_ov021_021fd7c0
    .extern func_ov021_021fe520
    .extern func_ov021_021fe63c
    .extern func_ov021_021fe84c
    .extern func_ov021_021feea4
    .extern func_ov021_021ff1d0
    .extern func_ov021_021ff274
    .extern func_ov021_021ffa10
    .extern func_ov045_0220c028

.global func_ov021_021ff834
func_ov021_021ff834:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b L_021ff9e8
L_021ff850: ; jump table
    b L_021ff864 ; case 0
    b L_021ff884 ; case 1
    b L_021ff8e8 ; case 2
    b L_021ff94c ; case 3
    b L_021ff98c ; case 4
L_021ff864:
    mov r0, #0x1
    sub r1, r0, #0x9
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021ff884:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ff9e8
    ldr r0, [r4, #0x2bc]
    mov r1, #0x0
    bl func_0207c4cc
    mov r1, r0
    mov r0, r4
    bl func_ov021_021ff1d0
    ldr r0, [r4, #0x388]
    ldr r1, L_021ff9fc
    bl func_02093360
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    movs r0, r1, asr #0x1f
    bne L_021ff8d0
    ldr r0, [r4, #0x38c]
    bl func_ov045_0220c028
L_021ff8d0:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff9e8
L_021ff8e8:
    bl func_ov021_021ff274
    cmp r0, #0x0
    beq L_021ff9e8
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021ffa10
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3d8]
    ldr r1, [r4, #0x2bc]
    ldr r0, L_021ffa00
    ldr r1, [r1, #0x4]
    ldr r2, [r0, #0x0]
    ldr r0, [r4, #0x54]
    ldrh r1, [r1, #0x0]
    ldr r0, [r2, r0, lsl #0x2]
    bl func_0207ab48
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff9e8
L_021ff94c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ff9e8
    ldr r0, [r4, #0x388]
    bl func_020939d8
    ldr r0, L_021ffa04
    ldr r0, [r0, #0x0]
    bl func_020755bc
    mov r0, r4
    bl func_ov021_021fe63c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff9e8
L_021ff98c:
    bl func_ov021_021fe520
    mov r0, r4
    bl func_ov021_021fe84c
    ldr r0, [r4, #0x3d8]
    cmp r0, #0x0
    beq L_021ff9c4
    mov r0, #0x0
    str r0, [r4, #0x48]
    bl func_02092850
    ldr r1, L_021ffa08
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_021ff9e8
L_021ff9c4:
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    mvn r0, #0x0
    ldr r1, L_021ffa0c
    str r0, [r4, #0x3e4]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
L_021ff9e8:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
L_021ff9fc: .word data_021f5ed0
L_021ffa00: .word data_021f5128
L_021ffa04: .word data_020f4e14
L_021ffa08: .word data_ov021_02202f38
L_021ffa0c: .word data_ov021_02202f30
    .size func_ov021_021ff834, . - func_ov021_021ff834

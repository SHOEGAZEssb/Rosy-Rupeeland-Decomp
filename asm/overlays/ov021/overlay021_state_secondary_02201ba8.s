    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_secondary.c. */
    .extern data_ov021_02202d60
    .extern data_ov021_02202da0
    .extern data_ov021_02202da8
    .extern data_ov021_02202db8
    .extern data_ov021_02202dc0
    .extern data_ov021_02202dc8
    .extern func_02092260
    .extern DisplayBrightness_StartMaskedTransitions
    .extern TitleDialog_ClearTextRect
    .extern func_02095860
    .extern func_ov001_021fc0ac
    .extern func_ov001_021fc1f0
    .extern func_ov001_021fc214
    .extern func_ov001_021fc240
    .extern func_ov001_021fc250
    .extern func_ov001_021fc2e4
    .extern func_ov001_021fc310
    .extern func_ov001_021fc320
    .extern func_ov001_021fc3c4
    .extern func_ov001_021fc3ec
    .extern func_ov001_021fc644
    .extern func_ov001_021fc758
    .extern func_ov001_021fc7e4
    .extern func_ov001_021fcae0
    .extern func_ov001_021fcb60
    .extern func_ov001_021fcbf0
    .extern func_ov001_021fcc44
    .extern func_ov021_021fd7c0
    .extern func_ov021_021feae4
    .extern func_ov021_021feea4
    .extern func_ov021_021ff274
    .extern Overlay021Descriptor_GetFlags16_19
    .extern func_ov021_021ff62c
    .extern func_ov021_021ff644

.global func_ov021_02201ba8
func_ov021_02201ba8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_ov021_021ff274
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_02201f70
L_02201bc4: ; jump table
    b L_02201bd4 ; case 0
    b L_02201bfc ; case 1
    b L_02201c40 ; case 2
    b L_02201f30 ; case 3
L_02201bd4:
    ldr r0, [r4, #0x358]
    bl func_ov001_021fc1f0
    mov r0, r4
    bl func_ov021_021ff644
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201f70
L_02201bfc:
    ldr r0, [r4, #0x358]
    bl func_ov001_021fc240
    cmp r0, #0x0
    beq L_02201c24
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201c40
L_02201c24:
    ldr r0, [r4, #0x358]
    bl func_ov001_021fc250
    cmp r0, #0x0
    beq L_02201f70
    mov r0, r4
    bl func_ov021_021ff644
    b L_02201f70
L_02201c40:
    ldr r0, [r4, #0x358]
    ldr r1, [r4, #0x2c]
    bl func_ov001_021fcae0
    cmp r0, #0x0
    bne L_02201ec8
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_02201ec8
    ldr r0, [r4, #0x358]
    add r1, r4, #0x30
    bl func_ov001_021fcbf0
    cmp r0, #0x0
    bne L_02201ec8
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_02201ec8
    ldr r0, [r4, #0x358]
    add r1, r4, #0x30
    bl func_ov001_021fc0ac
    mov r5, r0
    ldr r0, [r4, #0x358]
    add r1, r4, #0x30
    bl func_ov001_021fcb60
    cmp r0, #0x0
    bne L_02201ec8
    ldr r0, [r4, #0x358]
    add r1, r4, #0x30
    bl func_ov001_021fcc44
    cmp r0, #0x0
    beq L_02201cd4
    ldr r1, L_02201f80
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201f70
L_02201cd4:
    cmp r5, #0x0
    blt L_02201d14
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r0, [r4, #0x358]
    ldr r1, [r0, #0x1ac]
    cmp r5, r1
    beq L_02201f70
    mov r1, r5
    bl func_ov001_021fc758
    ldr r0, [r4, #0x358]
    bl func_ov001_021fc644
    mov r0, r4
    bl func_ov021_021ff644
    b L_02201f70
L_02201d14:
    ldr r0, [r4, #0x358]
    add r1, r4, #0x30
    bl func_ov001_021fc3c4
    cmp r0, #0x0
    beq L_02201d50
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    mov r0, r4
    mov r1, #0x3
    bl func_02092260
    ldr r1, L_02201f84
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201f70
L_02201d50:
    ldr r0, [r4, #0x358]
    add r1, r4, #0x30
    bl func_ov001_021fc3ec
    cmp r0, #0x0
    beq L_02201dac
    mov r0, r4
    bl func_ov021_021feae4
    cmp r0, #0x0
    beq L_02201d9c
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    mov r0, r4
    mov r1, #0xb
    bl func_02092260
    ldr r1, L_02201f88
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201f70
L_02201d9c:
    mov r0, r4
    mov r1, #0x9
    bl func_02092260
    b L_02201f70
L_02201dac:
    ldr r1, [r4, #0x2c4]
    add r2, r4, #0x14c
    mov r0, #0xac
    mla r0, r1, r0, r2
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_02201ec8
    ldr r0, [r4, #0x358]
    bl func_ov001_021fc7e4
    mov r1, #0x1
    bl func_ov021_021ff62c
    cmp r0, #0x0
    bne L_02201eb8
    ldr r0, [r4, #0x358]
    bl func_ov001_021fc7e4
    ldr r0, [r0, #0xc]
    str r0, [r4, #0x380]
    cmp r0, #0x0
    beq L_02201eb8
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_02201eb8
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    mov r0, r4
    mov r1, #0x2
    bl func_02092260
    ldr r0, [r4, #0x380]
    ldr r0, [r0, #0xc]
    str r0, [r4, #0x2bc]
    bl Overlay021Descriptor_GetFlags16_19
    cmp r0, #0x1
    bne L_02201e80
    ldr r1, [r4, #0x358]
    mov r0, #0x1
    ldr r2, [r1, #0x1ac]
    sub r1, r0, #0x11
    str r2, [r4, #0x374]
    ldr r2, [r4, #0x380]
    ldrh r2, [r2, #0x0]
    str r2, [r4, #0x378]
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, L_02201f8c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201f70
L_02201e80:
    ldr r0, [r4, #0x2bc]
    bl Overlay021Descriptor_GetFlags16_19
    cmp r0, #0x0
    bne L_02201ea4
    ldr r1, L_02201f90
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201f70
L_02201ea4:
    ldr r1, L_02201f94
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02201f70
L_02201eb8:
    mov r0, r4
    mov r1, #0x9
    bl func_02092260
    b L_02201f70
L_02201ec8:
    ldr r0, [r4, #0x358]
    bl func_ov001_021fc214
    cmp r0, #0x0
    beq L_02201efc
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201f70
L_02201efc:
    ldr r0, [r4, #0x358]
    bl func_ov001_021fc2e4
    cmp r0, #0x0
    beq L_02201f70
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201f70
L_02201f30:
    ldr r0, [r4, #0x358]
    bl func_ov001_021fc310
    cmp r0, #0x0
    beq L_02201f58
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201f70
L_02201f58:
    ldr r0, [r4, #0x358]
    bl func_ov001_021fc320
    cmp r0, #0x0
    beq L_02201f70
    mov r0, r4
    bl func_ov021_021ff644
L_02201f70:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02201f80: .word data_ov021_02202dc8
L_02201f84: .word data_ov021_02202dc0
L_02201f88: .word data_ov021_02202db8
L_02201f8c: .word data_ov021_02202d60
L_02201f90: .word data_ov021_02202da8
L_02201f94: .word data_ov021_02202da0
.size func_ov021_02201ba8, . - func_ov021_02201ba8

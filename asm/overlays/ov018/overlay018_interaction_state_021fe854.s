    .text
/* Exact fallback; see src/overlays/ov018/overlay018_interaction_state.c. */
    .extern data_ov018_021ffbc8
    .extern data_ov018_021ffc18
    .extern TitleInterpolatedValue_Configure
    .extern func_02091c7c
    .extern func_02091cf0
    .extern SceneSound_PlayPackedEffect
    .extern SceneSound_SetPackedEffectValue
    .extern SpriteMotionController_BeginHitResponse
    .extern func_ov003_021fb7ec
    .extern func_ov018_021fcf40
    .extern Overlay018_UpdateFrameUi
    .extern Overlay018_SetPathSpriteAnimation
    .extern func_ov018_021fdbd4
    .extern Overlay018_UpdatePathInput
    .extern Overlay018_CopyCoordinates
    .extern func_ov018_021ff3cc

.global Overlay018_UpdateInteractionState
Overlay018_UpdateInteractionState:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_021fea00
L_021fe86c: ; jump table
    b L_021fe87c ; case 0
    b L_021fe89c ; case 1
    b L_021fe954 ; case 2
    b L_021fe9ac ; case 3
L_021fe87c:
    ldr r0, L_021fea10
    mov r1, #0x10
    strh r1, [r0, #0x0]
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fe89c:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fe904
    add r0, r4, #0xd8
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_021fe904
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fe8f4
    mov r0, r4
    mov r1, #0x3
    bl SceneSound_PlayPackedEffect
    ldr r1, L_021fea14
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov018_021fcf40
L_021fe8f4:
    add r0, r4, #0x64
    add r1, r4, #0x30
    bl Overlay018_CopyCoordinates
    b L_021fea00
L_021fe904:
    mov r0, r4
    bl Overlay018_UpdatePathInput
    ldr r0, [r4, #0x58]
    ldr r0, [r0, #0x24]
    sub r0, r0, #0x2
    cmp r0, #0x1
    bhi L_021fea00
    mov r0, r4
    mov r1, #0x0
    bl Overlay018_SetPathSpriteAnimation
    mov r0, r4
    mov r1, #0x4c
    mov r2, #0x0
    bl SceneSound_SetPackedEffectValue
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fea00
L_021fe954:
    ldr r1, [r4, #0x3c8]
    cmp r1, #0x0
    beq L_021fe978
    bl func_ov018_021fdbd4
    ldr r1, L_021fea18
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov018_021fcf40
    b L_021fea00
L_021fe978:
    mov r0, #0x14
    str r0, [sp, #0x0]
    add r0, r4, #0x1a8
    mov r1, #0x1
    mov r2, #0x10
    mov r3, #0x0
    bl TitleInterpolatedValue_Configure
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fea00
L_021fe9ac:
    mov r0, #0x0
    str r0, [r4, #0x414]
    ldr r2, [r4, #0x1b8]
    add r0, r4, #0x1a8
    mov r1, #0x1
    rsb r5, r2, #0x10
    bl func_02091c7c
    orr r2, r0, r5, lsl #0x8
    ldr r1, L_021fea10
    add r0, r4, #0x1a8
    strh r2, [r1, #0x0]
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021fea00
    ldr r0, [r4, #0x190]
    bl func_ov003_021fb7ec
    ldr r0, [r4, #0x58]
    bl func_ov018_021ff3cc
    mov r0, #0x0
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fea00:
    mov r0, r4
    bl Overlay018_UpdateFrameUi
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fea10: .word 0x4001052
L_021fea14: .word data_ov018_021ffbc8
L_021fea18: .word data_ov018_021ffc18
    .size Overlay018_UpdateInteractionState, . - Overlay018_UpdateInteractionState

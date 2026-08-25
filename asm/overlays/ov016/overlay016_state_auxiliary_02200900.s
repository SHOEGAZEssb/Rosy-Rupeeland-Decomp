    .text

/* Exact fallback; see src/overlays/ov016/overlay016_state_auxiliary.c. */
    .extern data_ov016_02201418
    .extern data_ov016_02201468
    .extern data_ov016_02201470
    .extern data_ov016_02201478
    .extern data_ov016_02201488
    .extern data_ov016_02201490
    .extern data_ov016_02201498
    .extern SceneSound_PlayPackedEffect
    .extern SpriteMotionController_BeginHitResponse
    .extern func_ov000_021fc298
    .extern func_ov000_021fc3f8
    .extern func_ov000_021fc424
    .extern func_ov000_021fc450
    .extern Overlay000_Grid_UpdateTransition
    .extern func_ov000_021fc4fc
    .extern func_ov000_021fc528
    .extern func_ov000_021fc538
    .extern func_ov000_021fc5ac
    .extern Overlay000_SyncSelection
    .extern Overlay000_SetSelection
    .extern Overlay000_GetActiveMetadata
    .extern func_ov000_021fcb98
    .extern func_ov000_021fcc18
    .extern func_ov000_021fcca8
    .extern func_ov000_021fccfc
    .extern Overlay016_RemoveActor
    .extern Overlay016_HasActorReachedLimit
    .extern Overlay016ActorValue_Init
    .extern Overlay016_UpdateScene
    .extern Overlay016_RefreshSelectionPresentation
    .extern Overlay016_ToggleDetailPanel
    .extern Overlay016_MoveDetailSelection
.global Overlay016_UpdateAuxiliaryState
Overlay016_UpdateAuxiliaryState:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_02200d30
L_02200918: ; jump table
    b L_02200944 ; case 0
    b L_0220096c ; case 1
    b L_022009a8 ; case 2
    b L_02200cc8 ; case 3
    b L_02200d30 ; case 4
    b L_02200d30 ; case 5
    b L_02200d30 ; case 6
    b L_02200d30 ; case 7
    b L_02200d30 ; case 8
    b L_02200d30 ; case 9
    b L_02200d0c ; case 10
L_02200944:
    ldr r0, [r4, #0x44c]
    bl func_ov000_021fc3f8
    mov r0, r4
    bl Overlay016_RefreshSelectionPresentation
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200d30
L_0220096c:
    ldr r0, [r4, #0x44c]
    bl func_ov000_021fc450
    cmp r0, #0x0
    beq L_0220099c
    mov r0, r4
    bl Overlay016_RefreshSelectionPresentation
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022009a8
L_0220099c:
    ldr r0, [r4, #0x44c]
    bl Overlay000_Grid_UpdateTransition ; func_ov001_021fc460
    b L_02200d30
L_022009a8:
    ldr r0, [r4, #0x44c]
    ldr r1, [r4, #0x2c]
    bl func_ov000_021fcb98
    cmp r0, #0x0
    bne L_02200c60
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_02200c60
    ldr r0, [r4, #0x44c]
    add r1, r4, #0x30
    bl func_ov000_021fcca8
    cmp r0, #0x0
    bne L_02200c60
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_02200c60
    ldr r0, [r4, #0x44c]
    add r1, r4, #0x30
    bl func_ov000_021fc298
    mov r5, r0
    ldr r0, [r4, #0x44c]
    add r1, r4, #0x30
    bl func_ov000_021fcc18
    cmp r0, #0x0
    bne L_02200c60
    ldr r0, [r4, #0x44c]
    add r1, r4, #0x30
    bl func_ov000_021fccfc
    cmp r0, #0x0
    beq L_02200a3c
    ldr r1, L_02200d40
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_02200d30
L_02200a3c:
    cmp r5, #0x0
    ldr r0, [r4, #0x44c]
    blt L_02200ad4
    ldr r1, [r0, #0x25c]
    cmp r5, r1
    bne L_02200aa8
    bl Overlay000_GetActiveMetadata
    ldr r1, [r0, #0xc]
    cmp r1, #0x0
    ldrne r0, [r0, #0x1c]
    cmpne r0, #0x0
    beq L_02200a98
    cmp r1, #0x0
    ldrne r0, [r1, #0x20]
    andne r0, r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne L_02200a98
    ldr r1, L_02200d44
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_02200c60
L_02200a98:
    mov r0, r4
    mov r1, #0x9
    bl SceneSound_PlayPackedEffect
    b L_02200c60
L_02200aa8:
    mov r0, r4
    mov r1, #0x0
    bl SceneSound_PlayPackedEffect
    ldr r0, [r4, #0x44c]
    mov r1, r5
    bl Overlay000_SetSelection
    ldr r0, [r4, #0x44c]
    bl Overlay000_SyncSelection
    mov r0, r4
    bl Overlay016_RefreshSelectionPresentation
    b L_02200c60
L_02200ad4:
    add r1, r4, #0x30
    bl func_ov000_021fc5ac
    cmp r0, #0x0
    beq L_02200b24
    mov r0, r4
    mov r1, #0x3
    bl SceneSound_PlayPackedEffect
    ldr r0, [r4, #0x54]
    cmp r0, #0x1
    bne L_02200b10
    ldr r1, L_02200d48
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_02200d30
L_02200b10:
    ldr r1, L_02200d4c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_02200d30
L_02200b24:
    ldr r0, [r4, #0x470]
    add r1, r4, #0x30
    add r0, r0, #0x20
    mov r2, #0x0
    mov r3, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_02200b90
    ldr r0, [r4, #0x54]
    mov r1, #0x2
    cmp r0, #0x1
    mov r0, r4
    bne L_02200b78
    bl SceneSound_PlayPackedEffect
    mov r0, #0x1
    str r0, [r4, #0x478]
    ldr r1, L_02200d50
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_02200d30
L_02200b78:
    bl SceneSound_PlayPackedEffect
    mov r0, #0xa
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02200d30
L_02200b90:
    add r0, r4, #0x2ec
    add r1, r4, #0x30
    mvn r2, #0x3
    mov r3, #0x0
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_02200bc8
    mov r0, r4
    mov r1, #0xb
    bl SceneSound_PlayPackedEffect
    mov r0, r4
    mvn r1, #0x0
    bl Overlay016_MoveDetailSelection
    b L_02200c60
L_02200bc8:
    add r0, r4, #0x398
    add r1, r4, #0x30
    mov r2, #0x4
    mov r3, #0x0
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_02200c00
    mov r0, r4
    mov r1, #0xb
    bl SceneSound_PlayPackedEffect
    mov r0, r4
    mov r1, #0x1
    bl Overlay016_MoveDetailSelection
    b L_02200c60
L_02200c00:
    mov r2, #0x0
    add r0, r4, #0x240
    add r1, r4, #0x30
    sub r3, r2, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_02200c34
    mov r0, r4
    mov r1, #0xb
    bl SceneSound_PlayPackedEffect
    mov r0, r4
    bl Overlay016_ToggleDetailPanel
    b L_02200c60
L_02200c34:
    ldr r0, [r4, #0x470]
    ldr r2, [r4, #0x54]
    add r1, r4, #0x30
    bl Overlay016_RemoveActor
    str r0, [r4, #0x474]
    cmp r0, #0x0
    beq L_02200c60
    ldr r1, L_02200d54
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
L_02200c60:
    ldr r0, [r4, #0x44c]
    bl func_ov000_021fc424
    cmp r0, #0x0
    beq L_02200c94
    mov r0, r4
    mov r1, #0x0
    bl SceneSound_PlayPackedEffect
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200d30
L_02200c94:
    ldr r0, [r4, #0x44c]
    bl func_ov000_021fc4fc
    cmp r0, #0x0
    beq L_02200d30
    mov r0, r4
    mov r1, #0x0
    bl SceneSound_PlayPackedEffect
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200d30
L_02200cc8:
    ldr r0, [r4, #0x44c]
    bl func_ov000_021fc528
    cmp r0, #0x0
    beq L_02200cf0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200d30
L_02200cf0:
    ldr r0, [r4, #0x44c]
    bl func_ov000_021fc538
    cmp r0, #0x0
    beq L_02200d30
    mov r0, r4
    bl Overlay016_RefreshSelectionPresentation
    b L_02200d30
L_02200d0c:
    ldr r0, [r4, #0x470]
    add r0, r0, #0x20
    bl Overlay016_HasActorReachedLimit
    cmp r0, #0x0
    beq L_02200d30
    ldr r1, L_02200d58
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
L_02200d30:
    mov r0, r4
    bl Overlay016_UpdateScene
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02200d40: .word data_ov016_02201498
L_02200d44: .word data_ov016_02201490
L_02200d48: .word data_ov016_02201488
L_02200d4c: .word data_ov016_02201418
L_02200d50: .word data_ov016_02201478
L_02200d54: .word data_ov016_02201470
L_02200d58: .word data_ov016_02201468
    .size Overlay016_UpdateAuxiliaryState, . - Overlay016_UpdateAuxiliaryState


    .text

/* Exact fallback; see src/overlays/ov016/overlay016_state_list.c. */
    .extern data_ov016_022013c8
    .extern data_ov016_02201450
    .extern ActorDescriptor_GetPrimaryLabel
    .extern SceneSound_PlayPackedEffect
    .extern InventoryScroll_SetSelectedRow
    .extern InventoryScroll_SaveOrigins
    .extern InventoryScroll_MoveSelectionUp
    .extern InventoryScroll_MoveSelectionDown
    .extern InventoryScroll_PageUp
    .extern InventoryScroll_PageDown
    .extern InventoryScroll_UpdateInterpolation
    .extern InventoryScroll_TestUpperArrowPress
    .extern InventoryScroll_TestLowerArrowPress
    .extern InventoryScroll_TestUpperArrowHold
    .extern InventoryScroll_TestLowerArrowHold
    .extern InventoryScroll_TestMarkerHit
    .extern InventoryScroll_UpdateSelectionMovement
    .extern InventoryScroll_ResetPresentationState
    .extern SpriteMotionController_BeginHitResponse
    .extern ModalState_UpdateInput
    .extern Overlay016_RenderList
    .extern Overlay016_HitTestList
    .extern func_ov016_021fd628
    .extern func_ov016_021fd640
    .extern Overlay016_HasActorReachedLimit
    .extern Overlay016ActorValue_Init
    .extern Overlay016_UpdateScene
    .extern Overlay016_CreateTransientMessage
    .extern Overlay016_DestroyTransientMessage
    .extern Overlay016_UpdateCursorPosition
    .extern Overlay016_SyncSelectedPanel
    .extern Overlay016_DispatchPendingTransition
.global func_ov016_0220007c
func_ov016_0220007c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r1, [r6, #0x444]
    ldr r0, [r6, #0x4]
    ldr r5, [r1, #0x58]
    cmp r0, #0xa
    bgt L_022000d0
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b L_02200470
L_022000a4: ; jump table
    b L_022000dc ; case 0
    b L_022000f8 ; case 1
    b L_02200144 ; case 2
    b L_02200370 ; case 3
    b L_022003f0 ; case 4
    b L_02200470 ; case 5
    b L_02200470 ; case 6
    b L_02200470 ; case 7
    b L_02200470 ; case 8
    b L_02200470 ; case 9
    b L_02200438 ; case 10
L_022000d0:
    cmp r0, #0x14
    beq L_02200454
    b L_02200470
L_022000dc:
    mov r0, r5
    bl InventoryScroll_ResetPresentationState
    ldr r1, [r6, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x4]
    str r0, [r6, #0x8]
L_022000f8:
    mov r0, r5
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    beq L_02200128
    mov r0, r6
    bl Overlay016_SyncSelectedPanel
    ldr r1, [r6, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x4]
    str r0, [r6, #0x8]
    b L_02200144
L_02200128:
    ldr r0, [r6, #0x444]
    bl func_ov016_021fd640
    cmp r0, #0x0
    beq L_02200470
    mov r0, r6
    bl Overlay016_UpdateCursorPosition
    b L_02200470
L_02200144:
    mov r0, r5
    bl InventoryScroll_SaveOrigins
    ldr r0, [r6, #0x2c]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    beq L_02200168
    mov r0, r5
    bl InventoryScroll_MoveSelectionUp
    b L_0220033c
L_02200168:
    tst r0, #0x80
    beq L_0220017c
    mov r0, r5
    bl InventoryScroll_MoveSelectionDown
    b L_0220033c
L_0220017c:
    ldr r0, [r6, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_0220033c
    ldr r0, [r6, #0x444]
    add r1, r6, #0x30
    bl Overlay016_HitTestList
    mov r4, r0
    mov r0, r5
    add r1, r6, #0x30
    bl InventoryScroll_TestUpperArrowHold
    cmp r0, #0x0
    mov r0, r5
    beq L_022001bc
    bl InventoryScroll_PageUp
    b L_0220033c
L_022001bc:
    add r1, r6, #0x30
    bl InventoryScroll_TestLowerArrowHold
    cmp r0, #0x0
    beq L_022001d8
    mov r0, r5
    bl InventoryScroll_PageDown
    b L_0220033c
L_022001d8:
    ldr r0, [r6, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_0220033c
    mov r0, r5
    add r1, r6, #0x30
    bl InventoryScroll_TestUpperArrowPress
    cmp r0, #0x0
    mov r0, r5
    beq L_0220021c
    bl InventoryScroll_PageUp
    cmp r0, #0x0
    bne L_0220033c
    mov r0, r6
    mov r1, #0x16
    bl SceneSound_PlayPackedEffect
    b L_0220033c
L_0220021c:
    add r1, r6, #0x30
    bl InventoryScroll_TestLowerArrowPress
    cmp r0, #0x0
    mov r0, r5
    beq L_0220024c
    bl InventoryScroll_PageDown
    cmp r0, #0x0
    bne L_0220033c
    mov r0, r6
    mov r1, #0x16
    bl SceneSound_PlayPackedEffect
    b L_0220033c
L_0220024c:
    add r1, r6, #0x30
    bl InventoryScroll_TestMarkerHit
    cmp r0, #0x0
    beq L_02200280
    ldr r0, [r6, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_02200280
    ldr r1, L_02200480
    mov r0, r6
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_02200470
L_02200280:
    cmp r4, #0x0
    blt L_022002d8
    ldr r0, [r5, #0x14]
    cmp r4, r0
    mov r0, r6
    beq L_022002d0
    mov r1, #0x0
    bl SceneSound_PlayPackedEffect
    mov r0, r5
    mov r1, r4
    bl InventoryScroll_SetSelectedRow
    mov r0, r6
    bl Overlay016_UpdateCursorPosition
    mov r0, r6
    bl Overlay016_SyncSelectedPanel
    mov r0, #0x14
    str r0, [r6, #0x4]
    mov r0, #0x0
    str r0, [r6, #0x8]
    b L_02200470
L_022002d0:
    bl Overlay016_DispatchPendingTransition
    b L_02200470
L_022002d8:
    add r0, r6, #0xe8
    add r1, r6, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_02200300
    mov r0, r6
    bl Overlay016_DispatchPendingTransition
    b L_02200470
L_02200300:
    add r0, r6, #0x194
    add r1, r6, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_0220033c
    mov r0, r6
    mov r1, #0x3
    bl SceneSound_PlayPackedEffect
    ldr r1, L_02200484
    mov r0, r6
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_02200470
L_0220033c:
    mov r0, r5
    bl InventoryScroll_UpdateSelectionMovement
    cmp r0, #0x0
    beq L_02200470
    mov r0, r6
    mov r1, #0x0
    bl SceneSound_PlayPackedEffect
    ldr r1, [r6, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r6, #0x4]
    str r0, [r6, #0x8]
    b L_02200470
L_02200370:
    add r0, r6, #0xe8
    bl Overlay016_HasActorReachedLimit
    cmp r0, #0x0
    beq L_02200470
    ldr r0, [r6, #0x444]
    bl func_ov016_021fd628
    ldrh r1, [r0, #0xc]
    and r1, r1, #0x4
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq L_022003b4
    mov r2, #0x0
    mov r0, r6
    mov r3, r2
    mov r1, #0x1c
    bl Overlay016_CreateTransientMessage
    b L_022003d8
L_022003b4:
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x4
    bl ActorDescriptor_GetPrimaryLabel
    mov r3, r0
    mov r0, r6
    mov r1, #0xe
    mov r2, #0x0
    bl Overlay016_CreateTransientMessage
L_022003d8:
    ldr r1, [r6, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x4]
    str r0, [r6, #0x8]
    b L_02200470
L_022003f0:
    ldr r1, [r6, #0x20]
    ldr r0, [r6, #0x460]
    mov r2, r1, lsl #0x1a
    add r1, r6, #0x30
    mov r2, r2, asr #0x1f
    bl ModalState_UpdateInput
    cmp r0, #0x0
    blt L_02200470
    mov r0, r6
    bl Overlay016_DestroyTransientMessage
    ldr r0, [r6, #0x444]
    bl Overlay016_RenderList
    ldr r1, [r6, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x2
    str r1, [r6, #0x4]
    str r0, [r6, #0x8]
    b L_02200470
L_02200438:
    add r0, r6, #0xe8
    bl Overlay016_HasActorReachedLimit
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x4]
    strne r0, [r6, #0x8]
    b L_02200470
L_02200454:
    ldr r0, [r6, #0x8]
    add r0, r0, #0x1
    str r0, [r6, #0x8]
    cmp r0, #0x8
    movgt r0, #0x0
    strgt r0, [r6, #0x4]
    strgt r0, [r6, #0x8]
L_02200470:
    mov r0, r6
    bl Overlay016_UpdateScene
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_02200480: .word data_ov016_02201450
L_02200484: .word data_ov016_022013c8
    .size func_ov016_0220007c, . - func_ov016_0220007c


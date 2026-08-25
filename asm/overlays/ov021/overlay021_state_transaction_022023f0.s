    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_transaction.c. */
    .extern data_021f5128
    .extern data_ov021_02202cd0
    .extern data_ov021_02202d38
    .extern data_ov021_02202d58
    .extern data_ov021_02202d68
    .extern data_ov021_02202d90
    .extern data_ov021_02202fb8
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GamePhaseCurrencyHud_GetCurrency
    .extern GamePhaseCurrencyHud_AddCurrency
    .extern func_02062ca8
    .extern GraphicsSpriteText_FormatDecimal
    .extern RecordCategory_PublishById
    .extern RecordDescriptor_GetMessage
    .extern RecordDescriptor_SetValue
    .extern func_0209189c
    .extern SceneSound_PlayPackedEffect
    .extern SceneSound_StopPackedEffect
    .extern DisplayBrightness_StartMaskedTransitions
    .extern TitleDialog_ClearTextRect
    .extern PresentationScalar_TransitionTo
    .extern Presentation_SetScript
    .extern Presentation_IsScriptComplete
    .extern func_ov002_021fbe68
    .extern Overlay021_List_Show
    .extern Overlay021_List_RenderVisibleRows
    .extern Overlay021_List_UpdateSelectionDisplay
    .extern Overlay021_SetTransition
    .extern Overlay021_SetupMainBackground
    .extern Overlay021_SetupSceneSprites
    .extern Overlay021_DestroyAuxiliaryPanel
    .extern Overlay021_ShowListMarker
    .extern Overlay021_UpdateScene
    .extern Overlay021_SelectList
    .extern Overlay021_IsResourceStateReady
    .extern Overlay021_Dialog_ShowMessage
    .extern Overlay021_Dialog_ShowContent
    .extern Overlay021_Dialog_UpdatePrompt
    .extern Overlay021_BeginTileTransitionOffset80
    .extern Overlay021_BeginTileTransitionOffset60
    .extern Overlay021_UpdateTileTransitionOffset20
    .extern Overlay021_Descriptor_HasFlag29
    .extern func_ov045_0220b924
    .extern func_ov045_0220b9b8
    .extern func_ov045_0220bc34
    .extern func_ov045_0220bc40
    .extern func_ov045_0220bd90
    .extern func_ov045_0220bdb0
    .extern func_ov045_0220bdd0
    .extern func_ov045_0220bdf0
    .extern gHeapContext
    .extern gGamePhaseCurrencyHud
    .extern Heap_Alloc

.global Overlay021_UpdateTransaction
Overlay021_UpdateTransaction:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x1e
    bgt L_02202458
    bge L_02202998
    cmp r1, #0x14
    bgt L_0220244c
    bge L_022028e0
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b L_02202ba8
L_02202420: ; jump table
    b L_0220247c ; case 0
    b L_0220249c ; case 1
    b L_022024fc ; case 2
    b L_02202544 ; case 3
    b L_0220270c ; case 4
    b L_02202ba8 ; case 5
    b L_02202ba8 ; case 6
    b L_02202ba8 ; case 7
    b L_02202ba8 ; case 8
    b L_02202ba8 ; case 9
    b L_022028a0 ; case 10
L_0220244c:
    cmp r1, #0x15
    beq L_02202940
    b L_02202ba8
L_02202458:
    cmp r1, #0x33
    bgt L_02202470
    bge L_02202b28
    cmp r1, #0x32
    beq L_02202aa8
    b L_02202ba8
L_02202470:
    cmp r1, #0x34
    beq L_02202b84
    b L_02202ba8
L_0220247c:
    mov r0, #0x1
    sub r1, r0, #0x9
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_0220249c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02202ba8
    mov r0, r4
    mov r1, #0x6c
    bl SceneSound_PlayPackedEffect
    ldr r1, L_02202bb8
    ldr r3, L_02202bbc
    mov r0, #0xb0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022024d4
    bl func_ov045_0220bc40
L_022024d4:
    ldr r1, L_02202bc0
    str r0, [r4, #0x384]
    mov r2, #0x0
    bl Presentation_SetScript
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202ba8
L_022024fc:
    ldr r0, [r4, #0x384]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    beq L_02202ba8
    add r0, r4, #0x2cc
    mov r1, #0x3c
    mov r2, #0x5a
    bl func_0209189c
    mov r0, r0, lsl #0x10
    ldr r2, [r4, #0x384]
    mov r0, r0, asr #0x10
    str r0, [r2, #0x7c]
    mov r1, #0x0
    str r1, [r2, #0x80]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    stmib r4, {r0, r1}
    b L_02202ba8
L_02202544:
    ldr r0, [r4, #0x384]
    bl Overlay021_IsResourceStateReady
    cmp r0, #0x0
    beq L_02202ba8
    mov r0, r4
    mov r1, #0x6c
    bl SceneSound_StopPackedEffect
    ldr r0, [r4, #0x2c8]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_022026f4
L_02202570: ; jump table
    b L_022026f4 ; case 0
    b L_02202584 ; case 1
    b L_022025d0 ; case 2
    b L_02202618 ; case 3
    b L_02202690 ; case 4
L_02202584:
    mov r0, r4
    mov r1, #0x6a
    bl SceneSound_PlayPackedEffect
    ldr r0, [r4, #0x2bc]
    ldr r1, [r4, #0x394]
    ldr r0, [r0, #0x8]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    ldr r0, [r4, #0x384]
    bgt L_022025b4
    bl func_ov045_0220bd90
    b L_022025c0
L_022025b4:
    bl func_ov045_0220bdf0
    mov r0, r4
    bl Overlay021_BeginTileTransitionOffset80
L_022025c0:
    mov r0, r4
    mov r1, #0x6
    bl Overlay021_Dialog_ShowMessage
    b L_022026f4
L_022025d0:
    mov r0, r4
    mov r1, #0x6b
    bl SceneSound_PlayPackedEffect
    ldr r0, [r4, #0x384]
    bl func_ov045_0220bdb0
    mov r0, r4
    bl Overlay021_BeginTileTransitionOffset60
    ldr r1, [r4, #0x2bc]
    add r0, r4, #0x3b8
    ldr r1, [r1, #0x4]
    ldr r2, L_02202bc4
    ldr r1, [r1, #0x14]
    mov r3, #0x0
    bl GraphicsSpriteText_FormatDecimal
    mov r0, r4
    mov r1, #0x9
    bl Overlay021_Dialog_ShowMessage
    b L_022026f4
L_02202618:
    mov r0, r4
    mov r1, #0x6a
    bl SceneSound_PlayPackedEffect
    ldr r1, [r4, #0x2bc]
    ldr r0, [r4, #0x394]
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x10]
    cmp r0, r1, lsl #0x1
    ldr r0, [r4, #0x384]
    blt L_02202668
    bl func_ov045_0220bd90
    mov r0, #0x1
    str r0, [r4, #0x3e8]
    ldr r0, [r4, #0x2bc]
    mov r1, #0x4
    bl RecordDescriptor_GetMessage
    mov r1, r0
    mov r0, r4
    bl Overlay021_Dialog_ShowContent
    b L_022026f4
L_02202668:
    bl func_ov045_0220bdf0
    mov r0, r4
    bl Overlay021_BeginTileTransitionOffset80
    ldr r0, [r4, #0x2bc]
    mov r1, #0x3
    bl RecordDescriptor_GetMessage
    mov r1, r0
    mov r0, r4
    bl Overlay021_Dialog_ShowContent
    b L_022026f4
L_02202690:
    mov r0, r4
    mov r1, #0x6b
    bl SceneSound_PlayPackedEffect
    ldr r0, [r4, #0x384]
    bl func_ov045_0220bdb0
    mov r0, r4
    bl Overlay021_BeginTileTransitionOffset60
    ldr r0, [r4, #0x2bc]
    ldr r2, [r4, #0x394]
    ldr r1, [r0, #0x4]
    ldr r1, [r1, #0x10]
    add r1, r1, r1, lsr #0x1f
    cmp r2, r1, asr #0x1
    bgt L_022026e0
    mov r1, #0x6
    bl RecordDescriptor_GetMessage
    mov r1, r0
    mov r0, r4
    bl Overlay021_Dialog_ShowContent
    b L_022026f4
L_022026e0:
    mov r1, #0x5
    bl RecordDescriptor_GetMessage
    mov r1, r0
    mov r0, r4
    bl Overlay021_Dialog_ShowContent
L_022026f4:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202ba8
L_0220270c:
    bl Overlay021_Dialog_UpdatePrompt
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x3e8]
    cmp r0, #0x0
    beq L_02202734
    mov r0, #0x0
    str r0, [r4, #0x3e8]
    ldr r0, [r4, #0x384]
    bl func_ov045_0220bdd0
L_02202734:
    ldr r0, [r4, #0x2c8]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_02202ba8
L_02202744: ; jump table
    b L_02202ba8 ; case 0
    b L_02202758 ; case 1
    b L_022027a0 ; case 2
    b L_022027f4 ; case 3
    b L_02202854 ; case 4
L_02202758:
    ldr r0, L_02202bc8
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    ldr r0, [r4, #0x3ec]
    ldr r2, [r4, #0x394]
    mov r3, #0x0
    bl func_ov045_0220b924
    ldr r1, L_02202bc8
    mov r2, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r4, #0x394]
    bl GamePhaseCurrencyHud_AddCurrency
    mov r0, #0x14
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02202ba8
L_022027a0:
    ldr r1, [r4, #0x2bc]
    ldr r0, L_02202bc8
    ldr r1, [r1, #0x4]
    ldr r0, [r0, #0x0]
    ldr r5, [r1, #0x14]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    ldr r0, [r4, #0x3ec]
    mov r2, r5
    mov r3, #0x0
    bl func_ov045_0220b924
    ldr r1, L_02202bc8
    mov r2, r0
    ldr r0, [r1, #0x0]
    mov r1, r5
    bl GamePhaseCurrencyHud_AddCurrency
    mov r0, #0x14
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02202ba8
L_022027f4:
    mov r0, #0x1
    str r0, [r4, #0x3d8]
    ldr r0, [r4, #0x2bc]
    ldr r1, [r4, #0x394]
    bl RecordDescriptor_SetValue
    ldr r0, L_02202bc8
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    ldr r0, [r4, #0x3ec]
    ldr r2, [r4, #0x394]
    mov r3, #0x1
    bl func_ov045_0220b924
    ldr r1, [r4, #0x394]
    ldr r3, L_02202bc8
    rsb r1, r1, #0x0
    mov r2, r0
    ldr r0, [r3, #0x0]
    bl GamePhaseCurrencyHud_AddCurrency
    mov r0, #0xa
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02202ba8
L_02202854:
    ldr r0, L_02202bc8
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    ldr r0, [r4, #0x3ec]
    ldr r2, [r4, #0x394]
    mov r3, #0x1
    bl func_ov045_0220b924
    ldr r3, [r4, #0x394]
    ldr r1, L_02202bc8
    mov r2, r0
    ldr r0, [r1, #0x0]
    rsb r1, r3, #0x0
    bl GamePhaseCurrencyHud_AddCurrency
    mov r0, #0x32
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02202ba8
L_022028a0:
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220b9b8
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220bc34
    cmp r0, #0x0
    bne L_02202ba8
    mov r0, #0x1
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    mov r0, #0x1e
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02202ba8
L_022028e0:
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220b9b8
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220bc34
    cmp r0, #0x0
    bne L_02202ba8
    mov r0, r4
    bl Overlay021_UpdateTileTransitionOffset20
    ldr r0, [r4, #0x384]
    mov r1, #0x2
    add r0, r0, #0xc
    mov r2, #0x160
    bl PresentationScalar_TransitionTo
    ldr r2, [r4, #0x384]
    mov r0, #0x10
    str r0, [r2, #0x7c]
    mov r1, #0x0
    str r1, [r2, #0x80]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    stmib r4, {r0, r1}
    b L_02202ba8
L_02202940:
    ldr r0, [r4, #0x384]
    bl Overlay021_IsResourceStateReady
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x384]
    cmp r0, #0x0
    beq L_02202968
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_02202968:
    mov r0, #0x0
    str r0, [r4, #0x384]
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    mov r0, #0x1
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    mov r0, #0x1e
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02202ba8
L_02202998:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02202ba8
    mov r0, r4
    bl Overlay021_DestroyAuxiliaryPanel
    mov r0, r4
    bl Overlay021_SetupSceneSprites
    ldr r1, [r4, #0x2c4]
    mov r0, r4
    bl Overlay021_SelectList
    ldr r0, [r4, #0x37c]
    cmp r0, #0x0
    beq L_022029fc
    ldr r0, [r4, #0x2bc]
    bl Overlay021_Descriptor_HasFlag29
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3d8]
    ldr r0, [r4, #0x37c]
    bl func_02062ca8
    ldr r1, L_02202bcc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_02202ba8
L_022029fc:
    ldr r0, [r4, #0x380]
    cmp r0, #0x0
    beq L_02202a38
    ldr r0, [r4, #0x2bc]
    bl Overlay021_Descriptor_HasFlag29
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3d8]
    ldr r0, [r4, #0x380]
    bl func_02062ca8
    ldr r1, L_02202bd0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_02202ba8
L_02202a38:
    mov r0, r4
    bl Overlay021_SetupMainBackground
    ldr r0, [r4, #0x2c0]
    bl Overlay021_List_Show
    ldr r0, [r4, #0x2c0]
    bl Overlay021_List_RenderVisibleRows
    ldr r0, [r4, #0x2c0]
    bl Overlay021_List_UpdateSelectionDisplay
    mov r0, r4
    bl Overlay021_ShowListMarker
    ldr r0, [r4, #0x2bc]
    bl Overlay021_Descriptor_HasFlag29
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3d8]
    ldr r1, [r4, #0x2bc]
    ldr r0, L_02202bd4
    ldr r1, [r1, #0x4]
    ldr r2, [r0, #0x0]
    ldr r0, [r4, #0x54]
    ldrh r1, [r1, #0x0]
    ldr r0, [r2, r0, lsl #0x2]
    bl RecordCategory_PublishById
    ldr r1, L_02202bd8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_02202ba8
L_02202aa8:
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220b9b8
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220bc34
    cmp r0, #0x0
    bne L_02202ba8
    mov r0, r4
    bl Overlay021_UpdateTileTransitionOffset20
    ldr r0, [r4, #0x384]
    mov r1, #0x2
    add r0, r0, #0xc
    mov r2, #0x160
    bl PresentationScalar_TransitionTo
    ldr r1, [r4, #0x384]
    mov r0, #0x10
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0x2bc]
    mov r1, #0x1
    bl RecordDescriptor_GetMessage
    mov r1, r0
    mov r0, r4
    bl Overlay021_Dialog_ShowContent
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202ba8
L_02202b28:
    bl Overlay021_Dialog_UpdatePrompt
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x384]
    bl Overlay021_IsResourceStateReady
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x384]
    cmp r0, #0x0
    beq L_02202b5c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_02202b5c:
    mov r1, #0x0
    str r1, [r4, #0x384]
    mov r0, #0x1
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202ba8
L_02202b84:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x390]
    bl func_ov002_021fbe68
    ldr r1, L_02202bdc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
L_02202ba8:
    mov r0, r4
    bl Overlay021_UpdateScene
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02202bb8: .word data_ov021_02202fb8
L_02202bbc: .word gHeapContext
L_02202bc0: .word data_ov021_02202cd0
L_02202bc4: .word 0xff676980
L_02202bc8: .word gGamePhaseCurrencyHud
L_02202bcc: .word data_ov021_02202d68
L_02202bd0: .word data_ov021_02202d38
L_02202bd4: .word data_021f5128
L_02202bd8: .word data_ov021_02202d58
L_02202bdc: .word data_ov021_02202d90
.size Overlay021_UpdateTransaction, . - Overlay021_UpdateTransaction

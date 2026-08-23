; Matching retail form; see src/game/game_phase_load_scene_update.c for
; the documented portable reconstruction and recovered behavior.
.text
.extern GX_VBlankIntr
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern data_020d548c
.extern data_020d5494
.extern data_020d549c
.extern data_020d54a4
.extern data_020d54ac
.extern data_020d54b4
.extern data_020d54bc
.extern data_020d54c4
.extern data_020d54cc
.extern data_020d54d4
.extern data_020d54dc
.extern data_020d54e4
.extern data_020d54ec
.extern data_020d54f4
.extern data_020d54fc
.extern data_020d5504
.extern data_020d550c
.extern data_020d5514
.extern data_020d551c
.extern data_020d5524
.extern data_020d552c
.extern data_020d5534
.extern data_020d553c
.extern data_020f4e14
.extern data_021052fc
.extern OverlayManager_LoadOverlay
.extern OverlayManager_GetGlobal
.extern DisplayBrightness_IsMainTransitionComplete
.extern DisplayBrightness_IsSubTransitionComplete
.extern OverlaySlot_LoadOverlay
.extern OverlaySlot_UnloadOverlay
.extern GamePhaseRuntime_GetActorCollection
.extern GamePhaseRuntime_ApplyScreenMode
.extern GamePhaseRuntime_SetPlacementMode
.extern GamePhaseState_SetEnabled
.extern GamePhaseCurrencyHud_SetVisible
.extern GamePhaseAreaScene_SetEnabled
.extern func_0201e0f4
.extern ActorCollection_GetSpriteGroup
.extern GridEffectActorRegistry_FinalizeDepartingActors
.extern Sound_SetModalEnvelopeEnabled
.extern InventoryScene_Init
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteGroup_ReleaseResources
.extern GraphicsSpriteGroup_PrepareResources
.extern func_020745c4
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern SceneInputBase_Update
.extern func_020923a4
.extern func_02092418
.extern func_02092c8c
.extern func_ov004_021fc944
.extern func_ov009_021fce74
.extern func_ov013_021fce2c
.extern func_ov016_021fe77c
.extern func_ov017_021fda3c
.extern func_ov018_021fcf68
.extern func_ov018_021fd9f8
.extern func_ov019_021fce28
.extern func_ov020_021fd844
.extern func_ov021_021fd7e8
.extern func_ov022_021fdd44
.extern func_ov025_021ff27c
.extern Overlay027Scene_Init
.extern func_ov028_021fdb00
.extern func_ov035_02202378
.extern func_ov036_022045d4
.extern func_ov037_021fe4fc
.extern func_ov043_0220b76c
.extern func_ov044_0220be60
.extern func_ov059_0220fd20
.extern func_ov059_02210fec
.extern gDebugFont
.extern gGameWork
.extern gHeapContext
.extern gLupyContext
.extern gSoundContext

    .global GamePhaseLoadScene_Update
GamePhaseLoadScene_Update: ; 0x0200d094
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x28]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b L_0200e3bc
L_0200d0ac: ; jump table
    b L_0200d0c4 ; case 0
    b L_0200d17c ; case 1
    b L_0200dc10 ; case 2
    b L_0200dc4c ; case 3
    b L_0200dc7c ; case 4
    b L_0200dd4c ; case 5
L_0200d0c4:
    add r0, r0, #0x1
    str r0, [r5, #0x28]
    ldr r0, [r5, #0x2c]
    cmp r0, #0x1
    bgt L_0200d0e0
    beq L_0200d110
    b L_0200d170
L_0200d0e0:
    sub r0, r0, #0x11
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b L_0200d170
L_0200d0f0: ; jump table
    b L_0200d150 ; case 0
    b L_0200d160 ; case 1
    b L_0200d170 ; case 2
    b L_0200d170 ; case 3
    b L_0200d170 ; case 4
    b L_0200d150 ; case 5
    b L_0200d160 ; case 6
    b L_0200d150 ; case 7
L_0200d110:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r0, L_0200e0e4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    beq L_0200d17c
    mov r0, #0x2
    sub r1, r0, #0x12
    bl func_02092c8c
    b L_0200d17c
L_0200d150:
    mov r0, #0x3
    mov r1, #0x10
    bl func_02092c8c
    b L_0200d17c
L_0200d160:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    b L_0200d17c
L_0200d170:
    mov r0, #0x3
    sub r1, r0, #0x13
    bl func_02092c8c
L_0200d17c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_0200dbf4
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    beq L_0200dbf4
    mov r0, #0x0
    bl GX_VBlankIntr
    mov r1, #0x0
    str r1, [r5, #0x3c]
    mov r4, r0
    bl GridEffectActorRegistry_FinalizeDepartingActors
    ldr r0, [r5, #0x2c]
    sub r0, r0, #0x10
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b L_0200d1e4
L_0200d1c0: ; jump table
    b L_0200d224 ; case 0
    b L_0200d224 ; case 1
    b L_0200d1e4 ; case 2
    b L_0200d1e4 ; case 3
    b L_0200d1e4 ; case 4
    b L_0200d1e4 ; case 5
    b L_0200d208 ; case 6
    b L_0200d1e4 ; case 7
    b L_0200d224 ; case 8
L_0200d1e4:
    mov r1, #0x1e
    ldr r0, L_0200e0e8
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x0
    mov r3, #0x14
    bl Sound_SetModalEnvelopeEnabled
    b L_0200d224
L_0200d208:
    mov r2, #0x0
    ldr r0, L_0200e0e8
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r3, #0x14
    bl Sound_SetModalEnvelopeEnabled
L_0200d224:
    ldr r0, [r5, #0x2c]
    cmp r0, #0xa
    bne L_0200d23c
    add r0, r5, #0x40
    bl func_020923a4
    b L_0200d29c
L_0200d23c:
    ldr r0, L_0200e0e4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0f4
    add r0, r5, #0x40
    bl func_020923a4
    ldr r2, L_0200e0ec
    mov r1, #0x0
    ldr r0, L_0200e0e4
    strh r1, [r2, #0x0]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_SetEnabled
    ldr r0, L_0200e0e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteGroup
    bl GraphicsSpriteGroup_ReleaseResources
    ldr r0, L_0200e0f0
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_020745c4
L_0200d29c:
    ldr r0, [r5, #0x2c]
    cmp r0, #0x1
    beq L_0200d2b8
    cmp r0, #0x12
    cmpne r0, #0x17
    beq L_0200d344
    b L_0200d2f0
L_0200d2b8:
    ldr r0, L_0200e0e4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne L_0200d2f0
    ldr r0, L_0200e0f4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
    b L_0200d344
L_0200d2f0:
    ldr r2, L_0200e0f8
    mov r1, #0x0
    ldr r0, L_0200e0e4
    strh r1, [r2, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl GamePhaseRuntime_SetPlacementMode
    ldr r0, L_0200e0e4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_SetEnabled
    ldr r0, L_0200e0fc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_020745c4
    ldr r0, L_0200e0f4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
L_0200d344:
    ldr r0, [r5, #0x2c]
    cmp r0, #0x19
    addls pc, pc, r0, lsl #0x2
    b L_0200d3bc
L_0200d354: ; jump table
    b L_0200d3bc ; case 0
    b L_0200d3bc ; case 1
    b L_0200d408 ; case 2
    b L_0200d430 ; case 3
    b L_0200d478 ; case 4
    b L_0200d4c0 ; case 5
    b L_0200d50c ; case 6
    b L_0200d3bc ; case 7
    b L_0200d540 ; case 8
    b L_0200d3bc ; case 9
    b L_0200d5d8 ; case 10
    b L_0200d62c ; case 11
    b L_0200d6bc ; case 12
    b L_0200d730 ; case 13
    b L_0200d77c ; case 14
    b L_0200d7c4 ; case 15
    b L_0200d804 ; case 16
    b L_0200d844 ; case 17
    b L_0200d894 ; case 18
    b L_0200d8c8 ; case 19
    b L_0200d918 ; case 20
    b L_0200d958 ; case 21
    b L_0200d9a4 ; case 22
    b L_0200d5d8 ; case 23
    b L_0200db94 ; case 24
    b L_0200d6f0 ; case 25
L_0200d3bc:
    ldr r1, L_0200e100
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e104
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e108
    add r0, r5, #0x8c
    bl OverlaySlot_LoadOverlay
    ldr r0, L_0200e10c
    ldr r1, L_0200e110
    mov r2, #0x4
    ldr r3, L_0200e114
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d400
    bl func_ov013_021fce2c ; func_ov023_021fce2c, func_ov024_021fce2c, func_ov038_021fce2c
L_0200d400:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d408:
    ldr r1, L_0200e118
    ldr r3, L_0200e114
    mov r0, #0x88
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d428
    bl InventoryScene_Init
L_0200d428:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d430:
    ldr r0, L_0200e11c
    ldr r1, L_0200e120
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_0200e11c
    mov r1, #0x388
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, L_0200e118
    ldr r3, L_0200e114
    mov r0, #0x88
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d470
    bl InventoryScene_Init
L_0200d470:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d478:
    ldr r0, L_0200e11c
    ldr r1, L_0200e120
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200e11c
    mov r1, #0x388
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r1, L_0200e118
    ldr r3, L_0200e114
    mov r0, #0x88
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d4b8
    bl InventoryScene_Init
L_0200d4b8:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d4c0:
    ldr r1, L_0200e124
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e128
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e12c
    add r0, r5, #0x8c
    bl OverlaySlot_LoadOverlay
    mov r0, #0x240
    ldr r1, L_0200e130
    mov r2, #0x4
    ldr r3, L_0200e114
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d504
    bl func_ov044_0220be60
L_0200d504:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d50c:
    ldr r1, L_0200e134
    add r0, r5, #0x8c
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e138
    ldr r3, L_0200e114
    mov r0, #0x2f8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d538
    bl func_ov043_0220b76c
L_0200d538:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d540:
    ldr r1, L_0200e13c
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e140
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r0, L_0200e0e4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl GamePhaseRuntime_ApplyScreenMode
    ldr r0, L_0200e0e4
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl GamePhaseRuntime_SetPlacementMode
    ldr r0, L_0200e0e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_SetEnabled
    ldr r0, L_0200e0e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_SetEnabled
    ldr r0, L_0200e144
    ldr r1, L_0200e148
    mov r2, #0x4
    ldr r3, L_0200e114
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d5d0
    ldr r1, [r5, #0x30]
    bl func_ov018_021fcf68
L_0200d5d0:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d5d8:
    ldr r1, L_0200e14c
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e150
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e154
    ldr r3, L_0200e114
    mov r0, #0x64
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d624
    ldr r1, [r5, #0x2c]
    cmp r1, #0xa
    moveq r2, #0x1
    ldr r1, [r5, #0x30]
    movne r2, #0x0
    bl func_ov019_021fce28 ; func_ov028_021fce28
L_0200d624:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d62c:
    ldr r0, [r5, #0x30]
    cmp r0, #0x7
    beq L_0200d67c
    ldr r1, L_0200e158
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e15c
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r0, L_0200e160
    ldr r1, L_0200e164
    ldr r3, L_0200e114
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d674
    ldr r1, [r5, #0x30]
    bl func_ov021_021fd7e8
L_0200d674:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d67c:
    ldr r1, L_0200e100
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e168
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e16c
    ldr r3, L_0200e114
    mov r0, #0x394
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d6b4
    bl func_ov022_021fdd44
L_0200d6b4:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d6bc:
    ldr r1, L_0200e170
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e174
    ldr r3, L_0200e114
    mov r0, #0x1e8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d6e8
    bl func_ov020_021fd844
L_0200d6e8:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d6f0:
    ldr r1, L_0200e100
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e178
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e17c
    ldr r3, L_0200e114
    mov r0, #0x368
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d728
    bl func_ov013_021fce2c ; func_ov023_021fce2c, func_ov024_021fce2c, func_ov038_021fce2c
L_0200d728:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d730:
    ldr r1, L_0200e180
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e100
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e184
    add r0, r5, #0x8c
    bl OverlaySlot_LoadOverlay
    mov r0, #0x2f8
    ldr r1, L_0200e188
    mov r2, #0x4
    ldr r3, L_0200e114
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d774
    bl func_ov013_021fce2c ; func_ov023_021fce2c, func_ov024_021fce2c, func_ov038_021fce2c
L_0200d774:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d77c:
    ldr r1, L_0200e18c
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r0, L_0200e190
    ldr r1, L_0200e194
    ldr r3, L_0200e114
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d7bc
    ldr r2, L_0200e11c
    mov r1, #0x2
    ldr r2, [r2, #0x0]
    add r2, r2, #0x200
    ldrsh r2, [r2, #0x6]
    bl func_ov016_021fe77c ; func_ov023_021fe77c, func_ov028_021fe77c
L_0200d7bc:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d7c4:
    ldr r1, L_0200e158
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e198
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r0, L_0200e19c
    ldr r1, L_0200e1a0
    ldr r3, L_0200e114
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d7fc
    bl func_ov018_021fd9f8 ; func_ov023_021fd9f8
L_0200d7fc:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d804:
    ldr r1, L_0200e1a4
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e1a8
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r0, L_0200e1ac
    ldr r1, L_0200e1b0
    ldr r3, L_0200e114
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d83c
    bl func_ov025_021ff27c
L_0200d83c:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d844:
    ldr r1, L_0200e1b4
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e1b8
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e1bc
    add r0, r5, #0x8c
    bl OverlaySlot_LoadOverlay
    mov r0, #0x64
    ldr r1, L_0200e1c0
    mov r2, #0x4
    ldr r3, L_0200e114
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d88c
    ldr r1, [r5, #0x30]
    bl func_ov004_021fc944
L_0200d88c:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d894:
    ldr r1, L_0200e1c4
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e1c8
    ldr r3, L_0200e114
    mov r0, #0x29c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d8c0
    bl func_ov028_021fdb00
L_0200d8c0:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d8c8:
    ldr r1, L_0200e14c
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e158
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e1cc
    add r0, r5, #0x8c
    bl OverlaySlot_LoadOverlay
    mov r0, #0x104
    ldr r1, L_0200e1d0
    mov r2, #0x4
    ldr r3, L_0200e114
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d910
    ldr r1, [r5, #0x30]
    bl func_ov009_021fce74 ; func_ov012_021fce74, func_ov027_021fce74, func_ov029_021fce74, func_ov040_021fce74
L_0200d910:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d918:
    ldr r1, L_0200e1b4
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e1d4
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e1d8
    ldr r3, L_0200e114
    mov r0, #0x5e0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d950
    bl Overlay027Scene_Init
L_0200d950:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d958:
    ldr r1, L_0200e14c
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e158
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e1dc
    add r0, r5, #0x8c
    bl OverlaySlot_LoadOverlay
    mov r0, #0x398
    ldr r1, L_0200e1e0
    mov r2, #0x4
    ldr r3, L_0200e114
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200d99c
    bl func_ov017_021fda3c ; func_ov030_021fda3c, func_ov034_021fda3c
L_0200d99c:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200d9a4:
    ldr r0, [r5, #0x30]
    cmp r0, #0x12c
    bgt L_0200da68
    bge L_0200db50
    cmp r0, #0xcb
    bgt L_0200da24
    bge L_0200db50
    cmp r0, #0xc8
    bgt L_0200da08
    bge L_0200db50
    cmp r0, #0x4d
    ble L_0200db0c
    sub r1, r0, #0x64
    cmp r1, #0x8
    addls pc, pc, r1, lsl #0x2
    b L_0200db0c
L_0200d9e4: ; jump table
    b L_0200db0c ; case 0
    b L_0200db0c ; case 1
    b L_0200db0c ; case 2
    b L_0200db0c ; case 3
    b L_0200db0c ; case 4
    b L_0200db0c ; case 5
    b L_0200db0c ; case 6
    b L_0200db0c ; case 7
    b L_0200db0c ; case 8
L_0200da08:
    cmp r0, #0xc9
    bgt L_0200da18
    beq L_0200db50
    b L_0200db0c
L_0200da18:
    cmp r0, #0xca
    beq L_0200db50
    b L_0200db0c
L_0200da24:
    cmp r0, #0xce
    bgt L_0200da4c
    bge L_0200db50
    cmp r0, #0xcc
    bgt L_0200da40
    beq L_0200db50
    b L_0200db0c
L_0200da40:
    cmp r0, #0xcd
    beq L_0200db50
    b L_0200db0c
L_0200da4c:
    cmp r0, #0xcf
    bgt L_0200da5c
    beq L_0200db50
    b L_0200db0c
L_0200da5c:
    cmp r0, #0xd0
    beq L_0200db50
    b L_0200db0c
L_0200da68:
    ldr r2, L_0200e1e4
    cmp r0, r2
    bgt L_0200dacc
    bge L_0200db50
    sub r1, r2, #0x3
    cmp r0, r1
    bgt L_0200daac
    bge L_0200db50
    sub r1, r2, #0x5
    cmp r0, r1
    bgt L_0200da9c
    beq L_0200db50
    b L_0200db0c
L_0200da9c:
    sub r1, r2, #0x4
    cmp r0, r1
    beq L_0200db50
    b L_0200db0c
L_0200daac:
    cmp r0, #0x130
    bgt L_0200dabc
    beq L_0200db50
    b L_0200db0c
L_0200dabc:
    sub r1, r2, #0x1
    cmp r0, r1
    beq L_0200db50
    b L_0200db0c
L_0200dacc:
    cmp r0, #0x258
    bgt L_0200daf8
    bge L_0200db0c
    add r1, r2, #0x1
    cmp r0, r1
    bgt L_0200daec
    beq L_0200db50
    b L_0200db0c
L_0200daec:
    cmp r0, #0x134
    beq L_0200db50
    b L_0200db0c
L_0200daf8:
    ldr r1, L_0200e1e8
    cmp r0, r1
    ble L_0200db0c
    add r1, r1, #0x1
    cmp r0, r1
L_0200db0c:
    ldr r1, L_0200e1b4
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e1ec
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e1f0
    ldr r3, L_0200e114
    mov r0, #0x4c0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200db48
    ldr r1, [r5, #0x30]
    bl func_ov036_022045d4
L_0200db48:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200db50:
    ldr r1, L_0200e1b4
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e1f4
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e1f0
    ldr r3, L_0200e114
    mov r0, #0x4c0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200db8c
    ldr r1, [r5, #0x30]
    bl func_ov035_02202378
L_0200db8c:
    str r0, [r5, #0x24]
    b L_0200dbd4
L_0200db94:
    ldr r1, L_0200e1b4
    add r0, r5, #0x74
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0200e1f8
    add r0, r5, #0x80
    bl OverlaySlot_LoadOverlay
    ldr r0, L_0200e1fc
    ldr r1, L_0200e200
    ldr r3, L_0200e114
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200dbd0
    ldr r1, [r5, #0x30]
    bl func_ov037_021fe4fc
L_0200dbd0:
    str r0, [r5, #0x24]
L_0200dbd4:
    mov r1, #0x1
    mov r0, r4
    str r1, [r5, #0x38]
    bl GX_VBlankIntr
    ldr r0, [r5, #0x28]
    add r0, r0, #0x1
    str r0, [r5, #0x28]
    b L_0200e3bc
L_0200dbf4:
    ldr r0, L_0200e0e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteGroup
    bl GraphicsSpriteGroup_AdvanceAnimations
    b L_0200e3bc
L_0200dc10:
    ldr r0, [r5, #0x24]
    mov r1, #0x0
    bl SceneInputBase_Update
    ldr r0, [r5, #0x24]
    ldr r0, [r0, #0x20]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq L_0200e3bc
    mov r0, #0x3
    mov r1, #0x0
    bl func_02092c8c
    ldr r0, [r5, #0x28]
    add r0, r0, #0x1
    str r0, [r5, #0x28]
    b L_0200e3bc
L_0200dc4c:
    ldr r0, [r5, #0x24]
    mov r1, #0x0
    bl SceneInputBase_Update
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_0200e3bc
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    ldrne r0, [r5, #0x28]
    addne r0, r0, #0x1
    strne r0, [r5, #0x28]
    b L_0200e3bc
L_0200dc7c:
    ldr r0, [r5, #0x24]
    mov r1, #0x1
    bl SceneInputBase_Update
    cmp r0, #0x0
    beq L_0200e3bc
    ldr r0, [r5, #0x2c]
    cmp r0, #0x1
    bgt L_0200dca4
    beq L_0200dcf0
    b L_0200dd30
L_0200dca4:
    sub r0, r0, #0x12
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b L_0200dd30
L_0200dcb4: ; jump table
    b L_0200dcd0 ; case 0
    b L_0200dd30 ; case 1
    b L_0200dd30 ; case 2
    b L_0200dd30 ; case 3
    b L_0200dce0 ; case 4
    b L_0200dcd0 ; case 5
    b L_0200dce0 ; case 6
L_0200dcd0:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    b L_0200dd3c
L_0200dce0:
    mov r0, #0x3
    mov r1, #0x10
    bl func_02092c8c
    b L_0200dd3c
L_0200dcf0:
    ldr r0, L_0200e0e4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    ldreq r0, [r5, #0x24]
    ldreq r0, [r0, #0x980]
    cmpeq r0, #0x0
    bne L_0200dd30
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    b L_0200dd3c
L_0200dd30:
    mov r0, #0x3
    sub r1, r0, #0x13
    bl func_02092c8c
L_0200dd3c:
    ldr r0, [r5, #0x28]
    add r0, r0, #0x1
    str r0, [r5, #0x28]
    b L_0200e3bc
L_0200dd4c:
    ldr r0, [r5, #0x24]
    mov r1, #0x0
    bl SceneInputBase_Update
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_0200e3bc
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    beq L_0200e3bc
    mov r4, #0x0
    str r4, [r5, #0x38]
    ldr r0, [r5, #0x2c]
    ldr r1, L_0200e204
    cmp r0, #0x1
    ldreq r0, [r5, #0x24]
    ldreq r4, [r0, #0x980]
    ldr r0, L_0200e11c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_0200ddb8
    ldr r0, L_0200e11c
    ldr r1, L_0200e204
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r4, #0x1
    b L_0200ddd0
L_0200ddb8:
    ldr r0, L_0200e11c
    ldr r1, L_0200e208
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    movne r4, #0xb
L_0200ddd0:
    ldr r0, [r5, #0x24]
    cmp r0, #0x0
    beq L_0200dde8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
L_0200dde8:
    mov r1, #0x0
    add r0, r5, #0x74
    str r1, [r5, #0x24]
    bl OverlaySlot_UnloadOverlay
    add r0, r5, #0x80
    bl OverlaySlot_UnloadOverlay
    add r0, r5, #0x8c
    bl OverlaySlot_UnloadOverlay
    ldr ip, L_0200e20c
    ldr lr, [r5, #0x98]
    ldrh r3, [ip, #0x0]
    mov r2, #0x1e
    ldr r0, L_0200e0e8
    bic r3, r3, #0x8000
    orr r3, r3, lr, lsl #0xf
    strh r3, [ip, #0x0]
    str r2, [sp, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, r1
    mov r3, #0x14
    bl Sound_SetModalEnvelopeEnabled
    add r0, r5, #0x40
    bl func_02092418
    cmp r4, #0xf
    addls pc, pc, r4, lsl #0x2
    b L_0200dedc
L_0200de54: ; jump table
    b L_0200dff4 ; case 0
    b L_0200de94 ; case 1
    b L_0200dedc ; case 2
    b L_0200defc ; case 3
    b L_0200defc ; case 4
    b L_0200dedc ; case 5
    b L_0200dedc ; case 6
    b L_0200dedc ; case 7
    b L_0200dedc ; case 8
    b L_0200df40 ; case 9
    b L_0200dedc ; case 10
    b L_0200df1c ; case 11
    b L_0200deec ; case 12
    b L_0200dedc ; case 13
    b L_0200deec ; case 14
    b L_0200deec ; case 15
L_0200de94:
    ldr r0, L_0200e0e4
    ldr r0, [r0, #0x0]
    add r1, r0, #0x3000
    ldr r1, [r1, #0xbc]
    ldr r1, [r1, #0x40]
    mov r1, r1, lsl #0xc
    mov r1, r1, lsr #0x1e
    cmp r1, #0x2
    bne L_0200dedc
    mov r1, #0x1
    mov r2, r1
    bl GamePhaseRuntime_ApplyScreenMode
    ldr r0, L_0200e0e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_SetEnabled
L_0200dedc:
    str r4, [r5, #0x2c]
    mov r0, #0x0
    str r0, [r5, #0x28]
    b L_0200e3bc
L_0200deec:
    ldr r0, L_0200e11c
    ldr r1, L_0200e210
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
L_0200defc:
    ldr r0, L_0200e11c
    ldr r1, L_0200e204
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    str r4, [r5, #0x2c]
    mov r0, #0x0
    str r0, [r5, #0x28]
    b L_0200e3bc
L_0200df1c:
    ldr r0, L_0200e11c
    str r4, [r5, #0x2c]
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    add r0, r0, #0x200
    ldrsh r0, [r0, #0x4]
    str r0, [r5, #0x30]
    str r1, [r5, #0x28]
    b L_0200e3bc
L_0200df40:
    cmp r5, #0x0
    beq L_0200df58
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200df58:
    ldr r0, L_0200e0e4
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl GamePhaseRuntime_ApplyScreenMode
    ldr r0, L_0200e0e4
    mov r1, #0x3
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl GamePhaseRuntime_SetPlacementMode
    ldr r0, L_0200e0e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_SetEnabled
    ldr r0, L_0200e0e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_SetEnabled
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    ldr r2, L_0200e214
    bl OverlayManager_LoadOverlay
    mov r0, #0x90
    ldr r1, L_0200e218
    mov r2, #0x4
    ldr r3, L_0200e114
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200dfec
    ldr r1, L_0200e0e4
    ldr r1, [r1, #0x0]
    add r1, r1, #0x3000
    ldr r1, [r1, #0xbc]
    bl func_ov059_02210fec
L_0200dfec:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_0200dff4:
    ldr r0, [r5, #0x2c]
    cmp r0, #0x1
    bgt L_0200e008
    beq L_0200e07c
    b L_0200e21c
L_0200e008:
    sub r0, r0, #0x10
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b L_0200e21c
L_0200e018: ; jump table
    b L_0200e2ac ; case 0
    b L_0200e21c ; case 1
    b L_0200e038 ; case 2
    b L_0200e21c ; case 3
    b L_0200e2ac ; case 4
    b L_0200e21c ; case 5
    b L_0200e21c ; case 6
    b L_0200e038 ; case 7
L_0200e038:
    ldr r0, L_0200e0f0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_0200e0e4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl GamePhaseRuntime_ApplyScreenMode
    ldr r0, L_0200e0e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_SetEnabled
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    b L_0200e2ac
L_0200e07c:
    ldr r0, L_0200e0e4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne L_0200e21c
    ldr r0, L_0200e0f0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_0200e0e4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl GamePhaseRuntime_ApplyScreenMode
    ldr r0, L_0200e0e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_SetEnabled
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    b L_0200e2ac
L_0200e0e4: .word data_021052fc
L_0200e0e8: .word gSoundContext
L_0200e0ec: .word 0x4000050
L_0200e0f0: .word data_020f4e14
L_0200e0f4: .word gLupyContext
L_0200e0f8: .word 0x4001050
L_0200e0fc: .word gDebugFont
L_0200e100: .word 0x2e
L_0200e104: .word 0x6
L_0200e108: .word 0xd
L_0200e10c: .word 0x9ac
L_0200e110: .word data_020d548c
L_0200e114: .word gHeapContext
L_0200e118: .word data_020d5494
L_0200e11c: .word gGameWork
L_0200e120: .word 0x387
L_0200e124: .word 0x1
L_0200e128: .word 0xf
L_0200e12c: .word 0x2c
L_0200e130: .word data_020d549c
L_0200e134: .word 0x2b
L_0200e138: .word data_020d54a4
L_0200e13c: .word 0x3
L_0200e140: .word 0x12
L_0200e144: .word 0x424
L_0200e148: .word data_020d54ac
L_0200e14c: .word 0x2
L_0200e150: .word 0x13
L_0200e154: .word data_020d54b4
L_0200e158: .word 0x2d
L_0200e15c: .word 0x15
L_0200e160: .word 0x428
L_0200e164: .word data_020d54bc
L_0200e168: .word 0x16
L_0200e16c: .word data_020d54c4
L_0200e170: .word 0x14
L_0200e174: .word data_020d54cc
L_0200e178: .word 0x26
L_0200e17c: .word data_020d54d4
L_0200e180: .word 0x5
L_0200e184: .word 0x18
L_0200e188: .word data_020d54dc
L_0200e18c: .word 0x10
L_0200e190: .word 0x488
L_0200e194: .word data_020d54e4
L_0200e198: .word 0x17
L_0200e19c: .word 0x4f8
L_0200e1a0: .word data_020d54ec
L_0200e1a4: .word 0x5e
L_0200e1a8: .word 0x19
L_0200e1ac: .word 0x63c
L_0200e1b0: .word data_020d54f4
L_0200e1b4: .word 0x30
L_0200e1b8: .word 0x4
L_0200e1bc: .word 0x1a
L_0200e1c0: .word data_020d54fc
L_0200e1c4: .word 0x1c
L_0200e1c8: .word data_020d5504
L_0200e1cc: .word 0x1d
L_0200e1d0: .word data_020d550c
L_0200e1d4: .word 0x1b
L_0200e1d8: .word data_020d5514
L_0200e1dc: .word 0x1e
L_0200e1e0: .word data_020d551c
L_0200e1e4: .word 0x132
L_0200e1e8: .word 0x259
L_0200e1ec: .word 0x24
L_0200e1f0: .word data_020d5524
L_0200e1f4: .word 0x23
L_0200e1f8: .word 0x25
L_0200e1fc: .word 0x4bc
L_0200e200: .word data_020d552c
L_0200e204: .word 0x389
L_0200e208: .word 0x3b2
L_0200e20c: .word 0x4000304
L_0200e210: .word 0x3bd
L_0200e214: .word 0x3b
L_0200e218: .word data_020d5534
L_0200e21c:
    ldr r0, L_0200e0f0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_0200e0fc
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_0200e0e4
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl GamePhaseRuntime_ApplyScreenMode
    ldr r0, L_0200e0e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_SetEnabled
    ldr r0, L_0200e0e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_SetEnabled
    ldr r0, L_0200e11c
    ldr r1, L_0200e3c4
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_0200e2a0
    ldr r0, L_0200e11c
    ldr r1, L_0200e3c4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    b L_0200e2ac
L_0200e2a0:
    mov r0, #0x3
    mov r1, #0x0
    bl func_02092c8c
L_0200e2ac:
    ldr r0, [r5, #0x34]
    cmp r0, #0x0
    beq L_0200e2c8
    ldr r0, L_0200e0f4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
L_0200e2c8:
    ldr r0, L_0200e0e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteGroup
    bl GraphicsSpriteGroup_PrepareResources
    cmp r5, #0x0
    beq L_0200e2f8
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200e2f8:
    ldr r0, L_0200e11c
    mov r1, #0x3cc
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_0200e358
    ldr r0, L_0200e11c
    mov r1, #0x3cc
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    bl OverlayManager_GetGlobal
    ldr r2, L_0200e3c8
    mov r1, #0x2
    bl OverlayManager_LoadOverlay
    ldr r1, L_0200e3cc
    ldr r3, L_0200e114
    mov r0, #0x80
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200e3b4
    mov r1, #0x0
    bl func_ov059_0220fd20 ; func_ov060_0220fd20, func_ov061_0220fd20, func_ov062_0220fd20, func_ov063_0220fd20, Overlay064Scene_Construct, Overlay065Particle_Init, func_ov066_0220fd20, func_ov068_0220fd20, func_ov069_0220fd20, func_ov070_0220fd20, func_ov071_0220fd20, func_ov072_0220fd20, func_ov073_0220fd20, func_ov074_0220fd20
    b L_0200e3b4
L_0200e358:
    ldr r0, L_0200e11c
    ldr r1, L_0200e3d0
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_0200e3b4
    ldr r0, L_0200e11c
    ldr r1, L_0200e3d0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    bl OverlayManager_GetGlobal
    ldr r2, L_0200e3c8
    mov r1, #0x2
    bl OverlayManager_LoadOverlay
    ldr r1, L_0200e3cc
    ldr r3, L_0200e114
    mov r0, #0x80
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200e3b4
    mov r1, #0x1
    bl func_ov059_0220fd20 ; func_ov060_0220fd20, func_ov061_0220fd20, func_ov062_0220fd20, func_ov063_0220fd20, Overlay064Scene_Construct, Overlay065Particle_Init, func_ov066_0220fd20, func_ov068_0220fd20, func_ov069_0220fd20, func_ov070_0220fd20, func_ov071_0220fd20, func_ov072_0220fd20, func_ov073_0220fd20, func_ov074_0220fd20
L_0200e3b4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_0200e3bc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_0200e3c4: .word 0x3ba
L_0200e3c8: .word 0x48
L_0200e3cc: .word data_020d553c
L_0200e3d0: .word 0x3cd
    .size GamePhaseLoadScene_Update, . - GamePhaseLoadScene_Update


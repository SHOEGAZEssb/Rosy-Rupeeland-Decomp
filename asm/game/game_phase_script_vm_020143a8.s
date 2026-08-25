; Matching retail form; see src/game/game_phase_script_vm_actor_command_dispatch.c.
.text
.extern GameWork_SetFlag
.extern Heap_Alloc
.extern OS_Halt
.extern data_020d5b2c
.extern data_020d5b34
.extern gGamePhaseRuntime
.extern data_ov054_0220f160
.extern OverlayManager_LoadOverlay
.extern OverlayManager_GetGlobal
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern GamePhaseRuntime_GetActorCollection
.extern ActorMotionAreaFollower_GetPosition
.extern VecFx32Object_SetComponents
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern RectS32_Set
.extern OverlayTransitionScene_Init
.extern RuntimePresentationManager_AppendFirstListEffect
.extern RuntimePresentationManager_GetFirstListNodeEffect
.extern RuntimePresentationManager_GetSecondListNodeEffect
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern TimedSpriteBurstManager_Init
.extern AuxiliaryTimedSpritePresentation_Init
.extern DirectSpriteTrackPresentation_SpawnAndRegister
.extern SpriteNumberMotionPresentation_Init
.extern func_02022ff4
.extern func_02023434
.extern func_02023ed4
.extern func_02024b04
.extern func_02025300
.extern func_02028630
.extern func_02028814
.extern func_0202906c
.extern ActorCollection_GetSpriteGroup
.extern ActorCollection_FindActorByRuntimeId
.extern Actor_GetOwningCollection
.extern Graphics3dPresentation_RemoveSpriteEffect
.extern Graphics3dPresentation_SetPairedEntryModeAt
.extern Graphics3dPresentation_SetRupeeVisibleAt
.extern Graphics3dPresentation_CreatePresetSpriteEffectInBounds
.extern Graphics3dPresentation_CreatePreset1To2SpriteEffectInBounds
.extern Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds
.extern Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
.extern Graphics3dPresentation_CreatePreset11To13SpriteEffectAt
.extern Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt
.extern Graphics3dPresentation_CreatePreset25To27TimedPointSpriteEffectAt
.extern Graphics3dPresentation_CreatePreset32CenteredAreaSpriteEffect
.extern Graphics3dPresentation_CreatePreset22To24TimedPointSpriteEffectWithHorizontalVelocityAt
.extern func_020be8c0
.extern func_020beae4
.extern func_020beb18
.extern func_020beb6c
.extern func_020bf1f8
.extern func_ov050_0220e1a0
.extern func_ov051_0220daa4
.extern func_ov051_0220dd90
.extern func_ov053_0220da0c
.extern func_ov054_0220e9bc
.extern func_ov054_0220ef78
.extern func_ov054_0220ef80
.extern func_ov055_0220ef6c
.extern func_ov057_0220e558
.extern func_ov065_022101bc
.extern func_ov073_02210710
.extern gGameWork
.extern gHeapContext
.extern genrand_int32

    .global GamePhaseActorScriptVm_DispatchEffectCommand
GamePhaseActorScriptVm_DispatchEffectCommand: ; 0x020143a8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc0
    mov r11, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r11
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r11
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r11
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r11
    bl GamePhaseScriptVm_Pop
    mov r8, r0
    mov r0, r11
    bl GamePhaseScriptVm_Pop
    mov r9, r0
    mov r0, r11
    bl GamePhaseScriptVm_Pop
    str r0, [sp, #0x1c]
    mov r0, r11
    mov r1, #0x0
    ldr r10, [r11, #0x84]
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    ldr r0, [sp, #0x1c]
    cmp r0, #0x26
    addls pc, pc, r0, lsl #0x2
    b L_02015538
L_02014424: ; jump table
    b L_02015538 ; case 0
    b L_020144c0 ; case 1
    b L_02015538 ; case 2
    b L_02014570 ; case 3
    b L_020145e8 ; case 4
    b L_0201553c ; case 5
    b L_02014668 ; case 6
    b L_02014680 ; case 7
    b L_02014724 ; case 8
    b L_020148b0 ; case 9
    b L_020149e4 ; case 10
    b L_02014dfc ; case 11
    b L_02014e40 ; case 12
    b L_02014e84 ; case 13
    b L_02014eac ; case 14
    b L_02014ee0 ; case 15
    b L_02014f0c ; case 16
    b L_02014f60 ; case 17
    b L_02015018 ; case 18
    b L_02015038 ; case 19
    b L_020150a4 ; case 20
    b L_020150f4 ; case 21
    b L_0201512c ; case 22
    b L_02015224 ; case 23
    b L_02014f88 ; case 24
    b L_02014fb4 ; case 25
    b L_020152f0 ; case 26
    b L_02014f34 ; case 27
    b L_02014bf0 ; case 28
    b L_02014fe4 ; case 29
    b L_02015308 ; case 30
    b L_02015398 ; case 31
    b L_02015444 ; case 32
    b L_02015350 ; case 33
    b L_0201545c ; case 34
    b L_02015474 ; case 35
    b L_020154a0 ; case 36
    b L_020154c0 ; case 37
    b L_02015508 ; case 38
L_020144c0:
    ldr r0, [r10, #0x20]
    ldr r1, [r10, #0x1c]
    mov r2, r0, asr #0xc
    mov r0, r2, asr #0x3
    add r0, r2, r0, lsr #0x1c
    mov r1, r1, asr #0xc
    mov r2, r0, asr #0x4
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    add r1, r2, #0x4
    mov r3, r0, asr #0x4
    str r1, [sp, #0x0]
    sub r1, r3, #0x4
    add r0, sp, #0x30
    sub r2, r2, #0x4
    add r3, r3, #0x4
    bl RectS32_Set
    ldr r2, [sp, #0x30]
    ldr r9, [sp, #0x34]
    ldr r5, [sp, #0x38]
    ldr r4, [sp, #0x3c]
    str r2, [sp, #0xb0]
    ldr r1, L_020154c8
    ldr r3, L_020154cc
    mov r0, #0x28
    mov r2, #0x4
    str r9, [sp, #0xb4]
    str r5, [sp, #0xb8]
    str r4, [sp, #0xbc]
    bl Heap_Alloc
    movs r1, r0
    beq L_02014558
    add r1, sp, #0xb0
    mov r2, r8
    mov r3, r7
    str r6, [sp, #0x0]
    bl TimedSpriteBurstManager_Init
    mov r1, r0
L_02014558:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    b L_0201553c
L_02014570:
    ldr r1, L_020154c8
    ldr r3, L_020154cc
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_020145cc
    ldr r0, L_020154d0
    ldr r5, [r0, #0x0]
    add r0, r5, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r2, #0x2000
    mov r1, r0
    str r2, [sp, #0x0]
    sub r0, r2, #0x20c0
    str r0, [sp, #0x4]
    add r0, r5, #0x2000
    ldr r2, [r0, #0xea4]
    mov r0, r4
    mov r3, r9
    bl SpriteNumberMotionPresentation_Init
    mov r4, r0
L_020145cc:
    ldr r0, L_020154d0
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    b L_0201553c
L_020145e8:
    ldr r1, L_020154c8
    ldr r3, L_020154cc
    mov r0, #0x54
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_0201464c
    ldr r0, L_020154d0
    ldr r5, [r0, #0x0]
    add r0, r5, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    str r8, [sp, #0x0]
    mov r2, #0x2000
    str r7, [sp, #0x4]
    mov r1, r0
    str r2, [sp, #0x8]
    sub r0, r2, #0x20c0
    str r0, [sp, #0xc]
    add r0, r5, #0x2000
    ldr r2, [r0, #0xea4]
    mov r0, r4
    mov r3, r9
    bl func_02022ff4
    mov r4, r0
L_0201464c:
    ldr r0, L_020154d0
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    b L_0201553c
L_02014668:
    bl OverlayManager_GetGlobal
    ldr r2, L_020154d4
    mov r1, #0x1
    bl OverlayManager_LoadOverlay
    bl func_ov055_0220ef6c
    b L_0201553c
L_02014680:
    add r0, sp, #0xa0
    bl VecFx32Object_Init
    cmp r4, #0x0
    add r0, sp, #0xa0
    beq L_020146b4
    ldr r1, [r10, #0x10c]
    ldr r2, [r10, #0x110]
    ldr r3, [r10, #0x114]
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    mov r3, r3, lsl #0xc
    bl VecFx32Object_SetComponents
    b L_020146bc
L_020146b4:
    add r1, r10, #0x18
    bl VecFx32Object_Assign
L_020146bc:
    ldr r1, L_020154c8
    ldr r3, L_020154cc
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_02014718
    mov r0, r10
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    str r8, [sp, #0x0]
    str r7, [sp, #0x4]
    str r6, [sp, #0x8]
    str r5, [sp, #0xc]
    mvn r5, #0x0
    mov r2, r0
    mov r0, r4
    add r1, sp, #0xa0
    mov r3, r9
    str r5, [sp, #0x10]
    mov r4, #0x1
    str r4, [sp, #0x14]
    bl AuxiliaryTimedSpritePresentation_Init
L_02014718:
    add r0, sp, #0xa0
    bl VecFx32Object_Destroy
    b L_0201553c
L_02014724:
    cmp r6, #0x0
    mov r0, r6, lsl #0xc
    ble L_02014744
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014750
L_02014744:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014750:
    mov r6, r0
    cmp r7, #0x0
    mov r0, r7, lsl #0xc
    ble L_02014774
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014780
L_02014774:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014780:
    mov r7, r0
    cmp r8, #0x0
    mov r0, r8, lsl #0xc
    ble L_020147a4
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_020147b0
L_020147a4:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_020147b0:
    bl func_020beae4
    mov r8, r0
    mov r0, r7
    bl func_020beae4
    mov r7, r0
    mov r0, r6
    bl func_020beae4
    mov r3, r0
    mov r1, r8
    mov r2, r7
    add r0, sp, #0x90
    bl VecFx32Object_InitComponents
    bl OverlayManager_GetGlobal
    ldr r2, L_020154d8
    mov r1, #0x2
    bl OverlayManager_LoadOverlay
    ldr r1, L_020154dc
    ldr r3, L_020154cc
    mov r0, #0x160
    mov r2, #0x4
    bl Heap_Alloc
    movs r6, r0
    beq L_020148a4
    cmp r4, #0x0
    mov r0, r4, lsl #0xc
    ble L_0201482c
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014838
L_0201482c:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014838:
    mov r7, r0
    cmp r5, #0x0
    mov r0, r5, lsl #0xc
    ble L_0201485c
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014868
L_0201485c:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014868:
    bl func_020beae4
    mov r4, r0
    mov r0, r7
    bl func_020beae4
    str r4, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, L_020154d0
    add r3, sp, #0x90
    ldr r1, [r0, #0x0]
    mov r0, r6
    add r1, r1, #0x2000
    ldr r2, [r1, #0xea4]
    mov r1, r9
    add r2, r2, #0x18
    bl func_ov065_022101bc
L_020148a4:
    add r0, sp, #0x90
    bl VecFx32Object_Destroy
    b L_0201553c
L_020148b0:
    cmp r7, #0x0
    mov r0, r7, lsl #0xc
    ble L_020148d0
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_020148dc
L_020148d0:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_020148dc:
    mov r7, r0
    cmp r8, #0x0
    mov r0, r8, lsl #0xc
    ble L_02014900
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_0201490c
L_02014900:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_0201490c:
    mov r4, r0
    cmp r9, #0x0
    mov r0, r9, lsl #0xc
    ble L_02014930
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_0201493c
L_02014930:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_0201493c:
    bl func_020beae4
    mov r5, r0
    mov r0, r4
    bl func_020beae4
    mov r4, r0
    mov r0, r7
    bl func_020beae4
    mov r3, r0
    mov r1, r5
    mov r2, r4
    add r0, sp, #0x80
    bl VecFx32Object_InitComponents
    ldr r1, L_020154c8
    ldr r3, L_020154cc
    mov r0, #0x38
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq L_020149c0
    mov r0, r10
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    mov r3, r6, lsl #0x10
    mov r4, #0x1
    mov r2, r0
    str r4, [sp, #0x0]
    mov r4, #0x0
    add r1, sp, #0x80
    mov r0, r5
    mov r3, r3, asr #0x10
    str r4, [sp, #0x4]
    bl func_02025300
    mov r5, r0
L_020149c0:
    ldr r0, L_020154d0
    mov r1, r5
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    add r0, sp, #0x80
    bl VecFx32Object_Destroy
    b L_0201553c
L_020149e4:
    cmp r7, #0x0
    mov r0, r7, lsl #0xc
    ble L_02014a04
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014a10
L_02014a04:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014a10:
    mov r7, r0
    cmp r8, #0x0
    mov r0, r8, lsl #0xc
    ble L_02014a34
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014a40
L_02014a34:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014a40:
    mov r8, r0
    cmp r9, #0x0
    mov r0, r9, lsl #0xc
    ble L_02014a64
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014a70
L_02014a64:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014a70:
    bl func_020beae4
    mov r9, r0
    mov r0, r8
    bl func_020beae4
    mov r8, r0
    mov r0, r7
    bl func_020beae4
    mov r3, r0
    mov r1, r9
    mov r2, r8
    add r0, sp, #0x70
    bl VecFx32Object_InitComponents
    cmp r4, #0x0
    mov r0, r4, lsl #0xc
    ble L_02014ac0
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014acc
L_02014ac0:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014acc:
    mov r7, r0
    cmp r5, #0x0
    mov r0, r5, lsl #0xc
    ble L_02014af0
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014afc
L_02014af0:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014afc:
    mov r4, r0
    cmp r6, #0x0
    mov r0, r6, lsl #0xc
    ble L_02014b20
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014b2c
L_02014b20:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014b2c:
    bl func_020beae4
    mov r5, r0
    mov r0, r4
    bl func_020beae4
    mov r4, r0
    mov r0, r7
    bl func_020beae4
    mov r3, r0
    mov r1, r5
    mov r2, r4
    add r0, sp, #0x60
    bl VecFx32Object_InitComponents
    ldr r1, L_020154c8
    ldr r3, L_020154cc
    mov r0, #0x24
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_02014bc4
    mov r0, r10
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    mov r5, r0
    bl genrand_int32
    mov r1, #0x3
    bl func_020bf1f8
    add r0, r1, #0x28
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [sp, #0x0]
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r1, r5
    mov r0, r4
    add r2, sp, #0x70
    add r3, sp, #0x60
    bl func_02023434
    mov r4, r0
L_02014bc4:
    ldr r0, L_020154d0
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    add r0, sp, #0x60
    bl VecFx32Object_Destroy
    add r0, sp, #0x70
    bl VecFx32Object_Destroy
    b L_0201553c
L_02014bf0:
    cmp r7, #0x0
    mov r0, r7, lsl #0xc
    ble L_02014c10
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014c1c
L_02014c10:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014c1c:
    mov r7, r0
    cmp r8, #0x0
    mov r0, r8, lsl #0xc
    ble L_02014c40
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014c4c
L_02014c40:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014c4c:
    mov r8, r0
    cmp r9, #0x0
    mov r0, r9, lsl #0xc
    ble L_02014c70
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014c7c
L_02014c70:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014c7c:
    bl func_020beae4
    mov r9, r0
    mov r0, r8
    bl func_020beae4
    mov r8, r0
    mov r0, r7
    bl func_020beae4
    mov r3, r0
    mov r1, r9
    mov r2, r8
    add r0, sp, #0x50
    bl VecFx32Object_InitComponents
    cmp r4, #0x0
    mov r0, r4, lsl #0xc
    ble L_02014ccc
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014cd8
L_02014ccc:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014cd8:
    mov r7, r0
    cmp r5, #0x0
    mov r0, r5, lsl #0xc
    ble L_02014cfc
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014d08
L_02014cfc:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014d08:
    mov r4, r0
    cmp r6, #0x0
    mov r0, r6, lsl #0xc
    ble L_02014d2c
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02014d38
L_02014d2c:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02014d38:
    bl func_020beae4
    mov r5, r0
    mov r0, r4
    bl func_020beae4
    mov r4, r0
    mov r0, r7
    bl func_020beae4
    mov r3, r0
    mov r1, r5
    mov r2, r4
    add r0, sp, #0x40
    bl VecFx32Object_InitComponents
    ldr r1, L_020154c8
    ldr r3, L_020154cc
    mov r0, #0x24
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_02014dd0
    mov r0, r10
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    mov r5, r0
    bl genrand_int32
    mov r1, #0x3
    bl func_020bf1f8
    add r0, r1, #0x28
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r1, r5
    mov r0, r4
    add r2, sp, #0x50
    add r3, sp, #0x40
    bl func_02023434
    mov r4, r0
L_02014dd0:
    ldr r0, L_020154d0
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    add r0, sp, #0x40
    bl VecFx32Object_Destroy
    add r0, sp, #0x50
    bl VecFx32Object_Destroy
    b L_0201553c
L_02014dfc:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    str r6, [sp, #0x0]
    mov r1, r9
    mov r2, r8
    mov r3, r7
    str r5, [sp, #0x4]
    mov r4, #0x46
    str r4, [sp, #0x8]
    bl Graphics3dPresentation_CreatePreset1To2SpriteEffectInBounds
    mov r1, r0
    mov r0, r11
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_0201553c
L_02014e40:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    str r6, [sp, #0x0]
    mov r1, r9
    mov r2, r8
    mov r3, r7
    str r5, [sp, #0x4]
    mov r4, #0x46
    str r4, [sp, #0x8]
    bl Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds
    mov r1, r0
    mov r0, r11
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_0201553c
L_02014e84:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, r9
    mov r2, r8
    mov r3, r7
    bl Graphics3dPresentation_SetPairedEntryModeAt
    b L_0201553c
L_02014eac:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    str r7, [sp, #0x0]
    str r6, [sp, #0x4]
    mov r1, r9
    mov r2, r4
    mov r3, r8
    str r5, [sp, #0x8]
    bl Graphics3dPresentation_CreatePresetSpriteEffectInBounds
    b L_0201553c
L_02014ee0:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, r9
    mov r2, r8
    mov r3, r7
    str r6, [sp, #0x0]
    bl Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
    b L_0201553c
L_02014f0c:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, r9
    mov r2, r8
    mov r3, r7
    bl Graphics3dPresentation_CreatePreset11To13SpriteEffectAt
    b L_0201553c
L_02014f34:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, r9
    mov r2, r8
    mov r3, r7
    str r6, [sp, #0x0]
    bl Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt
    b L_0201553c
L_02014f60:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, r9
    mov r2, r8
    mov r3, r7
    bl Graphics3dPresentation_SetRupeeVisibleAt
    b L_0201553c
L_02014f88:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, r9
    mov r2, r8
    mov r3, r7
    str r6, [sp, #0x0]
    bl Graphics3dPresentation_CreatePreset25To27TimedPointSpriteEffectAt
    b L_0201553c
L_02014fb4:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    str r6, [sp, #0x0]
    mov r1, r9
    mov r2, r8
    mov r3, r7
    str r5, [sp, #0x4]
    bl Graphics3dPresentation_CreatePreset32CenteredAreaSpriteEffect
    b L_0201553c
L_02014fe4:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    str r6, [sp, #0x0]
    str r5, [sp, #0x4]
    mov r1, r9
    mov r2, r8
    mov r3, r7
    str r4, [sp, #0x8]
    bl Graphics3dPresentation_CreatePreset22To24TimedPointSpriteEffectWithHorizontalVelocityAt
    b L_0201553c
L_02015018:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, r9
    bl Graphics3dPresentation_RemoveSpriteEffect
    b L_0201553c
L_02015038:
    ldr r1, L_020154c8
    ldr r3, L_020154cc
    mov r0, #0x58
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_02015088
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    str r8, [sp, #0x0]
    str r7, [sp, #0x4]
    mov r1, r0
    ldr r2, [r11, #0x84]
    mov r0, r4
    mov r3, r9
    bl func_02024b04
    mov r4, r0
L_02015088:
    ldr r0, L_020154d0
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    b L_0201553c
L_020150a4:
    bl OverlayManager_GetGlobal
    ldr r2, L_020154e0
    mov r1, #0x0
    bl OverlayManager_LoadOverlay
    add r0, sp, #0x20
    mov r1, r9, lsl #0xc
    mov r2, r8, lsl #0xc
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r2, r7
    add r1, sp, #0x20
    bl func_ov050_0220e1a0
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    b L_0201553c
L_020150f4:
    bl OverlayManager_GetGlobal
    ldr r2, L_020154e4
    mov r1, #0x0
    bl OverlayManager_LoadOverlay
    cmp r9, #0x0
    mov r0, r8
    mov r1, r7
    bne L_02015120
    mov r2, r6
    bl func_ov051_0220daa4
    b L_0201553c
L_02015120:
    mov r2, r6
    bl func_ov051_0220dd90
    b L_0201553c
L_0201512c:
    cmp r9, #0x0
    cmpne r9, #0x1
    beq L_02015144
    cmp r9, #0x2
    beq L_020151e4
    b L_0201553c
L_02015144:
    ldr r0, L_020154e8
    ldr r1, L_020154ec
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    bl OverlayManager_GetGlobal
    ldr r2, L_020154f0
    mov r1, #0x1
    bl OverlayManager_LoadOverlay
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    ldr r2, L_020154d0
    mov r1, r0
    ldr r0, [r2, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    add r0, r0, #0x18
    bl func_ov054_0220e9bc
    ldr r1, L_020154d0
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, r4
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetSecondListNodeEffect
    mov r5, r0
    ldr r0, L_020154d0
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    mov r1, r8
    bl ActorCollection_FindActorByRuntimeId
    mov r1, r4
    add r0, r0, #0x18
    str r0, [r5, #0x8]
    mov r0, r11
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_0201553c
L_020151e4:
    ldr r0, L_020154d0
    mov r1, r8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetSecondListNodeEffect
    ldr r1, L_020154d0
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    mov r1, r7
    bl ActorCollection_FindActorByRuntimeId
    add r0, r0, #0x18
    str r0, [r4, #0x8]
    b L_0201553c
L_02015224:
    cmp r9, #0x1
    beq L_02015238
    cmp r9, #0x2
    beq L_020152d0
    b L_0201553c
L_02015238:
    ldr r2, L_020154e8
    ldr r1, L_020154d0
    ldr r0, [r2, #0x0]
    add r0, r0, #0x100
    strh r7, [r0, #0xa0]
    ldr r0, [r2, #0x0]
    add r0, r0, #0x100
    strh r6, [r0, #0xa2]
    ldr r0, [r2, #0x0]
    add r0, r0, #0x100
    strh r5, [r0, #0xa4]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    bl func_ov054_0220ef80
    ldr r1, L_020154d0
    mov r5, r0
    ldr r0, [r1, #0x0]
    mov r1, r5
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetFirstListNodeEffect
    ldr r1, L_020154d0
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, r8
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetSecondListNodeEffect
    mov r6, r0
    mov r0, r4
    bl func_ov054_0220ef78
    str r0, [r6, #0x8]
    mov r0, r11
    mov r1, r5
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_0201553c
L_020152d0:
    ldr r0, L_020154f4
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    mov r0, r11
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_0201553c
L_020152f0:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_02028630
    b L_0201553c
L_02015308:
    str r6, [sp, #0x0]
    str r5, [sp, #0x4]
    str r4, [sp, #0x8]
    mov r0, #0x100
    str r0, [sp, #0xc]
    ldr r0, [r10, #0x110]
    mov r1, r9
    str r0, [sp, #0x10]
    ldr r4, [r10, #0x114]
    mov r2, r8
    mov r3, r7
    mov r0, #0x0
    str r4, [sp, #0x14]
    bl DirectSpriteTrackPresentation_SpawnAndRegister
    mov r1, r0
    mov r0, r11
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_0201553c
L_02015350:
    str r6, [sp, #0x0]
    str r5, [sp, #0x4]
    str r4, [sp, #0x8]
    mov r0, #0x100
    str r0, [sp, #0xc]
    ldr r0, [r10, #0x110]
    mov r1, r9
    str r0, [sp, #0x10]
    ldr r4, [r10, #0x114]
    mov r2, r8
    mov r3, r7
    mov r0, #0x1
    str r4, [sp, #0x14]
    bl DirectSpriteTrackPresentation_SpawnAndRegister
    mov r1, r0
    mov r0, r11
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_0201553c
L_02015398:
    ldr r0, L_020154d0
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    mov r1, r5
    bl ActorCollection_FindActorByRuntimeId
    mov r5, r0
    bl OverlayManager_GetGlobal
    ldr r2, L_020154f8
    mov r1, #0x2
    bl OverlayManager_LoadOverlay
    ldr r1, L_020154c8
    ldr r3, L_020154cc
    mov r0, #0x1c
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_0201542c
    mov r2, r7, lsl #0xc
    ldr r1, L_020154fc
    str r2, [sp, #0x0]
    mov r2, #0x1640
    str r1, [sp, #0x4]
    mov r1, r6, lsl #0x10
    str r2, [sp, #0x8]
    add r2, r2, #0x3
    str r2, [sp, #0xc]
    mov r1, r1, asr #0x10
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    mov r1, r5
    mov r2, r9, lsl #0xc
    mov r3, r8, lsl #0xc
    str r4, [sp, #0x18]
    bl func_ov073_02210710
    mov r1, r0
L_0201542c:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    b L_0201553c
L_02015444:
    bl OverlayManager_GetGlobal
    ldr r2, L_02015500
    mov r1, #0x1
    bl OverlayManager_LoadOverlay
    bl func_ov057_0220e558
    b L_0201553c
L_0201545c:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    mov r3, r6
    bl func_02023ed4
    b L_0201553c
L_02015474:
    ldr r1, L_020154dc
    ldr r3, L_020154cc
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0201553c
    mov r2, r9
    mov r1, #0x0
    bl OverlayTransitionScene_Init
    b L_0201553c
L_020154a0:
    bl OverlayManager_GetGlobal
    ldr r2, L_02015504
    mov r1, #0x0
    bl OverlayManager_LoadOverlay
    mov r0, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_ov053_0220da0c
    b L_0201553c
L_020154c0:
    bl func_02028814
    b L_0201553c
L_020154c8: .word data_020d5b34
L_020154cc: .word gHeapContext
L_020154d0: .word gGamePhaseRuntime
L_020154d4: .word 0x37
L_020154d8: .word 0x41
L_020154dc: .word data_020d5b2c
L_020154e0: .word 0x32
L_020154e4: .word 0x33
L_020154e8: .word gGameWork
L_020154ec: .word 0x40a
L_020154f0: .word 0x36
L_020154f4: .word data_ov054_0220f160
L_020154f8: .word 0x49
L_020154fc: .word 0x1642
L_02015500: .word 0x39
L_02015504: .word 0x35
L_02015508:
    ldr r0, L_020154d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    str r6, [sp, #0x0]
    mov r1, r9
    mov r2, r8
    mov r3, r7
    str r5, [sp, #0x4]
    bl func_0202906c
    b L_0201553c
L_02015538:
    bl OS_Halt
L_0201553c:
    mov r0, #0x1
    add sp, sp, #0xc0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size GamePhaseActorScriptVm_DispatchEffectCommand, . - GamePhaseActorScriptVm_DispatchEffectCommand

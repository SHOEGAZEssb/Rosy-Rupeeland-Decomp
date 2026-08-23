.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern Heap_Alloc
.extern SceneManager_GetCurrent
.extern Sound_Play
.extern data_021052fc
.extern data_ov092_0221c820
.extern OverlayManager_LoadOverlay
.extern OverlayManager_GetGlobal
.extern func_0201e0ec
.extern ActorDerivedType1_GetActiveRecordId
.extern func_0204d308
.extern Sound_StopEffect
.extern Sound_SetEffectParameters
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_ov060_0220fd54
.extern func_ov092_02217930
.extern func_ov092_02218380
.extern func_ov092_02218394
.extern func_ov092_022183b8
.extern func_ov092_02218584
.extern func_ov092_022185a4
.extern func_ov092_022185c4
.extern func_ov092_0221893c
.extern func_ov092_02219238
.extern func_ov092_022192b0
.extern func_ov092_022192c8
.extern func_ov092_022196d0
.extern func_ov092_02219e8c
.extern func_ov092_02219fec
.extern func_ov092_0221a6d4
.extern gGameWork
.extern gHeapContext
.extern gSceneManager
.extern gSoundContext

.global func_ov092_02217ddc
func_ov092_02217ddc:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    bl func_0204d308
    ldr r1, .L_0221835c
    ldr r0, .L_02218360
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    add r1, r1, #0x2000
    ldr r4, [r1, #0xea4]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x2
    beq .L_02218354
    ldr r0, .L_02218364
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl func_ov092_02218380
    cmp r0, #0x0
    beq .L_02218354
    ldr r0, .L_02218360
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, .L_0221835c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    add r0, r5, #0x200
    ldr r2, .L_02218364
    mov r1, #0x0
    ldrsh r3, [r0, #0x84]
    ldr r0, [r2, #0x0]
    mov r2, r1
    bl func_ov092_02218394
    mov r0, r4
    bl ActorDerivedType1_GetActiveRecordId
    cmp r0, #0x68
    bne .L_02217e94
    mov r0, #0x0
    str r0, [r4, #0xa0]
    str r0, [r4, #0x90]
    str r0, [r4, #0x40]
    mov r0, #0x214000
    str r0, [r4, #0x20]
.L_02217e94:
    ldrb r0, [r5, #0x1ec]
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_02218344
.L_02217ea4:
    b .L_02217ec8
    b .L_02217f94
    b .L_02218038
    b .L_02218344
    b .L_02218344
    b .L_0221816c
    b .L_02218254
    b .L_02218274
    b .L_0221833c
.L_02217ec8:
    mov r0, r5
    bl func_ov092_02219e8c
    bl OverlayManager_GetGlobal
    ldr r2, .L_02218368
    mov r1, #0x2
    bl OverlayManager_LoadOverlay
    ldr r1, .L_0221836c
    mov r0, #0x58
    mov r2, #0x4
    ldr r3, .L_02218370
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02217f08
    mov r1, r5
    mov r2, #0x0
    bl func_ov060_0220fd54
.L_02217f08:
    mov r0, #0x1
    strb r0, [r5, #0x1ec]
    add r0, r5, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xee]
    ldr r0, [r5, #0x250]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, .L_02218364
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    mov r3, #0x1
    bl func_ov092_02218394
    ldr r0, .L_02218364
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    mov r3, #0x78
    bl func_ov092_02218394
    add r0, r4, #0x38
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov092_02217930
    add r0, r4, #0x88
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov092_02217930
    add r0, r4, #0x98
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov092_02217930
    b .L_02218344
.L_02217f94:
    ldr r2, [r5, #0x250]
    add r0, r5, #0x100
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldrh r0, [r0, #0xee]
    cmp r0, #0x96
    blo .L_02218344
    ldr r0, .L_02218374
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl Sound_Play
    add r0, r5, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xee]
    add r0, r5, #0x200
    mov r1, #0x3c
    strh r1, [r0, #0x7a]
    mov r0, #0x4
    strb r0, [r5, #0x278]
    mov r0, #0x2
    strb r0, [r5, #0x1ec]
    ldr r1, [r4, #0x230]
    ldr r0, .L_02218364
    orr r1, r1, #0x4
    str r1, [r4, #0x230]
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    bl GameWork_SetFlag
    ldr r4, [r5, #0x250]
    ldr r0, .L_02218364
    ldrh r3, [r4, #0x24]
    mov r1, #0x0
    mov r2, #0x1
    orr r3, r3, #0x4
    strh r3, [r4, #0x24]
    ldr r0, [r0, #0x0]
    mov r3, #0x2
    bl func_ov092_02218394
    b .L_02218344
.L_02218038:
    mov r0, r5
    bl func_ov092_022185c4
    mov r0, r5
    bl func_ov092_02218584
    mov r0, r5
    bl func_ov092_0221893c
    mov r0, r5
    bl func_ov092_02219238
    mov r0, r5
    bl func_ov092_022192c8
    add r1, r5, #0x200
    ldrsh r0, [r1, #0x86]
    cmp r0, #0x3
    blt .L_02218124
    cmp r0, #0x6
    bge .L_02218124
    ldrsh r2, [r1, #0x84]
    ldr r0, .L_02218378
    add r2, r2, #0x1
    strh r2, [r1, #0x84]
    ldrsh r1, [r1, #0x84]
    cmp r1, r0
    blt .L_02218124
    ldr r1, [r4, #0x230]
    ldr r0, .L_02218364
    bic r1, r1, #0x4
    str r1, [r4, #0x230]
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    bl GameWork_ClearFlag
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_ov092_02217930
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov092_02217930
    add r0, r4, #0x98
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov092_02217930
    ldr r0, .L_02218374
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl Sound_StopEffect
    mov r0, #0x6
    strb r0, [r5, #0x1ec]
    ldr r0, .L_02218364
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    mov r3, #0x78
    bl func_ov092_02218394
    b .L_02218344
.L_02218124:
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x84]
    ldr r0, .L_0221837c
    mov r2, #0x4
    cmp r1, r0
    rsbge r0, r0, #0x0
    addge r0, r1, r0
    rsbge r1, r0, #0x0
    mov r0, #0x0
    str r0, [sp, #0x0]
    movlt r1, #0x0
    str r1, [sp, #0x4]
    ldr r0, .L_02218374
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r3, #0x7f
    bl Sound_SetEffectParameters
    b .L_02218344
.L_0221816c:
    mov r0, r5
    bl func_ov092_022196d0
    cmp r0, #0x0
    bne .L_0221820c
    ldr r1, [r4, #0x230]
    ldr r0, .L_02218364
    bic r1, r1, #0x4
    str r1, [r4, #0x230]
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    bl GameWork_ClearFlag
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_ov092_02217930
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov092_02217930
    add r0, r4, #0x98
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov092_02217930
    ldr r0, .L_02218374
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl Sound_StopEffect
    mov r0, #0x6
    strb r0, [r5, #0x1ec]
    ldr r0, .L_02218364
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    mov r3, #0x78
    bl func_ov092_02218394
    b .L_02218344
.L_0221820c:
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x84]
    ldr r0, .L_0221837c
    mov r2, #0x4
    cmp r1, r0
    rsbge r0, r0, #0x0
    addge r0, r1, r0
    rsbge r1, r0, #0x0
    mov r0, #0x0
    str r0, [sp, #0x0]
    movlt r1, #0x0
    str r1, [sp, #0x4]
    ldr r0, .L_02218374
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r3, #0x7f
    bl Sound_SetEffectParameters
    b .L_02218344
.L_02218254:
    ldr r0, [r5, #0x250]
    mov r1, #0x1
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r5, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xee]
    mov r0, #0x7
    strb r0, [r5, #0x1ec]
.L_02218274:
    add r0, r5, #0x100
    ldrh r1, [r0, #0xee]
    cmp r1, #0x78
    ldrlo r1, [r5, #0x250]
    ldrloh r0, [r1, #0x24]
    biclo r0, r0, #0x4
    strloh r0, [r1, #0x24]
    blo .L_022182ac
    ldr r3, [r5, #0x250]
    mov r1, #0x78
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x4
    strh r2, [r3, #0x24]
    strh r1, [r0, #0xee]
.L_022182ac:
    mov r0, r5
    bl func_ov092_022185c4
    mov r0, r5
    bl func_ov092_022185a4
    mov r0, r5
    bl func_ov092_0221893c
    mov r0, r5
    bl func_ov092_02219238
    mov r0, r5
    bl func_ov092_022192b0
    mov r0, r5
    bl func_ov092_022192c8
    add r0, r5, #0x100
    ldrh r0, [r0, #0xee]
    cmp r0, #0x78
    blo .L_02218344
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x86]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02218344
    mov r0, r5
    bl func_ov092_0221a6d4
    cmp r0, #0x0
    beq .L_02218344
    mov r0, r5
    bl func_ov092_022183b8
    cmp r0, #0x0
    beq .L_02218344
    mov r1, #0x8
    mov r0, r5
    strb r1, [r5, #0x1ec]
    bl func_ov092_02219fec
    b .L_02218344
.L_0221833c:
    mov r0, #0x0
    strb r0, [r5, #0x1ec]
.L_02218344:
    add r0, r5, #0x100
    ldrh r1, [r0, #0xee]
    add r1, r1, #0x1
    strh r1, [r0, #0xee]
.L_02218354:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_0221835c: .word data_021052fc
.L_02218360: .word gSceneManager
.L_02218364: .word gGameWork
.L_02218368: .word 0x3f
.L_0221836c: .word data_ov092_0221c820
.L_02218370: .word gHeapContext
.L_02218374: .word gSoundContext
.L_02218378: .word 0x1553
.L_0221837c: .word 0x12fb
.size func_ov092_02217ddc, . - func_ov092_02217ddc

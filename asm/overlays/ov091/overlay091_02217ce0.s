.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern Heap_Alloc
.extern SceneManager_GetCurrent
.extern Sound_Play
.extern data_021052fc
.extern data_ov091_02218dc8
.extern OverlayManager_LoadOverlay
.extern OverlayManager_GetGlobal
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern VecFx32Triple_Destroy
.extern VecFx32Bezier_Evaluate3D
.extern ActorMotion_BindActor
.extern ActorMotion_SetTarget
.extern ActorMotionJitter_EnsureMinimum
.extern ActorMotionAreaFollower_BindActor
.extern GamePhaseCurrencyHud_GetCurrency
.extern func_0201e0ec
.extern Actor_SetActive
.extern func_0204d308
.extern func_02059278
.extern func_0205929c
.extern func_02072b68
.extern func_020a27a0
.extern func_020a2844
.extern func_020adcac
.extern func_020befec
.extern func_ov060_0220fd54
.extern func_ov076_02213740
.extern func_ov076_02213780
.extern func_ov076_02214034
.extern func_ov091_02218838
.extern func_ov091_02218848
.extern func_ov091_0221888c
.extern func_ov091_022188f8
.extern gGameWork
.extern gHeapContext
.extern gLupyContext
.extern gSceneManager
.extern gSoundContext

.global func_ov091_02217ce0
func_ov091_02217ce0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x104
    ldr r1, .L_02218814
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x2
    ldrne r0, .L_02218818
    ldrne r0, [r0, #0x0]
    ldrne r0, [r0, #0x3cc]
    cmpne r0, #0x0
    beq .L_0221880c
    ldr r0, .L_0221881c
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_BindActor
    ldr r0, .L_0221881c
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x44
    add r0, r0, #0x3000
    bl ActorMotion_BindActor
    mov r0, r4
    bl func_0204d308
    ldr r1, .L_0221881c
    ldr r0, .L_02218814
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    add r1, r1, #0x2000
    ldr r7, [r1, #0xea4]
    bl SceneManager_GetCurrent
    ldr r1, .L_0221881c
    mov r5, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    ldrb r1, [r4, #0x1ec]
    mov r6, r0
    cmp r1, #0xe
    addls pc, pc, r1, lsl #0x2
    b .L_0221875c
.L_02217d94:
    b .L_02217dd0
    b .L_02217eb8
    b .L_02217f00
    b .L_02217ff0
    b .L_02217ff8
    b .L_02218238
    b .L_0221841c
    b .L_022185e4
    b .L_0221860c
    b .L_02218668
    b .L_02218668
    b .L_022186e4
    b .L_0221875c
    b .L_02218730
    b .L_0221875c
.L_02217dd0:
    bl OverlayManager_GetGlobal
    ldr r2, .L_02218820
    mov r1, #0x2
    bl OverlayManager_LoadOverlay
    ldr r1, .L_02218824
    ldr r3, .L_02218828
    mov r0, #0x58
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02217e08
    mov r1, r4
    mov r2, #0x0
    bl func_ov060_0220fd54
.L_02217e08:
    add r0, r4, #0x18
    add r1, r7, #0x18
    bl func_020050a4
    add r0, r4, #0x210
    add r1, r4, #0x18
    bl func_020050a4
    ldr r1, [r7, #0x230]
    ldr r0, .L_0221881c
    orr r1, r1, #0x20
    str r1, [r7, #0x230]
    ldr r2, [r7, #0xd0]
    mov r1, #0x1
    orr r2, r2, #0x40000
    str r2, [r7, #0xd0]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    bl Actor_SetActive
    ldr r0, .L_0221881c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_02217e70
    mov r1, #0x1
    bl Actor_SetActive
.L_02217e70:
    ldr r0, [r4, #0x1f4]
    mov r1, #0x1
    bl Actor_SetActive
    ldr r0, [r4, #0x1f0]
    mov r1, #0x1
    bl Actor_SetActive
    mov r6, #0x0
    mov r5, #0x1
.L_02217e90:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x1f8]
    mov r1, r5
    bl Actor_SetActive
    add r6, r6, #0x1
    cmp r6, #0x6
    blt .L_02217e90
    mov r0, #0x1
    strb r0, [r4, #0x1ec]
    b .L_0221875c
.L_02217eb8:
    ldr r0, .L_0221882c
    mov r1, #0x57
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    add r0, r4, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xee]
    mov r0, #0x2
    strb r0, [r4, #0x1ec]
    ldr r1, [r7, #0x230]
    ldr r0, .L_02218818
    orr r1, r1, #0x4
    str r1, [r7, #0x230]
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    bl GameWork_SetFlag
    b .L_0221875c
.L_02217f00:
    ldr r0, [r4, #0x220]
    add r1, r7, #0x18
    add r0, r0, #0x29
    str r0, [r4, #0x220]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r4, #0x220]
    add r0, r4, #0x210
    bl func_020050a4
    ldr r0, .L_02218830
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    cmp r0, #0x0
    bne .L_02217f68
    ldr r1, [r7, #0x230]
    ldr r0, .L_02218818
    bic r1, r1, #0x4
    str r1, [r7, #0x230]
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    bl GameWork_ClearFlag
    mov r0, #0x0
    str r0, [r4, #0x220]
    mov r0, #0xd
    strb r0, [r4, #0x1ec]
    b .L_0221875c
.L_02217f68:
    ldr r0, [r4, #0x1f4]
    ldrsh r0, [r0, #0xda]
    cmp r0, #0x0
    ble .L_0221875c
    mov r0, #0x0
    str r0, [r4, #0x220]
    ldr r1, [r7, #0x230]
    ldr r0, .L_02218818
    bic r1, r1, #0x4
    str r1, [r7, #0x230]
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    bl GameWork_ClearFlag
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r7, #0x38
    bl func_ov091_02218838
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r7, #0x88
    bl func_ov091_02218838
    add r0, r7, #0x98
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov091_02218838
    ldrb r1, [r5, #0x54]
    mov r0, #0x3
    orr r1, r1, #0x2
    strb r1, [r5, #0x54]
    strb r0, [r4, #0x1ec]
    b .L_0221875c
.L_02217ff0:
    mov r0, #0x4
    strb r0, [r4, #0x1ec]
.L_02217ff8:
    ldr r1, [r4, #0x220]
    ldr r0, .L_02218834
    add r1, r1, #0x52
    str r1, [r4, #0x220]
    cmp r1, r0
    strgt r0, [r4, #0x220]
    ldr r1, [r4, #0x1f0]
    add r0, r4, #0x210
    add r1, r1, #0x18
    bl func_020050a4
    mov r1, #0x0
    ldr r6, [r4, #0x1f4]
    mov r2, r1
    mov r3, r1
    add r0, r7, #0x38
    ldrsh r6, [r6, #0xda]
    bl func_ov091_02218838
    mov r1, #0x0
    mov r2, r1
    add r0, r7, #0x88
    mov r3, r1
    bl func_ov091_02218838
    mov r1, #0x0
    add r0, r7, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov091_02218838
    ldr r0, .L_02218830
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    cmp r0, #0x0
    bne .L_022180a8
    ldr r1, [r7, #0x230]
    ldr r0, .L_02218818
    bic r1, r1, #0x4
    str r1, [r7, #0x230]
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    bl GameWork_ClearFlag
    mov r0, #0x0
    str r0, [r4, #0x220]
    mov r0, #0xd
    strb r0, [r4, #0x1ec]
    b .L_0221875c
.L_022180a8:
    cmp r6, #0x0
    bne .L_022180fc
    ldrb r2, [r5, #0x54]
    mov r1, #0x2
    ldr r0, .L_02218818
    bic r2, r2, #0x2
    strb r2, [r5, #0x54]
    strb r1, [r4, #0x1ec]
    ldr r2, [r7, #0x230]
    mov r1, #0x3ec
    orr r2, r2, #0x4
    str r2, [r7, #0x230]
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, #0x0
    str r0, [r4, #0x220]
    ldr r1, [r4, #0x238]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    b .L_0221875c
.L_022180fc:
    cmp r6, #0x5
    blt .L_02218208
    ldrb r2, [r5, #0x54]
    ldr r0, .L_02218818
    mov r1, #0x3ec
    bic r2, r2, #0x2
    strb r2, [r5, #0x54]
    ldr r2, [r7, #0x230]
    bic r2, r2, #0x4
    str r2, [r7, #0x230]
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r7, #0x38
    bl func_ov091_02218838
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r7, #0x88
    bl func_ov091_02218838
    add r0, r7, #0x98
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov091_02218838
    mov r0, #0x5
    strb r0, [r4, #0x1ec]
    ldr r0, [r4, #0x1f0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1d8]
    blx r1
    mov r2, #0x1
    ldr r0, [r4, #0x1f0]
    mov r1, #0x0
    strb r2, [r0, #0x2d2]
    add r0, r4, #0x100
    strh r1, [r0, #0xee]
    add r0, r4, #0x224
    ldr r1, [r4, #0x1f0]
    add r1, r1, #0x18
    bl func_020050a4
    ldr r0, .L_0221882c
    mov r1, #0x57
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205929c
    ldr r0, .L_0221882c
    mov r1, #0x1c4
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    ldr r0, .L_0221882c
    mov r1, #0x1c4
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
    sub r0, r6, #0x1
    and r1, r0, #0xff
    ldr r0, [r4, #0x238]
    bl func_02072b68
    mov r1, #0x2
    ldr r0, .L_02218818
    ldr r0, [r0, #0x0]
    str r1, [r0, #0x3cc]
    b .L_0221875c
.L_02218208:
    ldr r0, [r4, #0x238]
    sub r2, r6, #0x1
    ldrb r1, [r0, #0x38]
    cmp r2, r1
    beq .L_02218224
    and r1, r2, #0xff
    bl func_02072b68
.L_02218224:
    ldr r1, [r4, #0x238]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    b .L_0221875c
.L_02218238:
    ldr r1, [r4, #0x1f4]
    ldr r0, [r4, #0x238]
    ldrsh r2, [r1, #0xda]
    ldrb r1, [r0, #0x38]
    sub r2, r2, #0x1
    cmp r2, r1
    beq .L_0221825c
    and r1, r2, #0xff
    bl func_02072b68
.L_0221825c:
    ldr r1, [r4, #0x228]
    ldr r2, [r4, #0x22c]
    add r0, sp, #0xf4
    mov r3, #0x4a000
    bl func_0200500c
    ldr r1, [r4, #0x228]
    ldr r2, [r4, #0x22c]
    add r0, sp, #0xe4
    mov r3, #0x78000
    bl func_0200500c
    add r0, sp, #0xb4
    add r2, sp, #0xf4
    add r3, sp, #0xe4
    add r1, r4, #0x224
    bl func_ov091_02218848
    add r0, r4, #0x100
    ldrh r0, [r0, #0xee]
    ldr r5, [r4, #0x1f0]
    mov r1, #0x28
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0x44
    add r1, sp, #0xb4
    bl VecFx32Bezier_Evaluate3D
    add r0, r5, #0x18
    add r1, sp, #0x44
    bl func_020050a4
    add r0, sp, #0x44
    bl func_02005058
    ldr r1, [r5, #0x1c]
    ldr r0, [r4, #0x1f0]
    str r1, [r0, #0x2ac]
    ldr r1, [r5, #0x20]
    ldr r0, [r4, #0x1f0]
    str r1, [r0, #0x2b0]
    ldr r1, [r4, #0x1f0]
    ldr r2, [r5, #0x24]
    ldr r0, [r1, #0x2b4]
    cmp r0, r2
    strlt r2, [r1, #0x2b4]
    add r0, r4, #0x100
    ldrh r0, [r0, #0xee]
    mov r1, #0x3
    bl func_020befec
    cmp r1, #0x0
    bne .L_0221833c
    ldr r0, [r5, #0x24]
    ldr r2, [r5, #0x1c]
    ldr r3, [r5, #0x20]
    mov r1, r0, asr #0xc
    mov r0, r6
    mov r2, r2, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r1, #0x1
    bl func_020a27a0
.L_0221833c:
    ldr r0, [r4, #0x220]
    add r1, r5, #0x18
    add r0, r0, #0x52
    str r0, [r4, #0x220]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r4, #0x220]
    add r0, r4, #0x210
    bl func_020050a4
    add r0, r4, #0x100
    ldrh r1, [r0, #0xee]
    cmp r1, #0x28
    blo .L_02218400
    mov r1, #0x0
    strh r1, [r0, #0xee]
    mov r2, #0x6
    add r0, r4, #0x224
    add r1, r5, #0x18
    strb r2, [r4, #0x1ec]
    bl func_020050a4
    mov r0, #0xa
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x230]
    ldr r2, [r4, #0x228]
    ldr r1, [r4, #0x22c]
    mov r0, r0, asr #0xc
    rsb r1, r0, r1, asr #0xc
    mov r0, r6
    mov r2, r2, asr #0xc
    add r3, r1, #0x14
    mov r1, #0x0
    bl func_020a2844
    ldr r0, [r4, #0x1f0]
    mov r1, #0x14
    bl func_ov076_02214034
    ldr r0, [r4, #0x1f4]
    bl func_ov076_02213740
    ldr r1, [r4, #0x1f0]
    ldr r0, [r1, #0x14]
    orr r0, r0, #0x2
    str r0, [r1, #0x14]
    ldr r1, [r4, #0x1f0]
    ldr r0, [r1, #0x14]
    orr r0, r0, #0x4
    str r0, [r1, #0x14]
    ldr r1, [r4, #0x238]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
.L_02218400:
    add r0, sp, #0xb4
    bl VecFx32Triple_Destroy
    add r0, sp, #0xe4
    bl func_02005058
    add r0, sp, #0xf4
    bl func_02005058
    b .L_0221875c
.L_0221841c:
    add r0, sp, #0xa4
    mov r1, #0xc8000
    mov r2, #0x54000
    mov r3, #0x20000
    bl func_0200500c
    add r0, sp, #0x94
    mov r1, #0xc8000
    mov r2, #0x78000
    mov r3, #0xaa000
    bl func_0200500c
    add r0, sp, #0x64
    add r2, sp, #0xa4
    add r3, sp, #0x94
    add r1, r4, #0x224
    bl func_ov091_02218848
    add r0, r4, #0x100
    ldrh r0, [r0, #0xee]
    ldr r5, [r4, #0x1f0]
    mov r1, #0x96
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0x34
    add r1, sp, #0x64
    bl VecFx32Bezier_Evaluate3D
    add r0, r5, #0x18
    add r1, sp, #0x34
    bl func_020050a4
    add r0, sp, #0x34
    bl func_02005058
    ldr r2, [r5, #0x1c]
    ldr r1, [r4, #0x1f0]
    add r0, r4, #0x100
    str r2, [r1, #0x2ac]
    ldr r3, [r5, #0x20]
    ldr r2, [r4, #0x1f0]
    mov r1, #0x3
    str r3, [r2, #0x2b0]
    ldr r3, [r5, #0x24]
    ldr r2, [r4, #0x1f0]
    add r3, r3, #0x20000
    str r3, [r2, #0x2b4]
    ldrh r0, [r0, #0xee]
    bl func_020befec
    cmp r1, #0x0
    bne .L_022184f8
    ldr r0, [r5, #0x24]
    ldr r2, [r5, #0x1c]
    ldr r3, [r5, #0x20]
    mov r1, r0, asr #0xc
    mov r0, r6
    mov r2, r2, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r1, #0x1
    bl func_020a27a0
.L_022184f8:
    ldr r0, [r4, #0x220]
    add r1, r5, #0x18
    add r0, r0, #0x52
    str r0, [r4, #0x220]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r4, #0x220]
    add r0, r4, #0x210
    bl func_020050a4
    add r0, r4, #0x100
    ldrh r1, [r0, #0xee]
    cmp r1, #0x96
    blo .L_022185c8
    mov r1, #0x0
    strh r1, [r0, #0xee]
    mov r0, #0x7
    strb r0, [r4, #0x1ec]
    ldr r5, [r4, #0x1f0]
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x38
    bl func_ov091_02218838
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x88
    bl func_ov091_02218838
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x98
    bl func_ov091_02218838
    ldr r0, [r4, #0x1f0]
    mov r1, #0x2800
    str r1, [r0, #0x44]
    ldr r0, [r4, #0x1f0]
    mov r1, #0x2
    strb r1, [r0, #0x2d2]
    ldr r0, .L_0221882c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x28
    bl Sound_Play
    ldr r0, .L_0221881c
    mov r1, #0x14
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionJitter_EnsureMinimum
    mov r0, #0x0
    str r0, [r4, #0x220]
.L_022185c8:
    add r0, sp, #0x64
    bl VecFx32Triple_Destroy
    add r0, sp, #0x94
    bl func_02005058
    add r0, sp, #0xa4
    bl func_02005058
    b .L_0221875c
.L_022185e4:
    add r0, r4, #0x100
    ldrh r1, [r0, #0xee]
    cmp r1, #0x78
    blo .L_0221875c
    mov r1, #0x0
    strh r1, [r0, #0xee]
    mov r0, #0x8
    strb r0, [r4, #0x1ec]
    str r1, [r4, #0x220]
    b .L_0221875c
.L_0221860c:
    ldr r0, [r4, #0x220]
    ldr r1, [r4, #0x1f4]
    add r0, r0, #0x4
    str r0, [r4, #0x220]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r4, #0x220]
    add r0, r4, #0x210
    add r1, r1, #0x18
    bl func_020050a4
    add r0, r4, #0x100
    ldrh r1, [r0, #0xee]
    cmp r1, #0x78
    blo .L_0221875c
    ldr r1, [r4, #0x1f4]
    mov r3, #0x100
    ldr r2, [r1, #0x54]
    mov r1, #0x0
    strh r3, [r2, #0x36]
    strh r1, [r0, #0xee]
    mov r0, #0x9
    strb r0, [r4, #0x1ec]
    b .L_0221875c
.L_02218668:
    ldr r0, [r4, #0x220]
    ldr r1, [r4, #0x1f4]
    add r0, r0, #0x4
    str r0, [r4, #0x220]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r4, #0x220]
    add r0, r4, #0x210
    add r1, r1, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x1f4]
    ldr r1, [r0, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_0221875c
    ldrb r1, [r4, #0x1ec]
    cmp r1, #0x9
    movne r0, #0xb
    strneb r0, [r4, #0x1ec]
    movne r0, #0x0
    strne r0, [r4, #0x220]
    bne .L_022186d4
    bl func_ov076_02213780
    mov r0, #0xa
    strb r0, [r4, #0x1ec]
.L_022186d4:
    add r0, r4, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xee]
    b .L_0221875c
.L_022186e4:
    add r0, r4, #0x210
    add r1, r7, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x220]
    add r0, r0, #0x10
    str r0, [r4, #0x220]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r4, #0x220]
    adds r1, r4, #0x18
    add r0, r7, #0x18
    addne r1, r1, #0x4
    cmp r0, #0x0
    addne r0, r0, #0x4
    bl func_020adcac
    cmp r0, #0x1000
    movlt r0, #0xc
    strltb r0, [r4, #0x1ec]
    b .L_0221875c
.L_02218730:
    add r0, r4, #0x210
    add r1, r7, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x220]
    add r0, r0, #0x7b
    str r0, [r4, #0x220]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r4, #0x220]
    movgt r0, #0xe
    strgtb r0, [r4, #0x1ec]
.L_0221875c:
    add r2, r4, #0x100
    ldrh r3, [r2, #0xee]
    add r0, sp, #0x24
    add r1, r4, #0x18
    add r3, r3, #0x1
    strh r3, [r2, #0xee]
    ldr r2, [r4, #0x220]
    rsb r2, r2, #0x1000
    bl func_ov091_0221888c
    ldr r2, [r4, #0x220]
    add r0, sp, #0x14
    add r1, r4, #0x210
    bl func_ov091_0221888c
    add r0, sp, #0x4
    add r1, sp, #0x24
    add r2, sp, #0x14
    bl func_ov091_022188f8
    add r1, sp, #0x4
    add r0, r4, #0x18
    bl func_020050a4
    add r0, sp, #0x4
    bl func_02005058
    add r0, sp, #0x14
    bl func_02005058
    add r0, sp, #0x24
    bl func_02005058
    ldr r1, [r4, #0x24]
    add r0, sp, #0x54
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    rsb r1, r1, #0x0
    sub r2, r1, #0x74000
    mov r1, #0x80000
    rsb r1, r1, #0x0
    mov r3, #0x0
    bl func_0200500c
    ldr r0, .L_0221881c
    add r1, sp, #0x54
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotion_SetTarget
    add r0, sp, #0x54
    bl func_02005058
.L_0221880c:
    add sp, sp, #0x104
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02218814: .word gSceneManager
.L_02218818: .word gGameWork
.L_0221881c: .word data_021052fc
.L_02218820: .word 0x3f
.L_02218824: .word data_ov091_02218dc8
.L_02218828: .word gHeapContext
.L_0221882c: .word gSoundContext
.L_02218830: .word gLupyContext
.L_02218834: .word 0xccd
.size func_ov091_02217ce0, . - func_ov091_02217ce0

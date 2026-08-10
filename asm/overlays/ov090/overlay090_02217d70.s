.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern GX_HBlankIntr
.extern GX_VBlankIntr
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern SceneManager_GetCurrent
.extern Scene_ClearFlag02
.extern Sound_Play
.extern data_020c9670
.extern data_020f4dc8
.extern data_020f4e14
.extern data_021052fc
.extern data_ov090_0221cc08
.extern data_ov090_0221cc10
.extern OverlayManager_LoadOverlay
.extern OverlayManager_GetGlobal
.extern DisplayBrightness_StartTransition
.extern DisplayBrightnessPair_GetScreen
.extern DisplayBrightness_IsMainTransitionComplete
.extern func_02004fe0
.extern func_0200500c
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern func_020050c8
.extern func_0200637c
.extern func_020064b8
.extern func_02007f0c
.extern func_020091c0
.extern func_02009780
.extern func_020099c0
.extern func_0200a114
.extern func_0201e0ec
.extern func_0201f864
.extern func_020349b8
.extern Actor_SetDirectionFromVector
.extern ActorDerivedType1_StartRecord
.extern ActorDerivedType1_TeardownActiveRecord
.extern Type7Actor_SetMotionTargetWithTimer
.extern Type7Actor_SetFlag40StateEnabled
.extern func_0204d308
.extern func_02058d40
.extern func_02059278
.extern func_020593ac
.extern func_0205940c
.extern func_02059484
.extern func_0205958c
.extern func_02072b68
.extern func_0207593c
.extern func_0209a748
.extern func_020a2844
.extern func_020a28e0
.extern func_020a29ac
.extern func_020a63d0
.extern func_020a6404
.extern func_020a6548
.extern func_020a68fc
.extern func_020befec
.extern func_020bf1f8
.extern func_ov060_0220fd54
.extern func_ov063_02210314
.extern func_ov077_02215444
.extern func_ov090_0221a3cc
.extern func_ov090_0221a3dc
.extern func_ov090_0221a420
.extern func_ov090_0221a460
.extern func_ov090_0221a498
.extern func_ov090_0221a8bc
.extern func_ov090_0221aab8
.extern func_ov090_0221ab4c
.extern func_ov090_0221ad64
.extern func_ov090_0221ae1c
.extern func_ov090_0221b280
.extern func_ov090_0221b428
.extern func_ov090_0221b7f8
.extern gDebugFont
.extern gGameWork
.extern gHeapContext
.extern gSceneManager
.extern gSoundContext
.extern genrand_int32

.global func_ov090_02217d70
func_ov090_02217d70:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x358
    ldr r1, .L_02218cf0
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, r4
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_0200a114
    ldr r0, .L_02218cf0
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x44
    add r0, r0, #0x3000
    bl func_020091c0
    mov r0, r4
    bl func_0204d308
    ldr r1, .L_02218cf0
    ldr r0, .L_02218cf4
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    add r1, r1, #0x2000
    ldr r9, [r1, #0xea4]
    ldr r6, [r1, #0xea8]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x2
    beq .L_0221a3a4
    ldr r0, .L_02218cf4
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldrb r1, [r4, #0x1ec]
    mov r5, r0
    cmp r1, #0x21
    addls pc, pc, r1, lsl #0x2
    b .L_0221a284
.L_02217e00:
    b .L_02217e88
    b .L_02217f70
    b .L_02218078
    b .L_02218268
    b .L_022182e0
    b .L_02218350
    b .L_0221848c
    b .L_022185c0
    b .L_02218644
    b .L_022186b4
    b .L_0221870c
    b .L_02218890
    b .L_0221892c
    b .L_02218ae8
    b .L_02218c74
    b .L_02218d44
    b .L_02218fc8
    b .L_02218fc8
    b .L_02219300
    b .L_02219440
    b .L_02219640
    b .L_02219640
    b .L_02219878
    b .L_022198c4
    b .L_022199d4
    b .L_02219aa4
    b .L_0221a284
    b .L_02219adc
    b .L_02219c58
    b .L_02219e68
    b .L_02219fa0
    b .L_0221a250
    b .L_0221a284
    b .L_0221a284
.L_02217e88:
    bl OverlayManager_GetGlobal
    ldr r2, .L_02218cf8
    mov r1, #0x2
    bl OverlayManager_LoadOverlay
    ldr r1, .L_02218cfc
    ldr r3, .L_02218d00
    mov r0, #0x58
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02217ec0
    mov r1, r4
    mov r2, #0x1
    bl func_ov060_0220fd54
.L_02217ec0:
    add r0, r4, #0x18
    mov r1, #0x200000
    mov r2, #0x208000
    mov r3, #0x60000
    bl func_ov090_0221a3cc
    add r0, r4, #0x20c
    add r1, r4, #0x18
    bl func_020050a4
    mov r0, r9
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
    add r0, r9, #0x18
    add r1, r4, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x200]
    mov r1, #0x1
    bl func_02072b68
    ldr r1, [r4, #0x200]
    mov r0, #0x100
    strh r0, [r1, #0x32]
    strh r0, [r1, #0x34]
    cmp r6, #0x0
    beq .L_02217f64
    ldr r0, [r6, #0x10]
    mov r1, #0x220000
    orr r5, r0, #0x100
    add r0, sp, #0x348
    add r2, r1, #0x6a000
    mov r3, #0x0
    str r5, [r6, #0x10]
    bl func_0200500c
    add r1, sp, #0x348
    add r0, r6, #0x18
    bl func_020050a4
    mov r0, r6
    mov r1, #0x1
    bl Type7Actor_SetFlag40StateEnabled
    add r0, sp, #0x348
    bl func_02005058
.L_02217f64:
    mov r0, #0x1
    strb r0, [r4, #0x1ec]
    b .L_0221a284
.L_02217f70:
    mov r0, #0x0
    bl GX_VBlankIntr
    mov r0, #0x0
    bl GX_HBlankIntr
    ldr r0, [r5, #0x24]
    bl func_020a6404
    mov r0, #0x1
    bl GX_VBlankIntr
    mov r0, #0x1
    bl GX_HBlankIntr
    mov r0, #0x2
    mov r2, #0x0
    strb r0, [r4, #0x1ec]
    mov r0, r2
    mov r3, #0x1
.L_02217fac:
    add r1, r4, r2, lsl #0x2
    ldr r6, [r1, #0x1f4]
    add r2, r2, #0x1
    ldr r5, [r6, #0x14]
    cmp r2, #0x3
    orr r5, r5, #0x80
    str r5, [r6, #0x14]
    ldr r5, [r1, #0x1f4]
    ldr r5, [r5, #0x54]
    strb r0, [r5, #0x3a]
    ldr r5, [r1, #0x1f4]
    ldr r6, [r5, #0x29c]
    ldr r5, [r6, #0x14]
    orr r5, r5, #0x80
    str r5, [r6, #0x14]
    ldr r1, [r1, #0x1f4]
    ldr r1, [r1, #0x29c]
    ldr r1, [r1, #0x54]
    strb r3, [r1, #0x3a]
    blt .L_02217fac
    add r1, r4, #0x100
    strh r0, [r1, #0xf0]
    bl GX_VBlankIntr
    mov r0, #0x0
    bl GX_HBlankIntr
    ldr r0, .L_02218cf0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r1, #0x2
    bl func_0209a748
    mov r0, #0x1
    bl GX_VBlankIntr
    mov r0, #0x1
    bl GX_HBlankIntr
    ldr r0, .L_02218d04
    mov r1, #0x0
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x10
    mov r2, #0x0
    mov r3, #0x40
    bl DisplayBrightness_StartTransition
    ldr r0, .L_02218d04
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x10
    mov r2, #0x0
    mov r3, #0x40
    bl DisplayBrightness_StartTransition
    b .L_0221a284
.L_02218078:
    ldr r6, [r4, #0x200]
    mov r1, #0x200000
    ldrsh r0, [r6, #0x32]
    mov r2, #0x208000
    mov r3, #0x60000
    sub r0, r0, #0x4
    mov r0, r0, lsl #0x10
    mov r5, r0, asr #0x10
    cmp r5, #0x80
    movlt r5, #0x80
    strh r5, [r6, #0x32]
    add r0, sp, #0x338
    strh r5, [r6, #0x34]
    bl func_0200500c
    add r0, sp, #0x328
    mov r1, #0x200000
    mov r2, #0x21c000
    mov r3, #0x0
    bl func_0200500c
    add r0, sp, #0x318
    mov r1, #0x200000
    mov r2, #0x21c000
    mov r3, #0x3c000
    bl func_0200500c
    add r0, sp, #0x2e8
    add r1, sp, #0x338
    add r2, sp, #0x328
    add r3, sp, #0x318
    bl func_ov090_0221a3dc
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    mov r1, #0x1e
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0xc8
    add r1, sp, #0x2e8
    bl func_020064b8
    add r0, r9, #0x18
    add r1, sp, #0xc8
    bl func_020050a4
    add r0, sp, #0xc8
    bl func_02005058
    add r0, r4, #0x20c
    add r1, r9, #0x18
    bl func_020050a4
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    cmp r0, #0x1e
    blo .L_02218244
    ldr r1, .L_02218d08
    mov r2, #0x3
    mov r0, r4
    strb r2, [r4, #0x1ec]
    sub r2, r1, #0x9c
    add r3, r1, #0x1
    bl func_ov090_0221ad64
    ldr r2, [r4, #0x200]
    mov r1, #0x0
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x200]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x200]
    bl func_02072b68
    ldr r2, [r4, #0x200]
    mov r0, #0x100
    strh r0, [r2, #0x32]
    ldr r1, .L_02218d0c
    ldr r3, .L_02218d00
    strh r0, [r2, #0x34]
    add r0, r4, #0x100
    mov r2, #0x0
    strh r2, [r0, #0xf0]
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02218204
    ldr r3, .L_02218d10
    mov r1, #0x4
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    mov r2, #0x0
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r1, r1, #0x5
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r9, #0x54]
    add r1, r9, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
.L_02218204:
    ldr r0, .L_02218cf0
    mov r1, #0x2d
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_020099c0
    mov r1, #0x0
    str r1, [sp, #0x0]
    ldr r0, .L_02218d14
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02218d18
    mov r2, #0xa
    mov r3, #0x40
    bl func_020593ac
.L_02218244:
    add r0, sp, #0x2e8
    bl func_0200637c
    add r0, sp, #0x318
    bl func_02005058
    add r0, sp, #0x328
    bl func_02005058
    add r0, sp, #0x338
    bl func_02005058
    b .L_0221a284
.L_02218268:
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    cmp r0, #0x5a
    bls .L_0221a284
    ldr r2, [r4, #0x200]
    mov r1, #0x1
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x200]
    bl func_02072b68
    mov r0, #0x4
    strb r0, [r4, #0x1ec]
    cmp r6, #0x0
    beq .L_0221a284
    mov r0, r6
    mov r1, #0x0
    bl Type7Actor_SetFlag40StateEnabled
    mov r1, #0x220000
    add r0, sp, #0x2d8
    add r2, r1, #0xb000
    mov r3, #0x0
    bl func_0200500c
    add r1, sp, #0x2d8
    mov r0, r6
    mov r2, #0xf0
    bl Type7Actor_SetMotionTargetWithTimer
    add r0, sp, #0x2d8
    bl func_02005058
    b .L_0221a284
.L_022182e0:
    ldr r0, [r4, #0x200]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_0221a284
    mov r1, #0x1000
    mov r2, #0x5
    mov r0, r4
    strb r2, [r4, #0x1ec]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_ov090_0221ad64
    ldr r2, [r4, #0x200]
    mov r1, #0x8
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x200]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x200]
    bl func_02072b68
    add r0, r4, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xf0]
    b .L_0221a284
.L_02218350:
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    cmp r0, #0x10
    bls .L_02218380
    mov r0, #0x100000
    str r0, [r4, #0x214]
    ldr r1, [r4, #0x21c]
    ldr r0, .L_02218d1c
    add r1, r1, #0x2
    str r1, [r4, #0x21c]
    cmp r1, r0
    strgt r0, [r4, #0x21c]
.L_02218380:
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    cmp r0, #0x8
    bne .L_022183a0
    ldr r0, [r4, #0x200]
    mov r1, #0x9
    bl func_02072b68
    b .L_0221a284
.L_022183a0:
    cmp r0, #0x10
    bne .L_022183b8
    ldr r0, [r4, #0x200]
    mov r1, #0xa
    bl func_02072b68
    b .L_0221a284
.L_022183b8:
    cmp r0, #0x14
    bne .L_022183d0
    ldr r0, [r4, #0x200]
    mov r1, #0xb
    bl func_02072b68
    b .L_0221a284
.L_022183d0:
    cmp r0, #0x18
    bne .L_022183e8
    ldr r0, [r4, #0x200]
    mov r1, #0xc
    bl func_02072b68
    b .L_0221a284
.L_022183e8:
    cmp r0, #0x78
    blo .L_0221a284
    mvn r1, #0x0
    mov r0, r4
    mov r2, r1
    mov r3, r1
    bl func_ov090_0221ad64
    mov r1, #0x6
    mov r0, r9
    strb r1, [r4, #0x1ec]
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x54]
    blx r2
    mov r1, #0x0
    mov r0, r9
    sub r2, r1, #0x1000
    bl Actor_SetDirectionFromVector
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    mov r1, #0x0
    add r0, r4, #0x100
    strh r1, [r0, #0xf0]
    ldr r0, .L_02218cf0
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_020099c0
    ldr r0, .L_02218d14
    ldr r1, .L_02218d18
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl Sound_Play
    ldrb r0, [r5, #0x54]
    orr r0, r0, #0x2
    strb r0, [r5, #0x54]
    b .L_0221a284
.L_0221848c:
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    cmp r0, #0x78
    bne .L_022184f8
    ldr r1, [r5, #0x50]
    ldr r0, .L_02218d20
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    and r0, r1, r0
    orr r0, r0, #0x6
    str r0, [r5, #0x50]
    ldrb r2, [r5, #0x54]
    mov r1, #0x3c
    ldr r0, .L_02218d14
    bic r2, r2, #0x1
    strb r2, [r5, #0x54]
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02218d18
    mov r2, #0xb
    mov r3, #0x30
    bl func_02059484
    cmp r6, #0x0
    beq .L_022184f8
    mov r0, r6
    mov r1, #0x1
    bl Type7Actor_SetFlag40StateEnabled
.L_022184f8:
    add r0, r4, #0x100
    ldrh r5, [r0, #0xf0]
    mov r1, #0x2d
    mov r0, r5
    bl func_020befec
    cmp r1, #0x0
    bne .L_0221a284
    mov r0, r5
    mov r1, #0x2d
    bl func_020befec
    sub r0, r0, #0x1
    cmp r0, #0x3
    blt .L_02218574
    mov r0, #0x7
    strb r0, [r4, #0x1ec]
    add r0, r4, #0x100
    mov r3, #0x0
    strh r3, [r0, #0xf0]
    mov r2, #0x1
.L_02218544:
    add r1, r4, r3, lsl #0x2
    ldr r0, [r1, #0x1f4]
    add r3, r3, #0x1
    ldr r0, [r0, #0x54]
    cmp r3, #0x3
    strb r2, [r0, #0x3a]
    ldr r0, [r1, #0x1f4]
    ldr r0, [r0, #0x29c]
    ldr r0, [r0, #0x54]
    strb r2, [r0, #0x3a]
    blt .L_02218544
    b .L_0221a284
.L_02218574:
    add r5, r4, r0, lsl #0x2
    ldr r0, [r5, #0x1f4]
    mov r3, #0x20
    add r0, r0, #0x200
    ldrh r1, [r0, #0xf2]
    mov r2, #0x0
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    strh r1, [r0, #0xf2]
    ldr r0, [r5, #0x1f4]
    add r1, r0, #0x200
    strh r3, [r1, #0xfe]
    add r0, r0, #0x300
    strh r2, [r0, #0x0]
    ldrh r0, [r1, #0xf2]
    bic r0, r0, #0x30
    orr r0, r0, #0x10
    strh r0, [r1, #0xf2]
    b .L_0221a284
.L_022185c0:
    ldrb r0, [r5, #0x54]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_0221a284
    mov r1, #0x3c
    str r1, [sp, #0x0]
    ldr r0, .L_02218d14
    ldr r1, .L_02218d18
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    mov r3, #0x0
    bl func_02059484
    mov r0, r4
    mov r1, #0x10
    bl func_ov090_0221b7f8
    ldrb r1, [r5, #0x54]
    add r0, r4, #0x100
    mov r6, #0x0
    bic r1, r1, #0x2
    strb r1, [r5, #0x54]
    ldr r2, [r5, #0x50]
    mov r1, #0x8
    bic r2, r2, #0x1
    str r2, [r5, #0x50]
    strh r6, [r0, #0xf0]
    strb r1, [r4, #0x1ec]
.L_02218628:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x1f4]
    bl func_ov077_02215444
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_02218628
    b .L_0221a284
.L_02218644:
    mov r0, #0x0
    bl GX_VBlankIntr
    mov r0, #0x0
    bl GX_HBlankIntr
    ldr r0, [r5, #0x24]
    bl func_020a6548
    ldr r0, .L_02218d24
    ldr r1, .L_02218d28
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    movne r1, #0x31
    ldr r0, [r5, #0x24]
    moveq r1, #0x30
    mov r2, #0x0
    bl func_020a68fc
    mov r0, #0x1
    bl GX_VBlankIntr
    mov r0, #0x1
    bl GX_HBlankIntr
    ldr r0, .L_02218d14
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x6f
    bl Sound_Play
    mov r0, #0x9
    strb r0, [r4, #0x1ec]
    b .L_0221a284
.L_022186b4:
    ldr r0, [r5, #0x24]
    ldr r0, [r0, #0x4a4]
    ldrsh r0, [r0, #0x4]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221a284
    add r0, r4, #0x100
    mov r2, #0x0
    mov r1, #0xa
    strh r2, [r0, #0xf0]
    strb r1, [r4, #0x1ec]
    ldr r0, [r5, #0x24]
    sub r1, r1, #0xb
    bl func_020a63d0
    ldr r0, .L_02218d14
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x3a
    bl Sound_Play
    b .L_0221a284
.L_0221870c:
    ldr r0, .L_02218d14
    ldr r1, .L_02218d18
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl func_0205940c
    add r0, r4, #0x20c
    add r1, r9, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x214]
    cmp r0, #0x21c000
    movlt r0, #0x21c000
    strlt r0, [r4, #0x214]
    ldr r0, [r4, #0x21c]
    add r0, r0, #0x4
    str r0, [r4, #0x21c]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r4, #0x21c]
    add r0, r4, #0x100
    ldrh r1, [r0, #0xf0]
    cmp r1, #0x3c
    bls .L_0221a284
    mov r1, #0x0
    strh r1, [r0, #0xf0]
    mov r0, #0xb
    strb r0, [r4, #0x1ec]
    ldr r1, [r9, #0x230]
    ldr r0, .L_02218d24
    orr r1, r1, #0x4
    str r1, [r9, #0x230]
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    bl GameWork_SetFlag
    mov r0, #0x0
    bl GX_VBlankIntr
    mov r0, #0x0
    bl GX_HBlankIntr
    mov r0, r5
    bl func_ov063_02210314
    mov r0, r5
    bl Scene_ClearFlag02
    mov r0, #0x1
    bl GX_VBlankIntr
    mov r0, #0x1
    bl GX_HBlankIntr
    ldr r2, .L_02218d2c
    mov r1, #0x0
    ldr r3, [r2, #0x0]
    ldr r0, .L_02218d30
    str r1, [r3, #0x38]
    ldr r0, [r0, #0x0]
    mov r2, #0xaa
    bl func_0207593c
    mov r2, #0x0
.L_022187e4:
    add r0, r4, r2, lsl #0x2
    ldr r0, [r0, #0x1f4]
    add r2, r2, #0x1
    add r0, r0, #0x200
    ldrh r1, [r0, #0xf2]
    cmp r2, #0x3
    orr r1, r1, #0x2
    strh r1, [r0, #0xf2]
    blt .L_022187e4
    mov r3, #0x0
    mov r1, #0x1
.L_02218810:
    add r2, r4, r3, lsl #0x2
    ldr r0, [r2, #0x1f4]
    add r3, r3, #0x1
    ldr r0, [r0, #0x54]
    cmp r3, #0x3
    strb r1, [r0, #0x3a]
    ldr r0, [r2, #0x1f4]
    ldr r0, [r0, #0x29c]
    ldr r0, [r0, #0x54]
    strb r1, [r0, #0x3a]
    blt .L_02218810
    ldrb r2, [r4, #0x1ef]
    ldr r0, .L_02218d04
    mov r3, #0x118
    add r2, r4, r2, lsl #0x2
    ldr r2, [r2, #0x1f4]
    add r2, r2, #0x200
    ldrh r5, [r2, #0xf2]
    orr r5, r5, #0x4
    strh r5, [r2, #0xf2]
    strh r3, [r2, #0xc8]
    bl DisplayBrightnessPair_GetScreen
    mvn r1, #0xf
    mov r2, #0x0
    mov r3, #0xa
    bl DisplayBrightness_StartTransition
    cmp r6, #0x0
    beq .L_0221a284
    mov r0, r6
    mov r1, #0x0
    bl Type7Actor_SetFlag40StateEnabled
    b .L_0221a284
.L_02218890:
    mov r0, r4
    mov r1, #0x10
    bl func_ov090_0221b7f8
    add r0, r4, #0x20c
    add r1, r9, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x214]
    cmp r0, #0x21c000
    movlt r0, #0x21c000
    strlt r0, [r4, #0x214]
    ldr r0, [r4, #0x21c]
    add r0, r0, #0x52
    str r0, [r4, #0x21c]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r4, #0x21c]
    ldrb r0, [r4, #0x247]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneb r0, [r4, #0x247]
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x20]
    cmp r0, #0x0
    bgt .L_02218918
    ldr r1, [r9, #0x230]
    ldr r0, .L_02218d24
    bic r1, r1, #0x4
    str r1, [r9, #0x230]
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    bl GameWork_ClearFlag
    mov r0, #0x18
    strb r0, [r4, #0x1ec]
    b .L_0221a284
.L_02218918:
    mov r0, r4
    bl func_ov090_0221b280
    mov r0, r4
    bl func_ov090_0221ab4c
    b .L_0221a284
.L_0221892c:
    mov r1, #0x3c
    strb r1, [r4, #0x247]
    mov r0, r4
    sub r1, r1, #0x4c
    bl func_ov090_0221b7f8
    ldr r1, [r4, #0x21c]
    ldr r0, .L_02218d34
    add r1, r1, #0x14
    str r1, [r4, #0x21c]
    cmp r1, r0
    strgt r0, [r4, #0x21c]
    ldr r0, [r4, #0x200]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02218abc
    ldr r1, .L_02218d0c
    ldr r3, .L_02218d00
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022189e0
    ldr r2, [r4, #0x200]
    mov r6, #0x4
    ldr r1, [r2, #0x18]
    mov r7, #0x9
    ldr r1, [r1, #0x10]
    sub r5, r6, #0x5
    str r1, [sp, #0x0]
    ldr r1, [r2, #0x1c]
    mov r3, #0x1
    ldr r8, [r1, #0x10]
    add r1, r9, #0x18
    str r8, [sp, #0x4]
    str r7, [sp, #0x8]
    str r6, [sp, #0xc]
    str r5, [sp, #0x10]
    str r3, [sp, #0x14]
    ldr r5, [r9, #0x54]
    ldr r3, [r2, #0x14]
    ldr r2, [r5, #0x0]
    ldr r3, [r3, #0x10]
    bl func_0201f864
.L_022189e0:
    ldr r1, .L_02218d38
    mov r0, r4
    sub r2, r1, #0xa8
    add r3, r1, #0x1
    bl func_ov090_0221ad64
    mov r0, r9
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
    ldr r5, [r9, #0x54]
    ldr r0, [r4, #0x200]
    mov r1, #0x1
    bl func_02072b68
    ldrsh r3, [r5, #0x2e]
    ldrsh r0, [r5, #0x2c]
    ldr r2, [r4, #0x200]
    mov r1, #0x0
    strh r0, [r2, #0x2c]
    strh r3, [r2, #0x2e]
    add r0, r4, #0x100
    strh r1, [r0, #0xf0]
    mov r1, #0x28000
    add r0, r4, #0x224
    str r1, [r9, #0x24]
    add r1, r9, #0x18
    bl func_020050a4
    mov r0, #0xd
    strb r0, [r4, #0x1ec]
    ldr r0, .L_02218d14
    ldr r1, .L_02218d18
    ldr r0, [r0, #0x0]
    mov r2, #0x7
    bl Sound_Play
    ldr r0, .L_02218d14
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x44
    bl Sound_Play
    ldr r1, [r9, #0x278]
    cmp r1, #0x0
    beq .L_02218abc
    ldr r0, [r1, #0x14]
    mov r2, #0x0
    orr r0, r0, #0x80
    str r0, [r1, #0x14]
    ldr r1, [r9, #0x278]
    sub r0, r2, #0x10000
    ldr r1, [r1, #0x54]
    strb r2, [r1, #0x3a]
    ldr r2, [r9, #0x278]
    ldr r1, [r2, #0x5c]
    and r0, r1, r0
    orr r0, r0, #0x8
    str r0, [r2, #0x5c]
.L_02218abc:
    ldr r0, [r9, #0x1c]
    str r0, [r4, #0x210]
    ldr r0, [r9, #0x20]
    str r0, [r4, #0x214]
    ldr r0, [r4, #0x218]
    add r0, r0, #0x2000
    str r0, [r4, #0x218]
    cmp r0, #0x28000
    movgt r0, #0x28000
    strgt r0, [r4, #0x218]
    b .L_0221a284
.L_02218ae8:
    mov r0, r4
    mvn r1, #0xf
    bl func_ov090_0221b7f8
    ldr r2, [r4, #0x200]
    ldrsh r0, [r2, #0x32]
    add r0, r0, #0x2
    mov r0, r0, lsl #0x10
    mov r1, r0, asr #0x10
    cmp r1, #0x180
    movgt r1, #0x180
    strh r1, [r2, #0x32]
    strh r1, [r2, #0x34]
    ldr r0, [r9, #0x278]
    cmp r0, #0x0
    ldrne r0, [r0, #0x54]
    strneh r1, [r0, #0x32]
    strneh r1, [r0, #0x34]
    ldr r0, [r4, #0x228]
    mov r1, #0x3
    mov r0, r0, lsl #0x1
    add r0, r0, #0x200000
    bl func_020befec
    mov r1, r0
    add r0, sp, #0x2c8
    mov r2, #0x118000
    mov r3, #0x36000
    bl func_0200500c
    ldr r2, [sp, #0x2cc]
    ldr r1, .L_02218d3c
    cmp r2, r1
    strlt r1, [sp, #0x2cc]
    blt .L_02218b74
    add r0, r1, #0x8c000
    cmp r2, r0
    strgt r0, [sp, #0x2cc]
.L_02218b74:
    ldr r1, [r4, #0x228]
    add r0, sp, #0x2b8
    add r1, r1, r1, lsl #0x1
    add r2, r1, #0x200000
    mov r1, r2, asr #0x1
    add r1, r2, r1, lsr #0x1e
    mov r1, r1, asr #0x2
    mov r2, #0x12c000
    mov r3, #0x50000
    bl func_0200500c
    add r0, sp, #0x288
    add r2, sp, #0x2c8
    add r3, sp, #0x2b8
    add r1, r4, #0x224
    bl func_ov090_0221a3dc
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    mov r1, #0x50
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0xb8
    add r1, sp, #0x288
    bl func_020064b8
    add r0, r9, #0x18
    add r1, sp, #0xb8
    bl func_020050a4
    add r0, sp, #0xb8
    bl func_02005058
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    cmp r0, #0x50
    blo .L_02218c1c
    ldr r2, [r4, #0x200]
    mov r1, #0x2
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x200]
    bl func_02072b68
    mov r0, #0xe
    strb r0, [r4, #0x1ec]
.L_02218c1c:
    add r0, r4, #0x20c
    add r1, r9, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x214]
    cmp r0, #0x100000
    movlt r0, #0x100000
    strlt r0, [r4, #0x214]
    ldr r0, [r4, #0x21c]
    add r0, r0, #0x29
    str r0, [r4, #0x21c]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r4, #0x21c]
    mov r0, r4
    bl func_ov090_0221b280
    add r0, sp, #0x288
    bl func_0200637c
    add r0, sp, #0x2b8
    bl func_02005058
    add r0, sp, #0x2c8
    bl func_02005058
    b .L_0221a284
.L_02218c74:
    mov r0, r4
    mvn r1, #0xf
    bl func_ov090_0221b7f8
    ldr r2, [r4, #0x200]
    ldrh r1, [r2, #0x24]
    and r0, r1, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02218ce4
    bic r0, r1, #0x1
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x200]
    mov r1, #0x3
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x200]
    bl func_02072b68
    mov r0, #0xf
    strb r0, [r4, #0x1ec]
    add r0, r4, #0x100
    mov r2, #0x0
    ldr r1, .L_02218d14
    strh r2, [r0, #0xf0]
    ldr r0, [r1, #0x0]
    ldr r1, .L_02218d18
    mov r2, #0x8
    bl Sound_Play
.L_02218ce4:
    mov r0, r4
    bl func_ov090_0221b280
    b .L_0221a284
.L_02218cf0: .word data_021052fc
.L_02218cf4: .word gSceneManager
.L_02218cf8: .word 0x3f
.L_02218cfc: .word data_ov090_0221cc08
.L_02218d00: .word gHeapContext
.L_02218d04: .word data_020f4dc8
.L_02218d08: .word 0x109d
.L_02218d0c: .word data_ov090_0221cc10
.L_02218d10: .word 0x162c
.L_02218d14: .word gSoundContext
.L_02218d18: .word 0x142
.L_02218d1c: .word 0x19a
.L_02218d20: .word 0xffff8001
.L_02218d24: .word gGameWork
.L_02218d28: .word 0x17e
.L_02218d2c: .word gDebugFont
.L_02218d30: .word data_020f4e14
.L_02218d34: .word 0x266
.L_02218d38: .word 0x10a9
.L_02218d3c: .word 0x1ba000
.L_02218d40: .word 0x4cd
.L_02218d44:
    mov r0, r4
    mvn r1, #0xf
    bl func_ov090_0221b7f8
    ldr r2, [r4, #0x200]
    ldrsh r0, [r2, #0x32]
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r1, r0, asr #0x10
    cmp r1, #0x100
    movlt r1, #0x100
    strh r1, [r2, #0x32]
    strh r1, [r2, #0x34]
    ldr r0, [r9, #0x278]
    cmp r0, #0x0
    ldrne r0, [r0, #0x54]
    strneh r1, [r0, #0x32]
    strneh r1, [r0, #0x34]
    ldr r0, [r9, #0x24]
    ldr r1, .L_02218d40
    sub r0, r0, #0xcd
    sub r0, r0, #0x400
    str r0, [r9, #0x24]
    ldr r2, [r9, #0x20]
    mov r0, r4
    sub r1, r2, r1, lsr #0x1
    str r1, [r9, #0x20]
    bl func_ov090_0221aab8
    mvn r1, #0x0
    cmp r0, r1
    beq .L_02218e40
    mov r1, r0, lsl #0x1d
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    mov r3, r1, lsl #0x1
    add r1, r1, #0x1
    ldr r2, .L_02219c38
    mov r1, r1, lsl #0x1
    ldrsh r1, [r2, r1]
    ldrsh r2, [r2, r3]
    ldr r3, [r9, #0x1c]
    add r1, r1, r1, lsr #0x1f
    sub r2, r3, r2
    str r2, [r9, #0x1c]
    ldr r3, [r9, #0x20]
    ldr r2, .L_02218d3c
    add r1, r3, r1, asr #0x1
    str r1, [r9, #0x20]
    ldr r3, [r9, #0x1c]
    cmp r3, r2
    strlt r2, [r9, #0x1c]
    blt .L_02218e20
    add r1, r2, #0x8c000
    cmp r3, r1
    strgt r1, [r9, #0x1c]
.L_02218e20:
    ldr r1, [r9, #0x20]
    cmp r1, #0xe0000
    movlt r1, #0xe0000
    strlt r1, [r9, #0x20]
    blt .L_02218e40
    cmp r1, #0x160000
    movgt r1, #0x160000
    strgt r1, [r9, #0x20]
.L_02218e40:
    mvn r1, #0x0
    cmp r0, r1
    cmpne r0, #0x0
    cmpne r0, #0x4
    bne .L_02218e78
    add r1, r4, #0x200
    ldrsh r2, [r1, #0x34]
    cmp r2, #0x0
    subgt r2, r2, #0x1
    strgth r2, [r1, #0x34]
    bgt .L_02218e98
    addlt r2, r2, #0x1
    strlth r2, [r1, #0x34]
    b .L_02218e98
.L_02218e78:
    add r1, r4, #0x200
    cmp r0, #0x3
    ldrlesh r2, [r1, #0x34]
    addle r2, r2, #0x1
    strleh r2, [r1, #0x34]
    ldrgtsh r2, [r1, #0x34]
    subgt r2, r2, #0x1
    strgth r2, [r1, #0x34]
.L_02218e98:
    add r1, r4, #0x200
    ldrsh r3, [r1, #0x34]
    cmp r3, #0x10
    movgt r2, #0x10
    strgth r2, [r1, #0x34]
    bgt .L_02218ebc
    mvn r2, #0xf
    cmp r3, r2
    strlth r2, [r1, #0x34]
.L_02218ebc:
    add r1, r4, #0x200
    ldrsh r1, [r1, #0x34]
    cmp r1, #0x0
    movge r1, r1, lsl #0x14
    movlt r1, r1, lsl #0x4
    addlt r1, r1, #0x10000
    movlt r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    ldr r1, [r4, #0x200]
    cmp r0, #0x0
    cmpne r0, #0x1
    strh r2, [r1, #0x30]
    cmpne r0, #0x7
    ldreq r1, [r4, #0x200]
    ldreqsh r0, [r1, #0x34]
    addeq r0, r0, #0x8
    streqh r0, [r1, #0x34]
    beq .L_02218f20
    cmp r0, #0x3
    blt .L_02218f20
    cmp r0, #0x5
    ldrle r1, [r4, #0x200]
    ldrlesh r0, [r1, #0x34]
    suble r0, r0, #0x8
    strleh r0, [r1, #0x34]
.L_02218f20:
    add r0, r4, #0x20c
    add r1, r9, #0x18
    bl func_020050a4
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    adds r0, r1, r0, ror #0x1e
    bne .L_02218f7c
    ldr r0, .L_02218cf0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    ldr r1, [r9, #0x24]
    ldr r3, [r9, #0x1c]
    ldr r2, [r9, #0x20]
    mov r1, r1, asr #0xc
    rsb r1, r1, r2, asr #0xc
    mov r2, r3, asr #0xc
    sub r3, r1, #0x3c
    mov r1, #0x0
    bl func_020a29ac
.L_02218f7c:
    ldr r0, [r4, #0x21c]
    add r0, r0, #0x29
    str r0, [r4, #0x21c]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r4, #0x21c]
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    cmp r0, #0x7f
    bls .L_02218fbc
    ldr r1, [r4, #0x200]
    mov r2, #0x0
    mov r0, r4
    strh r2, [r1, #0x30]
    bl func_ov090_0221ae1c
    b .L_0221a284
.L_02218fbc:
    mov r0, r4
    bl func_ov090_0221b280
    b .L_0221a284
.L_02218fc8:
    ldr r1, [r4, #0x21c]
    ldr r0, .L_02218d40
    add r1, r1, #0x14
    cmp r1, r0
    str r1, [r4, #0x21c]
    movgt r0, #0x1000
    strgt r0, [r4, #0x21c]
    ldrb r1, [r4, #0x223]
    add r0, sp, #0xa8
    add r1, r4, r1, lsl #0x2
    ldr r1, [r1, #0x1f4]
    bl func_ov090_0221a420
    add r1, sp, #0xa8
    add r0, r9, #0x18
    bl func_020050a4
    add r0, sp, #0xa8
    bl func_02005058
    add r0, r4, #0x20c
    add r1, r9, #0x18
    bl func_020050a4
    ldrb r0, [r4, #0x1ec]
    cmp r0, #0x11
    bne .L_0221907c
    ldr r0, [r4, #0x200]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x4
    bne .L_02219060
    add r1, r4, #0x100
    ldrh r1, [r1, #0xf0]
    cmp r1, #0x14
    bls .L_02219060
    mov r1, #0x5
    bl func_02072b68
    ldr r1, [r4, #0x200]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_022190d4
.L_02219060:
    ldrh r2, [r0, #0x24]
    and r1, r2, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    orrne r1, r2, #0x4
    strneh r1, [r0, #0x24]
    b .L_022190d4
.L_0221907c:
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    mov r1, #0xa
    bl func_020befec
    cmp r1, #0x0
    bne .L_022190d4
    ldr r0, .L_02218cf0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r1, #0x1e
    str r1, [sp, #0x0]
    ldr r1, [r9, #0x24]
    ldr r3, [r9, #0x1c]
    ldr r2, [r9, #0x20]
    mov r1, r1, asr #0xc
    rsb r1, r1, r2, asr #0xc
    mov r2, r3, asr #0xc
    sub r3, r1, #0x1c
    mov r1, #0x1
    bl func_020a28e0
.L_022190d4:
    ldrb r0, [r4, #0x222]
    tst r0, #0x1
    beq .L_022192f0
    bic r2, r0, #0x1
    add r0, r4, #0x224
    add r1, r9, #0x18
    strb r2, [r4, #0x222]
    bl func_020050a4
    ldr r0, .L_02218d1c
    str r0, [r4, #0x21c]
    ldrb r0, [r4, #0x1ec]
    cmp r0, #0x10
    bne .L_02219278
    mov r0, #0x10000
    str r0, [r4, #0x230]
    ldr r1, [r4, #0x200]
    mov r0, #0x100
    strh r0, [r1, #0x32]
    strh r0, [r1, #0x34]
    ldr r2, [r4, #0x200]
    mov r1, #0x6
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x200]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x200]
    bl func_02072b68
    add r0, r4, #0x100
    mov r5, #0x0
    strh r5, [r0, #0xf0]
    ldrb r0, [r4, #0x222]
    tst r0, #0x2
    beq .L_022191d4
    mov r0, #0x1b
    ldr r6, .L_02218cf0
    strb r0, [r4, #0x1ec]
    mov r8, #0xa
    mov r7, r5
.L_02219178:
    add r0, r4, r5, lsl #0x2
    ldr r9, [r0, #0x1f4]
    add r0, r9, #0x200
    ldrh r1, [r0, #0xf2]
    orr r1, r1, #0x40
    strh r1, [r0, #0xf2]
    ldr r0, [r6, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    str r8, [sp, #0x0]
    ldr r1, [r9, #0x24]
    ldr r2, [r9, #0x1c]
    ldr r9, [r9, #0x20]
    mov r3, r1, asr #0xc
    mov r1, r7
    mov r2, r2, asr #0xc
    rsb r3, r3, r9, asr #0xc
    bl func_020a2844
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_02219178
    b .L_0221923c
.L_022191d4:
    mov r0, #0x12
    ldr r8, .L_02218cf0
    strb r0, [r4, #0x1ec]
    mov r7, #0x8
    mov r6, r5
.L_022191e8:
    ldr r0, [r8, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    str r7, [sp, #0x0]
    ldr r1, [r4, #0x230]
    ldr r2, [r4, #0x228]
    ldr r9, [r4, #0x22c]
    mov r3, r1, asr #0xc
    mov r1, r6
    mov r2, r2, asr #0xc
    rsb r3, r3, r9, asr #0xc
    bl func_020a2844
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_022191e8
    ldr r0, .L_02218d14
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x27
    bl Sound_Play
.L_0221923c:
    mov r5, #0x0
    mov r3, r5
    mov r1, #0x1
.L_02219248:
    add r2, r4, r5, lsl #0x2
    ldr r0, [r2, #0x1f4]
    add r5, r5, #0x1
    ldr r0, [r0, #0x54]
    cmp r5, #0x3
    strb r3, [r0, #0x3a]
    ldr r0, [r2, #0x1f4]
    ldr r0, [r0, #0x29c]
    ldr r0, [r0, #0x54]
    strb r1, [r0, #0x3a]
    blt .L_02219248
    b .L_0221a284
.L_02219278:
    add r0, r4, #0x224
    add r1, r9, #0x18
    bl func_020050a4
    ldr r1, .L_02218d08
    mov r0, r4
    sub r2, r1, #0x9c
    add r3, r1, #0x1
    bl func_ov090_0221ad64
    ldr r2, [r4, #0x200]
    mov r1, #0x0
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x200]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x200]
    bl func_02072b68
    add r0, r4, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xf0]
    mov r1, #0x15
    ldr r0, .L_02218d14
    strb r1, [r4, #0x1ec]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02218d18
    mov r2, #0x9
    bl Sound_Play
    b .L_0221a284
.L_022192f0:
    mov r0, r4
    mvn r1, #0xf
    bl func_ov090_0221b7f8
    b .L_0221a284
.L_02219300:
    mov r0, r4
    mov r1, #0x6
    bl func_ov090_0221b7f8
    add r0, sp, #0x278
    mov r1, #0x200000
    mov r2, #0x104000
    mov r3, #0x78000
    bl func_0200500c
    ldr r0, [r4, #0x228]
    mov r1, #0x3
    mov r0, r0, lsl #0x1
    add r0, r0, #0x200000
    bl func_020befec
    mov r1, r0
    add r0, sp, #0x268
    mov r2, #0xc0000
    mov r3, #0x50000
    bl func_0200500c
    add r0, sp, #0x238
    add r1, r4, #0x224
    add r2, sp, #0x278
    add r3, sp, #0x268
    bl func_ov090_0221a3dc
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    mov r1, #0x3c
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0x98
    add r1, sp, #0x238
    bl func_020064b8
    add r0, r9, #0x18
    add r1, sp, #0x98
    bl func_020050a4
    add r0, sp, #0x98
    bl func_02005058
    ldr r1, [r4, #0x200]
    ldrsh r0, [r1, #0x32]
    add r0, r0, #0x4
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    cmp r0, #0x200
    movgt r0, #0x200
    strh r0, [r1, #0x32]
    strh r0, [r1, #0x34]
    add r0, r4, #0x100
    ldrh r1, [r0, #0xf0]
    cmp r1, #0x3c
    blo .L_022193e4
    mov r1, #0x0
    strh r1, [r0, #0xf0]
    mov r2, #0x13
    add r0, r4, #0x224
    add r1, r9, #0x18
    strb r2, [r4, #0x1ec]
    bl func_020050a4
.L_022193e4:
    add r0, r4, #0x20c
    add r1, r9, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x214]
    cmp r0, #0x100000
    movlt r0, #0x100000
    strlt r0, [r4, #0x214]
    ldr r1, [r4, #0x21c]
    ldr r0, .L_02218d40
    add r1, r1, #0x14
    cmp r1, r0
    str r1, [r4, #0x21c]
    movgt r0, #0x1000
    strgt r0, [r4, #0x21c]
    mov r0, r4
    bl func_ov090_0221b280
    add r0, sp, #0x238
    bl func_0200637c
    add r0, sp, #0x268
    bl func_02005058
    add r0, sp, #0x278
    bl func_02005058
    b .L_0221a284
.L_02219440:
    mov r0, r4
    mov r1, #0x6
    bl func_ov090_0221b7f8
    add r0, sp, #0x228
    mov r1, #0x200000
    mov r2, #0x230000
    mov r3, #0x0
    bl func_0200500c
    add r0, sp, #0x218
    mov r1, #0x200000
    mov r2, #0x12c000
    mov r3, #0x5a000
    bl func_0200500c
    add r0, sp, #0x1e8
    add r1, r4, #0x224
    add r2, sp, #0x228
    add r3, sp, #0x218
    bl func_ov090_0221a3dc
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    mov r1, #0x1e
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0x88
    add r1, sp, #0x1e8
    bl func_020064b8
    add r0, r9, #0x18
    add r1, sp, #0x88
    bl func_020050a4
    add r0, sp, #0x88
    bl func_02005058
    ldr r1, [r4, #0x200]
    ldrsh r0, [r1, #0x32]
    sub r0, r0, #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    cmp r0, #0x100
    movlt r0, #0x100
    strh r0, [r1, #0x32]
    strh r0, [r1, #0x34]
    add r0, r4, #0x100
    ldrh r1, [r0, #0xf0]
    cmp r1, #0x1e
    blo .L_022195e4
    mov r1, #0x0
    strh r1, [r0, #0xf0]
    ldr r2, [r4, #0x200]
    mov r1, #0x7
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x200]
    bl func_02072b68
    mov r0, #0x17
    strb r0, [r4, #0x1ec]
    mov r3, #0x0
    mov r2, #0x1
.L_02219528:
    add r1, r4, r3, lsl #0x2
    ldr r0, [r1, #0x1f4]
    add r3, r3, #0x1
    ldr r0, [r0, #0x54]
    cmp r3, #0x3
    strb r2, [r0, #0x3a]
    ldr r0, [r1, #0x1f4]
    ldr r0, [r0, #0x29c]
    ldr r0, [r0, #0x54]
    strb r2, [r0, #0x3a]
    blt .L_02219528
    ldr r1, .L_02218d0c
    ldr r3, .L_02218d00
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022195b4
    ldr r3, .L_02218d10
    mov r1, #0x4
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    mov r2, #0x0
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r1, r1, #0x5
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r9, #0x54]
    add r1, r9, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
.L_022195b4:
    ldr r0, .L_02218d14
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x28
    bl Sound_Play
    ldr r0, .L_02218cf0
    mov r1, #0x14
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_020099c0
.L_022195e4:
    add r0, r4, #0x20c
    add r1, r9, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x214]
    cmp r0, #0x100000
    movlt r0, #0x100000
    strlt r0, [r4, #0x214]
    ldr r1, [r4, #0x21c]
    ldr r0, .L_02218d40
    add r1, r1, #0x14
    cmp r1, r0
    str r1, [r4, #0x21c]
    movgt r0, #0x1000
    strgt r0, [r4, #0x21c]
    mov r0, r4
    bl func_ov090_0221b280
    add r0, sp, #0x1e8
    bl func_0200637c
    add r0, sp, #0x218
    bl func_02005058
    add r0, sp, #0x228
    bl func_02005058
    b .L_0221a284
.L_02219640:
    mov r0, r4
    mov r1, #0x6
    bl func_ov090_0221b7f8
    add r0, sp, #0x1d8
    mov r1, #0x200000
    mov r2, #0x230000
    mov r3, #0x0
    bl func_0200500c
    add r0, sp, #0x1c8
    bl func_02004fe0
    ldrb r0, [r4, #0x1ec]
    mov r1, #0x200000
    cmp r0, #0x14
    add r0, sp, #0x1c8
    bne .L_02219690
    mov r2, #0x1e0000
    mov r3, #0x30000
    bl func_ov090_0221a3cc
    mov r5, #0x14
    b .L_022196a0
.L_02219690:
    mov r2, #0x1f4000
    mov r3, #0x50000
    bl func_ov090_0221a3cc
    mov r5, #0x1e
.L_022196a0:
    add r0, sp, #0x198
    add r2, sp, #0x1d8
    add r3, sp, #0x1c8
    add r1, r4, #0x224
    bl func_ov090_0221a3dc
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    mov r1, r5
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0x78
    add r1, sp, #0x198
    bl func_020064b8
    add r1, sp, #0x78
    add r0, r9, #0x18
    bl func_020050a4
    add r0, sp, #0x78
    bl func_02005058
    add r0, r4, #0x100
    ldrh r1, [r0, #0xf0]
    cmp r1, r5
    blt .L_0221981c
    mov r1, #0x0
    strh r1, [r0, #0xf0]
    ldr r1, [r4, #0x200]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    ldrb r0, [r4, #0x1ec]
    cmp r0, #0x15
    mov r0, r4
    ldr r2, [r0, #0x0]
    ldreq r1, .L_02219c3c
    ldr r2, [r2, #0xc4]
    movne r1, #0x32
    blx r2
    ldr r0, .L_02218d14
    ldr r1, .L_02218d18
    ldr r0, [r0, #0x0]
    mov r2, #0xa
    bl Sound_Play
    mov r0, #0x16
    strb r0, [r4, #0x1ec]
    ldr r1, .L_02218d0c
    ldr r3, .L_02218d00
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022197b0
    ldr r3, .L_02218d10
    mov r1, #0x4
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    mov r2, #0x0
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r1, r1, #0x5
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r9, #0x54]
    add r1, r9, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
.L_022197b0:
    ldr r0, .L_02218cf0
    mov r1, #0x2d
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_020099c0
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x20]
    cmp r0, #0x0
    bgt .L_0221981c
    ldr r1, [r9, #0x230]
    ldr r0, .L_02218d24
    bic r1, r1, #0x4
    str r1, [r9, #0x230]
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    bl GameWork_ClearFlag
    mov r1, #0x18
    add r0, sp, #0x198
    strb r1, [r4, #0x1ec]
    bl func_0200637c
    add r0, sp, #0x1c8
    bl func_02005058
    add r0, sp, #0x1d8
    bl func_02005058
    b .L_0221a284
.L_0221981c:
    add r0, r4, #0x20c
    add r1, r9, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x214]
    cmp r0, #0x100000
    movlt r0, #0x100000
    strlt r0, [r4, #0x214]
    ldr r1, [r4, #0x21c]
    ldr r0, .L_02218d40
    add r1, r1, #0x14
    cmp r1, r0
    str r1, [r4, #0x21c]
    movgt r0, #0x1000
    strgt r0, [r4, #0x21c]
    mov r0, r4
    bl func_ov090_0221b280
    add r0, sp, #0x198
    bl func_0200637c
    add r0, sp, #0x1c8
    bl func_02005058
    add r0, sp, #0x1d8
    bl func_02005058
    b .L_0221a284
.L_02219878:
    mov r0, r4
    mov r1, #0x6
    bl func_ov090_0221b7f8
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    cmp r0, #0x5a
    bls .L_0221a284
    ldr r2, [r4, #0x200]
    mov r1, #0x1
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x200]
    bl func_02072b68
    mov r1, #0x17
    mov r0, r4
    strb r1, [r4, #0x1ec]
    bl func_ov090_0221b280
    b .L_0221a284
.L_022198c4:
    mov r0, r4
    mov r1, #0x6
    bl func_ov090_0221b7f8
    ldr r0, [r4, #0x200]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_0221a284
    mvn r1, #0x0
    mov r0, r4
    mov r2, r1
    mov r3, r1
    bl func_ov090_0221ad64
    add r0, r4, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xf0]
    mov r0, #0xb
    strb r0, [r4, #0x1ec]
    ldr r1, [r9, #0x230]
    mov r0, r9
    orr r1, r1, #0x4
    str r1, [r9, #0x230]
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x54]
    blx r2
    ldr r1, [r9, #0x14]
    ldr r0, .L_02218d24
    bic r1, r1, #0x2
    str r1, [r9, #0x14]
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    bl GameWork_SetFlag
    add r0, r9, #0x38
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov090_0221a3cc
    add r0, r9, #0x88
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov090_0221a3cc
    add r0, r9, #0x98
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov090_0221a3cc
    mov r0, r9
    mov r1, #0x0
    mov r2, #0x1000
    bl Actor_SetDirectionFromVector
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    mov r0, r9
    bl ActorDerivedType1_TeardownActiveRecord
    ldr r0, [r9, #0xd0]
    mov r1, #0x0
    bic r0, r0, #0x4000
    str r0, [r9, #0xd0]
    add r0, r9, #0x200
    strh r1, [r0, #0x68]
    mov r0, r4
    bl func_ov090_0221b280
    b .L_0221a284
.L_022199d4:
    ldr r1, .L_02219c40
    mov r0, r4
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_ov090_0221ad64
    ldr r0, [r4, #0x200]
    mov r1, #0x0
    bl func_02072b68
    ldr r3, [r4, #0x200]
    ldr r0, .L_02218d04
    ldrh r2, [r3, #0x24]
    mov r1, #0x0
    orr r2, r2, #0x2
    strh r2, [r3, #0x24]
    ldr r3, [r9, #0x54]
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x10
    strh r2, [r3, #0x24]
    ldrsh r5, [r3, #0x2e]
    ldrsh r2, [r3, #0x2c]
    ldr r3, [r4, #0x200]
    strh r2, [r3, #0x2c]
    strh r5, [r3, #0x2e]
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    mov r2, #0x10
    mov r3, #0x5a
    bl DisplayBrightness_StartTransition
    ldr r0, .L_02218d04
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    mov r2, #0x10
    mov r3, #0x5a
    bl DisplayBrightness_StartTransition
    mov r1, #0x0
    add r0, r4, #0x100
    strh r1, [r0, #0xf0]
    mov r0, #0x19
    strb r0, [r4, #0x1ec]
    ldrb r2, [r4, #0x222]
    ldr r0, .L_02218d14
    orr r2, r2, #0x4
    strb r2, [r4, #0x222]
    ldr r0, [r0, #0x0]
    bl func_02058d40
    ldr r0, .L_02218d14
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x2d
    bl Sound_Play
    b .L_0221a284
.L_02219aa4:
    ldr r1, [r4, #0x200]
    ldrsh r0, [r1, #0x32]
    add r0, r0, #0x2
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    cmp r0, #0x200
    movgt r0, #0x200
    strh r0, [r1, #0x32]
    strh r0, [r1, #0x34]
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    movne r0, #0x1a
    strneb r0, [r4, #0x1ec]
    b .L_0221a284
.L_02219adc:
    ldr r0, .L_02218d14
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_02058d40
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    cmp r0, #0xa
    bne .L_02219b10
    ldr r1, .L_02219c44
    mov r0, r4
    mov r2, #0x0
    bl func_020349b8
    b .L_02219b20
.L_02219b10:
    cmp r0, #0x14
    bne .L_02219b20
    mov r0, r4
    bl func_ov090_0221b428
.L_02219b20:
    mov r1, #0x200000
    add r0, sp, #0x188
    sub r2, r1, #0xca000
    mov r3, #0x78000
    bl func_0200500c
    add r0, sp, #0x178
    mov r1, #0x200000
    mov r2, #0xd2000
    mov r3, #0x50000
    bl func_0200500c
    add r0, sp, #0x148
    add r2, sp, #0x188
    add r3, sp, #0x178
    add r1, r4, #0x224
    bl func_ov090_0221a3dc
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    mov r1, #0x3c
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0x68
    add r1, sp, #0x148
    bl func_020064b8
    add r0, r9, #0x18
    add r1, sp, #0x68
    bl func_020050a4
    add r0, sp, #0x68
    bl func_02005058
    ldr r1, [r4, #0x200]
    ldrsh r0, [r1, #0x32]
    add r0, r0, #0x4
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    cmp r0, #0x200
    movgt r0, #0x200
    strh r0, [r1, #0x32]
    strh r0, [r1, #0x34]
    add r0, r4, #0x100
    ldrh r1, [r0, #0xf0]
    cmp r1, #0x3c
    blo .L_02219be4
    mov r1, #0x0
    strh r1, [r0, #0xf0]
    mov r2, #0x1c
    add r0, r4, #0x224
    add r1, r9, #0x18
    strb r2, [r4, #0x1ec]
    bl func_020050a4
.L_02219be4:
    add r0, r4, #0x20c
    add r1, r9, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x214]
    cmp r0, #0x100000
    movlt r0, #0x100000
    strlt r0, [r4, #0x214]
    ldr r1, [r4, #0x21c]
    ldr r0, .L_02218d40
    add r1, r1, #0x14
    cmp r1, r0
    str r1, [r4, #0x21c]
    movgt r0, #0x1000
    strgt r0, [r4, #0x21c]
    add r0, sp, #0x148
    bl func_0200637c
    add r0, sp, #0x178
    bl func_02005058
    add r0, sp, #0x188
    bl func_02005058
    b .L_0221a284
.L_02219c38: .word data_020c9670
.L_02219c3c: .word 0x14a
.L_02219c40: .word 0x103b
.L_02219c44: .word 0xa10c
.L_02219c48: .word 0x1036
.L_02219c4c: .word data_ov090_0221cc10
.L_02219c50: .word gHeapContext
.L_02219c54: .word 0x162c
.L_02219c58:
    add r0, sp, #0x138
    mov r1, #0x200000
    mov r2, #0x208000
    mov r3, #0x0
    bl func_0200500c
    add r0, sp, #0x128
    mov r1, #0x200000
    mov r2, #0x17c000
    mov r3, #0x5a000
    bl func_0200500c
    add r0, sp, #0xf8
    add r2, sp, #0x138
    add r3, sp, #0x128
    add r1, r4, #0x224
    bl func_ov090_0221a3dc
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    mov r1, #0x3c
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0x58
    add r1, sp, #0xf8
    bl func_020064b8
    add r0, r9, #0x18
    add r1, sp, #0x58
    bl func_020050a4
    add r0, sp, #0x58
    bl func_02005058
    ldr r1, [r4, #0x200]
    add r2, r4, #0x100
    ldrsh r0, [r1, #0x32]
    sub r0, r0, #0x4
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    cmp r0, #0x100
    movlt r0, #0x100
    strh r0, [r1, #0x32]
    strh r0, [r1, #0x34]
    ldrh r0, [r2, #0xf0]
    cmp r0, #0x3c
    blo .L_02219e14
    ldr r1, .L_02219c48
    mov r3, #0x0
    strh r3, [r2, #0xf0]
    mov r0, r4
    sub r2, r1, #0x35
    add r3, r1, #0x1
    bl func_ov090_0221ad64
    ldr r2, [r4, #0x200]
    mov r1, #0x23
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x200]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x200]
    bl func_02072b68
    mov r0, #0x1d
    strb r0, [r4, #0x1ec]
    mov r3, #0x0
    mov r2, #0x1
.L_02219d58:
    add r1, r4, r3, lsl #0x2
    ldr r0, [r1, #0x1f4]
    add r3, r3, #0x1
    ldr r0, [r0, #0x54]
    cmp r3, #0x3
    strb r2, [r0, #0x3a]
    ldr r0, [r1, #0x1f4]
    ldr r0, [r0, #0x29c]
    ldr r0, [r0, #0x54]
    strb r2, [r0, #0x3a]
    blt .L_02219d58
    ldr r1, .L_02219c4c
    ldr r3, .L_02219c50
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02219de4
    ldr r3, .L_02219c54
    mov r1, #0x4
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    mov r2, #0x0
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r1, r1, #0x5
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r9, #0x54]
    add r1, r9, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
.L_02219de4:
    ldr r0, .L_0221a3ac
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x28
    bl Sound_Play
    ldr r0, .L_0221a3b0
    mov r1, #0x14
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_020099c0
.L_02219e14:
    add r0, r4, #0x20c
    add r1, r9, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x214]
    cmp r0, #0x100000
    movlt r0, #0x100000
    strlt r0, [r4, #0x214]
    ldr r1, [r4, #0x21c]
    ldr r0, .L_0221a3b4
    add r1, r1, #0x14
    cmp r1, r0
    str r1, [r4, #0x21c]
    movgt r0, #0x1000
    strgt r0, [r4, #0x21c]
    add r0, sp, #0xf8
    bl func_0200637c
    add r0, sp, #0x128
    bl func_02005058
    add r0, sp, #0x138
    bl func_02005058
    b .L_0221a284
.L_02219e68:
    add r0, r4, #0x100
    ldrh r1, [r0, #0xf0]
    add r1, r1, #0x1
    strh r1, [r0, #0xf0]
    ldrh r0, [r0, #0xf0]
    cmp r0, #0x78
    blo .L_0221a284
    mvn r1, #0x0
    mov r0, r4
    mov r2, r1
    mov r3, r1
    bl func_ov090_0221ad64
    ldr r1, [r9, #0x230]
    mov r0, r9
    orr r1, r1, #0x4
    str r1, [r9, #0x230]
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x54]
    blx r2
    ldr r1, [r9, #0x14]
    ldr r0, .L_0221a3b8
    bic r1, r1, #0x2
    str r1, [r9, #0x14]
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    bl GameWork_SetFlag
    mov r1, #0x0
    add r0, r9, #0x38
    mov r2, r1
    mov r3, r1
    bl func_ov090_0221a3cc
    mov r1, #0x0
    add r0, r9, #0x88
    mov r2, r1
    mov r3, r1
    bl func_ov090_0221a3cc
    mov r1, #0x0
    add r0, r9, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov090_0221a3cc
    mov r0, r9
    mov r1, #0x0
    mov r2, #0x1000
    bl Actor_SetDirectionFromVector
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    ldr r0, [r9, #0xd0]
    mov r1, #0x0
    bic r0, r0, #0x4000
    str r0, [r9, #0xd0]
    add r0, r9, #0x200
    strh r1, [r0, #0x68]
    mov r0, r9
    mov r1, #0x7d
    bl ActorDerivedType1_StartRecord
    mov r1, #0x0
    add r0, r4, #0x100
    strh r1, [r0, #0xf0]
    mov r0, #0x1e
    cmp r6, #0x0
    strb r0, [r4, #0x1ec]
    ldrne r0, [r6, #0x268]
    mov r1, #0xa
    orrne r0, r0, #0x20000
    strne r0, [r6, #0x268]
    ldr r0, .L_0221a3ac
    ldr r0, [r0, #0x0]
    bl func_0205958c
    ldr r0, .L_0221a3ac
    mov r1, #0x56
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    b .L_0221a284
.L_02219fa0:
    ldr r2, .L_0221a3bc
    add r0, sp, #0x48
    add r1, r9, #0x38
    bl func_ov090_0221a498
    add r1, sp, #0x48
    add r0, r9, #0x88
    bl func_020050c8
    add r0, sp, #0x48
    bl func_02005058
    add r0, r4, #0x20c
    add r1, r9, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x214]
    cmp r0, #0x100000
    movlt r0, #0x100000
    strlt r0, [r4, #0x214]
    ldr r0, [r4, #0x21c]
    add r0, r0, #0x29
    str r0, [r4, #0x21c]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r4, #0x21c]
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    adds r0, r1, r0, ror #0x1d
    bne .L_0221a0d4
    add r0, sp, #0xe8
    add r1, r9, #0x18
    bl func_02005030
    bl genrand_int32
    mov r1, #0xc
    mov r5, r0
    bl func_020bf1f8
    mov r1, r1, lsl #0xc
    ldr r2, [sp, #0xec]
    sub r1, r1, #0x6000
    add r1, r2, r1
    str r1, [sp, #0xec]
    mov r0, r5, lsr #0x8
    mov r1, #0x6
    bl func_020bf1f8
    mov r0, r1, lsl #0xc
    ldr r2, [sp, #0xf0]
    sub r0, r0, #0x3000
    add r0, r2, r0
    str r0, [sp, #0xf0]
    ldr r1, .L_02219c4c
    ldr r3, .L_02219c50
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_0221a0cc
    ldr r0, [r9, #0x54]
    ldr r6, [r0, #0x0]
    bl genrand_int32
    ldr r1, .L_0221a3c0
    mov r7, #0x4
    str r1, [sp, #0x0]
    add r1, r1, #0x1
    str r1, [sp, #0x4]
    and r0, r0, #0x3
    str r0, [sp, #0x8]
    mov r0, r5
    str r7, [sp, #0xc]
    sub r3, r7, #0x5
    str r3, [sp, #0x10]
    mov r5, #0x1
    add r1, sp, #0xe8
    mov r2, r6
    rsb r3, r7, #0x1640
    str r5, [sp, #0x14]
    bl func_0201f864
.L_0221a0cc:
    add r0, sp, #0xe8
    bl func_02005058
.L_0221a0d4:
    add r0, r4, #0x100
    ldrh r1, [r0, #0xf0]
    ldr r0, .L_0221a3c4
    cmp r1, r0
    bhs .L_0221a170
    mov r8, #0x0
    mov r6, #0x1
    mov r10, r8
    mov r11, r8
    mov r7, r6
    ldr r5, .L_0221a3b0
    b .L_0221a144
.L_0221a104:
    ldr r0, [r5, #0x0]
    mov r1, r7
    bl func_02007f0c
    ldr r1, [r0, r10, lsl #0x2]
    cmp r1, #0x0
    beq .L_0221a140
    ldrb r0, [r1, #0x4d]
    cmp r0, #0x4
    moveq r0, r6
    movne r0, r11
    cmp r0, #0x0
    beq .L_0221a140
    ldrh r0, [r1, #0x4e]
    cmp r0, #0x12
    addeq r8, r8, #0x1
.L_0221a140:
    add r10, r10, #0x1
.L_0221a144:
    ldr r0, [r5, #0x0]
    mov r1, #0x1
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r10, r0
    blt .L_0221a104
    cmp r8, #0x0
    ldreq r1, .L_0221a3c4
    addeq r0, r4, #0x100
    streqh r1, [r0, #0xf0]
.L_0221a170:
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    cmp r0, #0x30c
    bne .L_0221a1b8
    ldr r0, .L_0221a3c8
    mov r1, #0x0
    bl DisplayBrightnessPair_GetScreen
    mov r2, #0x10
    add r3, r2, #0xfe
    mov r1, #0x0
    bl DisplayBrightness_StartTransition
    ldr r0, .L_0221a3c8
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r2, #0x10
    mov r1, #0x0
    add r3, r2, #0xfe
    bl DisplayBrightness_StartTransition
.L_0221a1b8:
    add r0, r4, #0x100
    ldrh r0, [r0, #0xf0]
    cmp r0, #0x3c0
    blo .L_0221a284
    mov r1, #0x1040
    mov r0, r4
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_ov090_0221ad64
    ldr r0, [r4, #0x200]
    mov r1, #0x1
    bl func_02072b68
    ldr r5, [r4, #0x200]
    mov r3, #0xc0
    ldrh r1, [r5, #0x24]
    add r0, r4, #0x100
    mov r2, #0x0
    orr r1, r1, #0x2
    strh r1, [r5, #0x24]
    ldr r6, [r9, #0x54]
    mov r1, #0x1f
    ldrh r5, [r6, #0x24]
    orr r5, r5, #0x10
    strh r5, [r6, #0x24]
    ldrsh r7, [r6, #0x2e]
    ldrsh r5, [r6, #0x2c]
    ldr r6, [r4, #0x200]
    strh r5, [r6, #0x2c]
    strh r7, [r6, #0x2e]
    ldr r5, [r4, #0x200]
    strh r3, [r5, #0x32]
    strh r3, [r5, #0x34]
    strh r2, [r0, #0xf0]
    strb r1, [r4, #0x1ec]
    ldrb r0, [r4, #0x222]
    orr r0, r0, #0x4
    strb r0, [r4, #0x222]
    b .L_0221a284
.L_0221a250:
    ldr r1, [r4, #0x200]
    ldrsh r0, [r1, #0x32]
    add r0, r0, #0x4
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    cmp r0, #0x200
    movgt r0, #0x200
    strh r0, [r1, #0x32]
    strh r0, [r1, #0x34]
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    movne r0, #0x20
    strneb r0, [r4, #0x1ec]
.L_0221a284:
    add r2, r4, #0x100
    ldrh r3, [r2, #0xf0]
    add r0, sp, #0x38
    add r1, r4, #0x18
    add r3, r3, #0x1
    strh r3, [r2, #0xf0]
    ldr r2, [r4, #0x21c]
    rsb r2, r2, #0x1000
    bl func_ov090_0221a498
    ldr r2, [r4, #0x21c]
    add r0, sp, #0x28
    add r1, r4, #0x20c
    bl func_ov090_0221a498
    add r0, sp, #0x18
    add r1, sp, #0x38
    add r2, sp, #0x28
    bl func_ov090_0221a460
    add r1, sp, #0x18
    add r0, r4, #0x18
    bl func_020050a4
    add r0, sp, #0x18
    bl func_02005058
    add r0, sp, #0x28
    bl func_02005058
    add r0, sp, #0x38
    bl func_02005058
    ldr r2, [r4, #0x218]
    mov r1, #0x80000
    add r2, r2, r2, lsr #0x1f
    mov r2, r2, asr #0x1
    rsb r2, r2, #0x0
    add r0, sp, #0xd8
    rsb r1, r1, #0x0
    mov r3, #0x0
    sub r2, r2, #0x74000
    bl func_0200500c
    ldr r0, .L_0221a3b0
    add r1, sp, #0xd8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009780
    ldr r0, .L_0221a3b0
    add r1, sp, #0xd8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x44
    add r0, r0, #0x3000
    bl func_02009780
    ldr r0, .L_0221a3b0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r1, [r0, #0xb8]
    orr r1, r1, #0x10
    str r1, [r0, #0xb8]
    ldrb r0, [r4, #0x1ec]
    cmp r0, #0xb
    blo .L_0221a38c
    cmp r0, #0x19
    bhi .L_0221a38c
    mov r0, r4
    bl func_ov090_0221a8bc
    ldr r1, [r4, #0x23c]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    b .L_0221a39c
.L_0221a38c:
    ldr r1, [r4, #0x23c]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
.L_0221a39c:
    add r0, sp, #0xd8
    bl func_02005058
.L_0221a3a4:
    add sp, sp, #0x358
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221a3ac: .word gSoundContext
.L_0221a3b0: .word data_021052fc
.L_0221a3b4: .word 0x4cd
.L_0221a3b8: .word gGameWork
.L_0221a3bc: .word 0x19a
.L_0221a3c0: .word 0x163d
.L_0221a3c4: .word 0x2ee
.L_0221a3c8: .word data_020f4dc8
.size func_ov090_02217d70, . - func_ov090_02217d70

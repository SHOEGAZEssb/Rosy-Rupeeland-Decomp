.text
; Matching fallback for the portable implementation in src/overlays/ov093/overlay093_recovery.c.
.extern GX_HBlankIntr
.extern GX_VBlankIntr
.extern Heap_Alloc
.extern SceneManager_GetCurrent
.extern Scene_ClearFlag02
.extern Sound_Play
.extern data_020f4dc8
.extern data_021052fc
.extern data_ov093_022187f0
.extern data_ov093_022189e8
.extern data_ov093_022189f0
.extern OverlayManager_LoadOverlay
.extern OverlayManager_GetGlobal
.extern DisplayBrightness_StartTransition
.extern DisplayBrightnessPair_GetScreen
.extern func_0200500c
.extern func_02005058
.extern ActorMotion_BindActor
.extern ActorMotionAreaFollower_BindActor
.extern func_0201e0ec
.extern func_0201f864
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern func_0204d308
.extern func_020593ac
.extern func_02059484
.extern func_020594a4
.extern func_02072b68
.extern func_020a28e0
.extern func_020a2960
.extern func_020a6404
.extern func_020a6548
.extern func_020a68fc
.extern func_020befec
.extern func_020bf1f8
.extern func_ov060_0220fd54
.extern func_ov063_02210314
.extern func_ov093_022177e0
.extern gHeapContext
.extern gSceneManager
.extern gSoundContext
.extern genrand_int32

.global func_ov093_02217c50
func_ov093_02217c50:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x28
    mov r4, r0
    bl func_0204d308
    ldr r1, .L_022184c8
    ldr r0, .L_022184cc
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    add r1, r1, #0x2000
    ldr r7, [r1, #0xea4]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x2
    beq .L_022184c0
    ldr r0, .L_022184c8
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_BindActor
    ldr r0, .L_022184c8
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x44
    add r0, r0, #0x3000
    bl ActorMotion_BindActor
    ldr r0, .L_022184cc
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r1, .L_022184c8
    mov r5, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    ldrb r1, [r4, #0x1fc]
    mov r6, r0
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_02218360
.L_02217cf0:
    b .L_02217d18
    b .L_02217d78
    b .L_02217dd8
    b .L_02218034
    b .L_022180d8
    b .L_02218158
    b .L_02218190
    b .L_022181c0
    b .L_0221826c
    b .L_02218360
.L_02217d18:
    bl OverlayManager_GetGlobal
    ldr r2, .L_022184d0
    mov r1, #0x2
    bl OverlayManager_LoadOverlay
    ldr r1, .L_022184d4
    ldr r3, .L_022184d8
    mov r0, #0x58
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02217d50
    mov r1, r4
    mov r2, #0x1
    bl func_ov060_0220fd54
.L_02217d50:
    mov r0, #0x1
    strb r0, [r4, #0x1fc]
    add r2, r4, #0x100
    mov r1, #0x0
    mov r0, r7
    strh r1, [r2, #0xfe]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    b .L_02218360
.L_02217d78:
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
    mov r1, #0x0
    add r0, r4, #0x100
    strh r1, [r0, #0xfe]
    mov r0, #0x2
    strb r0, [r4, #0x1fc]
    ldr r0, .L_022184dc
    ldr r1, .L_022184e0
    ldr r0, [r0, #0x0]
    mov r2, #0xa
    bl Sound_Play
    ldr r0, [r5, #0x50]
    bic r0, r0, #0x8000
    str r0, [r5, #0x50]
    b .L_02218360
.L_02217dd8:
    ldr r0, [r4, #0x244]
    cmp r0, #0x80000
    blt .L_02217e60
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x40]
    mov r2, #0x8
    add r1, r1, #0x1
    strh r1, [r0, #0x40]
    ldrsh r1, [r0, #0x40]
    cmp r1, #0x0
    movgt r1, #0x0
    strgth r1, [r0, #0x40]
    ldr r0, .L_022184dc
    ldr r1, .L_022184e0
    ldr r0, [r0, #0x0]
    bl func_020594a4
    cmp r0, #0x0
    bne .L_02217e60
    mov r3, #0x0
    str r3, [sp, #0x0]
    ldr r0, .L_022184dc
    str r3, [sp, #0x4]
    ldr r0, [r0, #0x0]
    ldr r1, .L_022184e0
    mov r2, #0x8
    bl func_020593ac
    mov r1, #0x78
    ldr r0, .L_022184dc
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    add r1, r1, #0xb5
    mov r2, #0x8
    mov r3, #0x64
    bl func_02059484
.L_02217e60:
    ldr r2, [r4, #0x210]
    ldrb r7, [r2, #0x38]
    cmp r7, #0x1
    beq .L_02217e7c
    cmp r7, #0x2
    beq .L_02217f60
    b .L_02217f98
.L_02217e7c:
    add r0, r4, #0x100
    ldrh r0, [r0, #0xfe]
    cmp r0, #0x16
    movlo r1, #0xa000
    ldrhs r1, .L_022184e4
    ldr r0, [r4, #0x248]
    add r0, r0, r1
    str r0, [r4, #0x248]
    cmp r0, #0x198000
    blt .L_02217f98
    mov r0, #0x198000
    str r0, [r4, #0x248]
    ldr r2, [r4, #0x210]
    mov r1, #0x2
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x210]
    bl func_02072b68
    add r0, sp, #0x18
    mov r1, #0x180000
    mov r2, #0x194000
    mov r3, #0x0
    bl func_0200500c
    ldr r1, .L_022184e8
    ldr r3, .L_022184d8
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_02217f40
    mov r0, r4
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r3, .L_022184ec
    mov r2, r0
    str r3, [sp, #0x0]
    add r0, r3, #0x1
    str r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    mov r0, r5
    sub r3, r3, #0x1
    add r1, sp, #0x18
    bl func_0201f864
.L_02217f40:
    ldr r0, .L_022184dc
    ldr r1, .L_022184e0
    ldr r0, [r0, #0x0]
    mov r2, #0x7
    bl Sound_Play
    add r0, sp, #0x18
    bl func_02005058
    b .L_02217f98
.L_02217f60:
    ldrh r1, [r2, #0x24]
    and r0, r1, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02217f98
    bic r0, r1, #0x1
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x210]
    mov r1, #0x0
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x210]
    bl func_02072b68
.L_02217f98:
    ldr r0, [r4, #0x244]
    cmp r7, #0x1
    moveq r5, #0x4000
    addeq r0, r0, #0x4000
    addne r0, r0, #0xb000
    movne r5, #0xa000
    str r0, [r4, #0x244]
    bl genrand_int32
    mov r1, r5
    bl func_020bf1f8
    add r0, r5, r5, lsr #0x1f
    sub r0, r1, r0, asr #0x1
    add r0, r0, #0x180000
    str r0, [r4, #0x1c]
    ldr r0, [r4, #0x244]
    cmp r0, #0x1f0000
    blt .L_02218004
    mov r0, #0x1f0000
    str r0, [r4, #0x244]
    mov r0, #0x180000
    cmp r7, #0x0
    str r0, [r4, #0x1c]
    moveq r0, #0x3
    streqb r0, [r4, #0x1fc]
    addeq r0, r4, #0x100
    moveq r1, #0x0
    streqh r1, [r0, #0xfe]
.L_02218004:
    ldr r0, [r4, #0x244]
    cmp r0, #0x80000
    movlt r0, #0x80000
    str r0, [r4, #0x20]
    bl genrand_int32
    mov r1, #0x3000
    bl func_020bf1f8
    ldr r2, [r4, #0x20]
    sub r0, r1, #0x1800
    add r0, r2, r0
    str r0, [r4, #0x20]
    b .L_02218360
.L_02218034:
    add r0, r4, #0x100
    ldrh r0, [r0, #0xfe]
    cmp r0, #0x78
    bls .L_02218070
    add r0, r4, #0x18
    mov r1, #0x180000
    mov r2, #0x1f0000
    mov r3, #0x0
    bl func_ov093_022177e0
    mov r0, #0x4
    strb r0, [r4, #0x1fc]
    add r0, r4, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xfe]
    b .L_02218360
.L_02218070:
    rsb r5, r0, #0x78
    mov r0, #0xa000
    mul r0, r5, r0
    mov r1, #0x78
    bl func_020befec
    mov r1, #0x6000
    mov r7, r0
    mul r0, r5, r1
    mov r1, #0x78
    bl func_020befec
    mov r5, r0
    bl genrand_int32
    mov r1, r7
    bl func_020bf1f8
    add r0, r7, r7, lsr #0x1f
    sub r0, r1, r0, asr #0x1
    add r0, r0, #0x180000
    str r0, [r4, #0x1c]
    bl genrand_int32
    mov r1, r5
    bl func_020bf1f8
    add r0, r5, r5, lsr #0x1f
    sub r0, r1, r0, asr #0x1
    add r0, r0, #0x1f0000
    str r0, [r4, #0x20]
    b .L_02218360
.L_022180d8:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x40]
    cmp r1, #0x0
    addlt r1, r1, #0x1
    strlth r1, [r0, #0x40]
    add r1, r4, #0x100
    ldrh r0, [r1, #0xfe]
    cmp r0, #0x3c
    bls .L_02218360
    mov r0, #0x0
    strh r0, [r1, #0xfe]
    bl GX_VBlankIntr
    mov r0, #0x0
    bl GX_HBlankIntr
    ldr r0, [r5, #0x24]
    bl func_020a6548
    ldr r0, [r5, #0x24]
    mov r1, #0x45
    mov r2, #0x0
    bl func_020a68fc
    mov r0, #0x1
    bl GX_VBlankIntr
    mov r0, #0x1
    bl GX_HBlankIntr
    ldr r0, .L_022184dc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x6f
    bl Sound_Play
    mov r0, #0x5
    strb r0, [r4, #0x1fc]
    b .L_02218360
.L_02218158:
    ldr r0, [r5, #0x24]
    ldr r0, [r0, #0x4a4]
    ldrsh r0, [r0, #0x4]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02218360
    add r0, r4, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xfe]
    mov r0, #0x6
    strb r0, [r4, #0x1fc]
    b .L_02218360
.L_02218190:
    add r0, r4, #0x100
    ldrh r1, [r0, #0xfe]
    cmp r1, #0x5a
    bls .L_02218360
    mov r2, #0x0
    strh r2, [r0, #0xfe]
    mov r0, #0x7
    strb r0, [r4, #0x1fc]
    ldr r0, [r5, #0x24]
    mov r1, #0x46
    bl func_020a68fc
    b .L_02218360
.L_022181c0:
    ldr r0, [r5, #0x24]
    ldr r0, [r0, #0x4a4]
    ldrsh r0, [r0, #0x4]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02218360
    add r2, r4, #0x100
    mov r1, #0x0
    ldr r0, .L_022184f0
    strh r1, [r2, #0xfe]
    mov r2, #0x8
    strb r2, [r4, #0x1fc]
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    mov r2, #0x10
    mov r3, #0x77
    bl DisplayBrightness_StartTransition
    ldr r0, .L_022184f0
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    mov r2, #0x10
    mov r3, #0x77
    bl DisplayBrightness_StartTransition
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    ldr r0, .L_022184dc
    ldr r1, .L_022184e0
    ldr r0, [r0, #0x0]
    mov r2, #0xc
    bl func_020593ac
    mov r0, #0x77
    str r0, [sp, #0x0]
    add r1, r0, #0xb6
    ldr r0, .L_022184dc
    mov r2, #0xc
    ldr r0, [r0, #0x0]
    mov r3, #0x64
    bl func_02059484
    b .L_02218360
.L_0221826c:
    add r1, r4, #0x100
    ldrh r7, [r1, #0xfe]
    cmp r7, #0x78
    bls .L_022182c4
    mov r0, #0x180000
    str r0, [r4, #0x1c]
    mov r0, #0x0
    strh r0, [r1, #0xfe]
    mov r1, #0x9
    strb r1, [r4, #0x1fc]
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
    b .L_02218360
.L_022182c4:
    mov r0, #0xa000
    mul r0, r7, r0
    mov r1, #0x78
    bl func_020befec
    mov r1, #0x6000
    mov r8, r0
    mul r0, r7, r1
    mov r1, #0x78
    bl func_020befec
    mov r5, r0
    bl genrand_int32
    mov r1, r8
    bl func_020bf1f8
    add r0, r8, r8, lsr #0x1f
    sub r0, r1, r0, asr #0x1
    add r0, r0, #0x180000
    str r0, [r4, #0x1c]
    bl genrand_int32
    mov r1, r5
    bl func_020bf1f8
    add r0, r5, r5, lsr #0x1f
    sub r0, r1, r0, asr #0x1
    add r0, r0, #0x1f0000
    str r0, [r4, #0x20]
    add r0, r4, #0x100
    ldrh r0, [r0, #0xfe]
    cmp r0, #0x78
    bls .L_02218360
    mov r1, #0xa
    bl func_020befec
    cmp r1, #0x0
    bne .L_02218360
    ldr r5, .L_022184f4
    mov r0, r6
    mov r1, #0x0
    mov r2, #0x180
    mov r3, #0x198
    str r5, [sp, #0x0]
    bl func_020a2960
.L_02218360:
    add r0, r4, #0x100
    ldrh r2, [r0, #0xfe]
    add r1, r4, #0x200
    mov r7, #0x0
    add r2, r2, #0x1
    strh r2, [r0, #0xfe]
    ldrh r0, [r1, #0x3c]
    add r0, r0, #0x400
    strh r0, [r1, #0x3c]
.L_02218384:
    add r0, r4, r7, lsl #0x2
    ldr r1, [r0, #0x214]
    ldrh r2, [r1, #0x24]
    and r2, r2, #0x10
    mov r2, r2, lsl #0x10
    movs r2, r2, lsr #0x10
    bne .L_0221848c
    ldr r3, .L_022184f8
    mov r2, #0x14
    mla r5, r7, r2, r3
    ldr r3, [r0, #0x228]
    ldr r2, [r5, #0x8]
    add r2, r3, r2
    str r2, [r0, #0x228]
    cmp r2, #0x234000
    blt .L_02218478
    ldrh r0, [r1, #0x24]
    mov r8, #0x0
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r10, [r5, #0x0]
    mov r0, r10, asr #0xc
    sub r9, r0, #0xc
.L_022183e0:
    bl genrand_int32
    mov r11, r0
    bl genrand_int32
    mov r5, r0
    mov r0, r11
    mov r1, #0x18
    bl func_020bf1f8
    and r0, r5, #0x7
    rsb r3, r0, #0x240
    mov r0, #0xf0
    str r0, [sp, #0x0]
    add r2, r9, r1
    mov r0, r6
    mov r1, #0x1
    bl func_020a28e0
    add r8, r8, #0x1
    cmp r8, #0x6
    blt .L_022183e0
    sub r0, r10, #0x180000
    mov r0, r0, asr #0xc
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    cmp r1, #0x7f
    movgt r1, #0x7f
    bgt .L_02218450
    mvn r0, #0x7e
    cmp r1, r0
    movlt r1, r0
.L_02218450:
    str r1, [sp, #0x0]
    mov r1, #0x0
    ldr r0, .L_022184dc
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    ldr r1, .L_022184e0
    mov r2, #0xb
    mov r3, #0x64
    bl func_020593ac
    b .L_0221848c
.L_02218478:
    ldrsh r0, [r1, #0x30]
    ldr r2, [r5, #0xc]
    adds r0, r2, r0
    addmi r0, r0, #0x10000
    strh r0, [r1, #0x30]
.L_0221848c:
    add r7, r7, #0x1
    cmp r7, #0x5
    blt .L_02218384
    ldrb r0, [r4, #0x1fc]
    cmp r0, #0x6
    blo .L_022184c0
    ldr r2, [r4, #0x24c]
    ldr r0, .L_022184fc
    mov r1, #0x3e8
    mul r0, r2, r0
    sub r0, r0, #0x140000
    bl func_020befec
    str r0, [r4, #0x24c]
.L_022184c0:
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022184c8: .word data_021052fc
.L_022184cc: .word gSceneManager
.L_022184d0: .word 0x3f
.L_022184d4: .word data_ov093_022189e8
.L_022184d8: .word gHeapContext
.L_022184dc: .word gSoundContext
.L_022184e0: .word 0x12d
.L_022184e4: .word 0x499a
.L_022184e8: .word data_ov093_022189f0
.L_022184ec: .word 0x163d
.L_022184f0: .word data_020f4dc8
.L_022184f4: .word 0x7fff
.L_022184f8: .word data_ov093_022187f0
.L_022184fc: .word 0x3e3
.size func_ov093_02217c50, . - func_ov093_02217c50

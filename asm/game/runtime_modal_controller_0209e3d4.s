.text
; Matching fallback for the portable implementation in src/game/runtime_modal_controller.c.
.extern DisplayBrightnessPair_GetScreen
.extern DisplayBrightness_GetCurrent
.extern DisplayBrightness_StartTransition
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern Overlay007_HideItems
.extern Overlay007_PopulateItems
.extern Overlay007_UpdateItemFrames
.extern SignedAbsoluteValue
.extern Sound_FadeDirectSequence
.extern Sound_Play
.extern TouchPanelManager_GetPoint
.extern TouchPoint_InitZero
.extern VecFx32Object_Assign
.extern VecFx32Object_Destroy
.extern data_020f3160
.extern func_0209e2f4
.extern func_0209e338
.extern func_0209eb24
.extern func_0209eb34
.extern func_0209f1ec
.extern func_020a63d0
.extern func_020a6548
.extern func_020a6808
.extern func_020a6810
.extern func_020a681c
.extern func_020a68fc
.extern func_ov039_021ff610
.extern func_ov039_02200cd8
.extern func_ov039_02201fec
.extern func_ov039_022077b4
.extern func_ov049_0220bee8
.extern func_ov069_022119bc
.extern func_ov069_022119f8
.extern gDisplayBrightnessPair
.extern gGameWork
.extern gHeapContext
.extern gSoundContext
.extern gTouchPanelManager

.global func_0209e3d4
func_0209e3d4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x58
    ldr r1, .L_0209eb00
    mov r6, r0
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4c
    bl TouchPanelManager_GetPoint
    ldr r0, .L_0209eb00
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    movne r0, #0x0
    strne r0, [r6, #0x8c]
    bne .L_0209e440
    add r0, sp, #0x40
    bl TouchPoint_InitZero
    ldr r1, [sp, #0x50]
    ldr r0, [r6, #0x28]
    ldr r2, [sp, #0x54]
    add r0, r0, r1, lsl #0xc
    str r0, [sp, #0x44]
    ldr r0, [r6, #0x2c]
    add r1, sp, #0x40
    add r2, r0, r2, lsl #0xc
    mov r0, r6
    str r2, [sp, #0x48]
    bl func_0209e338
.L_0209e440:
    ldr r0, [r6, #0x8]
    bl func_ov039_022077b4
    ldr r0, [r6, #0xc]
    bl func_ov049_0220bee8
    ldr r0, [r6, #0x10]
    bl func_0209f1ec
    ldr r0, [r6, #0x14]
    cmp r0, #0x0
    beq .L_0209e468
    bl func_ov039_021ff610
.L_0209e468:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    beq .L_0209e478
    bl func_ov039_02201fec
.L_0209e478:
    ldr r0, [r6, #0x1c]
    cmp r0, #0x0
    beq .L_0209e488
    bl func_ov069_022119f8
.L_0209e488:
    ldr r0, [r6, #0x20]
    bl Overlay007_UpdateItemFrames
    ldr r1, [r6, #0x74]
    cmp r1, #0x0
    beq .L_0209e9ac
    ldr r0, [r6, #0x78]
    cmp r0, #0x0
    beq .L_0209e6e0
    ldr r2, [r6, #0x38]
    ldr r0, [r6, #0x28]
    ldr r1, .L_0209eb04
    sub lr, r2, r0
    umull r0, r7, lr, r1
    mov r2, #0x0
    ldr r4, [r6, #0x3c]
    ldr r3, [r6, #0x2c]
    adds r0, r0, #0x800
    sub r3, r4, r3
    umull ip, r5, r3, r1
    mla r7, lr, r2, r7
    mov r4, lr, asr #0x1f
    mla r7, r4, r1, r7
    adc r7, r7, #0x0
    mov r4, r0, lsr #0xc
    orr r4, r4, r7, lsl #0x14
    adds ip, ip, #0x800
    mla r5, r3, r2, r5
    mov r0, r3, asr #0x1f
    mla r5, r0, r1, r5
    mov r0, r4
    adc r1, r5, #0x0
    mov r5, ip, lsr #0xc
    orr r5, r5, r1, lsl #0x14
    bl SignedAbsoluteValue
    cmp r0, #0x4800
    ble .L_0209e534
    cmp r4, #0x0
    mvnlt r1, #0x0
    blt .L_0209e52c
    movgt r1, #0x1
    movle r1, #0x0
.L_0209e52c:
    mov r0, #0x4800
    mul r4, r1, r0
.L_0209e534:
    mov r0, r5
    bl SignedAbsoluteValue
    cmp r0, #0x4800
    ble .L_0209e560
    cmp r5, #0x0
    mvnlt r1, #0x0
    blt .L_0209e558
    movgt r1, #0x1
    movle r1, #0x0
.L_0209e558:
    mov r0, #0x4800
    mul r5, r1, r0
.L_0209e560:
    mov r0, r4
    bl SignedAbsoluteValue
    ldr r1, .L_0209eb04
    cmp r0, r1
    mov r0, r5
    movle r4, #0x0
    bl SignedAbsoluteValue
    ldr r1, .L_0209eb04
    cmp r0, r1
    ldr r0, [r6, #0x28]
    movle r5, #0x0
    add r0, r0, r4
    str r0, [r6, #0x28]
    ldr r0, [r6, #0x2c]
    cmp r4, #0x0
    add r0, r0, r5
    str r0, [r6, #0x2c]
    cmpeq r5, #0x0
    bne .L_0209e790
    ldr r0, [r6, #0x14]
    mov r4, #0x0
    cmp r0, #0x0
    beq .L_0209e5f0
    ldr r0, .L_0209eb08
    ldr r1, .L_0209eb0c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne .L_0209e5ec
    ldr r0, .L_0209eb08
    mov r1, #0x354
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0209e5f0
.L_0209e5ec:
    mov r4, #0x3c
.L_0209e5f0:
    mov r2, #0x0
    str r2, [r6, #0x78]
    ldr r0, [r6, #0x74]
    cmp r0, #0xb
    bgt .L_0209e640
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b .L_0209e790
.L_0209e610:
    b .L_0209e790
    b .L_0209e654
    b .L_0209e654
    b .L_0209e660
    b .L_0209e674
    b .L_0209e790
    b .L_0209e790
    b .L_0209e680
    b .L_0209e6b8
    b .L_0209e6cc
    b .L_0209e790
    b .L_0209e790
.L_0209e640:
    cmp r0, #0x32
    ldreq r0, [r6, #0x74]
    addeq r0, r0, #0x1
    streq r0, [r6, #0x74]
    b .L_0209e790
.L_0209e654:
    mov r0, #0x1
    str r0, [r6, #0x78]
    b .L_0209e790
.L_0209e660:
    mov r0, #0x180000
    str r0, [r6, #0x38]
    mov r0, #0xc2000
    str r0, [r6, #0x3c]
    b .L_0209e790
.L_0209e674:
    mov r0, #0x1
    str r0, [r6, #0x78]
    b .L_0209e790
.L_0209e680:
    ldr r0, [r6, #0xc4]
    ldr r0, [r0, #0x34]
    bl func_020a6548
    ldr r0, [r6, #0xc4]
    mov r1, r4
    ldr r0, [r0, #0x34]
    mov r2, #0x0
    bl func_020a68fc
    ldr r0, .L_0209eb10
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x6f
    bl Sound_Play
    b .L_0209e790
.L_0209e6b8:
    ldr r0, [r6, #0xc4]
    add r1, r4, #0x1
    ldr r0, [r0, #0x34]
    bl func_020a68fc
    b .L_0209e790
.L_0209e6cc:
    ldr r0, [r6, #0xc4]
    add r1, r4, #0x2
    ldr r0, [r0, #0x34]
    bl func_020a68fc
    b .L_0209e790
.L_0209e6e0:
    ldr r0, [r6, #0xc4]
    ldr r0, [r0, #0x34]
    ldr r0, [r0, #0x4a4]
    ldrsh r0, [r0, #0x4]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0209e790
    cmp r1, #0x17
    blt .L_0209e714
    cmp r1, #0x31
    bne .L_0209e790
.L_0209e714:
    ldr r1, [r6, #0x74]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r6, #0x74]
    str r0, [r6, #0x78]
    ldr r0, [r6, #0x74]
    cmp r0, #0xc
    bgt .L_0209e750
    cmp r0, #0x8
    blt .L_0209e790
    beq .L_0209e75c
    cmp r0, #0x9
    cmpne r0, #0xc
    beq .L_0209e770
    b .L_0209e790
.L_0209e750:
    cmp r0, #0x32
    beq .L_0209e770
    b .L_0209e790
.L_0209e75c:
    mov r0, #0x180000
    str r0, [r6, #0x38]
    mov r0, #0x1bc000
    str r0, [r6, #0x3c]
    b .L_0209e790
.L_0209e770:
    add r0, sp, #0x30
    mov r1, r6
    bl func_0209eb34
    add r1, sp, #0x30
    add r0, r6, #0x34
    bl VecFx32Object_Assign
    add r0, sp, #0x30
    bl VecFx32Object_Destroy
.L_0209e790:
    ldr r1, [r6, #0x74]
    sub r0, r1, #0x17
    cmp r0, #0x1
    bhi .L_0209e830
    mov r0, #0x1
    str r0, [r6, #0x78]
    ldr r1, [r6, #0x14]
    cmp r1, #0x0
    beq .L_0209e7d4
    add r0, sp, #0x20
    bl func_0209eb24
    add r1, sp, #0x20
    add r0, r6, #0x34
    bl VecFx32Object_Assign
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    b .L_0209e7f4
.L_0209e7d4:
    ldr r1, [r6, #0x18]
    add r0, sp, #0x10
    bl func_0209eb24
    add r1, sp, #0x10
    add r0, r6, #0x34
    bl VecFx32Object_Assign
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
.L_0209e7f4:
    ldr r1, [r6, #0x3c]
    ldr r0, [r6, #0x4c]
    add r0, r1, r0
    str r0, [r6, #0x3c]
    ldr r0, [r6, #0x38]
    sub r0, r0, #0x80000
    str r0, [r6, #0x38]
    ldr r0, [r6, #0x1c]
    cmp r0, #0x0
    ldr r0, [r6, #0x3c]
    subne r0, r0, #0x50000
    strne r0, [r6, #0x3c]
    subeq r0, r0, #0x6e000
    streq r0, [r6, #0x3c]
    b .L_0209e9ac
.L_0209e830:
    cmp r1, #0x19
    bne .L_0209e870
    mov r0, #0x1
    str r0, [r6, #0x78]
    ldr r1, [r6, #0x8]
    add r0, r6, #0x34
    ldr r1, [r1, #0x48]
    add r1, r1, #0x2c
    bl VecFx32Object_Assign
    ldr r0, [r6, #0x38]
    sub r0, r0, #0x80000
    str r0, [r6, #0x38]
    ldr r0, [r6, #0x3c]
    sub r0, r0, #0x60000
    str r0, [r6, #0x3c]
    b .L_0209e9ac
.L_0209e870:
    cmp r1, #0xa
    cmpne r1, #0xd
    cmpne r1, #0x33
    bne .L_0209e8bc
    mov r0, #0x1
    mov r1, #0x0
    str r0, [r6, #0x7c]
    str r1, [r6, #0x74]
    str r1, [r6, #0x78]
    ldr r0, [r6, #0xc4]
    sub r1, r1, #0x1
    ldr r0, [r0, #0x34]
    bl func_020a63d0
    ldr r0, .L_0209eb10
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x3a
    bl Sound_Play
    b .L_0209e9ac
.L_0209e8bc:
    cmp r1, #0x2b
    bne .L_0209e984
    mov r0, r6
    bl func_0209e2f4
    mov r4, #0x2c
    ldr r0, .L_0209eb14
    ldr r1, .L_0209eb18
    ldr r3, .L_0209eb1c
    mov r2, #0x4
    str r4, [r6, #0x74]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0209e8fc
    ldr r2, [r6, #0x0]
    mov r1, r6
    bl func_ov039_02200cd8
.L_0209e8fc:
    str r0, [r6, #0x18]
    ldr r0, [r6, #0x1c]
    cmp r0, #0x0
    beq .L_0209e910
    bl func_ov069_022119bc
.L_0209e910:
    ldr r0, .L_0209eb20
    mov r1, #0x0
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x10
    mov r2, #0x0
    mov r3, #0x3c
    bl DisplayBrightness_StartTransition
    mov r0, #0x1
    str r0, [r6, #0x78]
    ldr r1, [r6, #0x18]
    add r0, sp, #0x0
    bl func_0209eb24
    add r1, sp, #0x0
    add r0, r6, #0x34
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldr r1, [r6, #0x38]
    add r0, r6, #0x24
    sub r1, r1, #0x80000
    str r1, [r6, #0x38]
    ldr r2, [r6, #0x3c]
    add r1, r6, #0x34
    sub r2, r2, #0x6e000
    str r2, [r6, #0x3c]
    bl VecFx32Object_Assign
    mov r0, #0x0
    str r0, [r6, #0x4c]
    b .L_0209e9ac
.L_0209e984:
    cmp r1, #0x2e
    beq .L_0209e9ac
    cmp r1, #0x30
    bne .L_0209e9ac
    ldr r0, [r6, #0xc4]
    mov r1, #0x2
    ldr r0, [r0, #0x34]
    bl func_020a63d0
    mov r0, #0x31
    str r0, [r6, #0x74]
.L_0209e9ac:
    ldr r0, [r6, #0xc4]
    ldr r0, [r0, #0x34]
    bl func_020a6808
    movs r4, r0
    beq .L_0209eab0
    ldr r0, .L_0209eb20
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    bl DisplayBrightness_GetCurrent
    mvn r1, #0xf
    cmp r0, r1
    bne .L_0209eab0
    add r0, r1, #0xf
    cmp r4, r0
    bne .L_0209ea18
    ldr r0, [r6, #0xc4]
    mov r1, #0x3
    ldr r0, [r0, #0x34]
    ldr r0, [r0, #0x4a4]
    strh r1, [r0, #0x4]
    ldr r0, [r6, #0xc4]
    ldr r0, [r0, #0x34]
    bl func_020a6810
    ldr r0, [r6, #0x20]
    ldr r1, [r6, #0x4]
    bl Overlay007_PopulateItems
    b .L_0209eab0
.L_0209ea18:
    cmp r4, #0x1
    ldr r0, [r6, #0x20]
    bne .L_0209ea6c
    bl Overlay007_HideItems
    ldr r0, [r6, #0xc4]
    ldr r0, [r0, #0x34]
    bl func_020a6810
    ldr r0, [r6, #0xc4]
    ldr r0, [r0, #0x34]
    bl func_020a6548
    ldr r0, [r6, #0xc4]
    mov r1, #0xc
    ldr r0, [r0, #0x34]
    mov r2, #0x1
    bl func_020a68fc
    ldr r0, .L_0209eb10
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x6f
    bl Sound_Play
    b .L_0209eab0
.L_0209ea6c:
    bl Overlay007_HideItems
    ldr r0, [r6, #0xc4]
    ldr r0, [r0, #0x34]
    bl func_020a6810
    ldr r0, [r6, #0xc4]
    ldr r0, [r0, #0x34]
    bl func_020a6548
    ldr r0, [r6, #0xc4]
    mov r1, #0x63
    ldr r0, [r0, #0x34]
    mov r2, #0x1
    bl func_020a68fc
    ldr r0, .L_0209eb10
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x6f
    bl Sound_Play
.L_0209eab0:
    ldr r0, [r6, #0x7c]
    cmp r0, #0x0
    beq .L_0209eaec
    add r0, r0, #0x1
    str r0, [r6, #0x7c]
    cmp r0, #0x1e
    ble .L_0209eaec
    ldr r0, .L_0209eb10
    mov r1, #0x60
    ldr r0, [r0, #0x0]
    mov r2, #0x78
    mov r3, #0x0
    bl Sound_FadeDirectSequence
    mov r0, #0x0
    str r0, [r6, #0x7c]
.L_0209eaec:
    ldr r0, [r6, #0xc4]
    ldr r0, [r0, #0x34]
    bl func_020a681c
    add sp, sp, #0x58
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0209eb00: .word gTouchPanelManager
.L_0209eb04: .word 0x19a
.L_0209eb08: .word gGameWork
.L_0209eb0c: .word 0x14d
.L_0209eb10: .word gSoundContext
.L_0209eb14: .word 0x1d58
.L_0209eb18: .word data_020f3160
.L_0209eb1c: .word gHeapContext
.L_0209eb20: .word gDisplayBrightnessPair
.size func_0209e3d4, . - func_0209e3d4

.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_constructor.c. */
.extern data_020c9670
.extern data_020cdc1c
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov026_02204750
.extern data_ov026_02204944
.extern data_ov026_02204a70
.extern data_ov026_02204a78
.extern data_ov026_02204a80
.extern data_ov026_02204a88
.extern data_ov026_02204a90
.extern data_ov026_02204a98
.extern data_ov026_02204aa0
.extern data_ov026_02204aa8
.extern data_ov026_02204ab0
.extern data_ov026_02204ab8
.extern func_02071adc
.extern GraphicsResourceSetVariant_Init
.extern GraphicsResourceSetVariant_Load
.extern GraphicsSpriteRenderer_HideAllSprites
.extern func_02075238
.extern GraphicsAnimationInstanceManager_CreateInstance
.extern Graphics3DResourceOwner_Init
.extern Graphics3DResourceOwner_CreateManager
.extern Graphics3DResourceOwner_PrepareResources
.extern Graphics3DLightSet_Init
.extern Graphics3DSceneState_Init
.extern func_0209189c
.extern func_020918f4
.extern func_02091b6c
.extern func_02091e28
.extern func_02092364
.extern func_020923a4
.extern PresentationScalar_SetImmediate
.extern Presentation_InitVariant
.extern Presentation_SetPosition
.extern PresentationList_Append
.extern func_020ae6dc
.extern func_020befec
.extern func_ov026_021fce54
.extern func_ov026_021fd030
.extern func_ov026_021fd370
.extern func_ov026_021fd5b0
.extern func_ov026_021fe680
.extern func_ov026_021fe92c
.extern func_ov026_021fec6c
.extern func_ov026_021fef9c
.extern func_ov026_021ff7f0
.extern func_ov026_021ff830
.extern func_ov026_021ff878
.extern func_ov026_0220035c
.extern func_ov026_02200390
.extern func_ov026_02200d20
.extern func_ov043_0220b740
.extern G3X_Init
.extern gDebugFont
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov026_021ff8a0
func_ov026_021ff8a0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r7, r0
    mov r4, r1
    mov r6, r2
    mov r5, r3
    bl func_02091e28
    ldr r1, L_021ffff0
    add r0, r7, #0x7c
    str r1, [r7, #0x0]
    str r4, [r7, #0x54]
    str r6, [r7, #0x60]
    str r5, [r7, #0x64]
    bl GraphicsResourceSetVariant_Init
    add r0, r7, #0x88
    bl GraphicsResourceSetVariant_Init
    add r0, r7, #0x94
    bl GraphicsResourceSetVariant_Init
    add r0, r7, #0xa0
    bl GraphicsResourceSetVariant_Init
    add r0, r7, #0xac
    bl GraphicsResourceSetVariant_Init
    add r0, r7, #0x180
    bl Graphics3DLightSet_Init
    add r0, r7, #0x1c0
    bl Graphics3DSceneState_Init
    add r0, r7, #0x254
    bl Graphics3DSceneState_Init
    add r0, r7, #0x2f4
    bl func_ov026_021ff7f0
    add r0, r7, #0x304
    bl func_ov026_021ff7f0
    add r0, r7, #0x314
    bl func_ov026_021ff7f0
    add r0, r7, #0x328
    bl func_02092364
    add r0, r7, #0x370
    bl func_ov043_0220b740 ; func_ov044_0220b740, func_ov045_0220b740, func_ov046_0220b740, func_ov047_0220b740, func_ov048_0220b740, func_ov049_0220b740
    mov r0, #0x0
    str r0, [r7, #0x7a4]
    add r0, r7, #0x3a8
    add r0, r0, #0x400
    bl func_02091b6c
    ldr r0, L_021ffff4
    cmp r4, r0
    moveq r0, #0x0
    streq r0, [r7, #0x58]
    beq L_021ff984
    ldr r0, [r7, #0x54]
    subs r0, r0, #0x1
    str r0, [r7, #0x58]
    movmi r0, #0x0
    strmi r0, [r7, #0x58]
    bmi L_021ff984
    cmp r0, #0x9
    movgt r0, #0x0
    strgt r0, [r7, #0x58]
L_021ff984:
    ldr r1, [r7, #0x64]
    ldr r0, [r7, #0x60]
    sub r0, r1, r0
    str r0, [r7, #0x5c]
    bl G3X_Init
    mov r1, #0x0
    add r0, r7, #0x328
    str r1, [r7, #0x50]
    bl func_020923a4
    ldr r0, L_021ffff8
    ldr r0, [r0, #0x0]
    bl func_02075238
    ldr r0, L_021ffff8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_HideAllSprites
    ldr r0, L_021ffffc
    ldr r0, [r0, #0x0]
    bl func_02075238
    ldr r0, L_021ffffc
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_HideAllSprites
    bl func_020ae6dc
    ldr r0, L_02200000
    ldr r1, L_02200004
    mov r2, #0x4
    ldr r3, L_02200008
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffa04
    mov r1, #0x4
    mov r2, #0x2
    bl Graphics3DResourceOwner_Init
L_021ffa04:
    str r0, [r7, #0x68]
    bl Graphics3DResourceOwner_CreateManager
    str r0, [r7, #0x6c]
    ldr r0, [r7, #0x68]
    bl Graphics3DResourceOwner_CreateManager
    str r0, [r7, #0x70]
    ldr r0, [r7, #0x68]
    bl Graphics3DResourceOwner_CreateManager
    str r0, [r7, #0x74]
    ldr r0, [r7, #0x68]
    bl Graphics3DResourceOwner_CreateManager
    ldr r3, L_0220000c
    str r0, [r7, #0x78]
    ldr r1, L_02200010
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r7, #0x7c
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    ldr r0, [r7, #0x68]
    add r1, r7, #0x7c
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_02200014
    ldr r1, L_02200010
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r7, #0x88
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    ldr r0, [r7, #0x68]
    add r1, r7, #0x88
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_02200018
    ldr r1, L_02200010
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r7, #0x94
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    ldr r0, [r7, #0x68]
    add r1, r7, #0x94
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_0220001c
    ldr r1, L_02200010
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r7, #0xa0
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    ldr r0, [r7, #0x68]
    add r1, r7, #0xa0
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_02200020
    ldr r1, L_02200010
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r7, #0xac
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    ldr r0, [r7, #0x68]
    add r1, r7, #0xac
    bl Graphics3DResourceOwner_PrepareResources
    ldr r0, L_02200010
    mov r1, #0x5000
    ldr r0, [r0, #0x0]
    bl func_02071adc
    str r0, [r7, #0x15c]
    ldr r1, L_02200024
    ldr r3, L_02200008
    mov r0, #0x9c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffb44
    bl Presentation_InitVariant
L_021ffb44:
    str r0, [r7, #0x2e8]
    mov r1, r0
    add r0, r7, #0x2f4
    bl PresentationList_Append
    ldr r1, L_02200024
    ldr r3, L_02200008
    mov r0, #0x9c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffb74
    bl Presentation_InitVariant
L_021ffb74:
    str r0, [r7, #0x2ec]
    mov r1, r0
    add r0, r7, #0x2f4
    bl PresentationList_Append
    ldr r1, L_02200024
    ldr r3, L_02200008
    mov r0, #0x9c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffba4
    bl Presentation_InitVariant
L_021ffba4:
    str r0, [r7, #0x2f0]
    mov r1, r0
    add r0, r7, #0x2f4
    bl PresentationList_Append
    ldr r1, L_02200028
    ldr r3, L_02200008
    mov r0, #0x140
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffbd8
    ldr r1, [r7, #0x68]
    bl func_ov026_021fef9c
L_021ffbd8:
    str r0, [r7, #0x160]
    mov r1, r0
    add r0, r7, #0x2f4
    bl PresentationList_Append
    ldr r1, L_0220002c
    ldr r3, L_02200008
    mov r0, #0xbc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffc10
    ldr r1, [r7, #0x68]
    ldr r2, [r7, #0x58]
    bl func_ov026_021fd030
L_021ffc10:
    str r0, [r7, #0x164]
    mov r1, r0
    add r0, r7, #0x2f4
    bl PresentationList_Append
    ldr r1, L_02200030
    ldr r3, L_02200008
    mov r0, #0xb8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffc40
    bl func_ov026_021fd370
L_021ffc40:
    str r0, [r7, #0x168]
    mov r1, r0
    add r0, r7, #0x2f4
    bl PresentationList_Append
    ldr r1, L_02200034
    ldr r3, L_02200008
    mov r0, #0xc8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffc70
    bl func_ov026_021fe680
L_021ffc70:
    str r0, [r7, #0x16c]
    mov r1, r0
    add r0, r7, #0x2f4
    bl PresentationList_Append
    ldr r1, L_02200038
    ldr r3, L_02200008
    mov r0, #0xac
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffca4
    ldr r1, [r7, #0x68]
    bl func_ov026_021fe92c
L_021ffca4:
    str r0, [r7, #0x170]
    mov r1, r0
    add r0, r7, #0x2f4
    bl PresentationList_Append
    ldr r1, L_0220003c
    ldr r3, L_02200008
    mov r0, #0xb0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffcd4
    bl func_ov026_021fec6c
L_021ffcd4:
    str r0, [r7, #0x174]
    mov r1, r0
    add r0, r7, #0x2f4
    bl PresentationList_Append
    ldr r1, L_02200040
    ldr r3, L_02200008
    mov r0, #0xb0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffd10
    ldr r1, [r7, #0x15c]
    ldr r3, L_02200044
    mov r2, #0x7
    bl func_ov026_021fce54
L_021ffd10:
    str r0, [r7, #0x178]
    mov r1, r0
    add r0, r7, #0x2f4
    bl PresentationList_Append
    ldr r0, [r7, #0x178]
    ldr r1, L_02200048
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r1, L_0220004c
    ldr r3, L_02200008
    mov r0, #0xa4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffd54
    ldr r1, [r7, #0x68]
    bl func_ov026_021fd5b0
L_021ffd54:
    str r0, [r7, #0x17c]
    mov r1, r0
    add r0, r7, #0x2f4
    bl PresentationList_Append
    mov r0, r7
    mov r1, #0x8000
    mov r2, #0x2000
    mov r3, #0x0
    bl func_ov026_02200d20
    ldr r0, [r7, #0x2e8]
    mov r1, #0x1000
    add r0, r0, #0x1c
    bl PresentationScalar_SetImmediate
    mov r1, #0x0
    ldr r0, [r7, #0x2ec]
    mov r2, r1
    mov r3, r1
    bl Presentation_SetPosition
    mov r5, #0x0
    ldr r10, L_02200050
    str r5, [r7, #0x7a4]
    add r8, r7, #0x3a4
    mov r9, #0x3
    mov r11, #0x40
L_021ffdb4:
    ldr r1, L_02200054
    add r0, r8, #0x400
    mov r2, #0x800
    bl func_0209189c
    mov r4, r0
    mov r0, r5, lsl #0x10
    mov r1, #0x18
    bl func_020befec
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r6, r0, lsl #0x1
    ldr r0, [r7, #0x70]
    add r1, r7, #0x7c
    bl GraphicsAnimationInstanceManager_CreateInstance
    add r2, r7, r5, lsl #0x2
    str r0, [r2, #0xf8]
    add r0, r10, r6, lsl #0x1
    ldrsh lr, [r0, #0x2]
    mov ip, r6, lsl #0x1
    mov r1, #0x0
    smull r6, r0, lr, r4
    adds lr, r6, #0x800
    mov r6, r1
    adc r0, r0, r6
    mov r6, lr, lsr #0xc
    orr r6, r6, r0, lsl #0x14
    stmia sp, {r6, r9, r11}
    ldr r0, [r2, #0xf8]
    ldrsh r2, [r10, ip]
    mov r3, #0xcd
    smull r6, r4, r2, r4
    adds r6, r6, #0x800
    mov r2, r1
    adc r4, r4, r2
    mov r2, r6, lsr #0xc
    orr r2, r2, r4, lsl #0x14
    bl func_ov026_021ff830
    add r2, r7, r5, lsl #0x2
    add r5, r5, #0x1
    ldr r1, [r2, #0xf8]
    mov r0, #0x8000
    str r0, [r1, #0x44]
    ldr r1, [r2, #0xf8]
    mov r0, #0x1
    cmp r5, #0x18
    strb r0, [r1, #0x57]
    blt L_021ffdb4
    ldr r9, L_02200058
    ldr r10, L_02200050
    mov r4, #0x0
    add r8, r7, #0x3a4
    add r6, r9, #0xf1
L_021ffe88:
    add r0, r8, #0x400
    mov r1, #0x1000
    bl func_020918f4
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r5, r0, lsl #0x1
    ldr r0, [r7, #0x74]
    add r1, r7, #0x88
    bl GraphicsAnimationInstanceManager_CreateInstance
    add r2, r7, r4, lsl #0x2
    str r0, [r2, #0xb8]
    add r0, r10, r5, lsl #0x1
    ldrsh r3, [r0, #0x2]
    mov r11, r5, lsl #0x1
    mov r1, #0x0
    mov r5, r3, asr #0x1f
    mov r5, r5, lsl #0xb
    mov ip, #0x800
    orr r5, r5, r3, lsr #0x15
    adds r3, ip, r3, lsl #0xb
    mov ip, r1
    adc r5, r5, ip
    mov r3, r3, lsr #0xc
    orr r3, r3, r5, lsl #0x14
    add r0, r4, #0x4
    str r3, [sp, #0x0]
    stmib sp, {r0, r9}
    ldr r0, [r2, #0xb8]
    mul r2, r4, r6
    ldrsh r5, [r10, r11]
    add r3, r2, #0x800
    mov r2, r5, asr #0x1f
    mov r11, r2, lsl #0xb
    mov r2, #0x800
    adds ip, r2, r5, lsl #0xb
    orr r11, r11, r5, lsr #0x15
    mov r2, r1
    adc r5, r11, r2
    mov r2, ip, lsr #0xc
    orr r2, r2, r5, lsl #0x14
    bl func_ov026_021ff830
    add r2, r7, r4, lsl #0x2
    add r4, r4, #0x1
    ldr r1, [r2, #0xb8]
    mov r0, #0x2000
    str r0, [r1, #0x38]
    str r0, [r1, #0x34]
    ldr r1, [r2, #0xb8]
    mov r0, #0x8000
    str r0, [r1, #0x44]
    cmp r4, #0x10
    blt L_021ffe88
    ldr r0, [r7, #0x6c]
    add r1, r7, #0xac
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r0, [r7, #0x158]
    str r1, [sp, #0x0]
    mov r0, #0x19
    str r0, [sp, #0x4]
    mov r0, #0x44
    str r0, [sp, #0x8]
    ldr r0, [r7, #0x158]
    mov r2, r1
    mov r3, r1
    bl func_ov026_021ff830
    mov r0, #0x0
    str r0, [r7, #0x324]
    mov r1, #0x20
    mov r0, r7
    str r1, [r7, #0x36c]
    bl func_ov026_02200390
    ldr r1, [r7, #0x64]
    mov r0, r7
    str r1, [sp, #0x0]
    ldr r1, L_0220005c
    ldr r3, [r7, #0x60]
    ldmia r1, {r1, r2}
    bl func_ov026_0220035c
    mov r0, r7
    ldr r1, L_02200060
    ldmia r1, {r1, r2}
    bl func_ov026_021ff878
    ldr r1, [r7, #0x20]
    mov r0, r7
    orr r1, r1, #0x400
    str r1, [r7, #0x20]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021ffff0: .word data_ov026_02204944
L_021ffff4: .word 0x3e7
L_021ffff8: .word data_020f4e14
L_021ffffc: .word gDebugFont
L_02200000: .word 0x624
L_02200004: .word data_ov026_02204a70
L_02200008: .word gHeapContext
L_0220000c: .word 0x6029
L_02200010: .word data_020f4e18
L_02200014: .word 0x6026
L_02200018: .word 0x6023
L_0220001c: .word 0x602f
L_02200020: .word 0x602c
L_02200024: .word data_ov026_02204a78
L_02200028: .word data_ov026_02204a80
L_0220002c: .word data_ov026_02204a88
L_02200030: .word data_ov026_02204a90
L_02200034: .word data_ov026_02204a98
L_02200038: .word data_ov026_02204aa0
L_0220003c: .word data_ov026_02204aa8
L_02200040: .word data_ov026_02204ab0
L_02200044: .word 0x7fff
L_02200048: .word 0x63d
L_0220004c: .word data_ov026_02204ab8
L_02200050: .word data_020c9670
L_02200054: .word 0x4cd
L_02200058: .word 0x242
L_0220005c: .word data_020cdc1c
L_02200060: .word data_ov026_02204750
.size func_ov026_021ff8a0, .-func_ov026_021ff8a0


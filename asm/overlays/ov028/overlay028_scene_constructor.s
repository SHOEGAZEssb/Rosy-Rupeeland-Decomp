.text

/* Exact fallback; see src/overlays/ov028/overlay028_scene_constructor.c. */
.extern data_020f4e14
.extern data_020f4e18
.extern data_021052fc
.extern data_ov028_021ff210
.extern data_ov028_021ff238
.extern data_ov028_021ff250
.extern data_ov028_021ff2ac
.extern data_ov028_021ff2d8
.extern data_ov028_021ff2e0
.extern func_02071ea4
.extern func_02071ee0
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_02073e48
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroup_ReplaceStateResources
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_02091e28
.extern func_02092798
.extern func_02092814
.extern IndexedSelectionController_Init
.extern Presentation_SetPosition
.extern PresentationList_Append
.extern SpritePresentation_Init
.extern SpritePresentation_Hide
.extern func_020957bc
.extern func_020957f0
.extern func_02095820
.extern func_ov028_021fce00
.extern func_ov028_021fd680
.extern func_ov028_021fda98
.extern func_ov028_021fdad8
.extern func_ov028_021fdf94
.extern func_ov028_021fe1b0
.extern func_ov028_021fe3a4
.extern gDebugFont
.extern genrand_int32
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov028_021fdb00
func_ov028_021fdb00:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    bl func_02091e28
    ldr r1, L_021fdf58
    add r0, r10, #0x5c
    str r1, [r10, #0x0]
    bl func_02071ea4
    add r0, r10, #0x68
    bl func_02071ea4
    add r0, r10, #0x74
    bl func_02071ea4
    add r0, r10, #0x98
    bl func_020957bc
    add r0, r10, #0x144
    bl func_020957bc
    add r0, r10, #0x1fc
    bl func_02092798
    add r0, r10, #0x228
    bl IndexedSelectionController_Init
    add r0, r10, #0x264
    bl func_ov028_021fda98
    mov r0, #0x0
    str r0, [r10, #0x27c]
    add r0, r10, #0x280
    bl func_ov028_021fce00
    bl genrand_int32
    str r0, [r10, #0x27c]
    mov r0, #0x0
    str r0, [r10, #0x220]
    add r0, r10, #0x274
    ldr r1, L_021fdf5c
    bl func_ov028_021fdf94
    mov r0, r10
    bl func_ov028_021fe1b0
    add r0, r10, #0x1fc
    ldr r1, L_021fdf60
    bl func_02092814
    add r0, r10, #0x1fc
    ldr r1, L_021fdf64
    bl func_02092814
    mov r0, #0x5f
    str r0, [sp, #0x0]
    add r0, r10, #0x5c
    ldr r1, L_021fdf68
    mov r2, #0x5d
    ldr r1, [r1, #0x0]
    mov r3, #0x5e
    bl func_02071ee0
    mov r0, #0x20
    str r0, [sp, #0x0]
    add r0, r10, #0x68
    ldr r1, L_021fdf68
    mov r2, #0x1f
    ldr r1, [r1, #0x0]
    mov r3, #0x1
    bl func_02071ee0
    ldr r1, L_021fdf6c
    add r0, r10, #0x74
    str r1, [sp, #0x0]
    sub r2, r1, #0x1
    ldr r1, L_021fdf68
    ldr r3, L_021fdf70
    ldr r1, [r1, #0x0]
    bl func_02071ee0
    ldr r0, L_021fdf74
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r1, L_021fdf78
    str r0, [r10, #0x54]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0x58]
    mov r0, r10
    bl func_ov028_021fe1b0
    mov r0, r10
    bl func_ov028_021fe3a4
    ldr r0, [r10, #0x54]
    add r1, r10, #0x68
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0x8c]
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x8c]
    mov r2, #0x84
    mov r3, #0x1e
    bl func_02073e48
    ldr r0, [r10, #0x54]
    add r1, r10, #0x5c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r10, #0x98
    mov r2, #0x1
    mov r3, r2
    bl func_020957f0
    add r0, r10, #0x98
    mov r1, #0x80
    mov r2, #0xaa
    bl func_02095820
    ldr r0, [r10, #0x54]
    add r1, r10, #0x5c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r2, #0x0
    str r2, [sp, #0x0]
    add r0, r10, #0x144
    mov r3, #0x1
    bl func_020957f0
    add r0, r10, #0x144
    mov r1, #0xe8
    mov r2, #0xaa
    bl func_02095820
    mov r0, #0xa0
    ldr r1, L_021fdf7c
    mov r2, #0x4
    ldr r3, L_021fdf80
    bl Heap_Alloc
    mov r4, r0
    cmp r4, #0x0
    beq L_021fdd24
    ldr r0, [r10, #0x58]
    add r1, r10, #0x74
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, r4
    bl SpritePresentation_Init
    mov r4, r0
L_021fdd24:
    mov r1, r4
    str r4, [r10, #0x260]
    add r0, r10, #0x264
    bl PresentationList_Append
    ldr r0, [r10, #0x260]
    mov r1, #0x7
    ldr r0, [r0, #0x9c]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r10, #0x260]
    mov r3, #0x0
    ldr r1, [r0, #0x9c]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x6
    strh r0, [r1, #0x24]
    ldr r0, [r10, #0x260]
    ldr r1, [r10, #0x274]
    ldr r2, [r10, #0x278]
    bl Presentation_SetPosition
    ldr r6, L_021fdf7c
    ldr r4, L_021fdf80
    mov r9, #0x0
    mov r11, #0x1
    mov r7, #0xa0
    mov r5, #0x4
L_021fdd84:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl Heap_Alloc
    movs r8, r0
    beq L_021fddc0
    ldr r0, [r10, #0x54]
    add r1, r10, #0x5c
    mov r2, r11
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, r8
    bl SpritePresentation_Init
    mov r8, r0
L_021fddc0:
    add r0, r10, r9, lsl #0x2
    str r8, [r0, #0x1f0]
    mov r1, r8
    add r0, r10, #0x264
    bl PresentationList_Append
    cmp r9, #0x0
    movne r0, #0xf0
    moveq r0, #0x10
    mov r1, r0, lsl #0xc
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x1f0]
    mov r2, #0x4a000
    mov r3, #0x0
    bl Presentation_SetPosition
    cmp r9, #0x0
    movne r0, #0x5
    moveq r0, #0x3
    and r1, r0, #0xff
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x1f0]
    ldr r0, [r0, #0x9c]
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x1f0]
    bl SpritePresentation_Hide
    add r9, r9, #0x1
    cmp r9, #0x2
    blt L_021fdd84
    ldr r1, L_021fdf84
    ldr r3, L_021fdf80
    mov r0, #0x74
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fde58
    ldr r1, L_021fdf74
    ldr r1, [r1, #0x0]
    bl func_ov028_021fd680
L_021fde58:
    ldr r1, L_021fdf88
    str r0, [r10, #0x224]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x2000
    ldr r1, [r0, #0xea4]
    ldr r0, [r1, #0x58]
    str r0, [r10, #0x90]
    cmp r0, #0x0
    beq L_021fdefc
    ldr r0, [r0, #0x14]
    str r0, [r10, #0x80]
    ldr r0, [r10, #0x90]
    ldr r0, [r0, #0x18]
    str r0, [r10, #0x84]
    ldr r0, [r10, #0x90]
    ldr r0, [r0, #0x1c]
    str r0, [r10, #0x88]
    ldr r0, [r10, #0x90]
    ldrb r0, [r0, #0x38]
    str r0, [r10, #0x94]
    ldr r3, [r1, #0x208]
    ldr r1, [r10, #0x90]
    ldr r0, [r3, #0xc]
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x0]
    ldmib r3, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r0, [r10, #0x90]
    mov r1, #0xc
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r10, #0x90]
    mov r1, #0x100
    strh r1, [r0, #0x36]
    ldr r1, [r10, #0x90]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r10, #0x90]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
L_021fdefc:
    ldr r0, [r10, #0x220]
    ldr r0, [r0, #0x40]
    cmp r0, #0x0
    bne L_021fdf30
    ldr r0, [r10, #0x20]
    ldr r1, L_021fdf8c
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r10, #0x20]
    mov r0, r10
    ldmia r1, {r1, r2}
    bl func_ov028_021fdad8
    b L_021fdf40
L_021fdf30:
    ldr r1, L_021fdf90
    mov r0, r10
    ldmia r1, {r1, r2}
    bl func_ov028_021fdad8
L_021fdf40:
    ldr r1, [r10, #0x20]
    mov r0, r10
    orr r1, r1, #0x400
    str r1, [r10, #0x20]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fdf58: .word data_ov028_021ff2ac
L_021fdf5c: .word data_ov028_021ff238
L_021fdf60: .word 0x7007
L_021fdf64: .word 0x7005
L_021fdf68: .word data_020f4e18
L_021fdf6c: .word 0x138b
L_021fdf70: .word 0x1078
L_021fdf74: .word data_020f4e14
L_021fdf78: .word gDebugFont
L_021fdf7c: .word data_ov028_021ff2d8
L_021fdf80: .word gHeapContext
L_021fdf84: .word data_ov028_021ff2e0
L_021fdf88: .word data_021052fc
L_021fdf8c: .word data_ov028_021ff250
L_021fdf90: .word data_ov028_021ff210
.size func_ov028_021fdb00, .-func_ov028_021fdb00

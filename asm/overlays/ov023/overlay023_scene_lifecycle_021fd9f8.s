.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_lifecycle.c. */
.extern __construct_array
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov023_021ffb60
.extern data_ov023_021ffbc4
.extern data_ov023_021ffbf0
.extern data_ov023_021ffbf8
.extern func_020716bc
.extern AnimationResourceState_InitEmbedded
.extern func_02071ee0
.extern GraphicsSpriteState_ApplyRenderConfig
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_02091b6c
.extern SceneInputBase_Init
.extern TitleScreenResourceCollection_Init
.extern func_02092754
.extern TitleCharacterResourceCollection_Init
.extern func_02092814
.extern func_020929b0
.extern TitleDialog_Init
.extern IndexedSelectionController_Init
.extern Presentation_SetPosition
.extern SpritePresentation_Init
.extern SpritePresentation_SyncPosition
.extern func_020957bc
.extern func_020957f0
.extern func_02095820
.extern func_020afd0c
.extern func_ov023_021fd9b4
.extern func_ov023_021fd9b8
.extern func_ov023_021fd9d0
.extern func_ov023_021fe164
.extern func_ov023_021fe270
.extern func_ov023_021fe2cc
.extern func_ov023_021fe39c
.extern func_ov023_021fe640
.extern func_ov023_021fe994
.extern gDebugFont
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov023_021fd9f8
func_ov023_021fd9f8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    bl SceneInputBase_Init
    ldr r1, L_021fddc4
    add r0, r10, #0x54
    str r1, [r10, #0x0]
    bl TitleCharacterResourceCollection_Init
    add r0, r10, #0x78
    bl TitleScreenResourceCollection_Init
    add r0, r10, #0xbc
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0xd0
    bl func_020957bc
    add r0, r10, #0x17c
    bl func_020957bc
    ldr r1, L_021fddc8
    ldr r3, L_021fddcc
    str r1, [sp, #0x0]
    add r0, r10, #0x228
    mov r1, #0x2
    mov r2, #0xac
    bl __construct_array
    add r0, r10, #0x480
    bl IndexedSelectionController_Init
    add r0, r10, #0xc4
    add r0, r0, #0x400
    bl func_020929b0
    add r0, r10, #0xdc
    add r0, r0, #0x400
    bl func_02091b6c
    mov r2, #0x0
    str r2, [r10, #0x4bc]
    str r2, [r10, #0x390]
    mov r1, r2
L_021fda84:
    add r0, r10, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0x430]
    cmp r2, #0x12
    blt L_021fda84
    str r1, [r10, #0x478]
    str r1, [r10, #0x394]
    str r1, [r10, #0x47c]
    ldr r0, L_021fddd0
    ldr r1, L_021fddd4
    ldr r0, [r0, #0x0]
    bl func_020716bc
    str r0, [r10, #0x4c0]
    ldr r1, L_021fddd8
    add r0, r10, #0x54
    bl func_02092814
    ldr r1, L_021fdddc
    add r0, r10, #0x54
    bl func_02092814
    ldr r1, L_021fdde0
    add r0, r10, #0x78
    bl func_02092754
    ldr r1, L_021fdde4
    add r0, r10, #0x78
    bl func_02092754
    mov r0, #0x3f
    str r0, [sp, #0x0]
    ldr r1, L_021fddd0
    add r0, r10, #0xbc
    ldr r1, [r1, #0x0]
    mov r2, #0x3d
    mov r3, #0x3e
    bl func_02071ee0
    mov r0, r10
    bl func_ov023_021fe164
    mov r0, r10
    bl func_ov023_021fe270
    mov r0, r10
    bl func_ov023_021fe2cc
    ldr r0, L_021fdde8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0xc8]
    add r1, r10, #0xbc
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0xcc]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    ldr r0, [r10, #0xcc]
    mov r1, #0x14
    mov r2, #0x86
    mov r3, #0x2d
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r10, #0xc8]
    add r1, r10, #0xbc
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r10, #0xd0
    mov r2, #0x6
    mov r3, #0x1
    bl func_020957f0
    add r0, r10, #0xd0
    mov r1, #0x80
    mov r2, #0xaa
    bl func_02095820
    ldr r0, [r10, #0xc8]
    add r1, r10, #0xbc
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r4, #0x0
    add r0, r10, #0x17c
    mov r2, #0x2
    mov r3, #0x1
    str r4, [sp, #0x0]
    bl func_020957f0
    add r0, r10, #0x17c
    mov r1, #0xe4
    mov r2, #0xaa
    bl func_02095820
    mov r8, r4
    mov r7, r4
    add r6, r10, #0x228
    mov r11, #0x1
    mov r4, #0xac
    mov r5, #0x3c
L_021fdbfc:
    mul r9, r8, r4
    ldr r0, [r10, #0xc8]
    mov r2, r11
    add r1, r10, #0xbc
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    add r0, r6, r9
    add r2, r8, #0xc
    mov r3, #0x1
    str r7, [sp, #0x0]
    bl func_020957f0
    mul r1, r8, r5
    add r0, r6, r9
    add r1, r1, #0x94
    mov r2, #0x10
    bl func_02095820
    add r8, r8, #0x1
    cmp r8, #0x2
    blt L_021fdbfc
    mov r8, #0x0
    ldr r11, L_021fddec
    mov r6, #0x1
    mov r5, r8
    mov r7, #0xa0
    mov r4, #0x34000
L_021fdc60:
    ldr r3, L_021fddf0
    mov r0, r7
    mov r1, r11
    mov r2, #0x4
    bl Heap_Alloc
    movs r9, r0
    beq L_021fdc9c
    ldr r0, [r10, #0xc8]
    mov r2, #0x1
    add r1, r10, #0xbc
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, r9
    bl SpritePresentation_Init
    mov r9, r0
L_021fdc9c:
    mul r0, r8, r4
    add r3, r10, r8, lsl #0x2
    str r9, [r3, #0x380]
    add r2, r0, #0x16000
    ldr r0, [r9, #0x9c]
    mov r1, #0x2a000
    strb r6, [r0, #0x3a]
    strh r5, [r0, #0x28]
    ldr r0, [r3, #0x380]
    mov r3, r5
    bl Presentation_SetPosition
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0x380]
    bl SpritePresentation_SyncPosition
    add r8, r8, #0x1
    cmp r8, #0x2
    blt L_021fdc60
    mov r0, r10
    mov r1, #0x0
    bl func_ov023_021fe640
    mov r0, r10
    bl func_ov023_021fe39c
    mov r0, r10
    mov r1, #0x0
    bl func_ov023_021fe994
    mov r2, #0x8
    str r2, [sp, #0x0]
    ldr r0, L_021fddf4
    mov r1, #0x4
    mov r3, r2
    bl func_020afd0c
    mov r2, #0x8
    str r2, [sp, #0x0]
    ldr r0, L_021fddf8
    mov r1, #0x4
    mov r3, r2
    bl func_020afd0c
    mov r0, #0xec
    ldr r1, L_021fddfc
    mov r2, #0x4
    ldr r3, L_021fddf0
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdd5c
    ldr r1, L_021fde00
    ldr r2, [r10, #0x54]
    ldr r1, [r1, #0x0]
    bl TitleDialog_Init
L_021fdd5c:
    str r0, [r10, #0x4b8]
    mov r0, #0x84
    str r0, [sp, #0x0]
    ldr r0, [r10, #0x4b8]
    mov r1, #0x50
    mov r2, #0x28
    mov r3, #0xa8
    bl func_ov023_021fd9b8
    ldr r0, [r10, #0x4b8]
    mvn r1, #0x1
    str r1, [r0, #0xbc]
    ldr r1, [r10, #0x4b8]
    mov r0, #0xc
    str r0, [r1, #0xd0]
    mov r0, #0x0
    str r0, [r1, #0xd4]
    ldr r0, [r10, #0x20]
    ldr r1, L_021fde04
    orr r0, r0, #0x400
    str r0, [r10, #0x20]
    mov r0, r10
    ldmia r1, {r1, r2}
    bl func_ov023_021fd9d0
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fddc4: .word data_ov023_021ffbc4
L_021fddc8: .word func_ov023_021fd9b4
L_021fddcc: .word func_020957bc
L_021fddd0: .word data_020f4e18
L_021fddd4: .word 0xc007
L_021fddd8: .word 0x7007
L_021fdddc: .word 0x7005
L_021fdde0: .word 0x803c
L_021fdde4: .word 0x803b
L_021fdde8: .word data_020f4e14
L_021fddec: .word data_ov023_021ffbf0
L_021fddf0: .word gHeapContext
L_021fddf4: .word 0x4000050
L_021fddf8: .word 0x4001050
L_021fddfc: .word data_ov023_021ffbf8
L_021fde00: .word gDebugFont
L_021fde04: .word data_ov023_021ffb60
.size func_ov023_021fd9f8, .-func_ov023_021fd9f8


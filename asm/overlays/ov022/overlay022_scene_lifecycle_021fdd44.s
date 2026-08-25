    .text
/* Exact fallback; see src/overlays/ov022/overlay022_scene_lifecycle.c. */
    .extern __construct_array
    .extern data_020f4e14
    .extern data_020f4e18
    .extern data_ov022_02200558
    .extern data_ov022_022006a0
    .extern data_ov022_022006d4
    .extern data_ov022_022006dc
    .extern data_ov022_022006e4
    .extern GraphicsArchive_AcquirePaletteResource
    .extern AnimationResourceState_InitEmbedded
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern SceneInputBase_Init
    .extern TitleCharacterResourceCollection_Init
    .extern TitleCharacterResourceCollection_Append
    .extern TitleScrollValue_Init
    .extern TitleDialog_Init
    .extern func_02092f88
    .extern SpriteMotionController_Init
    .extern func_ov022_021fcf08
    .extern func_ov022_021fd370
    .extern func_ov022_021fdd00
    .extern func_ov022_021fdd04
    .extern func_ov022_021fdd1c
    .extern func_ov022_021fe3c0
    .extern func_ov022_021fe498
    .extern func_ov022_021fe544
    .extern func_ov022_021fe688
    .extern func_ov022_021fee3c
    .extern gDebugFont
    .extern genrand_int32
    .extern gGameWork
    .extern gHeapContext
    .extern Heap_Alloc

.global func_ov022_021fdd44
func_ov022_021fdd44:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl SceneInputBase_Init
    ldr r1, L_021fdfcc
    add r0, r4, #0x54
    str r1, [r4, #0x0]
    bl TitleCharacterResourceCollection_Init
    add r0, r4, #0x78
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x84
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x90
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0xa8
    bl SpriteMotionController_Init
    ldr r1, L_021fdfd0
    add r0, r4, #0x154
    str r1, [sp, #0x0]
    mov r1, #0x2
    mov r2, #0xac
    ldr r3, L_021fdfd4
    bl __construct_array
    add r0, r4, #0x378
    bl TitleScrollValue_Init
    mov r0, #0x0
    str r0, [r4, #0x390]
    str r0, [r4, #0x2c0]
    str r0, [r4, #0x2b4]
    str r0, [r4, #0x2b8]
    str r0, [r4, #0x2bc]
    str r0, [r4, #0x35c]
    bl genrand_int32
    str r0, [r4, #0x390]
    mov r0, #0x0
    str r0, [r4, #0x2c4]
    str r0, [r4, #0x2c8]
    str r0, [r4, #0x2b0]
    ldr r0, L_021fdfd8
    ldr r1, L_021fdfdc
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquirePaletteResource
    str r0, [r4, #0x374]
    add r0, r4, #0x54
    ldr r1, L_021fdfe0
    bl TitleCharacterResourceCollection_Append
    add r0, r4, #0x54
    ldr r1, L_021fdfe4
    bl TitleCharacterResourceCollection_Append
    add r0, r4, #0x54
    ldr r1, L_021fdfe8
    bl TitleCharacterResourceCollection_Append
    mov r0, #0x3f
    str r0, [sp, #0x0]
    add r0, r4, #0x78
    ldr r1, L_021fdfd8
    mov r2, #0x3d
    ldr r1, [r1, #0x0]
    mov r3, #0x3e
    bl AnimationResourceState_ReplaceResources
    mov r0, #0x41
    str r0, [sp, #0x0]
    add r0, r4, #0x84
    ldr r1, L_021fdfd8
    mov r2, #0x40
    ldr r1, [r1, #0x0]
    mov r3, #0x3e
    bl AnimationResourceState_ReplaceResources
    ldr r1, L_021fdfec
    ldr r0, L_021fdfd8
    str r1, [sp, #0x0]
    mov r2, #0x4000
    ldr r1, [r0, #0x0]
    add r0, r4, #0x90
    add r3, r2, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r1, L_021fdff0
    ldr r3, L_021fdff4
    mov r0, #0x34
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fde94
    bl func_ov022_021fd370
L_021fde94:
    ldr r1, L_021fdff8
    str r0, [r4, #0x350]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r1, L_021fdff8
    str r0, [r4, #0x9c]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0xa0]
    mov r0, r4
    bl func_ov022_021fe3c0
    mov r0, r4
    bl func_ov022_021fe498
    mov r0, r4
    bl func_ov022_021fe544
    mov r0, r4
    bl func_ov022_021fe688
    mov r0, r4
    bl func_ov022_021fee3c
    mov r0, #0xec
    ldr r1, L_021fdffc
    mov r2, #0x4
    ldr r3, L_021fdff4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdf0c
    ldr r1, L_021fe000
    ldr r2, [r4, #0x54]
    ldr r1, [r1, #0x0]
    bl TitleDialog_Init
L_021fdf0c:
    str r0, [r4, #0x2cc]
    mov r0, #0x84
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x2cc]
    mov r1, #0x50
    mov r2, #0x28
    mov r3, #0xa8
    bl func_ov022_021fdd04
    ldr r0, [r4, #0x2cc]
    mvn r1, #0x1
    str r1, [r0, #0xbc]
    ldr r1, [r4, #0x2cc]
    mov r0, #0xd
    str r0, [r1, #0xd0]
    mov r0, #0x0
    str r0, [r1, #0xd4]
    ldr r0, [r4, #0x2cc]
    add r2, r4, #0x2d0
    mov r1, #0x5
    bl func_02092f88
    ldr r0, [r4, #0x2cc]
    add r2, r4, #0x310
    mov r1, #0x6
    bl func_02092f88
    mov r0, #0x70
    ldr r1, L_021fe004
    mov r2, #0x4
    ldr r3, L_021fdff4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdf8c
    bl func_ov022_021fcf08
L_021fdf8c:
    ldr r1, L_021fe008
    str r0, [r4, #0x354]
    ldr r0, [r1, #0x0]
    mov r1, #0x0
    add r0, r0, #0x200
    strh r1, [r0, #0x4]
    ldr r0, [r4, #0x20]
    ldr r1, L_021fe00c
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov022_021fdd1c
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fdfcc: .word data_ov022_022006a0
L_021fdfd0: .word func_ov022_021fdd00
L_021fdfd4: .word SpriteMotionController_Init
L_021fdfd8: .word data_020f4e18
L_021fdfdc: .word 0xc007
L_021fdfe0: .word 0x7007
L_021fdfe4: .word 0x7005
L_021fdfe8: .word 0x7001
L_021fdfec: .word 0x4002
L_021fdff0: .word data_ov022_022006d4
L_021fdff4: .word gHeapContext
L_021fdff8: .word data_020f4e14
L_021fdffc: .word data_ov022_022006dc
L_021fe000: .word gDebugFont
L_021fe004: .word data_ov022_022006e4
L_021fe008: .word gGameWork
L_021fe00c: .word data_ov022_02200558
.size func_ov022_021fdd44, . - func_ov022_021fdd44

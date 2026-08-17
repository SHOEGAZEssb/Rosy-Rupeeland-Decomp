.text

/* Exact fallback; see src/overlays/ov031/overlay031_scene_constructor.c for documented portable C. */
.extern data_020f4e18
.extern data_ov031_021fe6f0
.extern data_ov031_021fe774
.extern data_ov031_021fe798
.extern data_ov031_021fe7a0
.extern AnimationResourceState_InitEmbedded
.extern func_02071ee0
.extern func_02073e48
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroup_ReleaseIndexedEntries
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern SceneInputBase_Init
.extern TitleCharacterResourceCollection_Init
.extern func_02092814
.extern TitleDialog_Init
.extern func_ov031_021fce00
.extern func_ov031_021fd258
.extern func_ov031_021fd91c
.extern func_ov031_021fd934
.extern func_ov031_021fdfa8
.extern gDebugFont
.extern genrand_int32
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov031_021fd95c
func_ov031_021fd95c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r0
    mov r5, r1
    bl SceneInputBase_Init
    ldr r1, L_021fdb38
    add r0, r4, #0x5c
    str r1, [r4, #0x0]
    str r5, [r4, #0x54]
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x70
    bl TitleCharacterResourceCollection_Init
    mov r1, #0x0
    str r1, [r4, #0xa0]
    add r0, r4, #0xa4
    mov r2, #0x8
    bl func_ov031_021fce00
    mov r0, #0x0
    str r0, [r4, #0x54c]
    bl genrand_int32
    str r0, [r4, #0x54c]
    add r0, r4, #0x70
    ldr r1, L_021fdb3c
    bl func_02092814
    mov r0, #0xec
    ldr r1, L_021fdb40
    mov r2, #0x4
    ldr r3, L_021fdb44
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd9e8
    ldr r1, L_021fdb48
    ldr r2, [r4, #0x70]
    ldr r1, [r1, #0x0]
    bl TitleDialog_Init
L_021fd9e8:
    str r0, [r4, #0x98]
    mov r0, #0x50
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x98]
    mov r1, #0x47
    mov r2, #0x2f
    mov r3, #0x86
    bl func_ov031_021fd91c
    ldr r2, [r4, #0x98]
    mov r1, #0x9
    mov r0, #0x0
    str r1, [r2, #0xd0]
    str r0, [r2, #0xd4]
    sub r2, r0, #0x2
    ldr r1, [r4, #0x98]
    ldr r0, L_021fdb48
    str r2, [r1, #0xbc]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x58]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r3, L_021fdb4c
    ldr r1, L_021fdb50
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r4, #0x5c
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r0, [r4, #0x58]
    add r1, r4, #0x5c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0x6c]
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, [r4, #0x6c]
    mov r2, #0x26
    mov r3, #0x5b
    bl func_02073e48
    mov r0, #0x4
    str r0, [r4, #0x94]
    ldr r0, [r4, #0x58]
    add r1, r4, #0x5c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0x68]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r1, #0x2
    str r1, [sp, #0x8]
    ldr r0, [r4, #0x68]
    mov r2, #0x26
    mov r3, #0x6d
    bl func_02073e48
    mov r0, #0x0
    str r0, [r4, #0x9c]
    ldr r1, L_021fdb54
    ldr r3, L_021fdb44
    mov r0, #0x154
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdaf8
    bl func_ov031_021fd258
L_021fdaf8:
    str r0, [r4, #0x548]
    mov r0, r4
    bl func_ov031_021fdfa8
    ldr r0, L_021fdb58
    mov r1, #0x0
    strh r1, [r0, #0x0]
    ldr r0, [r4, #0x20]
    ldr r1, L_021fdb5c
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov031_021fd934
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_021fdb38: .word data_ov031_021fe774
L_021fdb3c: .word 0x7007
L_021fdb40: .word data_ov031_021fe798
L_021fdb44: .word gHeapContext
L_021fdb48: .word gDebugFont
L_021fdb4c: .word 0x14ee
L_021fdb50: .word data_020f4e18
L_021fdb54: .word data_ov031_021fe7a0
L_021fdb58: .word 0x4001050
L_021fdb5c: .word data_ov031_021fe6f0
.size func_ov031_021fd95c, .-func_ov031_021fd95c

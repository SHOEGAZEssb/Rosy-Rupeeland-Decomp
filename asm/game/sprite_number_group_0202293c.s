; Matching retail form; see src/game/sprite_number_group.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern gSpriteNumberGroupNodeAllocationTag
.extern data_020d660c
.extern data_020f4e18
.extern SpriteNodeList_Init
.extern SpriteNodeList_Clear
.extern SpriteNodeList_AppendSprite
.extern SpriteNodeList_RemoveNode
.extern AnimationResourceState_InitEmbedded
.extern AnimationResourceState_Destroy
.extern AnimationResourceState_ReplaceResources
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroup_ReleaseState
.extern func_020befec
.extern gHeapContext

.global SpriteNumberGroup_Init
    .type SpriteNumberGroup_Init, @function
SpriteNumberGroup_Init: ; 0x0202293c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    add r0, r10, #0x4
    mov r9, r2
    str r1, [r10, #0x0]
    bl SpriteNodeList_Init
    add r0, r10, #0x18
    bl AnimationResourceState_InitEmbedded
    ldr r1, .L_02022a7c
    ldr r3, .L_02022a80
    str r1, [sp, #0x0]
    sub r2, r1, #0x1
    ldr r1, .L_02022a84
    add r0, r10, #0x18
    ldr r1, [r1, #0x0]
    bl AnimationResourceState_ReplaceResources
    cmp r9, #0x0
    movlt r7, #0xd
    movge r7, #0x2
    cmp r9, #0x0
    rsblt r8, r9, #0x0
    movge r8, r9
    mov r6, #0x0
    mov r5, #0x2
    mov r11, #0xa
    b .L_020229f4
.L_020229a4:
    ldr r0, [r10, #0x0]
    mov r2, r5
    add r1, r10, #0x18
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r4, r0
    mov r0, r8
    mov r1, r11
    bl func_020befec
    add r0, r7, r1
    and r1, r0, #0xff
    mov r0, r4
    bl GraphicsSpriteState_SetAnimationIndex
    mov r1, r4
    add r0, r10, #0x4
    bl SpriteNodeList_AppendSprite
    mov r0, r8
    mov r1, #0xa
    add r6, r6, #0x1
    bl func_020befec
    mov r8, r0
.L_020229f4:
    cmp r8, #0x0
    bgt .L_020229a4
    ldr r0, [r10, #0x0]
    add r1, r10, #0x18
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r4, r0
    cmp r9, #0x0
    bge .L_02022a24
    mov r1, #0xc
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02022a2c
.L_02022a24:
    mov r1, #0x1
    bl GraphicsSpriteState_SetAnimationIndex
.L_02022a2c:
    mov r1, r4
    add r0, r10, #0x4
    bl SpriteNodeList_AppendSprite
    ldr r0, [r10, #0x0]
    add r1, r10, #0x18
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r4, r0
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    mov r1, r4
    add r0, r10, #0x4
    bl SpriteNodeList_AppendSprite
    add r1, r6, #0x1
    mov r0, #0xa
    mul r0, r1, r0
    add r1, r0, #0x8
    mov r0, r10
    strh r1, [r10, #0x14]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02022a7c: .word 0x1718
.L_02022a80: .word 0x1001
.L_02022a84: .word data_020f4e18
    .size SpriteNumberGroup_Init, .-SpriteNumberGroup_Init

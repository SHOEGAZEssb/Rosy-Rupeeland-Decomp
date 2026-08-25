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

.global SpriteNumberGroup_Destroy
    .type SpriteNumberGroup_Destroy, @function
SpriteNumberGroup_Destroy: ; 0x02022b70
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x8]
    b .L_02022b9c
.L_02022b80:
    ldr r0, [r5, #0x0]
    ldr r1, [r4, #0x8]
    bl GraphicsSpriteGroup_ReleaseState
    mov r1, r4
    add r0, r5, #0x4
    bl SpriteNodeList_RemoveNode
    ldr r4, [r4, #0x0]
.L_02022b9c:
    cmp r4, #0x0
    bne .L_02022b80
    add r0, r5, #0x18
    bl AnimationResourceState_Destroy
    ldr r1, .L_02022bc4
    add r0, r5, #0x4
    str r1, [r5, #0x4]
    bl SpriteNodeList_Clear
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02022bc4: .word data_020d660c
    .size SpriteNumberGroup_Destroy, .-SpriteNumberGroup_Destroy

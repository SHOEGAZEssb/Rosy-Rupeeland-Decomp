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

.global SpriteNodeList_Destroy
    .type SpriteNodeList_Destroy, @function
SpriteNodeList_Destroy: ; 0x02022aa8
    stmdb sp!, {r4, lr}
    ldr r1, .L_02022ac4
    mov r4, r0
    str r1, [r4, #0x0]
    bl SpriteNodeList_Clear
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02022ac4: .word data_020d660c
    .size SpriteNodeList_Destroy, .-SpriteNodeList_Destroy

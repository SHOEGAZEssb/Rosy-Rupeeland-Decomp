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

.global SpriteNodeList_Clear
    .type SpriteNodeList_Clear, @function
SpriteNodeList_Clear: ; 0x02022ac8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    b .L_02022aec
.L_02022ad8:
    cmp r0, #0x0
    ldr r4, [r0, #0x0]
    beq .L_02022ae8
    bl Heap_Free
.L_02022ae8:
    mov r0, r4
.L_02022aec:
    cmp r0, #0x0
    bne .L_02022ad8
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5, #0x8]
    str r0, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
    .size SpriteNodeList_Clear, .-SpriteNodeList_Clear

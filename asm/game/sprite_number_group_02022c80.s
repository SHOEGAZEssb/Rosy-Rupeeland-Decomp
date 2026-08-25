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

.global SpriteNumberGroup_SetVisible
    .type SpriteNumberGroup_SetVisible, @function
SpriteNumberGroup_SetVisible: ; 0x02022c80
    ldr r3, [r0, #0x8]
    b .L_02022ca4
.L_02022c88:
    ldr r2, [r3, #0x8]
    cmp r1, #0x0
    ldrh r0, [r2, #0x24]
    bicne r0, r0, #0x4
    orreq r0, r0, #0x4
    strh r0, [r2, #0x24]
    ldr r3, [r3, #0x0]
.L_02022ca4:
    cmp r3, #0x0
    bne .L_02022c88
    bx lr
    .size SpriteNumberGroup_SetVisible, .-SpriteNumberGroup_SetVisible

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
.extern func_02071ee0
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroup_ReleaseState
.extern func_020befec
.extern gHeapContext

.global SpriteNumberGroup_SetPosition
    .type SpriteNumberGroup_SetPosition, @function
SpriteNumberGroup_SetPosition: ; 0x02022c30
    ldrsh ip, [r0, #0x14]
    add r3, ip, ip, lsr #0x1f
    subs r3, r1, r3, asr #0x1
    movmi r3, #0x0
    bmi .L_02022c50
    add r1, r3, ip
    cmp r1, #0x100
    rsbge r3, ip, #0x100
.L_02022c50:
    ldr ip, [r0, #0x8]
    mov r0, r2, lsl #0x10
    mov r0, r0, asr #0x10
    b .L_02022c74
.L_02022c60:
    ldr r1, [ip, #0x8]
    strh r3, [r1, #0x2c]
    strh r0, [r1, #0x2e]
    ldr ip, [ip, #0x0]
    add r3, r3, #0xa
.L_02022c74:
    cmp ip, #0x0
    bne .L_02022c60
    bx lr
    .size SpriteNumberGroup_SetPosition, .-SpriteNumberGroup_SetPosition

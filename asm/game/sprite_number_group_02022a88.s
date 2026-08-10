; Matching retail form; see src/game/sprite_number_group.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern gSpriteNumberGroupNodeAllocationTag
.extern data_020d660c
.extern data_020f4e18
.extern func_02022a88
.extern func_02022ac8
.extern func_02022b08
.extern func_02022bc8
.extern func_02071ea4
.extern func_02071eb8
.extern func_02071ee0
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroup_ReleaseState
.extern func_020befec
.extern gHeapContext

.global func_02022a88
    .type func_02022a88, @function
func_02022a88: ; 0x02022a88
    ldr r2, .L_02022aa4
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    bx lr
.L_02022aa4: .word data_020d660c
    .size func_02022a88, .-func_02022a88


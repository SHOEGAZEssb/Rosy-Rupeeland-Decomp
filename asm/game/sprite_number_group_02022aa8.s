; Matching retail form; see src/game/sprite_number_group.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d65b4
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

.global func_02022aa8
    .type func_02022aa8, @function
func_02022aa8: ; 0x02022aa8
    stmdb sp!, {r4, lr}
    ldr r1, .L_02022ac4
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02022ac8
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02022ac4: .word data_020d660c
    .size func_02022aa8, .-func_02022aa8


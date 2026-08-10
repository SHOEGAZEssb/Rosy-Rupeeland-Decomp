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
.extern func_02073ffc
.extern func_02074038
.extern func_020befec
.extern gHeapContext

.global func_02022b08
    .type func_02022b08, @function
func_02022b08: ; 0x02022b08
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    ldr r1, .L_02022b68
    ldr r3, .L_02022b6c
    mov r0, #0xc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x0]
    stmneib r0, {r1, r4}
    ldr r1, [r5, #0x4]
    cmp r1, #0x0
    strne r0, [r1, #0x4]
    ldrne r1, [r5, #0x4]
    strne r1, [r0, #0x0]
    streq r0, [r5, #0x8]
    str r0, [r5, #0x4]
    ldr r0, [r5, #0xc]
    add r0, r0, #0x1
    str r0, [r5, #0xc]
    ldr r0, [r5, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
.L_02022b68: .word data_020d65b4
.L_02022b6c: .word gHeapContext
    .size func_02022b08, .-func_02022b08


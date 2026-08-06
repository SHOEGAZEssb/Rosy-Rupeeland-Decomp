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
.extern func_02072b68
.extern func_02073ffc
.extern func_02074038
.extern func_020befec
.extern gHeapContext

.global func_02022ac8
    .type func_02022ac8, @function
func_02022ac8: ; 0x02022ac8
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
    .size func_02022ac8, .-func_02022ac8


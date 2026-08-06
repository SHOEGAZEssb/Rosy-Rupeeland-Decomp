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

.global func_02022b70
    .type func_02022b70, @function
func_02022b70: ; 0x02022b70
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x8]
    b .L_02022b9c
.L_02022b80:
    ldr r0, [r5, #0x0]
    ldr r1, [r4, #0x8]
    bl func_02074038
    mov r1, r4
    add r0, r5, #0x4
    bl func_02022bc8
    ldr r4, [r4, #0x0]
.L_02022b9c:
    cmp r4, #0x0
    bne .L_02022b80
    add r0, r5, #0x18
    bl func_02071eb8
    ldr r1, .L_02022bc4
    add r0, r5, #0x4
    str r1, [r5, #0x4]
    bl func_02022ac8
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02022bc4: .word data_020d660c
    .size func_02022b70, .-func_02022b70


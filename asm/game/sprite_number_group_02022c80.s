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

.global func_02022c80
    .type func_02022c80, @function
func_02022c80: ; 0x02022c80
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
    .size func_02022c80, .-func_02022c80


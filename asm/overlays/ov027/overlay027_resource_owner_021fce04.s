.text

/* Exact fallback; see src/overlays/ov027/overlay027_resource_owner.c. */
.extern data_020f4e18
.extern data_ov027_021feed0
.extern data_ov027_021fef1c
.extern Graphics3DResourceBinding_Init
.extern Presentation_Init
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov027_021fce04
func_ov027_021fce04:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl Presentation_Init
    ldr ip, L_021fce60
    ldr r1, L_021fce64
    ldr r3, L_021fce68
    mov r0, #0x18
    mov r2, #0x4
    str ip, [r5, #0x0]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fce54
    ldr r3, L_021fce6c
    ldr r1, L_021fce70
    str r3, [sp, #0x0]
    ldr r1, [r1, #0x0]
    mov r2, r4
    sub r3, r3, #0x1
    bl Graphics3DResourceBinding_Init
L_021fce54:
    str r0, [r5, #0x9c]
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fce60: .word data_ov027_021feed0
L_021fce64: .word data_ov027_021fef1c
L_021fce68: .word gHeapContext
L_021fce6c: .word 0x6125
L_021fce70: .word data_020f4e18
.size func_ov027_021fce04, .-func_ov027_021fce04


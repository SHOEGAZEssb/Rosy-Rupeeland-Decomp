.text

/* Exact fallback; see src/overlays/ov035/overlay035_transition_variant.c for documented portable C. */

    .extern Presentation_Init
    .extern Heap_Alloc
    .extern Graphics3DResourceBinding_Init
    .extern data_ov035_02203ccc
    .extern data_ov035_02203d30
    .extern gHeapContext
    .extern data_020f4e18


    .global func_ov035_021fe8e4
func_ov035_021fe8e4: 
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl Presentation_Init
    ldr ip, L_021fe940
    ldr r1, L_021fe944
    ldr r3, L_021fe948
    mov r0, #0x18
    mov r2, #0x4
    str ip, [r5, #0x0]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe934
    ldr r3, L_021fe94c
    ldr r1, L_021fe950
    str r3, [sp, #0x0]
    ldr r1, [r1, #0x0]
    mov r2, r4
    sub r3, r3, #0x1
    bl Graphics3DResourceBinding_Init
L_021fe934:
    str r0, [r5, #0x9c]
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fe940: .word data_ov035_02203ccc
L_021fe944: .word data_ov035_02203d30
L_021fe948: .word gHeapContext
L_021fe94c: .word 0x6131
L_021fe950: .word data_020f4e18
.size func_ov035_021fe8e4, .-func_ov035_021fe8e4


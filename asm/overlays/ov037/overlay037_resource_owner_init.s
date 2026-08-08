.text

/* Exact fallback; see src/overlays/ov037/overlay037_resource_owner.c for documented portable C. */

    .extern func_020949ec
    .extern Heap_Alloc
    .extern func_02077ca0
    .extern data_ov037_021fee5c
    .extern data_ov037_021feea8
    .extern gHeapContext
    .extern data_020f4e18

    .global func_ov037_021fd22c
func_ov037_021fd22c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_020949ec
    ldr ip, L_021fd288
    ldr r1, L_021fd28c
    ldr r3, L_021fd290
    mov r0, #0x18
    mov r2, #0x4
    str ip, [r5, #0x0]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd27c
    ldr r3, L_021fd294
    ldr r1, L_021fd298
    str r3, [sp, #0x0]
    ldr r1, [r1, #0x0]
    mov r2, r4
    sub r3, r3, #0x1
    bl func_02077ca0
L_021fd27c:
    str r0, [r5, #0x9c]
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fd288: .word data_ov037_021fee5c
L_021fd28c: .word data_ov037_021feea8
L_021fd290: .word gHeapContext
L_021fd294: .word 0x612b
L_021fd298: .word data_020f4e18
    .size func_ov037_021fd22c, .-func_ov037_021fd22c

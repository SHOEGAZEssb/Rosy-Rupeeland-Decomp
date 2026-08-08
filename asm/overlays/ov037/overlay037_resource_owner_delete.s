.text

/* Exact fallback; see src/overlays/ov037/overlay037_resource_owner.c for documented portable C. */

    .extern func_02077d08
    .extern Heap_Free
    .extern func_ov037_021fcf1c
    .extern data_ov037_021fee5c

    .global func_ov037_021fd2dc
func_ov037_021fd2dc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd320
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x9c]
    cmp r4, #0x0
    beq L_021fd308
    mov r0, r4
    bl func_02077d08
    mov r0, r4
    bl Heap_Free
L_021fd308:
    mov r0, r5
    bl func_ov037_021fcf1c
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fd320: .word data_ov037_021fee5c
    .size func_ov037_021fd2dc, .-func_ov037_021fd2dc

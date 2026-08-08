.text

/* Exact fallback; see src/overlays/ov034/overlay034_owner_lifecycle.c for documented portable C. */

    .extern Heap_Free
    .extern func_02071e04
    .extern func_ov034_021fce00
    .extern data_ov034_021ff194
    .extern data_020f4e18

    .global func_ov034_021fd634
func_ov034_021fd634:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd688
    mov r5, r0
    str r1, [r5, #0x0]
    mov r4, #0x0
L_021fd648:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0xa0]
    cmp r0, #0x0
    beq L_021fd65c
    bl Heap_Free
L_021fd65c:
    add r4, r4, #0x1
    cmp r4, #0x3
    blt L_021fd648
    ldr r0, L_021fd68c
    ldr r1, [r5, #0x9c]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    mov r0, r5
    bl func_ov034_021fce00
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fd688: .word data_ov034_021ff194
L_021fd68c: .word data_020f4e18
.size func_ov034_021fd634, .-func_ov034_021fd634

    .global func_ov034_021fd690
func_ov034_021fd690:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd6ec
    mov r5, r0
    str r1, [r5, #0x0]
    mov r4, #0x0
L_021fd6a4:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0xa0]
    cmp r0, #0x0
    beq L_021fd6b8
    bl Heap_Free
L_021fd6b8:
    add r4, r4, #0x1
    cmp r4, #0x3
    blt L_021fd6a4
    ldr r0, L_021fd6f0
    ldr r1, [r5, #0x9c]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    mov r0, r5
    bl func_ov034_021fce00
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fd6ec: .word data_ov034_021ff194
L_021fd6f0: .word data_020f4e18
.size func_ov034_021fd690, .-func_ov034_021fd690

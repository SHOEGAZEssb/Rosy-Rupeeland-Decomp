.text

/* Exact fallback; see src/overlays/ov035/overlay035_primitive_list.c for documented portable C. */

    .extern func_02091c7c
    .extern Heap_Free


    .global func_ov035_021fd5ac
func_ov035_021fd5ac: 
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r5, [r7, #0x0]
    mov r4, #0x2
    b L_021fd600
L_021fd5c0:
    mov r1, r4
    add r0, r5, #0x18
    ldr r6, [r5, #0x0]
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fd5fc
    ldr r0, [r5, #0x0]
    cmp r5, #0x0
    str r0, [r7, #0x0]
    beq L_021fd5f0
    mov r0, r5
    bl Heap_Free
L_021fd5f0:
    ldr r0, [r7, #0x8]
    sub r0, r0, #0x1
    str r0, [r7, #0x8]
L_021fd5fc:
    mov r5, r6
L_021fd600:
    cmp r5, #0x0
    bne L_021fd5c0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov035_021fd5ac, .-func_ov035_021fd5ac


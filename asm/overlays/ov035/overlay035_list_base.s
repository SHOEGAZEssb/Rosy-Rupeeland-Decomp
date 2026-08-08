.text

/* Exact fallback; see src/overlays/ov035/overlay035_primitive_list.c for documented portable C. */

    .extern Heap_Free
    .extern Heap_Alloc
    .extern func_ov035_021fd460
    .extern data_ov035_02203d18
    .extern gHeapContext


    .global func_ov035_021fd4b4
func_ov035_021fd4b4: 
    mov r2, #0x0
    str r2, [r0, #0x4]
    str r2, [r0, #0x0]
    str r2, [r0, #0x8]
    str r2, [r0, #0xc]
    ldr r2, L_021fd4d8
    str r1, [r0, #0x10]
    strh r2, [r0, #0x14]
    bx lr
L_021fd4d8: .word 0x7fff
.size func_ov035_021fd4b4, .-func_ov035_021fd4b4

    .global func_ov035_021fd4dc

func_ov035_021fd4dc: 
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x0]
    b L_021fd500
L_021fd4ec:
    cmp r0, #0x0
    ldr r4, [r0, #0x0]
    beq L_021fd4fc
    bl Heap_Free
L_021fd4fc:
    mov r0, r4
L_021fd500:
    cmp r0, #0x0
    bne L_021fd4ec
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5, #0x0]
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov035_021fd4dc, .-func_ov035_021fd4dc

    .global func_ov035_021fd51c

func_ov035_021fd51c: 
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r1
    mov r5, r3
    mov r4, r0
    mov r6, r2
    ldr r1, L_021fd5a4
    ldr r3, L_021fd5a8
    mov r0, #0x34
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd574
    ldr r1, [sp, #0x20]
    str r5, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r1, [r4, #0xc]
    mov r2, r7
    str r1, [sp, #0x8]
    ldr r1, [r4, #0x10]
    mov r3, r6
    bl func_ov035_021fd460
L_021fd574:
    ldr r1, [r4, #0x0]
    cmp r1, #0x0
    streq r0, [r4, #0x4]
    streq r0, [r4, #0x0]
    ldrne r1, [r4, #0x4]
    strne r0, [r1, #0x0]
    strne r0, [r4, #0x4]
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
L_021fd5a4: .word data_ov035_02203d18
L_021fd5a8: .word gHeapContext
.size func_ov035_021fd51c, .-func_ov035_021fd51c


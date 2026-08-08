.text

/* Exact fallback; see src/overlays/ov030/overlay030_board_interaction.c for documented portable C. */
.extern data_ov030_021ff708
.extern data_ov030_021ff8c4
.extern func_020755bc
.extern func_02076428
.extern func_02095940
.extern func_ov030_021fce00
.extern func_ov030_021fd3e8
.extern gHeapContext
.extern Heap_Alloc
.extern Heap_Free


    .global func_ov030_021fd434
func_ov030_021fd434:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0x1b0]
    cmp r0, #0x0
    beq L_021fd450
    bl Heap_Free
L_021fd450:
    ldr r1, L_021fd514
    ldr r3, L_021fd518
    mov r0, #0x24
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd470
    bl func_ov030_021fce00
L_021fd470:
    str r0, [r5, #0x1b0]
    ldr r0, [r5, #0x1b4]
    sub r0, r0, #0x1
    str r0, [r5, #0x1b4]
    ldr r0, [r5, #0x0]
    bl func_020755bc
    ldr r7, L_021fd51c
    mov r4, #0x0
    mov r6, #0x1
L_021fd494:
    ldr r0, [r5, #0x1b0]
    add r3, r7, r4, lsl #0x3
    add r0, r0, r4, lsl #0x2
    ldrh r0, [r0, #0xa]
    cmp r0, #0x0
    add r0, r5, r4, lsl #0x2
    ldrne r1, [r0, #0x34]
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x4
    ldreq r1, [r0, #0x34]
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldrsh r0, [r3, #0x6]
    mov r1, r4, lsl #0x3
    stmia sp, {r0, r6}
    ldrsh r2, [r3, #0x2]
    ldrsh r1, [r7, r1]
    ldrsh r3, [r3, #0x4]
    ldr r0, [r5, #0x0]
    bl func_02076428
    add r4, r4, #0x1
    cmp r4, #0x7
    blt L_021fd494
    mov r0, r5
    bl func_ov030_021fd3e8
    add r0, r5, #0x58
    bl func_02095940
    add r0, r5, #0x104
    bl func_02095940
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fd514: .word data_ov030_021ff8c4
L_021fd518: .word gHeapContext
L_021fd51c: .word data_ov030_021ff708
.size func_ov030_021fd434, .-func_ov030_021fd434

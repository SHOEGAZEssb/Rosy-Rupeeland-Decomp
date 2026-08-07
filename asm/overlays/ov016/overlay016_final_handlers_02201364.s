    .text

/* Exact fallback; see src/overlays/ov016/overlay016_final_handlers.c. */
    .extern Heap_Free
    .extern data_ov016_02201520
    .extern func_02095308
.global func_ov016_02201364
func_ov016_02201364:
    stmdb sp!, {r4, lr}
    ldr r1, L_02201388
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02201388: .word data_ov016_02201520
    .size func_ov016_02201364, . - func_ov016_02201364


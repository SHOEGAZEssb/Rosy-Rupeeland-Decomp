    .text
/* Exact fallback; see src/overlays/ov017/overlay017_final_handlers.c. */
    .extern Heap_Free
    .extern func_ov017_021fd948
.global func_ov017_02201388
func_ov017_02201388:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov017_021fd948
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov017_02201388, . - func_ov017_02201388

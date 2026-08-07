    .text
/* Exact fallback; see src/overlays/ov017/overlay017_final_handlers.c. */
    .extern Heap_Free
.global func_ov017_022013e0
func_ov017_022013e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov017_022013e0, . - func_ov017_022013e0

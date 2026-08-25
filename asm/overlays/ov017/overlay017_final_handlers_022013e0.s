    .text
/* Exact fallback; see src/overlays/ov017/overlay017_final_handlers.c. */
    .extern Heap_Free
.global Overlay017_FreeObject
Overlay017_FreeObject:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size Overlay017_FreeObject, . - Overlay017_FreeObject

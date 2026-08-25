    .text
/* Exact fallback; see src/overlays/ov017/overlay017_final_handlers.c. */
    .extern Heap_Free
    .extern Overlay017_EffectBase_NoOp
.global Overlay017_EffectBase_Delete
Overlay017_EffectBase_Delete:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Overlay017_EffectBase_NoOp
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size Overlay017_EffectBase_Delete, . - Overlay017_EffectBase_Delete

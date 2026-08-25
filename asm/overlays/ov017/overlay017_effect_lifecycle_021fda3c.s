    .text

/* Exact fallback; see src/overlays/ov017/overlay017_effect_lifecycle.c. */
    .extern Heap_Free
    .extern Overlay017_Transform_Destroy
    .extern Overlay017_EffectBase_NoOp
.global Overlay017_Effect_Delete
Overlay017_Effect_Delete:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xbc
    bl Overlay017_Transform_Destroy
    mov r0, r4
    bl Overlay017_EffectBase_NoOp
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size Overlay017_Effect_Delete, . - Overlay017_Effect_Delete


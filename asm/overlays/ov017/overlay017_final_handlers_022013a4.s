    .text
/* Exact fallback; see src/overlays/ov017/overlay017_final_handlers.c. */
    .extern Overlay017_EffectBase_NoOp
.global Overlay017_EffectBase_Destroy
Overlay017_EffectBase_Destroy:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Overlay017_EffectBase_NoOp
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size Overlay017_EffectBase_Destroy, . - Overlay017_EffectBase_Destroy

    .text

/* Exact fallback; see src/overlays/ov017/overlay017_effect_lifecycle.c. */
.global Overlay017_EffectBase_NoOp
Overlay017_EffectBase_NoOp:
    bx lr
    .size Overlay017_EffectBase_NoOp, . - Overlay017_EffectBase_NoOp


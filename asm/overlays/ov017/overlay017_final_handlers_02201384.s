    .text
/* Exact fallback; see src/overlays/ov017/overlay017_final_handlers.c. */
.global Overlay017_Final_NoOp
Overlay017_Final_NoOp:
    bx lr
    .size Overlay017_Final_NoOp, . - Overlay017_Final_NoOp

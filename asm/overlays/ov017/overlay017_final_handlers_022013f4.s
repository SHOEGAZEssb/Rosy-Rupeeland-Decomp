    .text
/* Exact fallback; see src/overlays/ov017/overlay017_final_handlers.c. */
    .extern data_ov017_02201618
.global Overlay017_GlobalHelper_Init
Overlay017_GlobalHelper_Init:
    ldr r3, L_02201404
    str r3, [r0, #0x0]
    stmib r0, {r1, r2}
    bx lr
L_02201404: .word data_ov017_02201618
    .size Overlay017_GlobalHelper_Init, . - Overlay017_GlobalHelper_Init

    .text

/* Exact fallback; see src/overlays/ov017/overlay017_grid_runtime.c. */
    .extern data_ov017_02201608
.global Overlay017_Transform_Init
Overlay017_Transform_Init:
    ldr r1, L_021fd77c
    mov r2, #0x0
    stmia r0, {r1, r2}
    str r2, [r0, #0x8]
    str r2, [r0, #0xc]
    str r2, [r0, #0x10]
    mov r1, #0x1000
    str r1, [r0, #0x14]
    str r1, [r0, #0x18]
    str r1, [r0, #0x1c]
    str r2, [r0, #0x20]
    str r2, [r0, #0x24]
    str r2, [r0, #0x28]
    bx lr
L_021fd77c: .word data_ov017_02201608
    .size Overlay017_Transform_Init, . - Overlay017_Transform_Init


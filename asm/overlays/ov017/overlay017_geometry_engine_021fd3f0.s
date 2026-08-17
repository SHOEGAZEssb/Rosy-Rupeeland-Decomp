    .text

/* Exact fallback; see src/overlays/ov017/overlay017_geometry_engine.c. */
.global Overlay017_WaitForSquareRoot
Overlay017_WaitForSquareRoot:
    ldr r1, L_021fd40c
L_021fd3f4:
    ldrh r0, [r1, #0x0]
    tst r0, #0x8000
    bne L_021fd3f4
    ldr r0, L_021fd410
    ldr r0, [r0, #0x0]
    bx lr
L_021fd40c: .word 0x40002b0
L_021fd410: .word 0x40002b4
    .size Overlay017_WaitForSquareRoot, . - Overlay017_WaitForSquareRoot


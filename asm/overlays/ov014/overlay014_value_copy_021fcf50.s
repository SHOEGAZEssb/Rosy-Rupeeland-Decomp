    .text

/* Exact fallback; see src/overlays/ov014/overlay014_value_helpers.c. */
    .global Overlay014_CopyValueTriple

Overlay014_CopyValueTriple:
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
    .size Overlay014_CopyValueTriple, . - Overlay014_CopyValueTriple

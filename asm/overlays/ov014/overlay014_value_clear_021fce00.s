    .text

/* Exact fallback; see src/overlays/ov014/overlay014_value_helpers.c. */
    .global Overlay014_ClearValueTriple

Overlay014_ClearValueTriple:
    mov r1, #0x0
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0x0]
    bx lr
    .size Overlay014_ClearValueTriple, . - Overlay014_ClearValueTriple

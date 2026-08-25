    .text
/* Exact ABI fallback; see src/overlays/ov012/overlay012_embedded_delete_thunk.c. */
    .global Overlay012_EmbeddedDeleteThunk
Overlay012_EmbeddedDeleteThunk:
    ldr ip, .Ladjust
    add r0, r0, ip
    /* MWASMARM cannot emit this overlay-local unresolved branch; the fixed delta reaches 0x021FD4FC. */
    b . - 0xf4c
.Ladjust:
    .word 0xffffffdc
    .size Overlay012_EmbeddedDeleteThunk, . - Overlay012_EmbeddedDeleteThunk

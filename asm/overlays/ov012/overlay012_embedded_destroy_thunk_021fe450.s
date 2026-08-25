    .text
/* Exact ABI fallback; see src/overlays/ov012/overlay012_embedded_destroy_thunk.c. */
    .global Overlay012_EmbeddedDestroyThunk
Overlay012_EmbeddedDestroyThunk:
    ldr ip, .Ladjust
    add r0, r0, ip
    /* MWASMARM cannot emit this overlay-local unresolved branch; the fixed delta reaches 0x021FD468. */
    b . - 0xff0
.Ladjust:
    .word 0xffffffdc
    .size Overlay012_EmbeddedDestroyThunk, . - Overlay012_EmbeddedDestroyThunk

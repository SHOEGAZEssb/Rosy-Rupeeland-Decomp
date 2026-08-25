    .text
/* Exact compiler thunk; see src/overlays/ov010/overlay010_embedded_delete_thunk.c. */
    .global Overlay010_EmbeddedDeleteThunk
Overlay010_EmbeddedDeleteThunk:
    ldr ip, L_021fe9b4
    add r0, r0, ip
    b . - 0x16fc
L_021fe9b4: .word 0xffffffdc
    .size Overlay010_EmbeddedDeleteThunk, . - Overlay010_EmbeddedDeleteThunk

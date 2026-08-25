    .text
    .extern Overlay009_Scene_Destroy

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov009/overlay009_embedded_destroy_thunk.c. */
    .global Overlay009_EmbeddedDestroyThunk
Overlay009_EmbeddedDestroyThunk:
    ldr ip, L_021feacc
    add r0, r0, ip
    /* Same-overlay resolved branch; avoid emitting a relocation. */
    b . - 0x1930
L_021feacc: .word 0xffffffdc
    .size Overlay009_EmbeddedDestroyThunk, . - Overlay009_EmbeddedDestroyThunk

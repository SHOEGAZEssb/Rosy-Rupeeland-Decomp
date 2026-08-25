    .text
    .extern Overlay009_Scene_Delete

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov009/overlay009_embedded_delete_thunk.c. */
    .global Overlay009_EmbeddedDeleteThunk
Overlay009_EmbeddedDeleteThunk:
    ldr ip, L_021feabc
    add r0, r0, ip
    /* Same-overlay resolved branch; avoid emitting a relocation. */
    b . - 0x18b0
L_021feabc: .word 0xffffffdc
    .size Overlay009_EmbeddedDeleteThunk, . - Overlay009_EmbeddedDeleteThunk

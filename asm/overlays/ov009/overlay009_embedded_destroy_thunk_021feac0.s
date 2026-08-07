    .text
    .extern func_ov009_021fd198

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov009/overlay009_embedded_destroy_thunk.c. */
    .global func_ov009_021feac0
func_ov009_021feac0:
    ldr ip, L_021feacc
    add r0, r0, ip
    /* Same-overlay resolved branch; avoid emitting a relocation. */
    b . - 0x1930
L_021feacc: .word 0xffffffdc
    .size func_ov009_021feac0, . - func_ov009_021feac0

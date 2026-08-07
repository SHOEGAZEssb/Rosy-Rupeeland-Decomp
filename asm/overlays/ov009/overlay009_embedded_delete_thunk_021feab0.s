    .text
    .extern func_ov009_021fd208

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov009/overlay009_embedded_delete_thunk.c. */
    .global func_ov009_021feab0
func_ov009_021feab0:
    ldr ip, L_021feabc
    add r0, r0, ip
    /* Same-overlay resolved branch; avoid emitting a relocation. */
    b . - 0x18b0
L_021feabc: .word 0xffffffdc
    .size func_ov009_021feab0, . - func_ov009_021feab0

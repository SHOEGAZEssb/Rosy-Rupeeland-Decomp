    .text

/* Exact fallback for the compiler-sensitive comparison; see
 * src/overlays/ov013/overlay013_runtime_update.c. */
    .global func_ov013_021fdfbc
func_ov013_021fdfbc:
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
    .size func_ov013_021fdfbc, . - func_ov013_021fdfbc

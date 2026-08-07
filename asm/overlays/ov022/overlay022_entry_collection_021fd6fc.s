    .text
/* Exact fallback; see src/overlays/ov022/overlay022_entry_collection.c. */


.global func_ov022_021fd6fc
func_ov022_021fd6fc:
    mov r1, #0x0
    str r1, [r0, #0x0]
    bx lr
.size func_ov022_021fd6fc, . - func_ov022_021fd6fc

.text

/* Exact fallback; see src/overlays/ov023/overlay023_pointer_collection.c. */



    .global func_ov023_021fd954
func_ov023_021fd954:
    ldr r1, [r0, #0x48]
    ldr r2, [r0, #0x3c]
    ldr r0, [r1, #0x14]
    add r0, r2, r0, lsl #0x2
    bx lr
.size func_ov023_021fd954, .-func_ov023_021fd954


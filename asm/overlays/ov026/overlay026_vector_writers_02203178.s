.text

/* Exact fallback; see src/overlays/ov026/overlay026_vector_writers.c. */


    .global func_ov026_02203178
func_ov026_02203178:
    str r1, [r0, #0x18]
    str r2, [r0, #0x1c]
    str r3, [r0, #0x20]
    bx lr
.size func_ov026_02203178, .-func_ov026_02203178


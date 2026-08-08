.text

/* Exact fallback; see src/overlays/ov026/overlay026_vector_writers.c. */



    .global func_ov026_02203580
func_ov026_02203580:
    mov r1, #0x0
    str r1, [r0, #0x24]
    str r1, [r0, #0x1c]
    mov r1, #0x1000
    str r1, [r0, #0x20]
    bx lr
.size func_ov026_02203580, .-func_ov026_02203580


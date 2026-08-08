.text

/* Exact fallback; see src/overlays/ov026/overlay026_motion_objects.c. */



    .global func_ov026_021fe5c0
func_ov026_021fe5c0:
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [r0, #0x7c]
    mov r1, #0x0
    str r1, [r0, #0x80]
    bx lr
.size func_ov026_021fe5c0, .-func_ov026_021fe5c0


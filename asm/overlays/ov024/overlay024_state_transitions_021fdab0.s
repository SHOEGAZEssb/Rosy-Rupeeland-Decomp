.text

/* Exact fallback; see src/overlays/ov024/overlay024_state_transitions.c. */



    .global func_ov024_021fdab0
func_ov024_021fdab0:
    str r1, [r0, #0x2f4]
    str r2, [r0, #0x2ec]
    mov r1, #0x0
    str r1, [r0, #0x2f0]
    bx lr
.size func_ov024_021fdab0, .-func_ov024_021fdab0


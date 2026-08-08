.text

/* Exact fallback; see src/overlays/ov026/overlay026_model_submit.c. */



    .global func_ov026_021fd990
func_ov026_021fd990:
    mov r1, r1, lsl #0x8
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r1, lsl #0x10
    ldr r1, L_021fd9c0
    orr r0, r2, r0, lsr #0x10
    str r0, [r1, #0x0]
    bx lr
L_021fd9c0: .word 0x4000488
.size func_ov026_021fd990, .-func_ov026_021fd990


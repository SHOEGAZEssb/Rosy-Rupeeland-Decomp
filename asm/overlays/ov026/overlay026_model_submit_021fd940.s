.text

/* Exact fallback; see src/overlays/ov026/overlay026_model_submit.c. */



    .global func_ov026_021fd940
func_ov026_021fd940:
    cmp r1, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    rsb r1, r1, #0x4
    mov r1, r0, lsr r1
    ldr r0, L_021fd960
    str r1, [r0, #0x0]
    bx lr
L_021fd960: .word 0x40004ac
.size func_ov026_021fd940, .-func_ov026_021fd940


    .text
/* Exact fallback; see src/overlays/ov022/overlay022_status_widget.c. */


.global func_ov022_021fd6dc
func_ov022_021fd6dc:
    ldr r0, [r0, #0x28]
    cmp r0, #0x2
    cmpne r0, #0x5
    bne L_021fd6f4
    mov r0, #0x1
    bx lr
L_021fd6f4:
    mov r0, #0x0
    bx lr
.size func_ov022_021fd6dc, . - func_ov022_021fd6dc

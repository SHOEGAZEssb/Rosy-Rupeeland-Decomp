    .text
/* Exact fallback; see src/overlays/ov022/overlay022_status_widget.c. */


.global Overlay022_StatusWidget_IsTransient
Overlay022_StatusWidget_IsTransient:
    ldr r0, [r0, #0x28]
    cmp r0, #0x2
    cmpne r0, #0x5
    bne L_021fd6f4
    mov r0, #0x1
    bx lr
L_021fd6f4:
    mov r0, #0x0
    bx lr
.size Overlay022_StatusWidget_IsTransient, . - Overlay022_StatusWidget_IsTransient

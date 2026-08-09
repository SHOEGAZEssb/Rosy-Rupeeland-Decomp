.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.

.global func_ov097_022194e8
func_ov097_022194e8:
    ldrb r1, [r0, #0x2bc]
    mov r2, #0x0
    cmp r1, #0x0
    bne .L_02219514
    ldrsh r0, [r0, #0xda]
    mov r1, #0x1
    cmp r0, #0x7
    cmpne r0, #0x6
    movne r1, r2
    cmp r1, #0x0
    movne r2, #0x1
.L_02219514:
    mov r0, r2
    bx lr
.size func_ov097_022194e8, . - func_ov097_022194e8

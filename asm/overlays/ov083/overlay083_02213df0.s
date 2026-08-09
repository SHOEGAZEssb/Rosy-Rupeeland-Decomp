.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.

.global func_ov083_02213df0
func_ov083_02213df0:
    ldrsh r1, [r0, #0xd6]
    cmp r1, #0x10
    beq .L_02213e0c
    ldr r0, [r0, #0x29c]
    tst r0, #0x1
    moveq r0, #0x1
    bxeq lr
.L_02213e0c:
    mov r0, #0x0
    bx lr
.size func_ov083_02213df0, . - func_ov083_02213df0

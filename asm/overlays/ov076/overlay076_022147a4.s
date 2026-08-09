.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.

.global func_ov076_022147a4
func_ov076_022147a4:
    ldrsh r1, [r0, #0xd6]
    cmp r1, #0x10
    beq .L_022147c0
    ldr r0, [r0, #0x29c]
    tst r0, #0x1
    moveq r0, #0x1
    bxeq lr
.L_022147c0:
    mov r0, #0x0
    bx lr
.size func_ov076_022147a4, . - func_ov076_022147a4

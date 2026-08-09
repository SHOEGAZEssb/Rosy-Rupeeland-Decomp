.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_02216c68
func_ov075_02216c68:
    ldrsh r1, [r0, #0xd6]
    cmp r1, #0x10
    beq .L_02216c84
    ldr r0, [r0, #0x29c]
    tst r0, #0x1
    moveq r0, #0x1
    bxeq lr
.L_02216c84:
    mov r0, #0x0
    bx lr
.size func_ov075_02216c68, . - func_ov075_02216c68

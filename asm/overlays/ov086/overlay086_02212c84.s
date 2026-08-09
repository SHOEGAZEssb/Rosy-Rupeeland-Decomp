.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.

.global func_ov086_02212c84
func_ov086_02212c84:
    ldr r1, [r0, #0x260]
    orr r1, r1, #0x10
    str r1, [r0, #0x260]
    bx lr
.size func_ov086_02212c84, . - func_ov086_02212c84

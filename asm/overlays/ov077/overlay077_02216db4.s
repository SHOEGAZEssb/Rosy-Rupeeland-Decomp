.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_02216db4
func_ov077_02216db4:
    ldr r1, [r0, #0x260]
    orr r1, r1, #0x10
    str r1, [r0, #0x260]
    bx lr
.size func_ov077_02216db4, . - func_ov077_02216db4

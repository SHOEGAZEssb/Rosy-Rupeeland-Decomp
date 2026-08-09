.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_02216ef8
func_ov077_02216ef8:
    ldr r0, .L_02216f00
    bx lr
.L_02216f00: .word 0x10e000
.size func_ov077_02216ef8, . - func_ov077_02216ef8

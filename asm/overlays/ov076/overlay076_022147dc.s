.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.

.global func_ov076_022147dc
func_ov076_022147dc:
    ldr r0, .L_022147e4
    bx lr
.L_022147e4: .word 0x10e000
.size func_ov076_022147dc, . - func_ov076_022147dc

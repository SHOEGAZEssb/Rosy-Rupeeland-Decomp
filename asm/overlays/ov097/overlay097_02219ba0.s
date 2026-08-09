.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.

.global func_ov097_02219ba0
func_ov097_02219ba0:
    add r0, r0, #0x18
    bx lr
.size func_ov097_02219ba0, . - func_ov097_02219ba0

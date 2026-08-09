.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_02216f04
func_ov077_02216f04:
    add r0, r0, #0x18
    bx lr
.size func_ov077_02216f04, . - func_ov077_02216f04

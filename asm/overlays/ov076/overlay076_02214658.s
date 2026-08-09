.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.

.global func_ov076_02214658
func_ov076_02214658:
    add r0, r0, #0x18
    bx lr
.size func_ov076_02214658, . - func_ov076_02214658

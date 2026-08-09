.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.

.global func_ov054_0220ef78
func_ov054_0220ef78:
    add r0, r0, #0x30
    bx lr
.size func_ov054_0220ef78, . - func_ov054_0220ef78

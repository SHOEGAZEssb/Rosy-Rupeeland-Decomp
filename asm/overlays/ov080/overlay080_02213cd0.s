.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.

.global func_ov080_02213cd0
func_ov080_02213cd0:
    add r0, r0, #0x18
    bx lr
.size func_ov080_02213cd0, . - func_ov080_02213cd0

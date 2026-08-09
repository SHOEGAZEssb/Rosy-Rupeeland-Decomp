.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.

.global func_ov080_02213cd8
func_ov080_02213cd8:
    mov r0, #0xc0000
    bx lr
.size func_ov080_02213cd8, . - func_ov080_02213cd8

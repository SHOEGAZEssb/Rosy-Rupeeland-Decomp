.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.

.global func_ov080_02213e38
func_ov080_02213e38:
    mov r0, #0x100
    bx lr
.size func_ov080_02213e38, . - func_ov080_02213e38

.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.

.global func_ov089_02219540
func_ov089_02219540:
    mov r0, #0x40000
    bx lr
.size func_ov089_02219540, . - func_ov089_02219540

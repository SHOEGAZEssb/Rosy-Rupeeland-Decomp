.text
; Matching fallback for the portable implementation in src/overlays/ov093/overlay093_recovery.c.

.global func_ov093_02218724
func_ov093_02218724:
    mov r0, #0x40000
    bx lr
.size func_ov093_02218724, . - func_ov093_02218724

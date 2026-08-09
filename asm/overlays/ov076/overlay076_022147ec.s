.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.

.global func_ov076_022147ec
func_ov076_022147ec:
    mov r0, #0x20
    bx lr
.size func_ov076_022147ec, . - func_ov076_022147ec

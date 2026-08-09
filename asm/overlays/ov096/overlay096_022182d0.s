.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.

.global func_ov096_022182d0
func_ov096_022182d0:
    mov r0, #0x800
    bx lr
.size func_ov096_022182d0, . - func_ov096_022182d0

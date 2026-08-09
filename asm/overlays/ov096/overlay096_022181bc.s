.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.

.global func_ov096_022181bc
func_ov096_022181bc:
    mov r0, #0xc0000
    bx lr
.size func_ov096_022181bc, . - func_ov096_022181bc

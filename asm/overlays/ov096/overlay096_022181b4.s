.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.

.global func_ov096_022181b4
func_ov096_022181b4:
    add r0, r0, #0x18
    bx lr
.size func_ov096_022181b4, . - func_ov096_022181b4

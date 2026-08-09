.text
; Matching fallback for the portable implementation in src/overlays/ov093/overlay093_recovery.c.

.global func_ov093_022187b4
func_ov093_022187b4:
    ldr r0, .L_022187bc
    bx lr
.L_022187bc: .word 0x309
.size func_ov093_022187b4, . - func_ov093_022187b4

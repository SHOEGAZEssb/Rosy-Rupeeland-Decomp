.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_022145d0
func_ov075_022145d0:
    mov r0, #0x800
    bx lr
.size func_ov075_022145d0, . - func_ov075_022145d0

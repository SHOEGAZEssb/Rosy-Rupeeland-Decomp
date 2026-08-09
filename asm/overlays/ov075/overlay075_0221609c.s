.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_0221609c
func_ov075_0221609c:
    mov r0, #0x2a000
    bx lr
.size func_ov075_0221609c, . - func_ov075_0221609c

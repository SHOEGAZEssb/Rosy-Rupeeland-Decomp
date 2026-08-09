.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.

.global func_ov087_02218904
func_ov087_02218904:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov087_02218904, . - func_ov087_02218904

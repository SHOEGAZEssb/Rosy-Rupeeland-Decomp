.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.

.global func_ov089_02219560
func_ov089_02219560:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov089_02219560, . - func_ov089_02219560

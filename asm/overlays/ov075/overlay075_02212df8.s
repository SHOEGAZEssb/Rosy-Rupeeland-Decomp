.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_02212df8
func_ov075_02212df8:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov075_02212df8, . - func_ov075_02212df8

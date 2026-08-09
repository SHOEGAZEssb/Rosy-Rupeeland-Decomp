.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.

.global func_ov082_02213070
func_ov082_02213070:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov082_02213070, . - func_ov082_02213070
